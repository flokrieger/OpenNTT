/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// c = a-b (mod q) where 0 <= a,b,c < q, q = qH*2^WORD_SIZE + 1

`default_nettype wire

module modsub #
(
    parameter LOGQ = 0,
    parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant  
    parameter WORD_SIZE = 0, // last WORD_SIZE digit of q will be 00...001
    parameter MODSUB_LAT = 0 // options: 0, 1 or 2
)
(
    input clk,
    input [LOGQ-WORD_SIZE-1:0] qH,
    input [LOGQ-1:0] a,b,
    output [LOGQ-1:0] c
);

// modular sub
wire        [LOGQ-WORD_SIZE-1:0] qH_in = (Q_VALUE == 0) ? qH : Q_VALUE[LOGQ-1:WORD_SIZE];

wire signed [LOGQ  :0] msub;
wire        [LOGQ  :0] msub_q;
wire        [LOGQ-1:0] msub_res;

reg signed  [LOGQ  :0] msub_reg;
reg         [LOGQ-1:0] msub_res_reg;

assign msub     = a - b;
assign msub_q   = msub_reg + {qH_in,{(WORD_SIZE-1){1'b0}},1'b1};
assign msub_res = (msub_reg[LOGQ] == 1'b0) ? msub_reg[LOGQ-1:0] : msub_q[LOGQ-1:0];

generate
    if(MODSUB_LAT == 2) begin
        always @(posedge clk) begin
            msub_reg     <= msub;
            msub_res_reg <= msub_res;
        end
    end
    else if(MODSUB_LAT == 1) begin
        always @(*) begin
            msub_reg     = msub;
        end
        always @(posedge clk) begin
            msub_res_reg <= msub_res;
        end
    end
    else begin
        always @(*) begin
            msub_reg     = msub;
            msub_res_reg = msub_res;
        end
    end
endgenerate

assign c = msub_res_reg;

endmodule