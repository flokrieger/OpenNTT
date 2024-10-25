/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns / 1ps

// Performs bit-reversal 0101 -> 1010
module BitReverse #(BITWIDTH = 0)(
    input [BITWIDTH-1:0] in,
    output [BITWIDTH-1:0] out
  );

  genvar i;
  generate
    for (i = 0; i < BITWIDTH; i = i+1) begin
      assign out[i] = in[BITWIDTH-1-i];
    end
  endgenerate
endmodule
