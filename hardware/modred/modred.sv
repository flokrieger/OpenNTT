/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Module performing modular reduction P mod q, 0 <= P < q^2. This either uses:
// default (WL Montgomery), sim, or custom

module modred #
(
	parameter LOGQ = 0,
  parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant
	parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
	parameter MODRED_LAT = 0,
	parameter MODRED_TYPE = "default", // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
	// parameters for default case
	parameter MODRED_L = 4,  // montgomery loop count (calculated as $ceil(LOGQ/WORD_SIZE))
  parameter MODRED_COREMUL_LAT = 1 // latency of multiply and add units in WL Montgomery	
)
(
input                     clk,
input      [(2*LOGQ)-1:0] P,
input      [LOGQ-1:0]     q,
output     [LOGQ-1:0]     C
);

logic [LOGQ-1:0] q_internal;
assign q_internal = Q_VALUE == 0 ? q : Q_VALUE;

if (MODRED_TYPE == "default") begin
	wlmont_p0 #(LOGQ,WORD_SIZE,MODRED_L,MODRED_COREMUL_LAT) mr (clk,P,q_internal,C);
end
else if (MODRED_TYPE == "custom") begin
	my_modred mr(clk,q_internal,P,C);
end
else begin
  wire [(2*LOGQ)-1:0] P_red;
	assign P_red = P%q_internal;

	shiftreg #(MODRED_LAT, LOGQ) sr(clk,P_red[LOGQ-1:0],C);
end

if(MODRED_TYPE == "default")
  if(MODRED_LAT != MODRED_L*2 + ((LOGQ-WORD_SIZE <= 24) ? (((2*LOGQ-47-1)/WORD_SIZE)*(0+1)) : (MODRED_L*(0+1))) + (0+1))
    $error("Invalid MODRED_LAT");

endmodule
