/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps


// Parametric NTT-friendly WL Montgomery reduction unit

module wlmont_p0
# (
    parameter LOGQ  = 60, // bit-size of prime
    parameter W     = 15, // word size
    parameter L     = 4,  // montgomery loop count (calculated as $ceil(LOGQ/W))
    parameter MULLAT= 1   // latency of multiply and add units
)
(
    input                  clk,
    input     [2*LOGQ-1:0] A,
    input     [  LOGQ-1:0] q,
    output reg[  LOGQ-1:0] B
);

wire [2*LOGQ-1:0] loop_i [L-1:0];
wire [2*LOGQ-1:0] loop_o [L-1:0];

generate
    for (genvar i=0; i<L; i=i+1) begin
        wlmont_sub_p0 #(LOGQ, 
                        W, 
                        2*LOGQ-i*(W-1), 
                        ((LOGQ>=(2*LOGQ-(i+1)*(W-1))) ? (LOGQ+1) : (2*LOGQ-(i+1)*(W-1))), 
                        MULLAT) wsu (clk,
                                     q[LOGQ-1:W],
                                     loop_i[i][2*LOGQ-i*(W-1)-1:0],
                                     loop_o[i][((LOGQ>=(2*LOGQ-(i+1)*(W-1))) ? (LOGQ+1) : (2*LOGQ-(i+1)*(W-1)))-1:0]);
    end
endgenerate

assign loop_i[0] = A;
generate
    for (genvar k=0; k<L-1; k=k+1) begin
        assign loop_i[k+1][2*LOGQ-(k+1)*(W-1)-1:0] = loop_o[k][2*LOGQ-(k+1)*(W-1)-1:0];
    end
endgenerate

// final correction
(* use_dsp = "no" *) wire [LOGQ:0] B_q;
assign B_q = loop_o[L-1][LOGQ:0] - q;

always @(posedge clk) begin
    if (B_q[LOGQ] == 1)
        B <= loop_o[L-1];
    else
        B <= B_q;
end

// Total latency (just for debugging)
localparam TOTAL_LATENCY = L*MULLAT + ((LOGQ-W <= 24) ? (((2*LOGQ-47)/W)*(0+1)) : (L*(0+1))) + (0+1);

endmodule
