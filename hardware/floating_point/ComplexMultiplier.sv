/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns / 1ps

module ComplexMultiplier
  import FLP_pkg::*;
  (
    input clk,
    input start,
    input [2*OVERALL_BITS-1:0] a,
    input [2*OVERALL_BITS-1:0] b,
    output [2*OVERALL_BITS-1:0] c,
    output done
  );

  logic [OVERALL_BITS-1:0] a_real,a_imag,b_real,b_imag;
  assign a_real = a[2*OVERALL_BITS-1:OVERALL_BITS];
  assign a_imag = a[OVERALL_BITS-1:0];
  assign b_real = b[2*OVERALL_BITS-1:OVERALL_BITS];
  assign b_imag = b[OVERALL_BITS-1:0];

  logic [OVERALL_BITS-1:0] a_x_b_real,a_x_b_imag;
  assign c = {a_x_b_real,a_x_b_imag};

  logic mult_done;
  logic [OVERALL_BITS-1:0] ar_x_br, ar_x_bi, ai_x_br, ai_x_bi;

  FLPMultiplier mult_ar_x_br(
    .clk(clk),
    .start(start),
    .a(a_real),
    .b(b_real),
    .result(ar_x_br),
    .done(mult_done)
  );
  FLPMultiplier mult_ar_x_bi(
    .clk(clk),
    .a(a_real),
    .b(b_imag),
    .result(ar_x_bi),
    .start(), 
    .done()
  );
  FLPMultiplier mult_ai_x_br(
    .clk(clk),
    .a(a_imag),
    .b(b_real),
    .result(ai_x_br),
    .start(), 
    .done()
  );
  FLPMultiplier mult_ai_x_bi(
    .clk(clk),
    .a(a_imag),
    .b(b_imag),
    .result(ai_x_bi),
    .start(), 
    .done()
  );

  FLPAdder #(.DO_SUBSTRACTION(1)) adder_real_result(
    .clk(clk),
    .start(mult_done),
    .a(ar_x_br),
    .b(ai_x_bi),
    .result(a_x_b_real),
    .done(done)
  );

  FLPAdder #(.DO_SUBSTRACTION(0)) adder_imag_result(
    .clk(clk),
    .a(ar_x_bi),
    .b(ai_x_br),
    .result(a_x_b_imag),
    .start(), 
    .done()
  );

endmodule