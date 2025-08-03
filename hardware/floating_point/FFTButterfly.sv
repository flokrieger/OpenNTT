/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns / 1ps

module FFTButterfly 
  import FLP_pkg::*;
  #(
    parameter BTF_TYPE = "unified", // "unified" or "ct" (DIT) or "gs" (DIF)
    parameter DIV_BY_2 = 0  // instantiate division-by-2 module
  )
  (
    input clk,
    input dif_dit, // 0: dif, 1: dit (by default, it is 0)
    input div_by_2, // perform final division by 2 if high
    input [1:0] opcode, // 0: butterfly, 1: multiply, 2: modadd, 3: modsub
    input [2*OVERALL_BITS-1:0] a,
    input [2*OVERALL_BITS-1:0] b,
    input [2*OVERALL_BITS-1:0] w,

    output [2*OVERALL_BITS-1:0] e,
    output [2*OVERALL_BITS-1:0] o
  );

  logic [OVERALL_BITS-1:0] a_in_real;
  logic [OVERALL_BITS-1:0] a_in_imag;
  logic [OVERALL_BITS-1:0] b_in_real;
  logic [OVERALL_BITS-1:0] b_in_imag;
  assign a_in_real = a[2*OVERALL_BITS-1:OVERALL_BITS];
  assign a_in_imag = a[OVERALL_BITS-1:0];
  assign b_in_real = b[2*OVERALL_BITS-1:OVERALL_BITS];
  assign b_in_imag = b[OVERALL_BITS-1:0];

  logic [OVERALL_BITS-1:0] tw_real;
  logic [OVERALL_BITS-1:0] tw_imag;
  assign tw_real = w[2*OVERALL_BITS-1:OVERALL_BITS];
  assign tw_imag = w[OVERALL_BITS-1:0];

  wire use_ct;
  assign use_ct = BTF_TYPE == "unified" ? (opcode == 2'd0 ? dif_dit : 1'd1) :
                  BTF_TYPE == "ct" ? 1'd1 : 1'd0;

  reg dif_by_2_DP;
  always_ff @( posedge clk ) begin
    dif_by_2_DP <= opcode == 2'd0 ? div_by_2 : 1'd0;
  end

  /////////////////////// Add stage //////////////////////

  logic [OVERALL_BITS-1:0] a_p_b_real_1DP, a_p_b_imag_1DP, a_m_b_real_1DP, a_m_b_imag_1DP, mul_out_real_1DP, mul_out_imag_1DP;
  logic [OVERALL_BITS-1:0] a_p_b_real, a_p_b_imag, a_m_b_real, a_m_b_imag, a_add_in_real_1DP, a_add_in_imag_1DP;
  logic [OVERALL_BITS-1:0] mult_delay_real,mult_delay_imag;
  FFTButterflyAddStage add_stage(
    .clk(clk),
    .start(),
    .a_real(a_add_in_real_1DP),
    .a_imag(a_add_in_imag_1DP),
    .b_real(mul_out_real_1DP),
    .b_imag(mul_out_imag_1DP),

    .a_p_b_real(a_p_b_real),
    .a_p_b_imag(a_p_b_imag),
    .a_m_b_real(a_m_b_real),
    .a_m_b_imag(a_m_b_imag),

    .done()
  );

  ///////////////////// Mult stage ///////////////////////////
  logic [OVERALL_BITS-1:0] mul_out_real, mul_out_imag;
  logic [OVERALL_BITS-1:0] tw_real_1DP,tw_imag_1DP;
  always_ff @(posedge clk)begin
    a_m_b_real_1DP <= use_ct ? b_in_real : a_m_b_real;
    a_m_b_imag_1DP <= use_ct ? b_in_imag : a_m_b_imag;
    a_p_b_real_1DP <= use_ct ? a_in_real : a_p_b_real;
    a_p_b_imag_1DP <= use_ct ? a_in_imag : a_p_b_imag;
    a_add_in_real_1DP <= use_ct ? mult_delay_real : a_in_real;
    a_add_in_imag_1DP <= use_ct ? mult_delay_imag : a_in_imag;
    mul_out_real_1DP <= use_ct ? mul_out_real : b_in_real;
    mul_out_imag_1DP <= use_ct ? mul_out_imag : b_in_imag;

    tw_real_1DP <= tw_real;
    tw_imag_1DP <= tw_imag;
  end

  shiftreg #(.DELAY(DELAY_COMPLEX_MULT),.LOGQ(2*OVERALL_BITS)) sr (
    .clk(clk), 
    .data_in({a_p_b_real_1DP,a_p_b_imag_1DP}), 
    .data_out({mult_delay_real,mult_delay_imag})
  );

  ComplexMultiplier tw_factor_mult(
    .clk(clk),
    .start(),
    .a({a_m_b_real_1DP,a_m_b_imag_1DP}),
    .b({tw_real_1DP,tw_imag_1DP}),
    .c({mul_out_real,mul_out_imag}),
    .done()
  );

  assign o[2*OVERALL_BITS-1:OVERALL_BITS] = use_ct ? a_m_b_real : mul_out_real;
  assign o[OVERALL_BITS-1:0] = use_ct ? a_m_b_imag : mul_out_imag;
  assign e[2*OVERALL_BITS-1:OVERALL_BITS] = use_ct ? a_p_b_real : mult_delay_real;
  assign e[OVERALL_BITS-1:0] = use_ct ? a_p_b_imag : mult_delay_imag;
endmodule