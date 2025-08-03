/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Twiddle factor generation for a single PE using RoutOpt DIT NR transformations
module TwiddleGen_rout_DIT_NR_peModule #(
  parameter NTT = 1,
 
  parameter LOGQ = 0,
  parameter LOGN = 0,
  parameter PE = 0,
  parameter PE_NUMBER = 0,
  parameter IS_MERGED = 0,

  // twiddle rom:
  parameter INSTANTIATE_MODMULT = 1, // 1: instantiate own modular multiplier, 0: use external modular multiplier
  parameter ROM_RD_LAT = 2,
  parameter MEM_TYPE = "", // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                           //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)
  parameter ROM_ADDR_WIDTH = 32,
  
  // integer multiplier:
  parameter INTMUL_LAT = 0, // should be at least 1 (valid only if INTMUL_TYPE="")
  parameter INTMUL_TYPE = "", // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)

  // modular reduction:
  parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant
  parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
  parameter MODRED_LAT = 0,
  parameter MODRED_TYPE = "default", // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
  // parameters for default case
  parameter MODRED_L = 4,  // montgomery loop count (calculated as $ceil(LOGQ/WORD_SIZE))
  parameter MODRED_COREMUL_LAT = 1 // latency of multiply and add units in WL Montgomery	

) (
  input clk,
  input rst,
  input [LOGQ-1:0] q,
  output [LOGQ-1:0] tw_out,
  input [ROM_ADDR_WIDTH-1:0] rom_base_addr,

  output [LOGQ-1:0] modmul_a,
  output [LOGQ-1:0] modmul_b,
  input [LOGQ-1:0] modmul_c
);

  localparam N = 1<<LOGN;
  localparam MODMUL_LAT = NTT ? INTMUL_LAT + MODRED_LAT : FLP_pkg::DELAY_COMPLEX_MULT;
  
  localparam TW_ROM_DEPTH = open_ntt_pkg::ROM_ADDR_WIDTH;
  localparam string rom_filename = IS_MERGED ? $sformatf("%s/tool/RomContent/twiddle_mem_rout_Merged_DIT_NR_n%0d_pe%0d_lat%0d%s%0d.mem", open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT, !NTT?"_FFT_":MODRED_TYPE=="default"?"_MontRed_":"_", PE_NUMBER) :
                                               $sformatf("%s/tool/RomContent/twiddle_mem_rout_DIT_NR_n%0d_pe%0d_lat%0d%s%0d.mem",        open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT, !NTT?"_FFT_":MODRED_TYPE=="default"?"_MontRed_":"_", PE_NUMBER);

  // Twiddle rom instance:
  logic [TW_ROM_DEPTH-1:0] tw_rom_addr,rom_base_addr_reg;
  logic [LOGQ-1:0] tw_rom_data [0:0];

  rom #(
      .MEM_WIDTH(LOGQ),     
      .MEM_DEPTH(TW_ROM_DEPTH),
      .MEM_COUNT(1),
      .ROM_CONTENT(rom_filename),
      .READ_LATENCY(ROM_RD_LAT),
      .OUTPUT_REG(0),
      .MEM_TYPE(MEM_TYPE)
  ) tw_rom (
      .clk(clk),
      .raddr(tw_rom_addr),
      .dout(tw_rom_data)
  );

  // stage iterator:
  logic [$clog2(LOGN)-1:0] s_i, s_rom;
  logic stage_done_initial;
  logic [$clog2(N/2)-1:0] tmp_i;
  always_ff @( posedge clk ) begin
    if (rst) begin
      s_i <= 0;
      tmp_i <= N/2-1;
    end else if (stage_done_initial && s_i != LOGN-1) begin
      s_i <= s_i + 1;
      tmp_i <= tmp_i >> 1;
    end
  end
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ($clog2(LOGN))) s_del0 (
      .clk(clk),
      .data_in(s_i),
      .data_out(s_rom)
    );

  // butterfly iterator:
  logic [$clog2(N/2/PE)-1:0] i_i, i_rom;
  always_ff @( posedge clk ) begin
    if (rst) begin
      i_i <= 0;
    end else begin
      i_i <= i_i + 1;
    end
  end
  assign stage_done_initial = i_i == {$clog2(N/2/PE){1'd1}};
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ($clog2(N/2/PE))) i_del0 (
          .clk(clk),
          .data_in(i_i),
          .data_out(i_rom)
      );

  // rom address generation logic:
  logic inc_rom_addr;
  always_ff @( posedge clk ) begin
    rom_base_addr_reg <= rom_base_addr[TW_ROM_DEPTH-1:0];
    if (rst)
      tw_rom_addr <= rom_base_addr_reg;
    else if(inc_rom_addr)
      tw_rom_addr <= tw_rom_addr + 1'd1;
  end

  // control signals:
  logic is_omega_c_addr, is_omega_c_addr_delayed;
  assign is_omega_c_addr = s_i >= $clog2(PE) && stage_done_initial;
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ(1)) is_omega_c_addr_delay (
    .clk(clk),
    .data_in(is_omega_c_addr),
    .data_out(is_omega_c_addr_delayed)
  );

  logic update_mult,update_mult_adv;
  assign update_mult_adv = i_i != {($clog2(N/2/PE)){1'd1}} && (i_i & tmp_i) == tmp_i;
  shiftreg #(.DELAY(ROM_RD_LAT+1), .LOGQ(1)) update_mult_delay (
    .clk(clk),
    .data_in(update_mult_adv),
    .data_out(update_mult)
  );
  
  always_comb begin
    inc_rom_addr = is_omega_c_addr;
    if(i_i < MODMUL_LAT) begin
      inc_rom_addr = update_mult_adv || i_i == MODMUL_LAT-1;
    end 
  end
 
  ////////////// data path ////////////
  logic [LOGQ-1:0] tw_out_internal_DP,tw_out_internal_DN;

  // omega_c:
  logic update_omega_c;
  logic [LOGQ-1:0] omega_c;
  always_ff @( posedge clk ) begin
    if(rst)
        omega_c <= {{(LOGQ-1){1'd0}},1'd1};
    else if(update_omega_c) begin
        omega_c <= tw_rom_data[0];
    end
  end
  assign update_omega_c = is_omega_c_addr_delayed;


  // modmult
  logic [LOGQ-1:0] modmul_in;
  logic [LOGQ-1:0] modmul_omega_in;
  logic [LOGQ-1:0] modmul_out;
  assign modmul_in        = tw_out_internal_DN;
  assign modmul_omega_in  = omega_c;

  logic [2*LOGQ-1:0] imul;
  if(INSTANTIATE_MODMULT) begin
    if(NTT) begin
      logic [2*LOGQ-1:0] imul;
      logic [LOGQ-1:0] q_reg;
      shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_q (.clk(clk),.data_in(q),.data_out(q_reg));
      intmul #(LOGQ,LOGQ,INTMUL_LAT,INTMUL_TYPE) intmul_i(clk,modmul_in,modmul_omega_in,imul);
      modred #(LOGQ,Q_VALUE,WORD_SIZE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT) modred_i(clk,imul,q_reg,modmul_out);
    end else begin
      ComplexMultiplier cmul (
            .clk(clk),
            .start(),
            .a(modmul_in),
            .b(modmul_omega_in),
            .c(modmul_out),
            .done()
          );
    end
  end else begin
    assign modmul_a = modmul_in;
    assign modmul_b = modmul_omega_in;
    assign modmul_out = modmul_c;
  end

  // output logic:
  assign tw_out_internal_DN = i_rom < MODMUL_LAT ? tw_rom_data[0] : update_mult ? modmul_out : tw_out_internal_DP;
  always @(posedge clk) begin
    tw_out_internal_DP <= tw_out_internal_DN;
  end 
  assign tw_out = tw_out_internal_DP;
endmodule
