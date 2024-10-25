/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps


// Parametric modmul unit for butterfly
// e = shift(a)
// o = b*w

module btf_modmul #
(
    parameter LOGQ = 0,
    parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant  
    parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
    // integer multiplier parameters
    parameter INTMUL_LAT = 0, // should be at least 1 (valid only if INTMUL_TYPE="")
    parameter INTMUL_TYPE = "", // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)
    // modular reduction parameters
    parameter MODRED_LAT = 0, 
	  parameter MODRED_TYPE = "default", // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
	  // modular reduction parameters (for default case)
	  parameter MODRED_L = 4,  // montgomery loop count (calculated as $ceil(LOGQ/WORD_SIZE))
    parameter MODRED_COREMUL_LAT = 1, // latency of multiply and add units in WL Montgomery	
    // butterfly related parameters
    parameter SHIFT_A = 0 // 1: shift input a by MODRED_LAT+INTMUL_LAT
)
(
    input  clk,
    input  [LOGQ-1:0] q,
    input  [LOGQ-1:0] a,b,w,
    output [LOGQ-1:0] e,o
);

wire [2*LOGQ-1:0] imul;

// shift
shiftreg #(SHIFT_A*(INTMUL_LAT+MODRED_LAT), LOGQ) a_sr_i(clk,a,e);

// modmul
intmul #(LOGQ,LOGQ,INTMUL_LAT,INTMUL_TYPE) intmul_i(clk,b,w,imul);
modred #(LOGQ,Q_VALUE,WORD_SIZE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT) modred_i(clk,imul,q,o);

endmodule