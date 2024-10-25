/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps
`default_nettype wire

// Basic FIFO implementation

module FIFO #
(
    parameter DEPTH = 0, 
    parameter WIDTH = 0
)
(
    input             clk,
    input             rst,
    input  [WIDTH-1:0] rst_val,
    input             shift, 
    input  [WIDTH-1:0] data_in,
    output [WIDTH-1:0] data_out,
    output [WIDTH-1:0] last_data_in
);

reg [WIDTH-1:0] shift_array [DEPTH-1:0];

always @(posedge clk) begin
  if(rst) begin
    shift_array[0] <= rst_val;
  end else if(shift) begin
    shift_array[0] <= data_in;
  end
end

generate
    for(genvar i=0; i < DEPTH-1; i=i+1) begin: DELAY_BLOCK
        always @(posedge clk) begin
        if(rst)begin
          shift_array[i+1] <= rst_val;
        end else if(shift) begin
            shift_array[i+1] <= shift_array[i];
          end
        end
    end
endgenerate

generate
    if(DEPTH == 0)
        assign data_out = data_in;
    else
        assign data_out = shift_array[DEPTH-1];
endgenerate
    assign last_data_in = shift_array[0];

endmodule