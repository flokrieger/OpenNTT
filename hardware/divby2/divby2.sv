/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// division by two in (mod q)

`default_nettype wire

module divby2 #
(
    parameter LOGQ = 0,
    parameter [LOGQ-1:0] Q_VALUE = 0,
    parameter WORD_SIZE = 0, // last WORD_SIZE digit of q will be 00...001
    parameter DIVBY2_LAT = 0 // options: 0 or 1
)
(
    input            clk,
    input [LOGQ-1:0] x,
    input [LOGQ-WORD_SIZE-1:0] qH,
    output reg [LOGQ-1:0] y
);

wire [LOGQ-2:0] x0and; 

generate
    if(Q_VALUE == 0)
        assign x0and = (x[0] == 1'b1) ? {qH,{WORD_SIZE-2{1'b0}},1'b1} : 0;
    else
        assign x0and = (x[0] == 1'b1) ? {Q_VALUE[LOGQ-1:2],1'b1} : 0;
endgenerate

generate
    if(DIVBY2_LAT == 0) begin
        always @(*) begin
            y = x[LOGQ-1:1] + x0and;
        end
    end
    else begin
        always @(posedge clk) begin
            y <= x[LOGQ-1:1] + x0and;
        end
    end
endgenerate

endmodule