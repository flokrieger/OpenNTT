/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

`timescale 1ns/1ps

// Top module for twiddle factor generation. Instantiates the correct module
// depending on the NTT type
module TwiddleGen #(
    parameter LOGQ = 0,
    parameter LOGN = 0,
    parameter PE = 0,

    parameter NTT_TYPE = "fntt_dit_nr", // standalones: fntt_dit_nr, fntt_dif_nr, intt_dit_rn, intt_dif_rn, mfntt_dit_nr, mintt_dif_rn
                                        // unifieds:    fntt_dit_nr-intt_dit_rn, mfntt_dit_nr-mintt_dif_rn

    // twiddle rom:
    parameter ROM_RD_LAT = 2,
    parameter MEM_TYPE = "", // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                             //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)
  parameter ROM_ADDR_WIDTH = 32,
    
    // integer multiplier:
    parameter INTMUL_LAT = 0, // should be at least 1 (valid only if INTMUL_TYPE="")
    parameter INTMUL_TYPE = "", // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)

    // modular reduction:
    parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant
    parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
    parameter MODRED_LAT = 0,
    parameter MODRED_TYPE = "default", // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
    // parameters for default case
    parameter MODRED_L = 4,  // montgomery loop count (calculated as $ceil(LOGQ/WORD_SIZE))
    parameter MODRED_COREMUL_LAT = 1 // latency of multiply and add units in WL Montgomery	
  ) (
    input clk,
    input rst,
    input forward,
    input [LOGQ-1:0] q,
    input [ROM_ADDR_WIDTH-1:0] rom_base_addr,
    output [LOGQ-1:0] tw_out [0:PE-1]
  );

  if(INTMUL_LAT+MODRED_LAT > 31)
    $error("Invalid modular multiplier latency\n");

  localparam IS_UNIFIED = NTT_TYPE == "fntt_dit_nr-intt_dit_rn" || NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn";
  
  logic [LOGQ-1:0] modmult_a_forw[0:PE-1];
  logic [LOGQ-1:0] modmult_b_forw[0:PE-1];
  logic [LOGQ-1:0] modmult_a_inv[0:PE-1];
  logic [LOGQ-1:0] modmult_b_inv[0:PE-1];
  logic [LOGQ-1:0] modmult_c[0:PE-1];
  logic [LOGQ-1:0] q_internal;
  logic [ROM_ADDR_WIDTH-1:0] rom_base_addr_internal;
  logic [LOGQ-1:0] tw_out_0 [0:PE-1];
  logic [LOGQ-1:0] tw_out_1 [0:PE-1];
  logic [LOGQ-1:0] tw_out_tmp [0:PE-1];
  assign q_internal             = Q_VALUE == 0 ? q : Q_VALUE;
  assign rom_base_addr_internal = Q_VALUE == 0 ? rom_base_addr : 0;

  if(NTT_TYPE == "fntt_dit_nr" || NTT_TYPE == "fntt_dit_nr-intt_dit_rn") begin
      if(PE == 1) begin
        logic rst_1DP;
        always_ff @( posedge clk ) rst_1DP <= rst;
        TwiddleGen_DIT_PE1 #(.LOGQ(LOGQ), .LOGN(LOGN), .NR(1), .ROM_RD_LAT(ROM_RD_LAT), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                                .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH),
                                .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT), .INSTANTIATE_MODMULT(IS_UNIFIED?0:1)) 
                              dit_nr 
                              (.clk(clk),.rst(rst & rst_1DP),.q(q_internal),.tw_out(tw_out_0),.rom_base_addr(rom_base_addr_internal),.modmul_a(modmult_a_forw),.modmul_b(modmult_b_forw),.modmul_c(modmult_c));
      end else
        TwiddleGen_DIT_NR #(.LOGQ(LOGQ), .LOGN(LOGN), .PE(PE), .ROM_RD_LAT(ROM_RD_LAT), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                            .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), 
                            .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT), .INSTANTIATE_MODMULT(IS_UNIFIED?0:1)) 
                          dit_nr 
                          (.clk(clk),.rst(rst),.q(q_internal),.tw_out(tw_out_0),.rom_base_addr(rom_base_addr_internal),.modmul_a(modmult_a_forw),.modmul_b(modmult_b_forw),.modmul_c(modmult_c));
  end
  if(NTT_TYPE == "fntt_dif_nr") begin
      TwiddleGen_DIF_NR #(.LOGQ(LOGQ), .LOGN(LOGN), .PE(PE), .ROM_RD_LAT(ROM_RD_LAT), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                          .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), 
                          .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT)) 
                        dif_nr 
                        (.clk(clk),.rst(rst),.q(q_internal),.rom_base_addr(rom_base_addr_internal),.tw_out(tw_out_0));
  end
  if(NTT_TYPE == "intt_dit_rn" || NTT_TYPE == "fntt_dit_nr-intt_dit_rn") begin
      if(PE == 1) begin
        logic rst_1DP;
        always_ff @( posedge clk ) rst_1DP <= rst;
        TwiddleGen_DIT_PE1 #(.LOGQ(LOGQ), .LOGN(LOGN), .NR(0), .ROM_RD_LAT(ROM_RD_LAT), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                                .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH),  
                                .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT), .INSTANTIATE_MODMULT(IS_UNIFIED?0:1)) 
                              dit_rn 
                              (.clk(clk),.rst(rst & rst_1DP),.q(q_internal),.tw_out(tw_out_tmp),.rom_base_addr(rom_base_addr_internal),.modmul_a(modmult_a_inv),.modmul_b(modmult_b_inv),.modmul_c(modmult_c));
      end else
        TwiddleGen_DIT_RN #(.LOGQ(LOGQ), .LOGN(LOGN), .PE(PE), .ROM_RD_LAT(ROM_RD_LAT), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                            .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), 
                            .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT), .INSTANTIATE_MODMULT(IS_UNIFIED?0:1)) 
                          dit_rn 
                          (.clk(clk),.rst(rst),.q(q_internal),.tw_out(tw_out_tmp),.rom_base_addr(rom_base_addr_internal),.modmul_a(modmult_a_inv),.modmul_b(modmult_b_inv),.modmul_c(modmult_c)); 

    if(NTT_TYPE == "fntt_dit_nr-intt_dit_rn")
      assign tw_out_1 = tw_out_tmp;
    else
      assign tw_out_0 = tw_out_tmp;
  end
  if(NTT_TYPE == "intt_dif_rn") begin
      TwiddleGen_DIF_RN #(.LOGQ(LOGQ), .LOGN(LOGN), .PE(PE), .ROM_RD_LAT(ROM_RD_LAT), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                          .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), 
                          .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT)) 
                        dif_rn 
                        (.clk(clk),.rst(rst),.q(q_internal),.rom_base_addr(rom_base_addr_internal),.tw_out(tw_out_0));
  end
  if(NTT_TYPE == "mfntt_dit_nr" || NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") begin
      TwiddleGen_Merged_DIT_NR #(.LOGQ(LOGQ), .LOGN(LOGN), .PE(PE), .ROM_RD_LAT(ROM_RD_LAT), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                                  .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH),
                                  .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT), .INSTANTIATE_MODMULT(IS_UNIFIED?0:1)) 
                                dit_nr 
                                (.clk(clk),.rst(rst),.q(q_internal),.tw_out(tw_out_0),.rom_base_addr(rom_base_addr_internal),.modmul_a(modmult_a_forw),.modmul_b(modmult_b_forw),.modmul_c(modmult_c));
  end
  if(NTT_TYPE == "mintt_dif_rn" || NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") begin
      TwiddleGen_Merged_DIF_RN #(.LOGQ(LOGQ), .LOGN(LOGN), .PE(PE), .ROM_RD_LAT(ROM_RD_LAT), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH), .MEM_TYPE(MEM_TYPE), .INTMUL_LAT(INTMUL_LAT), 
                                  .INTMUL_TYPE(INTMUL_TYPE), .Q_VALUE(Q_VALUE), .WORD_SIZE(WORD_SIZE), .MODRED_LAT(MODRED_LAT), 
                                  .MODRED_TYPE(MODRED_TYPE), .MODRED_L(MODRED_L), .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT), .INSTANTIATE_MODMULT(IS_UNIFIED?0:1)) 
                                dif_rn 
                                (.clk(clk),.rst(rst),.q(q_internal),.tw_out(tw_out_tmp),.rom_base_addr(rom_base_addr_internal),.modmul_a(modmult_a_inv),.modmul_b(modmult_b_inv),.modmul_c(modmult_c));
    if(NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn")
      assign tw_out_1 = tw_out_tmp;
    else
      assign tw_out_0 = tw_out_tmp;
  end


  generate
    if(IS_UNIFIED)begin
      logic forward_reg;
      always_ff @(posedge clk) forward_reg <= forward;
      assign tw_out = forward_reg ? tw_out_0 : tw_out_1;

      for(genvar g=0; g < PE; g=g+1) begin
        logic [LOGQ-1:0] q_reg;
        shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_q (.clk(clk),.data_in(q_internal),.data_out(q_reg));
        logic [2*LOGQ-1:0] imul;
        intmul #(LOGQ,LOGQ,INTMUL_LAT,INTMUL_TYPE) intmul_i(clk,forward_reg ? modmult_a_forw[g] : modmult_a_inv[g],forward_reg ? modmult_b_forw[g] : modmult_b_inv[g],imul);
        modred #(LOGQ,Q_VALUE,WORD_SIZE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT) modred_i(clk,imul,q_reg,modmult_c[g]);
      end
    end  else begin
      assign tw_out = tw_out_0;
    end
  endgenerate
endmodule