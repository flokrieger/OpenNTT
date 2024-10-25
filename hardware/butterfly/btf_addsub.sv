/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Parametric add/sub unit for butterfly
// e = (a+b)
// o = (a-b)

module btf_addsub #
(
    parameter LOGQ = 0,
    parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant  
    parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
    // modular add/sub parameters
    parameter MODADD_LAT = 0 // options: 0, 1 or 2 (Latency for ADD/SUB)
)
(
    input  clk,
    input  [LOGQ-WORD_SIZE-1:0] qH,
    input  [LOGQ-1:0] a,b,
    output [LOGQ-1:0] e,o
);

// add/sub
modadd #(LOGQ,Q_VALUE,WORD_SIZE,MODADD_LAT) modadd_i(clk,qH,a,b,e);
modsub #(LOGQ,Q_VALUE,WORD_SIZE,MODADD_LAT) modsub_i(clk,qH,a,b,o);

endmodule