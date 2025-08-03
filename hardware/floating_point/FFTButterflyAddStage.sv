/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns / 1ps

module FFTButterflyAddStage
  import FLP_pkg::*;
  (
    input clk,
    input start,
    input [OVERALL_BITS-1:0] a_real,
    input [OVERALL_BITS-1:0] a_imag,
    input [OVERALL_BITS-1:0] b_real,
    input [OVERALL_BITS-1:0] b_imag,

    output [OVERALL_BITS-1:0] a_p_b_real,
    output [OVERALL_BITS-1:0] a_p_b_imag,
    output [OVERALL_BITS-1:0] a_m_b_real,
    output [OVERALL_BITS-1:0] a_m_b_imag,

    output done
  );


  /////////////////// Real part ////////////////////

  logic sign_result_real_2DP, data_valid_real_2DP, bit_shifted_out_real_2DP, denorm_underflow_real_2DP, signs_equal_real_2DP, switched_operands_real_2DP;
  logic [EXPONENT_BITS-1:0] exponent_b_real_2DP;
  logic [SIGNIFICANT_BITS:0] significant_b_real_2DP;
  logic signed [SIGNIFICANT_BITS:0] denorm_significant_a_real_2DP;
  FLPAdderDenormalization denormalize_real_part (
    .clk(clk),
    .start(start),
    .a(a_real),
    .b(b_real),
    .sign_result_2DP(sign_result_real_2DP), 
    .data_valid_2DP(data_valid_real_2DP), 
    .bit_shifted_out_2DP(bit_shifted_out_real_2DP), 
    .denorm_underflow_2DP(denorm_underflow_real_2DP), 
    .signs_equal_2DP(signs_equal_real_2DP),
    .exponent_b_2DP(exponent_b_real_2DP),
    .significant_b_2DP(significant_b_real_2DP),
    .denorm_significant_a_2DP(denorm_significant_a_real_2DP),
    .switched_operands_2DP(switched_operands_real_2DP)
  );
  
  FLPAdderSigAddNormalize add_and_normalize_real(
    .clk(clk),
    .sign_result_2DP(sign_result_real_2DP), 
    .data_valid_2DP(data_valid_real_2DP), 
    .bit_shifted_out_2DP(bit_shifted_out_real_2DP), 
    .denorm_underflow_2DP(denorm_underflow_real_2DP), 
    .signs_equal_2DP(signs_equal_real_2DP),
    .exponent_b_2DP(exponent_b_real_2DP),
    .significant_b_2DP(significant_b_real_2DP),
    .denorm_significant_a_2DP(denorm_significant_a_real_2DP),

    .result(a_p_b_real),
    .done(done)
  );
  FLPAdderSigAddNormalize sub_and_normalize_real(
    .clk(clk),
    .sign_result_2DP(switched_operands_real_2DP ? sign_result_real_2DP : ~sign_result_real_2DP), 
    .bit_shifted_out_2DP(bit_shifted_out_real_2DP), 
    .denorm_underflow_2DP(denorm_underflow_real_2DP), 
    .signs_equal_2DP(~signs_equal_real_2DP),
    .exponent_b_2DP(exponent_b_real_2DP),
    .significant_b_2DP(significant_b_real_2DP),
    .denorm_significant_a_2DP(denorm_significant_a_real_2DP),

    .result(a_m_b_real),

    // unused:
    .data_valid_2DP(),
    .done()
  );

  /////////////////// Imaginary part ////////////////////

  logic sign_result_imag_2DP, bit_shifted_out_imag_2DP, denorm_underflow_imag_2DP, signs_equal_imag_2DP, switched_operands_imag_2DP;
  logic [EXPONENT_BITS-1:0] exponent_b_imag_2DP;
  logic [SIGNIFICANT_BITS:0] significant_b_imag_2DP;
  logic signed [SIGNIFICANT_BITS:0] denorm_significant_a_imag_2DP;
  FLPAdderDenormalization denormalize_imag_part (
    .clk(clk),
    .a(a_imag),
    .b(b_imag),
    .sign_result_2DP(sign_result_imag_2DP),
    .bit_shifted_out_2DP(bit_shifted_out_imag_2DP),
    .denorm_underflow_2DP(denorm_underflow_imag_2DP),
    .signs_equal_2DP(signs_equal_imag_2DP),
    .exponent_b_2DP(exponent_b_imag_2DP),
    .significant_b_2DP(significant_b_imag_2DP),
    .denorm_significant_a_2DP(denorm_significant_a_imag_2DP),
    .switched_operands_2DP(switched_operands_imag_2DP),
    // unused:
    .start(),
    .data_valid_2DP()
  );
  
  FLPAdderSigAddNormalize add_and_normalize_imag(
    .clk(clk),
    .sign_result_2DP(sign_result_imag_2DP),
    .bit_shifted_out_2DP(bit_shifted_out_imag_2DP),
    .denorm_underflow_2DP(denorm_underflow_imag_2DP),
    .signs_equal_2DP(signs_equal_imag_2DP),
    .exponent_b_2DP(exponent_b_imag_2DP),
    .significant_b_2DP(significant_b_imag_2DP),
    .denorm_significant_a_2DP(denorm_significant_a_imag_2DP),

    .result(a_p_b_imag),

    // unused:
    .data_valid_2DP(),
    .done()
  );
  FLPAdderSigAddNormalize sub_and_normalize_imag(
    .clk(clk),
    .sign_result_2DP(switched_operands_imag_2DP ? sign_result_imag_2DP : ~sign_result_imag_2DP),
    .bit_shifted_out_2DP(bit_shifted_out_imag_2DP),
    .denorm_underflow_2DP(denorm_underflow_imag_2DP),
    .signs_equal_2DP(~signs_equal_imag_2DP),
    .exponent_b_2DP(exponent_b_imag_2DP),
    .significant_b_2DP(significant_b_imag_2DP),
    .denorm_significant_a_2DP(denorm_significant_a_imag_2DP),

    .result(a_m_b_imag),
    // unused:
    .data_valid_2DP(),
    .done()
  );

endmodule