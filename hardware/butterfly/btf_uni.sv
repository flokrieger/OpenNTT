/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps


// Unified DIF/DIT-based (Cooley Tukey/Gentleman Sande) butterfly unit

module btf_uni #
(
    parameter LOGQ = 0,
    parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant  
    parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
    // modular add/sub parameters
    parameter MODADD_LAT = 0, // options: 0, 1 or 2 (Latency for ADD/SUB)
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
    parameter BTF_TYPE = "unified", // "unified" or "ct" (DIT) or "gs" (DIF)
    parameter SHIFT_AE = 0, // 1: shift input a/output e by MODRED_LAT+INTMUL_LAT
    parameter DIV_BY_2 = 1  // instantiate division-by-2 module
)
(
    input  clk,
    input  dif_dit, // 0: dif, 1: dit (by default, it is 0)
    input  div_by_2, // perform final division by 2 if high
    input  [1:0] opcode, // 0: butterfly, 1: multiply, 2: modadd, 3: modsub
    input  [LOGQ-1:0] q,
    input  [LOGQ-1:0] a,b,w,
    output [LOGQ-1:0] e,o,
    output [LOGQ-1:0] add_out,sub_out,mult_out
);

wire dif_dit_internal;
assign dif_dit_internal = BTF_TYPE == "unified" ? (opcode == 2'd0 ? dif_dit : 1'd1) :
                          BTF_TYPE == "ct" ? 1'd1 : 1'd0;

reg dif_by_2_DP;
always_ff @( posedge clk ) begin
  dif_by_2_DP <= opcode == 2'd0 ? div_by_2 : 1'd0;
end

wire [LOGQ-1:0] addsub_i0,addsub_i1;
wire [LOGQ-1:0] addsub_o0,addsub_o1;

wire [LOGQ-1:0] modmul_i0,modmul_i1;
wire [LOGQ-1:0] modmul_o0,modmul_o1;

wire dif_dit_d0,dif_dit_d1;

wire [LOGQ-1:0] e_bf, o_bf;
reg  [LOGQ-1:0] e_bf_1DP, o_bf_1DP;
wire [LOGQ-1:0] e_div, o_div;

shiftreg #(INTMUL_LAT+MODRED_LAT, 1) dif_dit_sr_i   (clk,dif_dit_internal,dif_dit_d0);
shiftreg #(MODADD_LAT           , 1) dif_dit_d0_sr_i(clk,dif_dit_d0,dif_dit_d1);

// shift control units

// units
logic [LOGQ-WORD_SIZE-1:0] qH;
assign qH = q[LOGQ-1:WORD_SIZE];
btf_addsub #(LOGQ,Q_VALUE,WORD_SIZE,MODADD_LAT) btf_addsub_i(clk,qH,addsub_i0,addsub_i1,addsub_o0,addsub_o1);
btf_modmul #(LOGQ,Q_VALUE,WORD_SIZE,INTMUL_LAT,INTMUL_TYPE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT,SHIFT_AE) btf_modmul_i(clk,q,modmul_i0,modmul_i1,w,modmul_o0,modmul_o1);

// MUXes
assign modmul_i0 = (dif_dit_internal == 1'b1)    ? a         : addsub_o0;
assign modmul_i1 = (dif_dit_internal == 1'b1)    ? b         : addsub_o1;

assign addsub_i0 = (dif_dit_d0 == 1'b1) ? modmul_o0 : a;
assign addsub_i1 = (dif_dit_d0 == 1'b1) ? modmul_o1 : b;

// BF output MUXes
assign e_bf       = (dif_dit_d1 == 1'b1) ? addsub_o0 : modmul_o0;
assign o_bf       = (dif_dit_d1 == 1'b1) ? addsub_o1 : modmul_o1;

// division by 2:
if(DIV_BY_2) begin
  divby2 #(LOGQ,Q_VALUE,WORD_SIZE,1) e_divby2_i(clk,e_bf,qH,e_div);
  divby2 #(LOGQ,Q_VALUE,WORD_SIZE,1) o_divby2_i(clk,o_bf,qH,o_div);
  always_ff @( posedge clk ) begin
    e_bf_1DP <= e_bf;
    o_bf_1DP <= o_bf;
  end
  assign e = dif_by_2_DP ? e_div : e_bf_1DP;
  assign o = dif_by_2_DP ? o_div : o_bf_1DP;
end else begin
  assign e = e_bf;
  assign o = o_bf;
end

// add / sub / mult out:
assign add_out = addsub_o0;
assign sub_out = addsub_o1;
assign mult_out = modmul_o1;

localparam ADD_SUB_LAT     = BTF_TYPE == "gs" ? MODADD_LAT : MODADD_LAT + INTMUL_LAT + MODRED_LAT;
localparam ADD_SUB_B_DELAY = BTF_TYPE == "gs" ? 0 : INTMUL_LAT + MODRED_LAT;
localparam MULT_LAT        = BTF_TYPE == "unified" || BTF_TYPE == "ct" ? INTMUL_LAT + MODRED_LAT : MODADD_LAT + INTMUL_LAT + MODRED_LAT;
localparam MULT_B_DELAY    = BTF_TYPE == "unified" || BTF_TYPE == "ct" ? 0 : MODADD_LAT;
localparam BTF_LAT         = MODADD_LAT + INTMUL_LAT + MODRED_LAT + (DIV_BY_2 ? 1 : 0);
localparam BTF_W_DIF_DELAY = MODADD_LAT;

endmodule