/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns / 1ps
`include "package.svh"

// This instantiates the OpenNTT module and interfaces to the outside world. Either
// via dma or send64() receive64() interface. Also handles command decoding.

module ComputeCore #(
          parameter BRAM_ADDR_WIDTH = 20,
          parameter LOG_COMMAND = 8
        )
        (
          clk, rst, 
          address_ext, dina_ext, dina2_ext, dina3_ext, doutb_ext, wea_ext, // send64() and receive64() testing interface to software
					command_in, command_we,                              // current instruction to execute
					done_ins_computation,                                // instruction computation finished
					grant_ext_io,                                        // grant BRAM access to send64/receive64 or to DMA
          dma_byte_wea, dma_rwaddr, dma_wdata, dma_rdata, dma_en // DMA interface
				);

  localparam LOGQ = `LOGQ;
  localparam LOGN = `LOGN;

  input clk, rst; 
  input [19:0] address_ext;
  input [63:0] dina_ext, dina3_ext;
  input [31:0] dina2_ext;
  input wea_ext;

  input [LOG_COMMAND-1:0] command_in;
  input command_we, grant_ext_io;
  output [63:0] doutb_ext;
  output done_ins_computation; // This becomes 1 when the instruction has finished. 

  input [7:0] dma_byte_wea;
  input [BRAM_ADDR_WIDTH-1:0] dma_rwaddr;
  input [63:0] dma_wdata;
  output [63:0] dma_rdata;
  input dma_en;


  // command register:
  reg [LOG_COMMAND-1:0] command_reg;
  reg [63:0] dina_ext_DP, dina3_ext_DP;
  reg [31:0] dina2_ext_DP;
  always @(posedge clk) begin
    dina_ext_DP <= dina_ext;
    dina2_ext_DP <= dina2_ext;
    dina3_ext_DP <= dina3_ext;
    if(rst)
      command_reg <= {LOG_COMMAND{1'd0}};
    else if(command_we)
      command_reg <= command_in;
    else
      command_reg <= command_reg;	
  end

  // command decoding:
  wire [1:0] opcode;
  wire forward, core_rst;
  wire [`ROM_ADDR_WIDTH-1:0] rom_base_addr;
  wire [$clog2(`NUM_POLY_MEMS)-1:0] poly_base_a,poly_base_b;
  assign opcode = dina2_ext_DP[1:0];
  assign forward = dina2_ext_DP[2];
  assign core_rst = ~command_reg[7];
  assign rom_base_addr = dina2_ext_DP[`ROM_ADDR_WIDTH+3-1:3];
  assign poly_base_a = dina2_ext_DP[31-$clog2(`MAX_NUM_POLY_MEMS):31-2*$clog2(`MAX_NUM_POLY_MEMS)+1];
  assign poly_base_b = dina2_ext_DP[31:31-$clog2(`MAX_NUM_POLY_MEMS)+1];

  wire wea_dma;
  assign wea_dma = (dma_byte_wea == 8'hff) && dma_en;

  wire core_wea;
  wire [$clog2(`NUM_POLY_MEMS)+LOGN-1:0] core_rwaddr;
  wire [LOGQ-1:0] core_rdata, core_wdata;
  wire [LOGQ-1:0] q, montgomery_factor;
  assign q = dina_ext_DP[LOGQ-1:0];
  assign montgomery_factor = dina3_ext_DP[LOGQ-1:0];

  // Memory mux - either give access to DMA or to send64/receive64:
  assign core_wdata = grant_ext_io ? dina_ext[LOGQ-1:0] : dma_wdata[LOGQ-1:0];
  assign dma_rdata = {{(64-LOGQ){1'd0}}, core_rdata};
  assign core_rwaddr = grant_ext_io ? address_ext[$clog2(`NUM_POLY_MEMS)+LOGN-1:0] : dma_rwaddr[$clog2(`NUM_POLY_MEMS)+LOGN-1+3:3];
  assign core_wea = grant_ext_io ? wea_ext : wea_dma;
  assign doutb_ext = {{(64-LOGQ){1'd0}}, core_rdata};

  // OpenNTT module:
  OpenNTT #(
    .LOGQ(`LOGQ),
    .LOGN(`LOGN),
    .PE(`PE),
    .NTT_TYPE(`NTT_TYPE),
    .INSTANTIATE_MULT_ADD(`INSTANTIATE_MULT_ADD),
    .Q_VALUE(`Q_VALUE),
    .WORD_SIZE(`WORD_SIZE),
    .MODADD_LAT(2),
    .INTMUL_LAT(4),
    .INTMUL_TYPE("fpga_auto"),    
    .MODRED_TYPE("default"),
    .MODRED_LAT(1),
    .MODRED_COREMUL_LAT(1),
    .TW_ROM_MEM_TYPE("fpga_block"),
    .NUM_POLY_MEMS(`NUM_POLY_MEMS),
    .RAM_MEM_TYPE("fpga_block"),
    .ROM_ADDR_WIDTH(`ROM_ADDR_WIDTH),
    .RAM_RD_LAT(2),
    .ROM_RD_LAT(2)
  ) open_ntt(
    .clk(clk),
    .rst(core_rst),
    .forward(forward),
    .opcode(opcode),
    .q(q),
    .montgomery_factor(montgomery_factor),
    .rom_base_addr(rom_base_addr),
    .poly_base_a(poly_base_a),
    .poly_base_b(poly_base_b),
    .io_ram_wen(core_wea),
    .io_ram_raddr(core_rwaddr),
    .io_ram_waddr(core_rwaddr),
    .io_ram_rdata(core_rdata),
    .io_ram_wdata(core_wdata),
    .done(done_ins_computation)
  );

endmodule