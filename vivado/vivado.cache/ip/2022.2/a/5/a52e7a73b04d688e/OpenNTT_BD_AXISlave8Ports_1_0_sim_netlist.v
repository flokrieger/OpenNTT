// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Fri Oct 25 15:45:12 2024
// Host        : ipd005 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ OpenNTT_BD_AXISlave8Ports_1_0_sim_netlist.v
// Design      : OpenNTT_BD_AXISlave8Ports_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXISlave8Ports
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    control_low_word,
    control_high_word,
    dina_ext_low_word,
    dina_ext_high_word,
    dina2_ext_word,
    dina3_ext_low_word,
    dina3_ext_high_word,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    status,
    dout_ext_high_word,
    dout_ext_low_word,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wstrb,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output [31:0]control_low_word;
  output [31:0]control_high_word;
  output [31:0]dina_ext_low_word;
  output [31:0]dina_ext_high_word;
  output [31:0]dina2_ext_word;
  output [31:0]dina3_ext_low_word;
  output [31:0]dina3_ext_high_word;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axi_aclk;
  input [3:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_araddr;
  input [31:0]status;
  input [31:0]dout_ext_high_word;
  input [31:0]dout_ext_low_word;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [3:0]s00_axi_wstrb;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire AXI_Slave8Ports_new_v1_0_S00_AXI_inst_n_4;
  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire [31:0]control_high_word;
  wire [31:0]control_low_word;
  wire [31:0]dina2_ext_word;
  wire [31:0]dina3_ext_high_word;
  wire [31:0]dina3_ext_low_word;
  wire [31:0]dina_ext_high_word;
  wire [31:0]dina_ext_low_word;
  wire [31:0]dout_ext_high_word;
  wire [31:0]dout_ext_low_word;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire [31:0]status;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXI_Slave8Ports_new_v1_0_S00_AXI AXI_Slave8Ports_new_v1_0_S00_AXI_inst
       (.SR(\slv_reg0[31]_i_1_n_0 ),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .aw_en_reg_0(AXI_Slave8Ports_new_v1_0_S00_AXI_inst_n_4),
        .aw_en_reg_1(aw_en_i_1_n_0),
        .axi_bvalid_reg_0(axi_bvalid_i_1_n_0),
        .axi_rvalid_reg_0(axi_rvalid_i_1_n_0),
        .control_high_word(control_high_word),
        .control_low_word(control_low_word),
        .dina2_ext_word(dina2_ext_word),
        .dina3_ext_high_word(dina3_ext_high_word),
        .dina3_ext_low_word(dina3_ext_low_word),
        .dina_ext_high_word(dina_ext_high_word),
        .dina_ext_low_word(dina_ext_low_word),
        .dout_ext_high_word(dout_ext_high_word),
        .dout_ext_low_word(dout_ext_low_word),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .status(status));
  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(AXI_Slave8Ports_new_v1_0_S00_AXI_inst_n_4),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(S_AXI_WREADY),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \slv_reg0[31]_i_1 
       (.I0(s00_axi_aresetn),
        .O(\slv_reg0[31]_i_1_n_0 ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXI_Slave8Ports_new_v1_0_S00_AXI
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_bvalid,
    aw_en_reg_0,
    s00_axi_rvalid,
    control_low_word,
    control_high_word,
    dina_ext_low_word,
    dina_ext_high_word,
    dina2_ext_word,
    dina3_ext_low_word,
    dina3_ext_high_word,
    s00_axi_rdata,
    SR,
    s00_axi_aclk,
    axi_bvalid_reg_0,
    aw_en_reg_1,
    axi_rvalid_reg_0,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    status,
    dout_ext_high_word,
    dout_ext_low_word,
    s00_axi_arvalid,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_wstrb);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output s00_axi_bvalid;
  output aw_en_reg_0;
  output s00_axi_rvalid;
  output [31:0]control_low_word;
  output [31:0]control_high_word;
  output [31:0]dina_ext_low_word;
  output [31:0]dina_ext_high_word;
  output [31:0]dina2_ext_word;
  output [31:0]dina3_ext_low_word;
  output [31:0]dina3_ext_high_word;
  output [31:0]s00_axi_rdata;
  input [0:0]SR;
  input s00_axi_aclk;
  input axi_bvalid_reg_0;
  input aw_en_reg_1;
  input axi_rvalid_reg_0;
  input [3:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_araddr;
  input [31:0]status;
  input [31:0]dout_ext_high_word;
  input [31:0]dout_ext_low_word;
  input s00_axi_arvalid;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input [3:0]s00_axi_wstrb;

  wire [0:0]SR;
  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_reg_0;
  wire aw_en_reg_1;
  wire axi_arready0;
  wire axi_awready0;
  wire axi_bvalid_reg_0;
  wire \axi_rdata[0]_i_4_n_0 ;
  wire \axi_rdata[0]_i_5_n_0 ;
  wire \axi_rdata[0]_i_6_n_0 ;
  wire \axi_rdata[0]_i_7_n_0 ;
  wire \axi_rdata[10]_i_4_n_0 ;
  wire \axi_rdata[10]_i_5_n_0 ;
  wire \axi_rdata[10]_i_6_n_0 ;
  wire \axi_rdata[10]_i_7_n_0 ;
  wire \axi_rdata[11]_i_4_n_0 ;
  wire \axi_rdata[11]_i_5_n_0 ;
  wire \axi_rdata[11]_i_6_n_0 ;
  wire \axi_rdata[11]_i_7_n_0 ;
  wire \axi_rdata[12]_i_4_n_0 ;
  wire \axi_rdata[12]_i_5_n_0 ;
  wire \axi_rdata[12]_i_6_n_0 ;
  wire \axi_rdata[12]_i_7_n_0 ;
  wire \axi_rdata[13]_i_4_n_0 ;
  wire \axi_rdata[13]_i_5_n_0 ;
  wire \axi_rdata[13]_i_6_n_0 ;
  wire \axi_rdata[13]_i_7_n_0 ;
  wire \axi_rdata[14]_i_4_n_0 ;
  wire \axi_rdata[14]_i_5_n_0 ;
  wire \axi_rdata[14]_i_6_n_0 ;
  wire \axi_rdata[14]_i_7_n_0 ;
  wire \axi_rdata[15]_i_4_n_0 ;
  wire \axi_rdata[15]_i_5_n_0 ;
  wire \axi_rdata[15]_i_6_n_0 ;
  wire \axi_rdata[15]_i_7_n_0 ;
  wire \axi_rdata[16]_i_4_n_0 ;
  wire \axi_rdata[16]_i_5_n_0 ;
  wire \axi_rdata[16]_i_6_n_0 ;
  wire \axi_rdata[16]_i_7_n_0 ;
  wire \axi_rdata[17]_i_4_n_0 ;
  wire \axi_rdata[17]_i_5_n_0 ;
  wire \axi_rdata[17]_i_6_n_0 ;
  wire \axi_rdata[17]_i_7_n_0 ;
  wire \axi_rdata[18]_i_4_n_0 ;
  wire \axi_rdata[18]_i_5_n_0 ;
  wire \axi_rdata[18]_i_6_n_0 ;
  wire \axi_rdata[18]_i_7_n_0 ;
  wire \axi_rdata[19]_i_4_n_0 ;
  wire \axi_rdata[19]_i_5_n_0 ;
  wire \axi_rdata[19]_i_6_n_0 ;
  wire \axi_rdata[19]_i_7_n_0 ;
  wire \axi_rdata[1]_i_4_n_0 ;
  wire \axi_rdata[1]_i_5_n_0 ;
  wire \axi_rdata[1]_i_6_n_0 ;
  wire \axi_rdata[1]_i_7_n_0 ;
  wire \axi_rdata[20]_i_4_n_0 ;
  wire \axi_rdata[20]_i_5_n_0 ;
  wire \axi_rdata[20]_i_6_n_0 ;
  wire \axi_rdata[20]_i_7_n_0 ;
  wire \axi_rdata[21]_i_4_n_0 ;
  wire \axi_rdata[21]_i_5_n_0 ;
  wire \axi_rdata[21]_i_6_n_0 ;
  wire \axi_rdata[21]_i_7_n_0 ;
  wire \axi_rdata[22]_i_4_n_0 ;
  wire \axi_rdata[22]_i_5_n_0 ;
  wire \axi_rdata[22]_i_6_n_0 ;
  wire \axi_rdata[22]_i_7_n_0 ;
  wire \axi_rdata[23]_i_4_n_0 ;
  wire \axi_rdata[23]_i_5_n_0 ;
  wire \axi_rdata[23]_i_6_n_0 ;
  wire \axi_rdata[23]_i_7_n_0 ;
  wire \axi_rdata[24]_i_4_n_0 ;
  wire \axi_rdata[24]_i_5_n_0 ;
  wire \axi_rdata[24]_i_6_n_0 ;
  wire \axi_rdata[24]_i_7_n_0 ;
  wire \axi_rdata[25]_i_4_n_0 ;
  wire \axi_rdata[25]_i_5_n_0 ;
  wire \axi_rdata[25]_i_6_n_0 ;
  wire \axi_rdata[25]_i_7_n_0 ;
  wire \axi_rdata[26]_i_4_n_0 ;
  wire \axi_rdata[26]_i_5_n_0 ;
  wire \axi_rdata[26]_i_6_n_0 ;
  wire \axi_rdata[26]_i_7_n_0 ;
  wire \axi_rdata[27]_i_4_n_0 ;
  wire \axi_rdata[27]_i_5_n_0 ;
  wire \axi_rdata[27]_i_6_n_0 ;
  wire \axi_rdata[27]_i_7_n_0 ;
  wire \axi_rdata[28]_i_4_n_0 ;
  wire \axi_rdata[28]_i_5_n_0 ;
  wire \axi_rdata[28]_i_6_n_0 ;
  wire \axi_rdata[28]_i_7_n_0 ;
  wire \axi_rdata[29]_i_4_n_0 ;
  wire \axi_rdata[29]_i_5_n_0 ;
  wire \axi_rdata[29]_i_6_n_0 ;
  wire \axi_rdata[29]_i_7_n_0 ;
  wire \axi_rdata[2]_i_4_n_0 ;
  wire \axi_rdata[2]_i_5_n_0 ;
  wire \axi_rdata[2]_i_6_n_0 ;
  wire \axi_rdata[2]_i_7_n_0 ;
  wire \axi_rdata[30]_i_4_n_0 ;
  wire \axi_rdata[30]_i_5_n_0 ;
  wire \axi_rdata[30]_i_6_n_0 ;
  wire \axi_rdata[30]_i_7_n_0 ;
  wire \axi_rdata[31]_i_4_n_0 ;
  wire \axi_rdata[31]_i_5_n_0 ;
  wire \axi_rdata[31]_i_6_n_0 ;
  wire \axi_rdata[31]_i_7_n_0 ;
  wire \axi_rdata[3]_i_4_n_0 ;
  wire \axi_rdata[3]_i_5_n_0 ;
  wire \axi_rdata[3]_i_6_n_0 ;
  wire \axi_rdata[3]_i_7_n_0 ;
  wire \axi_rdata[4]_i_4_n_0 ;
  wire \axi_rdata[4]_i_5_n_0 ;
  wire \axi_rdata[4]_i_6_n_0 ;
  wire \axi_rdata[4]_i_7_n_0 ;
  wire \axi_rdata[5]_i_4_n_0 ;
  wire \axi_rdata[5]_i_5_n_0 ;
  wire \axi_rdata[5]_i_6_n_0 ;
  wire \axi_rdata[5]_i_7_n_0 ;
  wire \axi_rdata[6]_i_4_n_0 ;
  wire \axi_rdata[6]_i_5_n_0 ;
  wire \axi_rdata[6]_i_6_n_0 ;
  wire \axi_rdata[6]_i_7_n_0 ;
  wire \axi_rdata[7]_i_4_n_0 ;
  wire \axi_rdata[7]_i_5_n_0 ;
  wire \axi_rdata[7]_i_6_n_0 ;
  wire \axi_rdata[7]_i_7_n_0 ;
  wire \axi_rdata[8]_i_4_n_0 ;
  wire \axi_rdata[8]_i_5_n_0 ;
  wire \axi_rdata[8]_i_6_n_0 ;
  wire \axi_rdata[8]_i_7_n_0 ;
  wire \axi_rdata[9]_i_4_n_0 ;
  wire \axi_rdata[9]_i_5_n_0 ;
  wire \axi_rdata[9]_i_6_n_0 ;
  wire \axi_rdata[9]_i_7_n_0 ;
  wire \axi_rdata_reg[0]_i_2_n_0 ;
  wire \axi_rdata_reg[0]_i_3_n_0 ;
  wire \axi_rdata_reg[10]_i_2_n_0 ;
  wire \axi_rdata_reg[10]_i_3_n_0 ;
  wire \axi_rdata_reg[11]_i_2_n_0 ;
  wire \axi_rdata_reg[11]_i_3_n_0 ;
  wire \axi_rdata_reg[12]_i_2_n_0 ;
  wire \axi_rdata_reg[12]_i_3_n_0 ;
  wire \axi_rdata_reg[13]_i_2_n_0 ;
  wire \axi_rdata_reg[13]_i_3_n_0 ;
  wire \axi_rdata_reg[14]_i_2_n_0 ;
  wire \axi_rdata_reg[14]_i_3_n_0 ;
  wire \axi_rdata_reg[15]_i_2_n_0 ;
  wire \axi_rdata_reg[15]_i_3_n_0 ;
  wire \axi_rdata_reg[16]_i_2_n_0 ;
  wire \axi_rdata_reg[16]_i_3_n_0 ;
  wire \axi_rdata_reg[17]_i_2_n_0 ;
  wire \axi_rdata_reg[17]_i_3_n_0 ;
  wire \axi_rdata_reg[18]_i_2_n_0 ;
  wire \axi_rdata_reg[18]_i_3_n_0 ;
  wire \axi_rdata_reg[19]_i_2_n_0 ;
  wire \axi_rdata_reg[19]_i_3_n_0 ;
  wire \axi_rdata_reg[1]_i_2_n_0 ;
  wire \axi_rdata_reg[1]_i_3_n_0 ;
  wire \axi_rdata_reg[20]_i_2_n_0 ;
  wire \axi_rdata_reg[20]_i_3_n_0 ;
  wire \axi_rdata_reg[21]_i_2_n_0 ;
  wire \axi_rdata_reg[21]_i_3_n_0 ;
  wire \axi_rdata_reg[22]_i_2_n_0 ;
  wire \axi_rdata_reg[22]_i_3_n_0 ;
  wire \axi_rdata_reg[23]_i_2_n_0 ;
  wire \axi_rdata_reg[23]_i_3_n_0 ;
  wire \axi_rdata_reg[24]_i_2_n_0 ;
  wire \axi_rdata_reg[24]_i_3_n_0 ;
  wire \axi_rdata_reg[25]_i_2_n_0 ;
  wire \axi_rdata_reg[25]_i_3_n_0 ;
  wire \axi_rdata_reg[26]_i_2_n_0 ;
  wire \axi_rdata_reg[26]_i_3_n_0 ;
  wire \axi_rdata_reg[27]_i_2_n_0 ;
  wire \axi_rdata_reg[27]_i_3_n_0 ;
  wire \axi_rdata_reg[28]_i_2_n_0 ;
  wire \axi_rdata_reg[28]_i_3_n_0 ;
  wire \axi_rdata_reg[29]_i_2_n_0 ;
  wire \axi_rdata_reg[29]_i_3_n_0 ;
  wire \axi_rdata_reg[2]_i_2_n_0 ;
  wire \axi_rdata_reg[2]_i_3_n_0 ;
  wire \axi_rdata_reg[30]_i_2_n_0 ;
  wire \axi_rdata_reg[30]_i_3_n_0 ;
  wire \axi_rdata_reg[31]_i_2_n_0 ;
  wire \axi_rdata_reg[31]_i_3_n_0 ;
  wire \axi_rdata_reg[3]_i_2_n_0 ;
  wire \axi_rdata_reg[3]_i_3_n_0 ;
  wire \axi_rdata_reg[4]_i_2_n_0 ;
  wire \axi_rdata_reg[4]_i_3_n_0 ;
  wire \axi_rdata_reg[5]_i_2_n_0 ;
  wire \axi_rdata_reg[5]_i_3_n_0 ;
  wire \axi_rdata_reg[6]_i_2_n_0 ;
  wire \axi_rdata_reg[6]_i_3_n_0 ;
  wire \axi_rdata_reg[7]_i_2_n_0 ;
  wire \axi_rdata_reg[7]_i_3_n_0 ;
  wire \axi_rdata_reg[8]_i_2_n_0 ;
  wire \axi_rdata_reg[8]_i_3_n_0 ;
  wire \axi_rdata_reg[9]_i_2_n_0 ;
  wire \axi_rdata_reg[9]_i_3_n_0 ;
  wire axi_rvalid_reg_0;
  wire axi_wready0;
  wire [31:0]control_high_word;
  wire [31:0]control_low_word;
  wire [31:0]dina2_ext_word;
  wire [31:0]dina3_ext_high_word;
  wire [31:0]dina3_ext_low_word;
  wire [31:0]dina_ext_high_word;
  wire [31:0]dina_ext_low_word;
  wire [31:0]dout_ext_high_word;
  wire [31:0]dout_ext_low_word;
  wire [3:0]p_0_in;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [3:0]sel0;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire \slv_reg3[15]_i_1_n_0 ;
  wire \slv_reg3[23]_i_1_n_0 ;
  wire \slv_reg3[31]_i_1_n_0 ;
  wire \slv_reg3[7]_i_1_n_0 ;
  wire \slv_reg7[15]_i_1_n_0 ;
  wire \slv_reg7[23]_i_1_n_0 ;
  wire \slv_reg7[31]_i_1_n_0 ;
  wire \slv_reg7[7]_i_1_n_0 ;
  wire \slv_reg8[0][15]_i_1_n_0 ;
  wire \slv_reg8[0][23]_i_1_n_0 ;
  wire \slv_reg8[0][31]_i_1_n_0 ;
  wire \slv_reg8[0][7]_i_1_n_0 ;
  wire \slv_reg8[1][15]_i_1_n_0 ;
  wire \slv_reg8[1][23]_i_1_n_0 ;
  wire \slv_reg8[1][31]_i_1_n_0 ;
  wire \slv_reg8[1][7]_i_1_n_0 ;
  wire \slv_reg8[2][15]_i_1_n_0 ;
  wire \slv_reg8[2][23]_i_1_n_0 ;
  wire \slv_reg8[2][31]_i_1_n_0 ;
  wire \slv_reg8[2][7]_i_1_n_0 ;
  wire \slv_reg8[3][15]_i_1_n_0 ;
  wire \slv_reg8[3][23]_i_1_n_0 ;
  wire \slv_reg8[3][31]_i_1_n_0 ;
  wire \slv_reg8[3][7]_i_1_n_0 ;
  wire \slv_reg8[4][15]_i_1_n_0 ;
  wire \slv_reg8[4][23]_i_1_n_0 ;
  wire \slv_reg8[4][31]_i_1_n_0 ;
  wire \slv_reg8[4][7]_i_1_n_0 ;
  wire \slv_reg8[5][15]_i_1_n_0 ;
  wire \slv_reg8[5][23]_i_1_n_0 ;
  wire \slv_reg8[5][31]_i_1_n_0 ;
  wire \slv_reg8[5][7]_i_1_n_0 ;
  wire \slv_reg8[6][15]_i_1_n_0 ;
  wire \slv_reg8[6][23]_i_1_n_0 ;
  wire \slv_reg8[6][31]_i_1_n_0 ;
  wire \slv_reg8[6][7]_i_1_n_0 ;
  wire \slv_reg8[7][15]_i_1_n_0 ;
  wire \slv_reg8[7][23]_i_1_n_0 ;
  wire \slv_reg8[7][31]_i_1_n_0 ;
  wire \slv_reg8[7][7]_i_1_n_0 ;
  wire [31:0]\slv_reg8_reg[2]_0 ;
  wire [31:0]\slv_reg8_reg[3]_1 ;
  wire [31:0]\slv_reg8_reg[4]_2 ;
  wire [31:0]\slv_reg8_reg[5]_3 ;
  wire [31:0]\slv_reg8_reg[6]_4 ;
  wire [31:0]\slv_reg8_reg[7]_5 ;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;
  wire [31:0]status;

  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_reg_1),
        .Q(aw_en_reg_0),
        .S(SR));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[0]),
        .Q(sel0[0]),
        .R(SR));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[1]),
        .Q(sel0[1]),
        .R(SR));
  FDRE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[2]),
        .Q(sel0[2]),
        .R(SR));
  FDRE \axi_araddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[3]),
        .Q(sel0[3]),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(SR));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[0]),
        .Q(p_0_in[0]),
        .R(SR));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[1]),
        .Q(p_0_in[1]),
        .R(SR));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[2]),
        .Q(p_0_in[2]),
        .R(SR));
  FDRE \axi_awaddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[3]),
        .Q(p_0_in[3]),
        .R(SR));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_1
       (.I0(s00_axi_wvalid),
        .I1(S_AXI_AWREADY),
        .I2(aw_en_reg_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(SR));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_reg_0),
        .Q(s00_axi_bvalid),
        .R(SR));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_4 
       (.I0(dina_ext_high_word[0]),
        .I1(dina_ext_low_word[0]),
        .I2(sel0[1]),
        .I3(control_high_word[0]),
        .I4(sel0[0]),
        .I5(control_low_word[0]),
        .O(\axi_rdata[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_5 
       (.I0(dina2_ext_word[0]),
        .I1(status[0]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[0]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[0]),
        .O(\axi_rdata[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [0]),
        .I1(\slv_reg8_reg[2]_0 [0]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[0]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[0]),
        .O(\axi_rdata[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [0]),
        .I1(\slv_reg8_reg[6]_4 [0]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [0]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [0]),
        .O(\axi_rdata[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[10]_i_4 
       (.I0(dina_ext_high_word[10]),
        .I1(dina_ext_low_word[10]),
        .I2(sel0[1]),
        .I3(control_high_word[10]),
        .I4(sel0[0]),
        .I5(control_low_word[10]),
        .O(\axi_rdata[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[10]_i_5 
       (.I0(dina2_ext_word[10]),
        .I1(status[10]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[10]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[10]),
        .O(\axi_rdata[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[10]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [10]),
        .I1(\slv_reg8_reg[2]_0 [10]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[10]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[10]),
        .O(\axi_rdata[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[10]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [10]),
        .I1(\slv_reg8_reg[6]_4 [10]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [10]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [10]),
        .O(\axi_rdata[10]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[11]_i_4 
       (.I0(dina_ext_high_word[11]),
        .I1(dina_ext_low_word[11]),
        .I2(sel0[1]),
        .I3(control_high_word[11]),
        .I4(sel0[0]),
        .I5(control_low_word[11]),
        .O(\axi_rdata[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[11]_i_5 
       (.I0(dina2_ext_word[11]),
        .I1(status[11]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[11]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[11]),
        .O(\axi_rdata[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[11]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [11]),
        .I1(\slv_reg8_reg[2]_0 [11]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[11]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[11]),
        .O(\axi_rdata[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[11]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [11]),
        .I1(\slv_reg8_reg[6]_4 [11]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [11]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [11]),
        .O(\axi_rdata[11]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[12]_i_4 
       (.I0(dina_ext_high_word[12]),
        .I1(dina_ext_low_word[12]),
        .I2(sel0[1]),
        .I3(control_high_word[12]),
        .I4(sel0[0]),
        .I5(control_low_word[12]),
        .O(\axi_rdata[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[12]_i_5 
       (.I0(dina2_ext_word[12]),
        .I1(status[12]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[12]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[12]),
        .O(\axi_rdata[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[12]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [12]),
        .I1(\slv_reg8_reg[2]_0 [12]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[12]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[12]),
        .O(\axi_rdata[12]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[12]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [12]),
        .I1(\slv_reg8_reg[6]_4 [12]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [12]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [12]),
        .O(\axi_rdata[12]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[13]_i_4 
       (.I0(dina_ext_high_word[13]),
        .I1(dina_ext_low_word[13]),
        .I2(sel0[1]),
        .I3(control_high_word[13]),
        .I4(sel0[0]),
        .I5(control_low_word[13]),
        .O(\axi_rdata[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[13]_i_5 
       (.I0(dina2_ext_word[13]),
        .I1(status[13]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[13]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[13]),
        .O(\axi_rdata[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[13]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [13]),
        .I1(\slv_reg8_reg[2]_0 [13]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[13]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[13]),
        .O(\axi_rdata[13]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[13]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [13]),
        .I1(\slv_reg8_reg[6]_4 [13]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [13]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [13]),
        .O(\axi_rdata[13]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[14]_i_4 
       (.I0(dina_ext_high_word[14]),
        .I1(dina_ext_low_word[14]),
        .I2(sel0[1]),
        .I3(control_high_word[14]),
        .I4(sel0[0]),
        .I5(control_low_word[14]),
        .O(\axi_rdata[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[14]_i_5 
       (.I0(dina2_ext_word[14]),
        .I1(status[14]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[14]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[14]),
        .O(\axi_rdata[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[14]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [14]),
        .I1(\slv_reg8_reg[2]_0 [14]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[14]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[14]),
        .O(\axi_rdata[14]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[14]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [14]),
        .I1(\slv_reg8_reg[6]_4 [14]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [14]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [14]),
        .O(\axi_rdata[14]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[15]_i_4 
       (.I0(dina_ext_high_word[15]),
        .I1(dina_ext_low_word[15]),
        .I2(sel0[1]),
        .I3(control_high_word[15]),
        .I4(sel0[0]),
        .I5(control_low_word[15]),
        .O(\axi_rdata[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[15]_i_5 
       (.I0(dina2_ext_word[15]),
        .I1(status[15]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[15]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[15]),
        .O(\axi_rdata[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[15]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [15]),
        .I1(\slv_reg8_reg[2]_0 [15]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[15]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[15]),
        .O(\axi_rdata[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[15]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [15]),
        .I1(\slv_reg8_reg[6]_4 [15]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [15]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [15]),
        .O(\axi_rdata[15]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_4 
       (.I0(dina_ext_high_word[16]),
        .I1(dina_ext_low_word[16]),
        .I2(sel0[1]),
        .I3(control_high_word[16]),
        .I4(sel0[0]),
        .I5(control_low_word[16]),
        .O(\axi_rdata[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_5 
       (.I0(dina2_ext_word[16]),
        .I1(status[16]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[16]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[16]),
        .O(\axi_rdata[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [16]),
        .I1(\slv_reg8_reg[2]_0 [16]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[16]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[16]),
        .O(\axi_rdata[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[16]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [16]),
        .I1(\slv_reg8_reg[6]_4 [16]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [16]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [16]),
        .O(\axi_rdata[16]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_4 
       (.I0(dina_ext_high_word[17]),
        .I1(dina_ext_low_word[17]),
        .I2(sel0[1]),
        .I3(control_high_word[17]),
        .I4(sel0[0]),
        .I5(control_low_word[17]),
        .O(\axi_rdata[17]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_5 
       (.I0(dina2_ext_word[17]),
        .I1(status[17]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[17]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[17]),
        .O(\axi_rdata[17]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [17]),
        .I1(\slv_reg8_reg[2]_0 [17]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[17]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[17]),
        .O(\axi_rdata[17]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[17]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [17]),
        .I1(\slv_reg8_reg[6]_4 [17]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [17]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [17]),
        .O(\axi_rdata[17]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_4 
       (.I0(dina_ext_high_word[18]),
        .I1(dina_ext_low_word[18]),
        .I2(sel0[1]),
        .I3(control_high_word[18]),
        .I4(sel0[0]),
        .I5(control_low_word[18]),
        .O(\axi_rdata[18]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_5 
       (.I0(dina2_ext_word[18]),
        .I1(status[18]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[18]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[18]),
        .O(\axi_rdata[18]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [18]),
        .I1(\slv_reg8_reg[2]_0 [18]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[18]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[18]),
        .O(\axi_rdata[18]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[18]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [18]),
        .I1(\slv_reg8_reg[6]_4 [18]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [18]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [18]),
        .O(\axi_rdata[18]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_4 
       (.I0(dina_ext_high_word[19]),
        .I1(dina_ext_low_word[19]),
        .I2(sel0[1]),
        .I3(control_high_word[19]),
        .I4(sel0[0]),
        .I5(control_low_word[19]),
        .O(\axi_rdata[19]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_5 
       (.I0(dina2_ext_word[19]),
        .I1(status[19]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[19]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[19]),
        .O(\axi_rdata[19]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [19]),
        .I1(\slv_reg8_reg[2]_0 [19]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[19]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[19]),
        .O(\axi_rdata[19]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[19]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [19]),
        .I1(\slv_reg8_reg[6]_4 [19]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [19]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [19]),
        .O(\axi_rdata[19]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_4 
       (.I0(dina_ext_high_word[1]),
        .I1(dina_ext_low_word[1]),
        .I2(sel0[1]),
        .I3(control_high_word[1]),
        .I4(sel0[0]),
        .I5(control_low_word[1]),
        .O(\axi_rdata[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_5 
       (.I0(dina2_ext_word[1]),
        .I1(status[1]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[1]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[1]),
        .O(\axi_rdata[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [1]),
        .I1(\slv_reg8_reg[2]_0 [1]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[1]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[1]),
        .O(\axi_rdata[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [1]),
        .I1(\slv_reg8_reg[6]_4 [1]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [1]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [1]),
        .O(\axi_rdata[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_4 
       (.I0(dina_ext_high_word[20]),
        .I1(dina_ext_low_word[20]),
        .I2(sel0[1]),
        .I3(control_high_word[20]),
        .I4(sel0[0]),
        .I5(control_low_word[20]),
        .O(\axi_rdata[20]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_5 
       (.I0(dina2_ext_word[20]),
        .I1(status[20]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[20]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[20]),
        .O(\axi_rdata[20]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [20]),
        .I1(\slv_reg8_reg[2]_0 [20]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[20]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[20]),
        .O(\axi_rdata[20]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[20]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [20]),
        .I1(\slv_reg8_reg[6]_4 [20]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [20]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [20]),
        .O(\axi_rdata[20]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_4 
       (.I0(dina_ext_high_word[21]),
        .I1(dina_ext_low_word[21]),
        .I2(sel0[1]),
        .I3(control_high_word[21]),
        .I4(sel0[0]),
        .I5(control_low_word[21]),
        .O(\axi_rdata[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_5 
       (.I0(dina2_ext_word[21]),
        .I1(status[21]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[21]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[21]),
        .O(\axi_rdata[21]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [21]),
        .I1(\slv_reg8_reg[2]_0 [21]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[21]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[21]),
        .O(\axi_rdata[21]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[21]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [21]),
        .I1(\slv_reg8_reg[6]_4 [21]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [21]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [21]),
        .O(\axi_rdata[21]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_4 
       (.I0(dina_ext_high_word[22]),
        .I1(dina_ext_low_word[22]),
        .I2(sel0[1]),
        .I3(control_high_word[22]),
        .I4(sel0[0]),
        .I5(control_low_word[22]),
        .O(\axi_rdata[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_5 
       (.I0(dina2_ext_word[22]),
        .I1(status[22]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[22]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[22]),
        .O(\axi_rdata[22]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [22]),
        .I1(\slv_reg8_reg[2]_0 [22]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[22]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[22]),
        .O(\axi_rdata[22]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[22]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [22]),
        .I1(\slv_reg8_reg[6]_4 [22]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [22]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [22]),
        .O(\axi_rdata[22]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_4 
       (.I0(dina_ext_high_word[23]),
        .I1(dina_ext_low_word[23]),
        .I2(sel0[1]),
        .I3(control_high_word[23]),
        .I4(sel0[0]),
        .I5(control_low_word[23]),
        .O(\axi_rdata[23]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_5 
       (.I0(dina2_ext_word[23]),
        .I1(status[23]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[23]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[23]),
        .O(\axi_rdata[23]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [23]),
        .I1(\slv_reg8_reg[2]_0 [23]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[23]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[23]),
        .O(\axi_rdata[23]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[23]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [23]),
        .I1(\slv_reg8_reg[6]_4 [23]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [23]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [23]),
        .O(\axi_rdata[23]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_4 
       (.I0(dina_ext_high_word[24]),
        .I1(dina_ext_low_word[24]),
        .I2(sel0[1]),
        .I3(control_high_word[24]),
        .I4(sel0[0]),
        .I5(control_low_word[24]),
        .O(\axi_rdata[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_5 
       (.I0(dina2_ext_word[24]),
        .I1(status[24]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[24]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[24]),
        .O(\axi_rdata[24]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [24]),
        .I1(\slv_reg8_reg[2]_0 [24]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[24]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[24]),
        .O(\axi_rdata[24]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[24]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [24]),
        .I1(\slv_reg8_reg[6]_4 [24]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [24]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [24]),
        .O(\axi_rdata[24]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_4 
       (.I0(dina_ext_high_word[25]),
        .I1(dina_ext_low_word[25]),
        .I2(sel0[1]),
        .I3(control_high_word[25]),
        .I4(sel0[0]),
        .I5(control_low_word[25]),
        .O(\axi_rdata[25]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_5 
       (.I0(dina2_ext_word[25]),
        .I1(status[25]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[25]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[25]),
        .O(\axi_rdata[25]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [25]),
        .I1(\slv_reg8_reg[2]_0 [25]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[25]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[25]),
        .O(\axi_rdata[25]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[25]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [25]),
        .I1(\slv_reg8_reg[6]_4 [25]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [25]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [25]),
        .O(\axi_rdata[25]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_4 
       (.I0(dina_ext_high_word[26]),
        .I1(dina_ext_low_word[26]),
        .I2(sel0[1]),
        .I3(control_high_word[26]),
        .I4(sel0[0]),
        .I5(control_low_word[26]),
        .O(\axi_rdata[26]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_5 
       (.I0(dina2_ext_word[26]),
        .I1(status[26]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[26]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[26]),
        .O(\axi_rdata[26]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [26]),
        .I1(\slv_reg8_reg[2]_0 [26]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[26]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[26]),
        .O(\axi_rdata[26]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[26]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [26]),
        .I1(\slv_reg8_reg[6]_4 [26]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [26]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [26]),
        .O(\axi_rdata[26]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_4 
       (.I0(dina_ext_high_word[27]),
        .I1(dina_ext_low_word[27]),
        .I2(sel0[1]),
        .I3(control_high_word[27]),
        .I4(sel0[0]),
        .I5(control_low_word[27]),
        .O(\axi_rdata[27]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_5 
       (.I0(dina2_ext_word[27]),
        .I1(status[27]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[27]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[27]),
        .O(\axi_rdata[27]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [27]),
        .I1(\slv_reg8_reg[2]_0 [27]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[27]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[27]),
        .O(\axi_rdata[27]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[27]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [27]),
        .I1(\slv_reg8_reg[6]_4 [27]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [27]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [27]),
        .O(\axi_rdata[27]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_4 
       (.I0(dina_ext_high_word[28]),
        .I1(dina_ext_low_word[28]),
        .I2(sel0[1]),
        .I3(control_high_word[28]),
        .I4(sel0[0]),
        .I5(control_low_word[28]),
        .O(\axi_rdata[28]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_5 
       (.I0(dina2_ext_word[28]),
        .I1(status[28]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[28]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[28]),
        .O(\axi_rdata[28]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [28]),
        .I1(\slv_reg8_reg[2]_0 [28]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[28]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[28]),
        .O(\axi_rdata[28]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[28]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [28]),
        .I1(\slv_reg8_reg[6]_4 [28]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [28]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [28]),
        .O(\axi_rdata[28]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_4 
       (.I0(dina_ext_high_word[29]),
        .I1(dina_ext_low_word[29]),
        .I2(sel0[1]),
        .I3(control_high_word[29]),
        .I4(sel0[0]),
        .I5(control_low_word[29]),
        .O(\axi_rdata[29]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_5 
       (.I0(dina2_ext_word[29]),
        .I1(status[29]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[29]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[29]),
        .O(\axi_rdata[29]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [29]),
        .I1(\slv_reg8_reg[2]_0 [29]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[29]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[29]),
        .O(\axi_rdata[29]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[29]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [29]),
        .I1(\slv_reg8_reg[6]_4 [29]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [29]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [29]),
        .O(\axi_rdata[29]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[2]_i_4 
       (.I0(dina_ext_high_word[2]),
        .I1(dina_ext_low_word[2]),
        .I2(sel0[1]),
        .I3(control_high_word[2]),
        .I4(sel0[0]),
        .I5(control_low_word[2]),
        .O(\axi_rdata[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[2]_i_5 
       (.I0(dina2_ext_word[2]),
        .I1(status[2]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[2]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[2]),
        .O(\axi_rdata[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[2]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [2]),
        .I1(\slv_reg8_reg[2]_0 [2]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[2]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[2]),
        .O(\axi_rdata[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[2]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [2]),
        .I1(\slv_reg8_reg[6]_4 [2]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [2]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [2]),
        .O(\axi_rdata[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_4 
       (.I0(dina_ext_high_word[30]),
        .I1(dina_ext_low_word[30]),
        .I2(sel0[1]),
        .I3(control_high_word[30]),
        .I4(sel0[0]),
        .I5(control_low_word[30]),
        .O(\axi_rdata[30]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_5 
       (.I0(dina2_ext_word[30]),
        .I1(status[30]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[30]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[30]),
        .O(\axi_rdata[30]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [30]),
        .I1(\slv_reg8_reg[2]_0 [30]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[30]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[30]),
        .O(\axi_rdata[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[30]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [30]),
        .I1(\slv_reg8_reg[6]_4 [30]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [30]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [30]),
        .O(\axi_rdata[30]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_4 
       (.I0(dina_ext_high_word[31]),
        .I1(dina_ext_low_word[31]),
        .I2(sel0[1]),
        .I3(control_high_word[31]),
        .I4(sel0[0]),
        .I5(control_low_word[31]),
        .O(\axi_rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_5 
       (.I0(dina2_ext_word[31]),
        .I1(status[31]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[31]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[31]),
        .O(\axi_rdata[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [31]),
        .I1(\slv_reg8_reg[2]_0 [31]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[31]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[31]),
        .O(\axi_rdata[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[31]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [31]),
        .I1(\slv_reg8_reg[6]_4 [31]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [31]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [31]),
        .O(\axi_rdata[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[3]_i_4 
       (.I0(dina_ext_high_word[3]),
        .I1(dina_ext_low_word[3]),
        .I2(sel0[1]),
        .I3(control_high_word[3]),
        .I4(sel0[0]),
        .I5(control_low_word[3]),
        .O(\axi_rdata[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[3]_i_5 
       (.I0(dina2_ext_word[3]),
        .I1(status[3]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[3]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[3]),
        .O(\axi_rdata[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[3]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [3]),
        .I1(\slv_reg8_reg[2]_0 [3]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[3]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[3]),
        .O(\axi_rdata[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[3]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [3]),
        .I1(\slv_reg8_reg[6]_4 [3]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [3]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [3]),
        .O(\axi_rdata[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[4]_i_4 
       (.I0(dina_ext_high_word[4]),
        .I1(dina_ext_low_word[4]),
        .I2(sel0[1]),
        .I3(control_high_word[4]),
        .I4(sel0[0]),
        .I5(control_low_word[4]),
        .O(\axi_rdata[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[4]_i_5 
       (.I0(dina2_ext_word[4]),
        .I1(status[4]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[4]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[4]),
        .O(\axi_rdata[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[4]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [4]),
        .I1(\slv_reg8_reg[2]_0 [4]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[4]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[4]),
        .O(\axi_rdata[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[4]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [4]),
        .I1(\slv_reg8_reg[6]_4 [4]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [4]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [4]),
        .O(\axi_rdata[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[5]_i_4 
       (.I0(dina_ext_high_word[5]),
        .I1(dina_ext_low_word[5]),
        .I2(sel0[1]),
        .I3(control_high_word[5]),
        .I4(sel0[0]),
        .I5(control_low_word[5]),
        .O(\axi_rdata[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[5]_i_5 
       (.I0(dina2_ext_word[5]),
        .I1(status[5]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[5]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[5]),
        .O(\axi_rdata[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[5]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [5]),
        .I1(\slv_reg8_reg[2]_0 [5]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[5]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[5]),
        .O(\axi_rdata[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[5]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [5]),
        .I1(\slv_reg8_reg[6]_4 [5]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [5]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [5]),
        .O(\axi_rdata[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[6]_i_4 
       (.I0(dina_ext_high_word[6]),
        .I1(dina_ext_low_word[6]),
        .I2(sel0[1]),
        .I3(control_high_word[6]),
        .I4(sel0[0]),
        .I5(control_low_word[6]),
        .O(\axi_rdata[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[6]_i_5 
       (.I0(dina2_ext_word[6]),
        .I1(status[6]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[6]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[6]),
        .O(\axi_rdata[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[6]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [6]),
        .I1(\slv_reg8_reg[2]_0 [6]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[6]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[6]),
        .O(\axi_rdata[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[6]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [6]),
        .I1(\slv_reg8_reg[6]_4 [6]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [6]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [6]),
        .O(\axi_rdata[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[7]_i_4 
       (.I0(dina_ext_high_word[7]),
        .I1(dina_ext_low_word[7]),
        .I2(sel0[1]),
        .I3(control_high_word[7]),
        .I4(sel0[0]),
        .I5(control_low_word[7]),
        .O(\axi_rdata[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[7]_i_5 
       (.I0(dina2_ext_word[7]),
        .I1(status[7]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[7]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[7]),
        .O(\axi_rdata[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[7]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [7]),
        .I1(\slv_reg8_reg[2]_0 [7]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[7]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[7]),
        .O(\axi_rdata[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[7]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [7]),
        .I1(\slv_reg8_reg[6]_4 [7]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [7]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [7]),
        .O(\axi_rdata[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[8]_i_4 
       (.I0(dina_ext_high_word[8]),
        .I1(dina_ext_low_word[8]),
        .I2(sel0[1]),
        .I3(control_high_word[8]),
        .I4(sel0[0]),
        .I5(control_low_word[8]),
        .O(\axi_rdata[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[8]_i_5 
       (.I0(dina2_ext_word[8]),
        .I1(status[8]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[8]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[8]),
        .O(\axi_rdata[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[8]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [8]),
        .I1(\slv_reg8_reg[2]_0 [8]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[8]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[8]),
        .O(\axi_rdata[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[8]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [8]),
        .I1(\slv_reg8_reg[6]_4 [8]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [8]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [8]),
        .O(\axi_rdata[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[9]_i_4 
       (.I0(dina_ext_high_word[9]),
        .I1(dina_ext_low_word[9]),
        .I2(sel0[1]),
        .I3(control_high_word[9]),
        .I4(sel0[0]),
        .I5(control_low_word[9]),
        .O(\axi_rdata[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[9]_i_5 
       (.I0(dina2_ext_word[9]),
        .I1(status[9]),
        .I2(sel0[1]),
        .I3(dout_ext_high_word[9]),
        .I4(sel0[0]),
        .I5(dout_ext_low_word[9]),
        .O(\axi_rdata[9]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[9]_i_6 
       (.I0(\slv_reg8_reg[3]_1 [9]),
        .I1(\slv_reg8_reg[2]_0 [9]),
        .I2(sel0[1]),
        .I3(dina3_ext_high_word[9]),
        .I4(sel0[0]),
        .I5(dina3_ext_low_word[9]),
        .O(\axi_rdata[9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[9]_i_7 
       (.I0(\slv_reg8_reg[7]_5 [9]),
        .I1(\slv_reg8_reg[6]_4 [9]),
        .I2(sel0[1]),
        .I3(\slv_reg8_reg[5]_3 [9]),
        .I4(sel0[0]),
        .I5(\slv_reg8_reg[4]_2 [9]),
        .O(\axi_rdata[9]_i_7_n_0 ));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(SR));
  MUXF8 \axi_rdata_reg[0]_i_1 
       (.I0(\axi_rdata_reg[0]_i_2_n_0 ),
        .I1(\axi_rdata_reg[0]_i_3_n_0 ),
        .O(reg_data_out[0]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[0]_i_2 
       (.I0(\axi_rdata[0]_i_4_n_0 ),
        .I1(\axi_rdata[0]_i_5_n_0 ),
        .O(\axi_rdata_reg[0]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[0]_i_3 
       (.I0(\axi_rdata[0]_i_6_n_0 ),
        .I1(\axi_rdata[0]_i_7_n_0 ),
        .O(\axi_rdata_reg[0]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(SR));
  MUXF8 \axi_rdata_reg[10]_i_1 
       (.I0(\axi_rdata_reg[10]_i_2_n_0 ),
        .I1(\axi_rdata_reg[10]_i_3_n_0 ),
        .O(reg_data_out[10]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[10]_i_2 
       (.I0(\axi_rdata[10]_i_4_n_0 ),
        .I1(\axi_rdata[10]_i_5_n_0 ),
        .O(\axi_rdata_reg[10]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[10]_i_3 
       (.I0(\axi_rdata[10]_i_6_n_0 ),
        .I1(\axi_rdata[10]_i_7_n_0 ),
        .O(\axi_rdata_reg[10]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(SR));
  MUXF8 \axi_rdata_reg[11]_i_1 
       (.I0(\axi_rdata_reg[11]_i_2_n_0 ),
        .I1(\axi_rdata_reg[11]_i_3_n_0 ),
        .O(reg_data_out[11]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[11]_i_2 
       (.I0(\axi_rdata[11]_i_4_n_0 ),
        .I1(\axi_rdata[11]_i_5_n_0 ),
        .O(\axi_rdata_reg[11]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[11]_i_3 
       (.I0(\axi_rdata[11]_i_6_n_0 ),
        .I1(\axi_rdata[11]_i_7_n_0 ),
        .O(\axi_rdata_reg[11]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(SR));
  MUXF8 \axi_rdata_reg[12]_i_1 
       (.I0(\axi_rdata_reg[12]_i_2_n_0 ),
        .I1(\axi_rdata_reg[12]_i_3_n_0 ),
        .O(reg_data_out[12]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[12]_i_2 
       (.I0(\axi_rdata[12]_i_4_n_0 ),
        .I1(\axi_rdata[12]_i_5_n_0 ),
        .O(\axi_rdata_reg[12]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[12]_i_3 
       (.I0(\axi_rdata[12]_i_6_n_0 ),
        .I1(\axi_rdata[12]_i_7_n_0 ),
        .O(\axi_rdata_reg[12]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(SR));
  MUXF8 \axi_rdata_reg[13]_i_1 
       (.I0(\axi_rdata_reg[13]_i_2_n_0 ),
        .I1(\axi_rdata_reg[13]_i_3_n_0 ),
        .O(reg_data_out[13]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[13]_i_2 
       (.I0(\axi_rdata[13]_i_4_n_0 ),
        .I1(\axi_rdata[13]_i_5_n_0 ),
        .O(\axi_rdata_reg[13]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[13]_i_3 
       (.I0(\axi_rdata[13]_i_6_n_0 ),
        .I1(\axi_rdata[13]_i_7_n_0 ),
        .O(\axi_rdata_reg[13]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(SR));
  MUXF8 \axi_rdata_reg[14]_i_1 
       (.I0(\axi_rdata_reg[14]_i_2_n_0 ),
        .I1(\axi_rdata_reg[14]_i_3_n_0 ),
        .O(reg_data_out[14]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[14]_i_2 
       (.I0(\axi_rdata[14]_i_4_n_0 ),
        .I1(\axi_rdata[14]_i_5_n_0 ),
        .O(\axi_rdata_reg[14]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[14]_i_3 
       (.I0(\axi_rdata[14]_i_6_n_0 ),
        .I1(\axi_rdata[14]_i_7_n_0 ),
        .O(\axi_rdata_reg[14]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(SR));
  MUXF8 \axi_rdata_reg[15]_i_1 
       (.I0(\axi_rdata_reg[15]_i_2_n_0 ),
        .I1(\axi_rdata_reg[15]_i_3_n_0 ),
        .O(reg_data_out[15]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[15]_i_2 
       (.I0(\axi_rdata[15]_i_4_n_0 ),
        .I1(\axi_rdata[15]_i_5_n_0 ),
        .O(\axi_rdata_reg[15]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[15]_i_3 
       (.I0(\axi_rdata[15]_i_6_n_0 ),
        .I1(\axi_rdata[15]_i_7_n_0 ),
        .O(\axi_rdata_reg[15]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(SR));
  MUXF8 \axi_rdata_reg[16]_i_1 
       (.I0(\axi_rdata_reg[16]_i_2_n_0 ),
        .I1(\axi_rdata_reg[16]_i_3_n_0 ),
        .O(reg_data_out[16]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[16]_i_2 
       (.I0(\axi_rdata[16]_i_4_n_0 ),
        .I1(\axi_rdata[16]_i_5_n_0 ),
        .O(\axi_rdata_reg[16]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[16]_i_3 
       (.I0(\axi_rdata[16]_i_6_n_0 ),
        .I1(\axi_rdata[16]_i_7_n_0 ),
        .O(\axi_rdata_reg[16]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(SR));
  MUXF8 \axi_rdata_reg[17]_i_1 
       (.I0(\axi_rdata_reg[17]_i_2_n_0 ),
        .I1(\axi_rdata_reg[17]_i_3_n_0 ),
        .O(reg_data_out[17]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[17]_i_2 
       (.I0(\axi_rdata[17]_i_4_n_0 ),
        .I1(\axi_rdata[17]_i_5_n_0 ),
        .O(\axi_rdata_reg[17]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[17]_i_3 
       (.I0(\axi_rdata[17]_i_6_n_0 ),
        .I1(\axi_rdata[17]_i_7_n_0 ),
        .O(\axi_rdata_reg[17]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(SR));
  MUXF8 \axi_rdata_reg[18]_i_1 
       (.I0(\axi_rdata_reg[18]_i_2_n_0 ),
        .I1(\axi_rdata_reg[18]_i_3_n_0 ),
        .O(reg_data_out[18]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[18]_i_2 
       (.I0(\axi_rdata[18]_i_4_n_0 ),
        .I1(\axi_rdata[18]_i_5_n_0 ),
        .O(\axi_rdata_reg[18]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[18]_i_3 
       (.I0(\axi_rdata[18]_i_6_n_0 ),
        .I1(\axi_rdata[18]_i_7_n_0 ),
        .O(\axi_rdata_reg[18]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(SR));
  MUXF8 \axi_rdata_reg[19]_i_1 
       (.I0(\axi_rdata_reg[19]_i_2_n_0 ),
        .I1(\axi_rdata_reg[19]_i_3_n_0 ),
        .O(reg_data_out[19]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[19]_i_2 
       (.I0(\axi_rdata[19]_i_4_n_0 ),
        .I1(\axi_rdata[19]_i_5_n_0 ),
        .O(\axi_rdata_reg[19]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[19]_i_3 
       (.I0(\axi_rdata[19]_i_6_n_0 ),
        .I1(\axi_rdata[19]_i_7_n_0 ),
        .O(\axi_rdata_reg[19]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(SR));
  MUXF8 \axi_rdata_reg[1]_i_1 
       (.I0(\axi_rdata_reg[1]_i_2_n_0 ),
        .I1(\axi_rdata_reg[1]_i_3_n_0 ),
        .O(reg_data_out[1]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[1]_i_2 
       (.I0(\axi_rdata[1]_i_4_n_0 ),
        .I1(\axi_rdata[1]_i_5_n_0 ),
        .O(\axi_rdata_reg[1]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[1]_i_3 
       (.I0(\axi_rdata[1]_i_6_n_0 ),
        .I1(\axi_rdata[1]_i_7_n_0 ),
        .O(\axi_rdata_reg[1]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(SR));
  MUXF8 \axi_rdata_reg[20]_i_1 
       (.I0(\axi_rdata_reg[20]_i_2_n_0 ),
        .I1(\axi_rdata_reg[20]_i_3_n_0 ),
        .O(reg_data_out[20]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[20]_i_2 
       (.I0(\axi_rdata[20]_i_4_n_0 ),
        .I1(\axi_rdata[20]_i_5_n_0 ),
        .O(\axi_rdata_reg[20]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[20]_i_3 
       (.I0(\axi_rdata[20]_i_6_n_0 ),
        .I1(\axi_rdata[20]_i_7_n_0 ),
        .O(\axi_rdata_reg[20]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(SR));
  MUXF8 \axi_rdata_reg[21]_i_1 
       (.I0(\axi_rdata_reg[21]_i_2_n_0 ),
        .I1(\axi_rdata_reg[21]_i_3_n_0 ),
        .O(reg_data_out[21]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[21]_i_2 
       (.I0(\axi_rdata[21]_i_4_n_0 ),
        .I1(\axi_rdata[21]_i_5_n_0 ),
        .O(\axi_rdata_reg[21]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[21]_i_3 
       (.I0(\axi_rdata[21]_i_6_n_0 ),
        .I1(\axi_rdata[21]_i_7_n_0 ),
        .O(\axi_rdata_reg[21]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(SR));
  MUXF8 \axi_rdata_reg[22]_i_1 
       (.I0(\axi_rdata_reg[22]_i_2_n_0 ),
        .I1(\axi_rdata_reg[22]_i_3_n_0 ),
        .O(reg_data_out[22]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[22]_i_2 
       (.I0(\axi_rdata[22]_i_4_n_0 ),
        .I1(\axi_rdata[22]_i_5_n_0 ),
        .O(\axi_rdata_reg[22]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[22]_i_3 
       (.I0(\axi_rdata[22]_i_6_n_0 ),
        .I1(\axi_rdata[22]_i_7_n_0 ),
        .O(\axi_rdata_reg[22]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(SR));
  MUXF8 \axi_rdata_reg[23]_i_1 
       (.I0(\axi_rdata_reg[23]_i_2_n_0 ),
        .I1(\axi_rdata_reg[23]_i_3_n_0 ),
        .O(reg_data_out[23]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[23]_i_2 
       (.I0(\axi_rdata[23]_i_4_n_0 ),
        .I1(\axi_rdata[23]_i_5_n_0 ),
        .O(\axi_rdata_reg[23]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[23]_i_3 
       (.I0(\axi_rdata[23]_i_6_n_0 ),
        .I1(\axi_rdata[23]_i_7_n_0 ),
        .O(\axi_rdata_reg[23]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(SR));
  MUXF8 \axi_rdata_reg[24]_i_1 
       (.I0(\axi_rdata_reg[24]_i_2_n_0 ),
        .I1(\axi_rdata_reg[24]_i_3_n_0 ),
        .O(reg_data_out[24]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[24]_i_2 
       (.I0(\axi_rdata[24]_i_4_n_0 ),
        .I1(\axi_rdata[24]_i_5_n_0 ),
        .O(\axi_rdata_reg[24]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[24]_i_3 
       (.I0(\axi_rdata[24]_i_6_n_0 ),
        .I1(\axi_rdata[24]_i_7_n_0 ),
        .O(\axi_rdata_reg[24]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(SR));
  MUXF8 \axi_rdata_reg[25]_i_1 
       (.I0(\axi_rdata_reg[25]_i_2_n_0 ),
        .I1(\axi_rdata_reg[25]_i_3_n_0 ),
        .O(reg_data_out[25]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[25]_i_2 
       (.I0(\axi_rdata[25]_i_4_n_0 ),
        .I1(\axi_rdata[25]_i_5_n_0 ),
        .O(\axi_rdata_reg[25]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[25]_i_3 
       (.I0(\axi_rdata[25]_i_6_n_0 ),
        .I1(\axi_rdata[25]_i_7_n_0 ),
        .O(\axi_rdata_reg[25]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(SR));
  MUXF8 \axi_rdata_reg[26]_i_1 
       (.I0(\axi_rdata_reg[26]_i_2_n_0 ),
        .I1(\axi_rdata_reg[26]_i_3_n_0 ),
        .O(reg_data_out[26]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[26]_i_2 
       (.I0(\axi_rdata[26]_i_4_n_0 ),
        .I1(\axi_rdata[26]_i_5_n_0 ),
        .O(\axi_rdata_reg[26]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[26]_i_3 
       (.I0(\axi_rdata[26]_i_6_n_0 ),
        .I1(\axi_rdata[26]_i_7_n_0 ),
        .O(\axi_rdata_reg[26]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(SR));
  MUXF8 \axi_rdata_reg[27]_i_1 
       (.I0(\axi_rdata_reg[27]_i_2_n_0 ),
        .I1(\axi_rdata_reg[27]_i_3_n_0 ),
        .O(reg_data_out[27]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[27]_i_2 
       (.I0(\axi_rdata[27]_i_4_n_0 ),
        .I1(\axi_rdata[27]_i_5_n_0 ),
        .O(\axi_rdata_reg[27]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[27]_i_3 
       (.I0(\axi_rdata[27]_i_6_n_0 ),
        .I1(\axi_rdata[27]_i_7_n_0 ),
        .O(\axi_rdata_reg[27]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(SR));
  MUXF8 \axi_rdata_reg[28]_i_1 
       (.I0(\axi_rdata_reg[28]_i_2_n_0 ),
        .I1(\axi_rdata_reg[28]_i_3_n_0 ),
        .O(reg_data_out[28]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[28]_i_2 
       (.I0(\axi_rdata[28]_i_4_n_0 ),
        .I1(\axi_rdata[28]_i_5_n_0 ),
        .O(\axi_rdata_reg[28]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[28]_i_3 
       (.I0(\axi_rdata[28]_i_6_n_0 ),
        .I1(\axi_rdata[28]_i_7_n_0 ),
        .O(\axi_rdata_reg[28]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(SR));
  MUXF8 \axi_rdata_reg[29]_i_1 
       (.I0(\axi_rdata_reg[29]_i_2_n_0 ),
        .I1(\axi_rdata_reg[29]_i_3_n_0 ),
        .O(reg_data_out[29]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[29]_i_2 
       (.I0(\axi_rdata[29]_i_4_n_0 ),
        .I1(\axi_rdata[29]_i_5_n_0 ),
        .O(\axi_rdata_reg[29]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[29]_i_3 
       (.I0(\axi_rdata[29]_i_6_n_0 ),
        .I1(\axi_rdata[29]_i_7_n_0 ),
        .O(\axi_rdata_reg[29]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(SR));
  MUXF8 \axi_rdata_reg[2]_i_1 
       (.I0(\axi_rdata_reg[2]_i_2_n_0 ),
        .I1(\axi_rdata_reg[2]_i_3_n_0 ),
        .O(reg_data_out[2]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[2]_i_2 
       (.I0(\axi_rdata[2]_i_4_n_0 ),
        .I1(\axi_rdata[2]_i_5_n_0 ),
        .O(\axi_rdata_reg[2]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[2]_i_3 
       (.I0(\axi_rdata[2]_i_6_n_0 ),
        .I1(\axi_rdata[2]_i_7_n_0 ),
        .O(\axi_rdata_reg[2]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(SR));
  MUXF8 \axi_rdata_reg[30]_i_1 
       (.I0(\axi_rdata_reg[30]_i_2_n_0 ),
        .I1(\axi_rdata_reg[30]_i_3_n_0 ),
        .O(reg_data_out[30]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[30]_i_2 
       (.I0(\axi_rdata[30]_i_4_n_0 ),
        .I1(\axi_rdata[30]_i_5_n_0 ),
        .O(\axi_rdata_reg[30]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[30]_i_3 
       (.I0(\axi_rdata[30]_i_6_n_0 ),
        .I1(\axi_rdata[30]_i_7_n_0 ),
        .O(\axi_rdata_reg[30]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(SR));
  MUXF8 \axi_rdata_reg[31]_i_1 
       (.I0(\axi_rdata_reg[31]_i_2_n_0 ),
        .I1(\axi_rdata_reg[31]_i_3_n_0 ),
        .O(reg_data_out[31]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[31]_i_2 
       (.I0(\axi_rdata[31]_i_4_n_0 ),
        .I1(\axi_rdata[31]_i_5_n_0 ),
        .O(\axi_rdata_reg[31]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[31]_i_3 
       (.I0(\axi_rdata[31]_i_6_n_0 ),
        .I1(\axi_rdata[31]_i_7_n_0 ),
        .O(\axi_rdata_reg[31]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(SR));
  MUXF8 \axi_rdata_reg[3]_i_1 
       (.I0(\axi_rdata_reg[3]_i_2_n_0 ),
        .I1(\axi_rdata_reg[3]_i_3_n_0 ),
        .O(reg_data_out[3]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[3]_i_2 
       (.I0(\axi_rdata[3]_i_4_n_0 ),
        .I1(\axi_rdata[3]_i_5_n_0 ),
        .O(\axi_rdata_reg[3]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[3]_i_3 
       (.I0(\axi_rdata[3]_i_6_n_0 ),
        .I1(\axi_rdata[3]_i_7_n_0 ),
        .O(\axi_rdata_reg[3]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(SR));
  MUXF8 \axi_rdata_reg[4]_i_1 
       (.I0(\axi_rdata_reg[4]_i_2_n_0 ),
        .I1(\axi_rdata_reg[4]_i_3_n_0 ),
        .O(reg_data_out[4]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[4]_i_2 
       (.I0(\axi_rdata[4]_i_4_n_0 ),
        .I1(\axi_rdata[4]_i_5_n_0 ),
        .O(\axi_rdata_reg[4]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[4]_i_3 
       (.I0(\axi_rdata[4]_i_6_n_0 ),
        .I1(\axi_rdata[4]_i_7_n_0 ),
        .O(\axi_rdata_reg[4]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(SR));
  MUXF8 \axi_rdata_reg[5]_i_1 
       (.I0(\axi_rdata_reg[5]_i_2_n_0 ),
        .I1(\axi_rdata_reg[5]_i_3_n_0 ),
        .O(reg_data_out[5]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[5]_i_2 
       (.I0(\axi_rdata[5]_i_4_n_0 ),
        .I1(\axi_rdata[5]_i_5_n_0 ),
        .O(\axi_rdata_reg[5]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[5]_i_3 
       (.I0(\axi_rdata[5]_i_6_n_0 ),
        .I1(\axi_rdata[5]_i_7_n_0 ),
        .O(\axi_rdata_reg[5]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(SR));
  MUXF8 \axi_rdata_reg[6]_i_1 
       (.I0(\axi_rdata_reg[6]_i_2_n_0 ),
        .I1(\axi_rdata_reg[6]_i_3_n_0 ),
        .O(reg_data_out[6]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[6]_i_2 
       (.I0(\axi_rdata[6]_i_4_n_0 ),
        .I1(\axi_rdata[6]_i_5_n_0 ),
        .O(\axi_rdata_reg[6]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[6]_i_3 
       (.I0(\axi_rdata[6]_i_6_n_0 ),
        .I1(\axi_rdata[6]_i_7_n_0 ),
        .O(\axi_rdata_reg[6]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(SR));
  MUXF8 \axi_rdata_reg[7]_i_1 
       (.I0(\axi_rdata_reg[7]_i_2_n_0 ),
        .I1(\axi_rdata_reg[7]_i_3_n_0 ),
        .O(reg_data_out[7]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[7]_i_2 
       (.I0(\axi_rdata[7]_i_4_n_0 ),
        .I1(\axi_rdata[7]_i_5_n_0 ),
        .O(\axi_rdata_reg[7]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[7]_i_3 
       (.I0(\axi_rdata[7]_i_6_n_0 ),
        .I1(\axi_rdata[7]_i_7_n_0 ),
        .O(\axi_rdata_reg[7]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(SR));
  MUXF8 \axi_rdata_reg[8]_i_1 
       (.I0(\axi_rdata_reg[8]_i_2_n_0 ),
        .I1(\axi_rdata_reg[8]_i_3_n_0 ),
        .O(reg_data_out[8]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[8]_i_2 
       (.I0(\axi_rdata[8]_i_4_n_0 ),
        .I1(\axi_rdata[8]_i_5_n_0 ),
        .O(\axi_rdata_reg[8]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[8]_i_3 
       (.I0(\axi_rdata[8]_i_6_n_0 ),
        .I1(\axi_rdata[8]_i_7_n_0 ),
        .O(\axi_rdata_reg[8]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(SR));
  MUXF8 \axi_rdata_reg[9]_i_1 
       (.I0(\axi_rdata_reg[9]_i_2_n_0 ),
        .I1(\axi_rdata_reg[9]_i_3_n_0 ),
        .O(reg_data_out[9]),
        .S(sel0[3]));
  MUXF7 \axi_rdata_reg[9]_i_2 
       (.I0(\axi_rdata[9]_i_4_n_0 ),
        .I1(\axi_rdata[9]_i_5_n_0 ),
        .O(\axi_rdata_reg[9]_i_2_n_0 ),
        .S(sel0[2]));
  MUXF7 \axi_rdata_reg[9]_i_3 
       (.I0(\axi_rdata[9]_i_6_n_0 ),
        .I1(\axi_rdata[9]_i_7_n_0 ),
        .O(\axi_rdata_reg[9]_i_3_n_0 ),
        .S(sel0[2]));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_reg_0),
        .Q(s00_axi_rvalid),
        .R(SR));
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_WREADY),
        .I3(aw_en_reg_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[0]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[1]),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[0]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[2]),
        .O(p_1_in[23]));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[31]_i_2 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[0]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[3]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[31]_i_3 
       (.I0(S_AXI_WREADY),
        .I1(S_AXI_AWREADY),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[0]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[0]),
        .O(p_1_in[7]));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(control_low_word[0]),
        .R(SR));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(control_low_word[10]),
        .R(SR));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(control_low_word[11]),
        .R(SR));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(control_low_word[12]),
        .R(SR));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(control_low_word[13]),
        .R(SR));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(control_low_word[14]),
        .R(SR));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(control_low_word[15]),
        .R(SR));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(control_low_word[16]),
        .R(SR));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(control_low_word[17]),
        .R(SR));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(control_low_word[18]),
        .R(SR));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(control_low_word[19]),
        .R(SR));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(control_low_word[1]),
        .R(SR));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(control_low_word[20]),
        .R(SR));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(control_low_word[21]),
        .R(SR));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(control_low_word[22]),
        .R(SR));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(control_low_word[23]),
        .R(SR));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(control_low_word[24]),
        .R(SR));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(control_low_word[25]),
        .R(SR));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(control_low_word[26]),
        .R(SR));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(control_low_word[27]),
        .R(SR));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(control_low_word[28]),
        .R(SR));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(control_low_word[29]),
        .R(SR));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(control_low_word[2]),
        .R(SR));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(control_low_word[30]),
        .R(SR));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(control_low_word[31]),
        .R(SR));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(control_low_word[3]),
        .R(SR));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(control_low_word[4]),
        .R(SR));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(control_low_word[5]),
        .R(SR));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(control_low_word[6]),
        .R(SR));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(control_low_word[7]),
        .R(SR));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(control_low_word[8]),
        .R(SR));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(control_low_word[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[0]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[0]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[0]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[0]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE \slv_reg1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(control_high_word[0]),
        .R(SR));
  FDRE \slv_reg1_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(control_high_word[10]),
        .R(SR));
  FDRE \slv_reg1_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(control_high_word[11]),
        .R(SR));
  FDRE \slv_reg1_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(control_high_word[12]),
        .R(SR));
  FDRE \slv_reg1_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(control_high_word[13]),
        .R(SR));
  FDRE \slv_reg1_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(control_high_word[14]),
        .R(SR));
  FDRE \slv_reg1_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(control_high_word[15]),
        .R(SR));
  FDRE \slv_reg1_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(control_high_word[16]),
        .R(SR));
  FDRE \slv_reg1_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(control_high_word[17]),
        .R(SR));
  FDRE \slv_reg1_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(control_high_word[18]),
        .R(SR));
  FDRE \slv_reg1_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(control_high_word[19]),
        .R(SR));
  FDRE \slv_reg1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(control_high_word[1]),
        .R(SR));
  FDRE \slv_reg1_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(control_high_word[20]),
        .R(SR));
  FDRE \slv_reg1_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(control_high_word[21]),
        .R(SR));
  FDRE \slv_reg1_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(control_high_word[22]),
        .R(SR));
  FDRE \slv_reg1_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(control_high_word[23]),
        .R(SR));
  FDRE \slv_reg1_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(control_high_word[24]),
        .R(SR));
  FDRE \slv_reg1_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(control_high_word[25]),
        .R(SR));
  FDRE \slv_reg1_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(control_high_word[26]),
        .R(SR));
  FDRE \slv_reg1_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(control_high_word[27]),
        .R(SR));
  FDRE \slv_reg1_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(control_high_word[28]),
        .R(SR));
  FDRE \slv_reg1_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(control_high_word[29]),
        .R(SR));
  FDRE \slv_reg1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(control_high_word[2]),
        .R(SR));
  FDRE \slv_reg1_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(control_high_word[30]),
        .R(SR));
  FDRE \slv_reg1_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(control_high_word[31]),
        .R(SR));
  FDRE \slv_reg1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(control_high_word[3]),
        .R(SR));
  FDRE \slv_reg1_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(control_high_word[4]),
        .R(SR));
  FDRE \slv_reg1_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(control_high_word[5]),
        .R(SR));
  FDRE \slv_reg1_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(control_high_word[6]),
        .R(SR));
  FDRE \slv_reg1_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(control_high_word[7]),
        .R(SR));
  FDRE \slv_reg1_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(control_high_word[8]),
        .R(SR));
  FDRE \slv_reg1_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(control_high_word[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(p_0_in[1]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(p_0_in[1]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(p_0_in[1]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(p_0_in[1]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(dina_ext_low_word[0]),
        .R(SR));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(dina_ext_low_word[10]),
        .R(SR));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(dina_ext_low_word[11]),
        .R(SR));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(dina_ext_low_word[12]),
        .R(SR));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(dina_ext_low_word[13]),
        .R(SR));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(dina_ext_low_word[14]),
        .R(SR));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(dina_ext_low_word[15]),
        .R(SR));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(dina_ext_low_word[16]),
        .R(SR));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(dina_ext_low_word[17]),
        .R(SR));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(dina_ext_low_word[18]),
        .R(SR));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(dina_ext_low_word[19]),
        .R(SR));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(dina_ext_low_word[1]),
        .R(SR));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(dina_ext_low_word[20]),
        .R(SR));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(dina_ext_low_word[21]),
        .R(SR));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(dina_ext_low_word[22]),
        .R(SR));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(dina_ext_low_word[23]),
        .R(SR));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(dina_ext_low_word[24]),
        .R(SR));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(dina_ext_low_word[25]),
        .R(SR));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(dina_ext_low_word[26]),
        .R(SR));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(dina_ext_low_word[27]),
        .R(SR));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(dina_ext_low_word[28]),
        .R(SR));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(dina_ext_low_word[29]),
        .R(SR));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(dina_ext_low_word[2]),
        .R(SR));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(dina_ext_low_word[30]),
        .R(SR));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(dina_ext_low_word[31]),
        .R(SR));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(dina_ext_low_word[3]),
        .R(SR));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(dina_ext_low_word[4]),
        .R(SR));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(dina_ext_low_word[5]),
        .R(SR));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(dina_ext_low_word[6]),
        .R(SR));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(dina_ext_low_word[7]),
        .R(SR));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(dina_ext_low_word[8]),
        .R(SR));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(dina_ext_low_word[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[3]),
        .O(\slv_reg3[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[3]),
        .O(\slv_reg3[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[3]),
        .O(\slv_reg3[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[2]),
        .I5(p_0_in[3]),
        .O(\slv_reg3[7]_i_1_n_0 ));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(dina_ext_high_word[0]),
        .R(SR));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(dina_ext_high_word[10]),
        .R(SR));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(dina_ext_high_word[11]),
        .R(SR));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(dina_ext_high_word[12]),
        .R(SR));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(dina_ext_high_word[13]),
        .R(SR));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(dina_ext_high_word[14]),
        .R(SR));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(dina_ext_high_word[15]),
        .R(SR));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(dina_ext_high_word[16]),
        .R(SR));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(dina_ext_high_word[17]),
        .R(SR));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(dina_ext_high_word[18]),
        .R(SR));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(dina_ext_high_word[19]),
        .R(SR));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(dina_ext_high_word[1]),
        .R(SR));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(dina_ext_high_word[20]),
        .R(SR));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(dina_ext_high_word[21]),
        .R(SR));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(dina_ext_high_word[22]),
        .R(SR));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(dina_ext_high_word[23]),
        .R(SR));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(dina_ext_high_word[24]),
        .R(SR));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(dina_ext_high_word[25]),
        .R(SR));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(dina_ext_high_word[26]),
        .R(SR));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(dina_ext_high_word[27]),
        .R(SR));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(dina_ext_high_word[28]),
        .R(SR));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(dina_ext_high_word[29]),
        .R(SR));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(dina_ext_high_word[2]),
        .R(SR));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(dina_ext_high_word[30]),
        .R(SR));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(dina_ext_high_word[31]),
        .R(SR));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(dina_ext_high_word[3]),
        .R(SR));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(dina_ext_high_word[4]),
        .R(SR));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(dina_ext_high_word[5]),
        .R(SR));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(dina_ext_high_word[6]),
        .R(SR));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(dina_ext_high_word[7]),
        .R(SR));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(dina_ext_high_word[8]),
        .R(SR));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(dina_ext_high_word[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg7[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg7[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg7[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg7[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg7[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg7[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg7[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg7[7]_i_1_n_0 ));
  FDRE \slv_reg7_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(dina2_ext_word[0]),
        .R(SR));
  FDRE \slv_reg7_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(dina2_ext_word[10]),
        .R(SR));
  FDRE \slv_reg7_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(dina2_ext_word[11]),
        .R(SR));
  FDRE \slv_reg7_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(dina2_ext_word[12]),
        .R(SR));
  FDRE \slv_reg7_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(dina2_ext_word[13]),
        .R(SR));
  FDRE \slv_reg7_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(dina2_ext_word[14]),
        .R(SR));
  FDRE \slv_reg7_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(dina2_ext_word[15]),
        .R(SR));
  FDRE \slv_reg7_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(dina2_ext_word[16]),
        .R(SR));
  FDRE \slv_reg7_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(dina2_ext_word[17]),
        .R(SR));
  FDRE \slv_reg7_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(dina2_ext_word[18]),
        .R(SR));
  FDRE \slv_reg7_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(dina2_ext_word[19]),
        .R(SR));
  FDRE \slv_reg7_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(dina2_ext_word[1]),
        .R(SR));
  FDRE \slv_reg7_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(dina2_ext_word[20]),
        .R(SR));
  FDRE \slv_reg7_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(dina2_ext_word[21]),
        .R(SR));
  FDRE \slv_reg7_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(dina2_ext_word[22]),
        .R(SR));
  FDRE \slv_reg7_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(dina2_ext_word[23]),
        .R(SR));
  FDRE \slv_reg7_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(dina2_ext_word[24]),
        .R(SR));
  FDRE \slv_reg7_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(dina2_ext_word[25]),
        .R(SR));
  FDRE \slv_reg7_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(dina2_ext_word[26]),
        .R(SR));
  FDRE \slv_reg7_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(dina2_ext_word[27]),
        .R(SR));
  FDRE \slv_reg7_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(dina2_ext_word[28]),
        .R(SR));
  FDRE \slv_reg7_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(dina2_ext_word[29]),
        .R(SR));
  FDRE \slv_reg7_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(dina2_ext_word[2]),
        .R(SR));
  FDRE \slv_reg7_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(dina2_ext_word[30]),
        .R(SR));
  FDRE \slv_reg7_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(dina2_ext_word[31]),
        .R(SR));
  FDRE \slv_reg7_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(dina2_ext_word[3]),
        .R(SR));
  FDRE \slv_reg7_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(dina2_ext_word[4]),
        .R(SR));
  FDRE \slv_reg7_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(dina2_ext_word[5]),
        .R(SR));
  FDRE \slv_reg7_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(dina2_ext_word[6]),
        .R(SR));
  FDRE \slv_reg7_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(dina2_ext_word[7]),
        .R(SR));
  FDRE \slv_reg7_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(dina2_ext_word[8]),
        .R(SR));
  FDRE \slv_reg7_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg7[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(dina2_ext_word[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[0][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[1]),
        .O(\slv_reg8[0][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[0][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[2]),
        .O(\slv_reg8[0][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[0][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[3]),
        .O(\slv_reg8[0][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \slv_reg8[0][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[1]),
        .I3(p_0_in[0]),
        .I4(p_0_in[2]),
        .I5(s00_axi_wstrb[0]),
        .O(\slv_reg8[0][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[1][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[1]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[1][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[1][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[2]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[1][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[1][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[3]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[1][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[1][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[1][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[2][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[1]),
        .I4(p_0_in[0]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[2][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[2][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[1]),
        .I4(p_0_in[0]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[2][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[2][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[1]),
        .I4(p_0_in[0]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[2][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[2][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[1]),
        .I4(p_0_in[0]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[2][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[3][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[1]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[3][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[3][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[3][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[3][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[3]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[3][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[3][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb[0]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[2]),
        .O(\slv_reg8[3][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[4][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[2]),
        .I4(p_0_in[0]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[4][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[4][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[2]),
        .I4(p_0_in[0]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[4][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[4][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[2]),
        .I4(p_0_in[0]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[4][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \slv_reg8[4][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[3]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[2]),
        .I4(p_0_in[0]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[4][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[5][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(s00_axi_wstrb[1]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[5][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[5][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(s00_axi_wstrb[2]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[5][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[5][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(s00_axi_wstrb[3]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[5][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[5][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(p_0_in[0]),
        .I4(s00_axi_wstrb[0]),
        .I5(p_0_in[1]),
        .O(\slv_reg8[5][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[6][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(s00_axi_wstrb[1]),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(\slv_reg8[6][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[6][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(s00_axi_wstrb[2]),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(\slv_reg8[6][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[6][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(s00_axi_wstrb[3]),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(\slv_reg8[6][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \slv_reg8[6][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(p_0_in[3]),
        .I3(s00_axi_wstrb[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[0]),
        .O(\slv_reg8[6][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg8[7][15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg8[7][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg8[7][23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg8[7][23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg8[7][31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg8[7][31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \slv_reg8[7][7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[2]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .I4(p_0_in[1]),
        .I5(p_0_in[3]),
        .O(\slv_reg8[7][7]_i_1_n_0 ));
  FDRE \slv_reg8_reg[0][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(dina3_ext_low_word[0]),
        .R(SR));
  FDRE \slv_reg8_reg[0][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(dina3_ext_low_word[10]),
        .R(SR));
  FDRE \slv_reg8_reg[0][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(dina3_ext_low_word[11]),
        .R(SR));
  FDRE \slv_reg8_reg[0][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(dina3_ext_low_word[12]),
        .R(SR));
  FDRE \slv_reg8_reg[0][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(dina3_ext_low_word[13]),
        .R(SR));
  FDRE \slv_reg8_reg[0][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(dina3_ext_low_word[14]),
        .R(SR));
  FDRE \slv_reg8_reg[0][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(dina3_ext_low_word[15]),
        .R(SR));
  FDRE \slv_reg8_reg[0][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(dina3_ext_low_word[16]),
        .R(SR));
  FDRE \slv_reg8_reg[0][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(dina3_ext_low_word[17]),
        .R(SR));
  FDRE \slv_reg8_reg[0][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(dina3_ext_low_word[18]),
        .R(SR));
  FDRE \slv_reg8_reg[0][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(dina3_ext_low_word[19]),
        .R(SR));
  FDRE \slv_reg8_reg[0][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(dina3_ext_low_word[1]),
        .R(SR));
  FDRE \slv_reg8_reg[0][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(dina3_ext_low_word[20]),
        .R(SR));
  FDRE \slv_reg8_reg[0][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(dina3_ext_low_word[21]),
        .R(SR));
  FDRE \slv_reg8_reg[0][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(dina3_ext_low_word[22]),
        .R(SR));
  FDRE \slv_reg8_reg[0][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(dina3_ext_low_word[23]),
        .R(SR));
  FDRE \slv_reg8_reg[0][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(dina3_ext_low_word[24]),
        .R(SR));
  FDRE \slv_reg8_reg[0][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(dina3_ext_low_word[25]),
        .R(SR));
  FDRE \slv_reg8_reg[0][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(dina3_ext_low_word[26]),
        .R(SR));
  FDRE \slv_reg8_reg[0][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(dina3_ext_low_word[27]),
        .R(SR));
  FDRE \slv_reg8_reg[0][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(dina3_ext_low_word[28]),
        .R(SR));
  FDRE \slv_reg8_reg[0][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(dina3_ext_low_word[29]),
        .R(SR));
  FDRE \slv_reg8_reg[0][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(dina3_ext_low_word[2]),
        .R(SR));
  FDRE \slv_reg8_reg[0][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(dina3_ext_low_word[30]),
        .R(SR));
  FDRE \slv_reg8_reg[0][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(dina3_ext_low_word[31]),
        .R(SR));
  FDRE \slv_reg8_reg[0][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(dina3_ext_low_word[3]),
        .R(SR));
  FDRE \slv_reg8_reg[0][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(dina3_ext_low_word[4]),
        .R(SR));
  FDRE \slv_reg8_reg[0][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(dina3_ext_low_word[5]),
        .R(SR));
  FDRE \slv_reg8_reg[0][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(dina3_ext_low_word[6]),
        .R(SR));
  FDRE \slv_reg8_reg[0][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(dina3_ext_low_word[7]),
        .R(SR));
  FDRE \slv_reg8_reg[0][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(dina3_ext_low_word[8]),
        .R(SR));
  FDRE \slv_reg8_reg[0][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[0][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(dina3_ext_low_word[9]),
        .R(SR));
  FDRE \slv_reg8_reg[1][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(dina3_ext_high_word[0]),
        .R(SR));
  FDRE \slv_reg8_reg[1][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(dina3_ext_high_word[10]),
        .R(SR));
  FDRE \slv_reg8_reg[1][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(dina3_ext_high_word[11]),
        .R(SR));
  FDRE \slv_reg8_reg[1][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(dina3_ext_high_word[12]),
        .R(SR));
  FDRE \slv_reg8_reg[1][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(dina3_ext_high_word[13]),
        .R(SR));
  FDRE \slv_reg8_reg[1][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(dina3_ext_high_word[14]),
        .R(SR));
  FDRE \slv_reg8_reg[1][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(dina3_ext_high_word[15]),
        .R(SR));
  FDRE \slv_reg8_reg[1][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(dina3_ext_high_word[16]),
        .R(SR));
  FDRE \slv_reg8_reg[1][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(dina3_ext_high_word[17]),
        .R(SR));
  FDRE \slv_reg8_reg[1][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(dina3_ext_high_word[18]),
        .R(SR));
  FDRE \slv_reg8_reg[1][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(dina3_ext_high_word[19]),
        .R(SR));
  FDRE \slv_reg8_reg[1][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(dina3_ext_high_word[1]),
        .R(SR));
  FDRE \slv_reg8_reg[1][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(dina3_ext_high_word[20]),
        .R(SR));
  FDRE \slv_reg8_reg[1][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(dina3_ext_high_word[21]),
        .R(SR));
  FDRE \slv_reg8_reg[1][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(dina3_ext_high_word[22]),
        .R(SR));
  FDRE \slv_reg8_reg[1][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(dina3_ext_high_word[23]),
        .R(SR));
  FDRE \slv_reg8_reg[1][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(dina3_ext_high_word[24]),
        .R(SR));
  FDRE \slv_reg8_reg[1][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(dina3_ext_high_word[25]),
        .R(SR));
  FDRE \slv_reg8_reg[1][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(dina3_ext_high_word[26]),
        .R(SR));
  FDRE \slv_reg8_reg[1][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(dina3_ext_high_word[27]),
        .R(SR));
  FDRE \slv_reg8_reg[1][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(dina3_ext_high_word[28]),
        .R(SR));
  FDRE \slv_reg8_reg[1][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(dina3_ext_high_word[29]),
        .R(SR));
  FDRE \slv_reg8_reg[1][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(dina3_ext_high_word[2]),
        .R(SR));
  FDRE \slv_reg8_reg[1][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(dina3_ext_high_word[30]),
        .R(SR));
  FDRE \slv_reg8_reg[1][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(dina3_ext_high_word[31]),
        .R(SR));
  FDRE \slv_reg8_reg[1][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(dina3_ext_high_word[3]),
        .R(SR));
  FDRE \slv_reg8_reg[1][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(dina3_ext_high_word[4]),
        .R(SR));
  FDRE \slv_reg8_reg[1][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(dina3_ext_high_word[5]),
        .R(SR));
  FDRE \slv_reg8_reg[1][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(dina3_ext_high_word[6]),
        .R(SR));
  FDRE \slv_reg8_reg[1][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(dina3_ext_high_word[7]),
        .R(SR));
  FDRE \slv_reg8_reg[1][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(dina3_ext_high_word[8]),
        .R(SR));
  FDRE \slv_reg8_reg[1][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[1][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(dina3_ext_high_word[9]),
        .R(SR));
  FDRE \slv_reg8_reg[2][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg8_reg[2]_0 [0]),
        .R(SR));
  FDRE \slv_reg8_reg[2][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg8_reg[2]_0 [10]),
        .R(SR));
  FDRE \slv_reg8_reg[2][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg8_reg[2]_0 [11]),
        .R(SR));
  FDRE \slv_reg8_reg[2][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg8_reg[2]_0 [12]),
        .R(SR));
  FDRE \slv_reg8_reg[2][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg8_reg[2]_0 [13]),
        .R(SR));
  FDRE \slv_reg8_reg[2][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg8_reg[2]_0 [14]),
        .R(SR));
  FDRE \slv_reg8_reg[2][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg8_reg[2]_0 [15]),
        .R(SR));
  FDRE \slv_reg8_reg[2][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg8_reg[2]_0 [16]),
        .R(SR));
  FDRE \slv_reg8_reg[2][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg8_reg[2]_0 [17]),
        .R(SR));
  FDRE \slv_reg8_reg[2][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg8_reg[2]_0 [18]),
        .R(SR));
  FDRE \slv_reg8_reg[2][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg8_reg[2]_0 [19]),
        .R(SR));
  FDRE \slv_reg8_reg[2][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg8_reg[2]_0 [1]),
        .R(SR));
  FDRE \slv_reg8_reg[2][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg8_reg[2]_0 [20]),
        .R(SR));
  FDRE \slv_reg8_reg[2][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg8_reg[2]_0 [21]),
        .R(SR));
  FDRE \slv_reg8_reg[2][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg8_reg[2]_0 [22]),
        .R(SR));
  FDRE \slv_reg8_reg[2][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg8_reg[2]_0 [23]),
        .R(SR));
  FDRE \slv_reg8_reg[2][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg8_reg[2]_0 [24]),
        .R(SR));
  FDRE \slv_reg8_reg[2][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg8_reg[2]_0 [25]),
        .R(SR));
  FDRE \slv_reg8_reg[2][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg8_reg[2]_0 [26]),
        .R(SR));
  FDRE \slv_reg8_reg[2][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg8_reg[2]_0 [27]),
        .R(SR));
  FDRE \slv_reg8_reg[2][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg8_reg[2]_0 [28]),
        .R(SR));
  FDRE \slv_reg8_reg[2][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg8_reg[2]_0 [29]),
        .R(SR));
  FDRE \slv_reg8_reg[2][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg8_reg[2]_0 [2]),
        .R(SR));
  FDRE \slv_reg8_reg[2][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg8_reg[2]_0 [30]),
        .R(SR));
  FDRE \slv_reg8_reg[2][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg8_reg[2]_0 [31]),
        .R(SR));
  FDRE \slv_reg8_reg[2][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg8_reg[2]_0 [3]),
        .R(SR));
  FDRE \slv_reg8_reg[2][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg8_reg[2]_0 [4]),
        .R(SR));
  FDRE \slv_reg8_reg[2][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg8_reg[2]_0 [5]),
        .R(SR));
  FDRE \slv_reg8_reg[2][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg8_reg[2]_0 [6]),
        .R(SR));
  FDRE \slv_reg8_reg[2][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg8_reg[2]_0 [7]),
        .R(SR));
  FDRE \slv_reg8_reg[2][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg8_reg[2]_0 [8]),
        .R(SR));
  FDRE \slv_reg8_reg[2][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[2][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg8_reg[2]_0 [9]),
        .R(SR));
  FDRE \slv_reg8_reg[3][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg8_reg[3]_1 [0]),
        .R(SR));
  FDRE \slv_reg8_reg[3][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg8_reg[3]_1 [10]),
        .R(SR));
  FDRE \slv_reg8_reg[3][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg8_reg[3]_1 [11]),
        .R(SR));
  FDRE \slv_reg8_reg[3][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg8_reg[3]_1 [12]),
        .R(SR));
  FDRE \slv_reg8_reg[3][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg8_reg[3]_1 [13]),
        .R(SR));
  FDRE \slv_reg8_reg[3][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg8_reg[3]_1 [14]),
        .R(SR));
  FDRE \slv_reg8_reg[3][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg8_reg[3]_1 [15]),
        .R(SR));
  FDRE \slv_reg8_reg[3][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg8_reg[3]_1 [16]),
        .R(SR));
  FDRE \slv_reg8_reg[3][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg8_reg[3]_1 [17]),
        .R(SR));
  FDRE \slv_reg8_reg[3][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg8_reg[3]_1 [18]),
        .R(SR));
  FDRE \slv_reg8_reg[3][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg8_reg[3]_1 [19]),
        .R(SR));
  FDRE \slv_reg8_reg[3][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg8_reg[3]_1 [1]),
        .R(SR));
  FDRE \slv_reg8_reg[3][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg8_reg[3]_1 [20]),
        .R(SR));
  FDRE \slv_reg8_reg[3][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg8_reg[3]_1 [21]),
        .R(SR));
  FDRE \slv_reg8_reg[3][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg8_reg[3]_1 [22]),
        .R(SR));
  FDRE \slv_reg8_reg[3][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg8_reg[3]_1 [23]),
        .R(SR));
  FDRE \slv_reg8_reg[3][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg8_reg[3]_1 [24]),
        .R(SR));
  FDRE \slv_reg8_reg[3][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg8_reg[3]_1 [25]),
        .R(SR));
  FDRE \slv_reg8_reg[3][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg8_reg[3]_1 [26]),
        .R(SR));
  FDRE \slv_reg8_reg[3][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg8_reg[3]_1 [27]),
        .R(SR));
  FDRE \slv_reg8_reg[3][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg8_reg[3]_1 [28]),
        .R(SR));
  FDRE \slv_reg8_reg[3][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg8_reg[3]_1 [29]),
        .R(SR));
  FDRE \slv_reg8_reg[3][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg8_reg[3]_1 [2]),
        .R(SR));
  FDRE \slv_reg8_reg[3][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg8_reg[3]_1 [30]),
        .R(SR));
  FDRE \slv_reg8_reg[3][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg8_reg[3]_1 [31]),
        .R(SR));
  FDRE \slv_reg8_reg[3][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg8_reg[3]_1 [3]),
        .R(SR));
  FDRE \slv_reg8_reg[3][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg8_reg[3]_1 [4]),
        .R(SR));
  FDRE \slv_reg8_reg[3][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg8_reg[3]_1 [5]),
        .R(SR));
  FDRE \slv_reg8_reg[3][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg8_reg[3]_1 [6]),
        .R(SR));
  FDRE \slv_reg8_reg[3][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg8_reg[3]_1 [7]),
        .R(SR));
  FDRE \slv_reg8_reg[3][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg8_reg[3]_1 [8]),
        .R(SR));
  FDRE \slv_reg8_reg[3][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[3][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg8_reg[3]_1 [9]),
        .R(SR));
  FDRE \slv_reg8_reg[4][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg8_reg[4]_2 [0]),
        .R(SR));
  FDRE \slv_reg8_reg[4][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg8_reg[4]_2 [10]),
        .R(SR));
  FDRE \slv_reg8_reg[4][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg8_reg[4]_2 [11]),
        .R(SR));
  FDRE \slv_reg8_reg[4][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg8_reg[4]_2 [12]),
        .R(SR));
  FDRE \slv_reg8_reg[4][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg8_reg[4]_2 [13]),
        .R(SR));
  FDRE \slv_reg8_reg[4][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg8_reg[4]_2 [14]),
        .R(SR));
  FDRE \slv_reg8_reg[4][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg8_reg[4]_2 [15]),
        .R(SR));
  FDRE \slv_reg8_reg[4][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg8_reg[4]_2 [16]),
        .R(SR));
  FDRE \slv_reg8_reg[4][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg8_reg[4]_2 [17]),
        .R(SR));
  FDRE \slv_reg8_reg[4][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg8_reg[4]_2 [18]),
        .R(SR));
  FDRE \slv_reg8_reg[4][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg8_reg[4]_2 [19]),
        .R(SR));
  FDRE \slv_reg8_reg[4][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg8_reg[4]_2 [1]),
        .R(SR));
  FDRE \slv_reg8_reg[4][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg8_reg[4]_2 [20]),
        .R(SR));
  FDRE \slv_reg8_reg[4][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg8_reg[4]_2 [21]),
        .R(SR));
  FDRE \slv_reg8_reg[4][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg8_reg[4]_2 [22]),
        .R(SR));
  FDRE \slv_reg8_reg[4][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg8_reg[4]_2 [23]),
        .R(SR));
  FDRE \slv_reg8_reg[4][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg8_reg[4]_2 [24]),
        .R(SR));
  FDRE \slv_reg8_reg[4][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg8_reg[4]_2 [25]),
        .R(SR));
  FDRE \slv_reg8_reg[4][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg8_reg[4]_2 [26]),
        .R(SR));
  FDRE \slv_reg8_reg[4][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg8_reg[4]_2 [27]),
        .R(SR));
  FDRE \slv_reg8_reg[4][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg8_reg[4]_2 [28]),
        .R(SR));
  FDRE \slv_reg8_reg[4][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg8_reg[4]_2 [29]),
        .R(SR));
  FDRE \slv_reg8_reg[4][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg8_reg[4]_2 [2]),
        .R(SR));
  FDRE \slv_reg8_reg[4][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg8_reg[4]_2 [30]),
        .R(SR));
  FDRE \slv_reg8_reg[4][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg8_reg[4]_2 [31]),
        .R(SR));
  FDRE \slv_reg8_reg[4][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg8_reg[4]_2 [3]),
        .R(SR));
  FDRE \slv_reg8_reg[4][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg8_reg[4]_2 [4]),
        .R(SR));
  FDRE \slv_reg8_reg[4][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg8_reg[4]_2 [5]),
        .R(SR));
  FDRE \slv_reg8_reg[4][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg8_reg[4]_2 [6]),
        .R(SR));
  FDRE \slv_reg8_reg[4][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg8_reg[4]_2 [7]),
        .R(SR));
  FDRE \slv_reg8_reg[4][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg8_reg[4]_2 [8]),
        .R(SR));
  FDRE \slv_reg8_reg[4][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[4][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg8_reg[4]_2 [9]),
        .R(SR));
  FDRE \slv_reg8_reg[5][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg8_reg[5]_3 [0]),
        .R(SR));
  FDRE \slv_reg8_reg[5][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg8_reg[5]_3 [10]),
        .R(SR));
  FDRE \slv_reg8_reg[5][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg8_reg[5]_3 [11]),
        .R(SR));
  FDRE \slv_reg8_reg[5][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg8_reg[5]_3 [12]),
        .R(SR));
  FDRE \slv_reg8_reg[5][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg8_reg[5]_3 [13]),
        .R(SR));
  FDRE \slv_reg8_reg[5][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg8_reg[5]_3 [14]),
        .R(SR));
  FDRE \slv_reg8_reg[5][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg8_reg[5]_3 [15]),
        .R(SR));
  FDRE \slv_reg8_reg[5][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg8_reg[5]_3 [16]),
        .R(SR));
  FDRE \slv_reg8_reg[5][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg8_reg[5]_3 [17]),
        .R(SR));
  FDRE \slv_reg8_reg[5][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg8_reg[5]_3 [18]),
        .R(SR));
  FDRE \slv_reg8_reg[5][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg8_reg[5]_3 [19]),
        .R(SR));
  FDRE \slv_reg8_reg[5][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg8_reg[5]_3 [1]),
        .R(SR));
  FDRE \slv_reg8_reg[5][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg8_reg[5]_3 [20]),
        .R(SR));
  FDRE \slv_reg8_reg[5][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg8_reg[5]_3 [21]),
        .R(SR));
  FDRE \slv_reg8_reg[5][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg8_reg[5]_3 [22]),
        .R(SR));
  FDRE \slv_reg8_reg[5][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg8_reg[5]_3 [23]),
        .R(SR));
  FDRE \slv_reg8_reg[5][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg8_reg[5]_3 [24]),
        .R(SR));
  FDRE \slv_reg8_reg[5][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg8_reg[5]_3 [25]),
        .R(SR));
  FDRE \slv_reg8_reg[5][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg8_reg[5]_3 [26]),
        .R(SR));
  FDRE \slv_reg8_reg[5][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg8_reg[5]_3 [27]),
        .R(SR));
  FDRE \slv_reg8_reg[5][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg8_reg[5]_3 [28]),
        .R(SR));
  FDRE \slv_reg8_reg[5][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg8_reg[5]_3 [29]),
        .R(SR));
  FDRE \slv_reg8_reg[5][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg8_reg[5]_3 [2]),
        .R(SR));
  FDRE \slv_reg8_reg[5][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg8_reg[5]_3 [30]),
        .R(SR));
  FDRE \slv_reg8_reg[5][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg8_reg[5]_3 [31]),
        .R(SR));
  FDRE \slv_reg8_reg[5][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg8_reg[5]_3 [3]),
        .R(SR));
  FDRE \slv_reg8_reg[5][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg8_reg[5]_3 [4]),
        .R(SR));
  FDRE \slv_reg8_reg[5][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg8_reg[5]_3 [5]),
        .R(SR));
  FDRE \slv_reg8_reg[5][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg8_reg[5]_3 [6]),
        .R(SR));
  FDRE \slv_reg8_reg[5][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg8_reg[5]_3 [7]),
        .R(SR));
  FDRE \slv_reg8_reg[5][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg8_reg[5]_3 [8]),
        .R(SR));
  FDRE \slv_reg8_reg[5][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[5][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg8_reg[5]_3 [9]),
        .R(SR));
  FDRE \slv_reg8_reg[6][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg8_reg[6]_4 [0]),
        .R(SR));
  FDRE \slv_reg8_reg[6][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg8_reg[6]_4 [10]),
        .R(SR));
  FDRE \slv_reg8_reg[6][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg8_reg[6]_4 [11]),
        .R(SR));
  FDRE \slv_reg8_reg[6][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg8_reg[6]_4 [12]),
        .R(SR));
  FDRE \slv_reg8_reg[6][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg8_reg[6]_4 [13]),
        .R(SR));
  FDRE \slv_reg8_reg[6][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg8_reg[6]_4 [14]),
        .R(SR));
  FDRE \slv_reg8_reg[6][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg8_reg[6]_4 [15]),
        .R(SR));
  FDRE \slv_reg8_reg[6][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg8_reg[6]_4 [16]),
        .R(SR));
  FDRE \slv_reg8_reg[6][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg8_reg[6]_4 [17]),
        .R(SR));
  FDRE \slv_reg8_reg[6][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg8_reg[6]_4 [18]),
        .R(SR));
  FDRE \slv_reg8_reg[6][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg8_reg[6]_4 [19]),
        .R(SR));
  FDRE \slv_reg8_reg[6][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg8_reg[6]_4 [1]),
        .R(SR));
  FDRE \slv_reg8_reg[6][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg8_reg[6]_4 [20]),
        .R(SR));
  FDRE \slv_reg8_reg[6][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg8_reg[6]_4 [21]),
        .R(SR));
  FDRE \slv_reg8_reg[6][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg8_reg[6]_4 [22]),
        .R(SR));
  FDRE \slv_reg8_reg[6][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg8_reg[6]_4 [23]),
        .R(SR));
  FDRE \slv_reg8_reg[6][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg8_reg[6]_4 [24]),
        .R(SR));
  FDRE \slv_reg8_reg[6][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg8_reg[6]_4 [25]),
        .R(SR));
  FDRE \slv_reg8_reg[6][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg8_reg[6]_4 [26]),
        .R(SR));
  FDRE \slv_reg8_reg[6][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg8_reg[6]_4 [27]),
        .R(SR));
  FDRE \slv_reg8_reg[6][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg8_reg[6]_4 [28]),
        .R(SR));
  FDRE \slv_reg8_reg[6][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg8_reg[6]_4 [29]),
        .R(SR));
  FDRE \slv_reg8_reg[6][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg8_reg[6]_4 [2]),
        .R(SR));
  FDRE \slv_reg8_reg[6][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg8_reg[6]_4 [30]),
        .R(SR));
  FDRE \slv_reg8_reg[6][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg8_reg[6]_4 [31]),
        .R(SR));
  FDRE \slv_reg8_reg[6][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg8_reg[6]_4 [3]),
        .R(SR));
  FDRE \slv_reg8_reg[6][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg8_reg[6]_4 [4]),
        .R(SR));
  FDRE \slv_reg8_reg[6][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg8_reg[6]_4 [5]),
        .R(SR));
  FDRE \slv_reg8_reg[6][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg8_reg[6]_4 [6]),
        .R(SR));
  FDRE \slv_reg8_reg[6][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg8_reg[6]_4 [7]),
        .R(SR));
  FDRE \slv_reg8_reg[6][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg8_reg[6]_4 [8]),
        .R(SR));
  FDRE \slv_reg8_reg[6][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[6][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg8_reg[6]_4 [9]),
        .R(SR));
  FDRE \slv_reg8_reg[7][0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(\slv_reg8_reg[7]_5 [0]),
        .R(SR));
  FDRE \slv_reg8_reg[7][10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg8_reg[7]_5 [10]),
        .R(SR));
  FDRE \slv_reg8_reg[7][11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg8_reg[7]_5 [11]),
        .R(SR));
  FDRE \slv_reg8_reg[7][12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg8_reg[7]_5 [12]),
        .R(SR));
  FDRE \slv_reg8_reg[7][13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg8_reg[7]_5 [13]),
        .R(SR));
  FDRE \slv_reg8_reg[7][14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg8_reg[7]_5 [14]),
        .R(SR));
  FDRE \slv_reg8_reg[7][15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg8_reg[7]_5 [15]),
        .R(SR));
  FDRE \slv_reg8_reg[7][16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg8_reg[7]_5 [16]),
        .R(SR));
  FDRE \slv_reg8_reg[7][17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg8_reg[7]_5 [17]),
        .R(SR));
  FDRE \slv_reg8_reg[7][18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg8_reg[7]_5 [18]),
        .R(SR));
  FDRE \slv_reg8_reg[7][19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg8_reg[7]_5 [19]),
        .R(SR));
  FDRE \slv_reg8_reg[7][1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg8_reg[7]_5 [1]),
        .R(SR));
  FDRE \slv_reg8_reg[7][20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg8_reg[7]_5 [20]),
        .R(SR));
  FDRE \slv_reg8_reg[7][21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg8_reg[7]_5 [21]),
        .R(SR));
  FDRE \slv_reg8_reg[7][22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg8_reg[7]_5 [22]),
        .R(SR));
  FDRE \slv_reg8_reg[7][23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg8_reg[7]_5 [23]),
        .R(SR));
  FDRE \slv_reg8_reg[7][24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg8_reg[7]_5 [24]),
        .R(SR));
  FDRE \slv_reg8_reg[7][25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg8_reg[7]_5 [25]),
        .R(SR));
  FDRE \slv_reg8_reg[7][26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg8_reg[7]_5 [26]),
        .R(SR));
  FDRE \slv_reg8_reg[7][27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg8_reg[7]_5 [27]),
        .R(SR));
  FDRE \slv_reg8_reg[7][28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg8_reg[7]_5 [28]),
        .R(SR));
  FDRE \slv_reg8_reg[7][29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg8_reg[7]_5 [29]),
        .R(SR));
  FDRE \slv_reg8_reg[7][2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg8_reg[7]_5 [2]),
        .R(SR));
  FDRE \slv_reg8_reg[7][30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg8_reg[7]_5 [30]),
        .R(SR));
  FDRE \slv_reg8_reg[7][31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg8_reg[7]_5 [31]),
        .R(SR));
  FDRE \slv_reg8_reg[7][3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg8_reg[7]_5 [3]),
        .R(SR));
  FDRE \slv_reg8_reg[7][4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg8_reg[7]_5 [4]),
        .R(SR));
  FDRE \slv_reg8_reg[7][5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg8_reg[7]_5 [5]),
        .R(SR));
  FDRE \slv_reg8_reg[7][6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg8_reg[7]_5 [6]),
        .R(SR));
  FDRE \slv_reg8_reg[7][7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg8_reg[7]_5 [7]),
        .R(SR));
  FDRE \slv_reg8_reg[7][8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg8_reg[7]_5 [8]),
        .R(SR));
  FDRE \slv_reg8_reg[7][9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg8[7][15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg8_reg[7]_5 [9]),
        .R(SR));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(S_AXI_ARREADY),
        .O(slv_reg_rden__0));
endmodule

(* CHECK_LICENSE_TYPE = "OpenNTT_BD_AXISlave8Ports_1_0,AXISlave8Ports,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "AXISlave8Ports,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (control_low_word,
    control_high_word,
    dina_ext_low_word,
    dina_ext_high_word,
    dina2_ext_word,
    dina3_ext_low_word,
    dina3_ext_high_word,
    dout_ext_low_word,
    dout_ext_high_word,
    status,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  output [31:0]control_low_word;
  output [31:0]control_high_word;
  output [31:0]dina_ext_low_word;
  output [31:0]dina_ext_high_word;
  output [31:0]dina2_ext_word;
  output [31:0]dina3_ext_low_word;
  output [31:0]dina3_ext_high_word;
  input [31:0]dout_ext_low_word;
  input [31:0]dout_ext_high_word;
  input [31:0]status;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN OpenNTT_BD_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) input [5:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [5:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN OpenNTT_BD_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire [31:0]control_high_word;
  wire [31:0]control_low_word;
  wire [31:0]dina2_ext_word;
  wire [31:0]dina3_ext_high_word;
  wire [31:0]dina3_ext_low_word;
  wire [31:0]dina_ext_high_word;
  wire [31:0]dina_ext_low_word;
  wire [31:0]dout_ext_high_word;
  wire [31:0]dout_ext_low_word;
  wire s00_axi_aclk;
  wire [5:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [5:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:0]status;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXISlave8Ports inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .control_high_word(control_high_word),
        .control_low_word(control_low_word),
        .dina2_ext_word(dina2_ext_word),
        .dina3_ext_high_word(dina3_ext_high_word),
        .dina3_ext_low_word(dina3_ext_low_word),
        .dina_ext_high_word(dina_ext_high_word),
        .dina_ext_low_word(dina_ext_low_word),
        .dout_ext_high_word(dout_ext_high_word),
        .dout_ext_low_word(dout_ext_low_word),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[5:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[5:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .status(status));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
