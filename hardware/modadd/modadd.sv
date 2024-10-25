/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// c = a+b (mod q) where 0 <= a,b,c < q, q = qH*2^WORD_SIZE + 1

`default_nettype wire

module modadd #
(
    parameter LOGQ = 0,
    parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant  
    parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
    parameter MODADD_LAT = 0 // options: 0, 1 or 2
)
(
    input clk,
    input [LOGQ-WORD_SIZE-1:0] qH,
    input [LOGQ-1:0] a,b,
    output [LOGQ-1:0] c
);

// modular add
wire        [LOGQ-WORD_SIZE-1:0] qH_in = (Q_VALUE == 0) ? qH : Q_VALUE[LOGQ-1:WORD_SIZE];

wire        [LOGQ  :0] madd;
wire signed [LOGQ  :0] madd_q;
wire        [LOGQ-1:0] madd_res;

reg         [LOGQ  :0] madd_reg;
reg         [LOGQ-1:0] madd_res_reg;

assign madd     = a + b;
assign madd_q   = madd_reg - {qH_in,{(WORD_SIZE-1){1'b0}},1'b1};
assign madd_res = (madd_q[LOGQ] == 1'b0) ? madd_q[LOGQ-1:0] : madd_reg[LOGQ-1:0];

generate
    if(MODADD_LAT == 2) begin
        always @(posedge clk) begin
            madd_reg     <= madd;
            madd_res_reg <= madd_res;
        end
    end
    else if(MODADD_LAT == 1) begin
        always @(*) begin
            madd_reg     = madd;
        end
        always @(posedge clk) begin
            madd_res_reg <= madd_res;
        end
    end
    else begin
        always @(*) begin
            madd_reg     = madd;
            madd_res_reg = madd_res;
        end
    end
endgenerate

assign c = madd_res_reg;

endmodule