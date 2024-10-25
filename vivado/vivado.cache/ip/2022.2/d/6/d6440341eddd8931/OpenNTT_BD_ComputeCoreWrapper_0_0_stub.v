// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Fri Oct 25 15:56:47 2024
// Host        : ipd005 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ OpenNTT_BD_ComputeCoreWrapper_0_0_stub.v
// Design      : OpenNTT_BD_ComputeCoreWrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ComputeCoreWrapper,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, control_low_word, control_high_word, 
  dina_ext_low_word, dina_ext_high_word, dina2_ext_word, dina3_ext_low_word, 
  dina3_ext_high_word, dout_ext_low_word, dout_ext_high_word, status, dma_bram_byte_wea, 
  dma_bram_abs_addr, dma_bram_dina, dma_bram_doutb, dma_bram_en)
/* synthesis syn_black_box black_box_pad_pin="clk,control_low_word[31:0],control_high_word[31:0],dina_ext_low_word[31:0],dina_ext_high_word[31:0],dina2_ext_word[31:0],dina3_ext_low_word[31:0],dina3_ext_high_word[31:0],dout_ext_low_word[31:0],dout_ext_high_word[31:0],status[31:0],dma_bram_byte_wea[7:0],dma_bram_abs_addr[19:0],dma_bram_dina[63:0],dma_bram_doutb[63:0],dma_bram_en" */;
  input clk;
  input [31:0]control_low_word;
  input [31:0]control_high_word;
  input [31:0]dina_ext_low_word;
  input [31:0]dina_ext_high_word;
  input [31:0]dina2_ext_word;
  input [31:0]dina3_ext_low_word;
  input [31:0]dina3_ext_high_word;
  output [31:0]dout_ext_low_word;
  output [31:0]dout_ext_high_word;
  output [31:0]status;
  input [7:0]dma_bram_byte_wea;
  input [19:0]dma_bram_abs_addr;
  input [63:0]dma_bram_dina;
  output [63:0]dma_bram_doutb;
  input dma_bram_en;
endmodule
