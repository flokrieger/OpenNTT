/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Top module for OpenNTT. Combines NTTCore and RAM Memory.

module OpenNTT 
  import FLP_pkg::*;
  #(
    parameter NTT = open_ntt_pkg::NTT, // 1: NTT, 0: FFT
    
    parameter LOGQ = open_ntt_pkg::LOGQ,
    parameter LOGN = open_ntt_pkg::LOGN,
    parameter PE = open_ntt_pkg::PE,

    parameter NTT_TYPE = open_ntt_pkg::NTT_TYPE, // standalones: fntt_dit_nr, fntt_dif_nr, intt_dit_rn, intt_dif_rn, mfntt_dit_nr, mintt_dif_rn
                                    // unifieds:    fntt_dit_nr-intt_dit_rn, mfntt_dit_nr-mintt_dif_rn
    parameter INSTANTIATE_MULT_ADD = open_ntt_pkg::INSTANTIATE_MULT_ADD, // 1: support polynomial addition / multiplication etc.

    parameter [LOGQ-1:0] Q_VALUE = open_ntt_pkg::Q_VALUE, // != 0: q is constant  
    parameter WORD_SIZE = open_ntt_pkg::WORD_SIZE, // Last WORD_SIZE digit of q will be 00...001
    
    parameter MODADD_LAT = 2, // options: 0, 1 or 2 (Latency for ADD/SUB)
    
    parameter INTMUL_LAT = 4, // should be at least 1 (valid only if INTMUL_TYPE="")
    parameter INTMUL_TYPE = "fpga_auto", // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)
    
    parameter MODRED_TYPE = "default", // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
    parameter MODRED_LAT = 1, // ignored for "default" (WL Montgomery) 
    parameter MODRED_COREMUL_LAT = 1, // latency of multiply and add units in WL Montgomery	, only used in "default" (WL Montgomery) 

    parameter MEMORY_OPTIMIZED = open_ntt_pkg::MEMORY_OPTIMIZED, // either memory optimized (1) our routing optimized (0)
    parameter TW_ROM_MEM_TYPE = "fpga_block", // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                                              //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)
    
    parameter NUM_POLY_MEMS = open_ntt_pkg::NUM_POLY_MEMS,   // number of polynomials we can store in memory
    parameter RAM_MEM_TYPE = "fpga_block", // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                                           //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)

    parameter ROM_ADDR_WIDTH = open_ntt_pkg::ROM_ADDR_WIDTH,
    parameter RAM_RD_LAT = 2,
    parameter ROM_RD_LAT = 2
  ) 
  (
    input clk,
    input rst,
    input forward, // only used in case of unifieds.
    input [1:0] opcode,

    input [LOGQ-1:0] q,
    input [LOGQ-1:0] montgomery_factor,
    input [ROM_ADDR_WIDTH-1:0] rom_base_addr,
    input [$clog2(NUM_POLY_MEMS)-1:0] poly_base_a,
    input [$clog2(NUM_POLY_MEMS)-1:0] poly_base_b,

    input io_ram_wen,
    input [$clog2(NUM_POLY_MEMS)+LOGN-1:0] io_ram_raddr,
    input [$clog2(NUM_POLY_MEMS)+LOGN-1:0] io_ram_waddr,
    output [LOGQ-1:0] io_ram_rdata,
    input  [LOGQ-1:0] io_ram_wdata,
    output done
  );

  localparam N = 1<<LOGN;
  if((INSTANTIATE_MULT_ADD && NUM_POLY_MEMS < 2) || NUM_POLY_MEMS < 1 || NUM_POLY_MEMS > 4)
    $error("invalid configuration");

  // memory instance:
  logic ntt_core_ram_wen;
  logic [$clog2(NUM_POLY_MEMS*N/2/PE)-1:0] ntt_core_ram_raddr, ntt_core_ram_waddr;
  logic [LOGQ-1:0] ntt_core_ram_wdata [0:PE-1][0:1];
  logic [LOGQ-1:0] ram_rdata [0:PE-1][0:1];
  logic [LOGQ-1:0] io_ram_rdata_DP[0:PE-1];
  logic [LOGQ-1:0] io_ram_rdata_out;
  generate
    for(genvar g = 0; g < PE; g = g + 1) begin
      logic io_ram_wen_local_b0, io_ram_wen_local_b1;
      logic [LOGQ-1:0] io_ram_wdata_DP;
      logic [$clog2(NUM_POLY_MEMS*N/2/PE)-1:0] io_ram_waddr_low_DP;

      PolyRAM # (
        .MEM_WIDTH(LOGQ),     
        .MEM_DEPTH($clog2(NUM_POLY_MEMS*N/2/PE)),
        .READ_LATENCY(RAM_RD_LAT),
        .OUTPUT_REG(0),
        .MEM_TYPE(RAM_MEM_TYPE)
      ) poly_mem (   
          .clk(clk),
          .rst(rst),
          .io_bank0_wen(io_ram_wen_local_b0),
          .io_bank1_wen(io_ram_wen_local_b1),
          .io_waddr(io_ram_waddr_low_DP),
          .io_raddr(io_ram_raddr[$clog2(NUM_POLY_MEMS*N/2/PE)-1:0]),
          .io_wdata(io_ram_wdata_DP),
          .core_wen(ntt_core_ram_wen),
          .core_waddr(ntt_core_ram_waddr),
          .core_raddr(ntt_core_ram_raddr),
          .wdata_bank0(ntt_core_ram_wdata[g][0]),
          .wdata_bank1(ntt_core_ram_wdata[g][1]),
          .rdata_bank0(ram_rdata[g][0]),
          .rdata_bank1(ram_rdata[g][1])
      );


      logic bank1_DP;
      shiftreg #(.DELAY(RAM_RD_LAT), .LOGQ(1)) bank_sel_shift (
        .clk(clk),
        .data_in(io_ram_raddr[$clog2(NUM_POLY_MEMS*N/2/PE)]),
        .data_out(bank1_DP));
      always @(posedge clk) begin
        io_ram_rdata_DP[g]  <= bank1_DP ? ram_rdata[g][1] : ram_rdata[g][0];
        io_ram_wen_local_b0 <= io_ram_wen && io_ram_waddr[$clog2(NUM_POLY_MEMS)+LOGN-1:$clog2(NUM_POLY_MEMS*N/2/PE)] == g*2;
        io_ram_wen_local_b1 <= io_ram_wen && io_ram_waddr[$clog2(NUM_POLY_MEMS)+LOGN-1:$clog2(NUM_POLY_MEMS*N/2/PE)] == g*2+1;
        io_ram_wdata_DP     <= io_ram_wdata;
        io_ram_waddr_low_DP <= io_ram_waddr[$clog2(NUM_POLY_MEMS*N/2/PE)-1:0];
      end
    end
  endgenerate
  if(PE > 1) begin
    logic [$clog2(NUM_POLY_MEMS)+LOGN-($clog2(NUM_POLY_MEMS*N/2/PE)+1)-1:0] io_ram_raddr_high_DP;
    shiftreg #(.DELAY(RAM_RD_LAT+1), .LOGQ($clog2(NUM_POLY_MEMS)+LOGN-($clog2(NUM_POLY_MEMS*N/2/PE)+1))) raddr_high_shift (
        .clk(clk),
        .data_in(io_ram_raddr[$clog2(NUM_POLY_MEMS)+LOGN-1:$clog2(NUM_POLY_MEMS*N/2/PE)+1]),
        .data_out(io_ram_raddr_high_DP));
    always_ff @( posedge clk ) begin
      io_ram_rdata_out <= io_ram_rdata_DP[io_ram_raddr_high_DP];    
    end 
  end else begin
    always_ff @( posedge clk ) begin
      io_ram_rdata_out <= io_ram_rdata_DP[0];    
    end 
  end
  assign io_ram_rdata = io_ram_rdata_out;


  // ntt core instance:
  NTTCore #(
    .NTT(NTT),
    .LOGQ(LOGQ),
    .LOGN(LOGN),
    .PE(PE),
    .NTT_TYPE(NTT_TYPE),
    .Q_VALUE(Q_VALUE),
    .WORD_SIZE(WORD_SIZE),
    .ADD_LAT(NTT ? MODADD_LAT : DELAY_FLP_ADDER),
    .INTMUL_LAT(INTMUL_LAT),
    .INTMUL_TYPE(INTMUL_TYPE),
    .MODRED_TYPE(MODRED_TYPE),
    .MODRED_LAT(MODRED_LAT),
    .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT),
    .MEMORY_OPTIMIZED(MEMORY_OPTIMIZED),
    .TW_ROM_MEM_TYPE(TW_ROM_MEM_TYPE),
    .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH),
    .INSTANTIATE_MULT_ADD(INSTANTIATE_MULT_ADD),
    .NUM_POLY_MEMS(NUM_POLY_MEMS),
    .RAM_RD_LAT(RAM_RD_LAT),
    .ROM_RD_LAT(ROM_RD_LAT),
    .NO_BFU(0)
  ) ntt_core (
    .clk(clk),
    .rst(rst),
    .forward(forward),
    .opcode(INSTANTIATE_MULT_ADD ? opcode : 2'd0),
    .q(q),
    .montgomery_factor(montgomery_factor),
    .rom_base_addr(rom_base_addr),
    .ram_wen(ntt_core_ram_wen),
    .ram_raddr(ntt_core_ram_raddr),
    .ram_waddr(ntt_core_ram_waddr),
    .ram_rdata(ram_rdata),
    .ram_wdata(ntt_core_ram_wdata),
    .poly_base_a(poly_base_a),
    .poly_base_b(poly_base_b),
    .done(done)
  );

endmodule