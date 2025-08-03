/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Parametric twiddle factor generation for RoutOpt DIT NR transformations
module TwiddleGen_rout_DIT_NR #(
  parameter NTT = 1,
  
  parameter LOGQ = 0,
  parameter LOGN = 0,
  parameter PE = 2,
  parameter IS_MERGED = 0,

  // twiddle rom:
  parameter ROM_RD_LAT = 2,
  parameter MEM_TYPE = "", // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                           //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)
  parameter ROM_ADDR_WIDTH = 32,
  
  // integer multiplier:
  parameter INSTANTIATE_MODMULT = 1, // 1: instantiate own modular multiplier, 0: use external modular multiplier
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
  output [LOGQ-1:0] tw_out [0:PE-1],
  input [ROM_ADDR_WIDTH-1:0] rom_base_addr,

  output [LOGQ-1:0] modmul_a[0:PE-1],
  output [LOGQ-1:0] modmul_b[0:PE-1],
  input [LOGQ-1:0] modmul_c[0:PE-1]
);

  generate
    for(genvar pe_num=0; pe_num < PE; pe_num=pe_num+1) begin
      TwiddleGen_rout_DIT_NR_peModule #(
        .NTT(NTT),
        .LOGQ(LOGQ),
        .LOGN(LOGN),
        .PE(PE),
        .IS_MERGED(IS_MERGED),
        .PE_NUMBER(pe_num),
        .ROM_RD_LAT(ROM_RD_LAT),
        .MEM_TYPE(MEM_TYPE),
        .INSTANTIATE_MODMULT(INSTANTIATE_MODMULT),
        .INTMUL_LAT(INTMUL_LAT),
        .INTMUL_TYPE(INTMUL_TYPE),
        .Q_VALUE(Q_VALUE),
        .WORD_SIZE(WORD_SIZE),
        .MODRED_LAT(MODRED_LAT),
        .MODRED_TYPE(MODRED_TYPE),
        .MODRED_L(MODRED_L),
        .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT),
        .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH)
      ) tw_gen_pe (
        .clk(clk),
        .rst(rst),
        .q(q),
        .tw_out(tw_out[pe_num]),
        .rom_base_addr(rom_base_addr),
        .modmul_a(modmul_a[pe_num]),
        .modmul_b(modmul_b[pe_num]),
        .modmul_c(modmul_c[pe_num])
      );
    end
  endgenerate
endmodule
