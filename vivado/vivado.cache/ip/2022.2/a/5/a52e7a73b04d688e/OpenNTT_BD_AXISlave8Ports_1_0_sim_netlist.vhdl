-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Fri Oct 25 15:45:12 2024
-- Host        : ipd005 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ OpenNTT_BD_AXISlave8Ports_1_0_sim_netlist.vhdl
-- Design      : OpenNTT_BD_AXISlave8Ports_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXI_Slave8Ports_new_v1_0_S00_AXI is
  port (
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    aw_en_reg_0 : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    control_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    control_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina_ext_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina_ext_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina2_ext_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina3_ext_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina3_ext_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aclk : in STD_LOGIC;
    axi_bvalid_reg_0 : in STD_LOGIC;
    aw_en_reg_1 : in STD_LOGIC;
    axi_rvalid_reg_0 : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    status : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dout_ext_high_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dout_ext_low_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXI_Slave8Ports_new_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXI_Slave8Ports_new_v1_0_S00_AXI is
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal \^aw_en_reg_0\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal \axi_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[10]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[12]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[13]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[13]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[14]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[14]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[16]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[17]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[17]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[18]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[18]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[19]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[19]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[20]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[21]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[21]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[22]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[22]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[23]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[24]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[25]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[25]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[26]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[26]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[27]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[27]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[28]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[29]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[29]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[30]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[30]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[9]_i_3_n_0\ : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^control_high_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^control_low_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^dina2_ext_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^dina3_ext_high_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^dina3_ext_low_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^dina_ext_high_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^dina_ext_low_word\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 7 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg7[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg7[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg7[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg7[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[0][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[0][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[0][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[0][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[1][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[1][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[1][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[1][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[2][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[2][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[2][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[2][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[3][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[3][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[3][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[3][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[4][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[4][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[4][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[4][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[5][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[5][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[5][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[5][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[6][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[6][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[6][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[6][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[7][15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[7][23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[7][31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8[7][7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg8_reg[2]_0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg8_reg[3]_1\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg8_reg[4]_2\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg8_reg[5]_3\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg8_reg[6]_4\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg8_reg[7]_5\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  aw_en_reg_0 <= \^aw_en_reg_0\;
  control_high_word(31 downto 0) <= \^control_high_word\(31 downto 0);
  control_low_word(31 downto 0) <= \^control_low_word\(31 downto 0);
  dina2_ext_word(31 downto 0) <= \^dina2_ext_word\(31 downto 0);
  dina3_ext_high_word(31 downto 0) <= \^dina3_ext_high_word\(31 downto 0);
  dina3_ext_low_word(31 downto 0) <= \^dina3_ext_low_word\(31 downto 0);
  dina_ext_high_word(31 downto 0) <= \^dina_ext_high_word\(31 downto 0);
  dina_ext_low_word(31 downto 0) <= \^dina_ext_low_word\(31 downto 0);
  s00_axi_rvalid <= \^s00_axi_rvalid\;
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_reg_1,
      Q => \^aw_en_reg_0\,
      S => SR(0)
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(0),
      Q => sel0(0),
      R => SR(0)
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(1),
      Q => sel0(1),
      R => SR(0)
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(2),
      Q => sel0(2),
      R => SR(0)
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(3),
      Q => sel0(3),
      R => SR(0)
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => SR(0)
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(0),
      Q => p_0_in(0),
      R => SR(0)
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(1),
      Q => p_0_in(1),
      R => SR(0)
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(2),
      Q => p_0_in(2),
      R => SR(0)
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(3),
      Q => p_0_in(3),
      R => SR(0)
    );
axi_awready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s_axi_awready\,
      I2 => \^aw_en_reg_0\,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => SR(0)
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_reg_0,
      Q => s00_axi_bvalid,
      R => SR(0)
    );
\axi_rdata[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(0),
      I1 => \^dina_ext_low_word\(0),
      I2 => sel0(1),
      I3 => \^control_high_word\(0),
      I4 => sel0(0),
      I5 => \^control_low_word\(0),
      O => \axi_rdata[0]_i_4_n_0\
    );
\axi_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(0),
      I1 => status(0),
      I2 => sel0(1),
      I3 => dout_ext_high_word(0),
      I4 => sel0(0),
      I5 => dout_ext_low_word(0),
      O => \axi_rdata[0]_i_5_n_0\
    );
\axi_rdata[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(0),
      I1 => \slv_reg8_reg[2]_0\(0),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(0),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(0),
      O => \axi_rdata[0]_i_6_n_0\
    );
\axi_rdata[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(0),
      I1 => \slv_reg8_reg[6]_4\(0),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(0),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(0),
      O => \axi_rdata[0]_i_7_n_0\
    );
\axi_rdata[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(10),
      I1 => \^dina_ext_low_word\(10),
      I2 => sel0(1),
      I3 => \^control_high_word\(10),
      I4 => sel0(0),
      I5 => \^control_low_word\(10),
      O => \axi_rdata[10]_i_4_n_0\
    );
\axi_rdata[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(10),
      I1 => status(10),
      I2 => sel0(1),
      I3 => dout_ext_high_word(10),
      I4 => sel0(0),
      I5 => dout_ext_low_word(10),
      O => \axi_rdata[10]_i_5_n_0\
    );
\axi_rdata[10]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(10),
      I1 => \slv_reg8_reg[2]_0\(10),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(10),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(10),
      O => \axi_rdata[10]_i_6_n_0\
    );
\axi_rdata[10]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(10),
      I1 => \slv_reg8_reg[6]_4\(10),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(10),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(10),
      O => \axi_rdata[10]_i_7_n_0\
    );
\axi_rdata[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(11),
      I1 => \^dina_ext_low_word\(11),
      I2 => sel0(1),
      I3 => \^control_high_word\(11),
      I4 => sel0(0),
      I5 => \^control_low_word\(11),
      O => \axi_rdata[11]_i_4_n_0\
    );
\axi_rdata[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(11),
      I1 => status(11),
      I2 => sel0(1),
      I3 => dout_ext_high_word(11),
      I4 => sel0(0),
      I5 => dout_ext_low_word(11),
      O => \axi_rdata[11]_i_5_n_0\
    );
\axi_rdata[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(11),
      I1 => \slv_reg8_reg[2]_0\(11),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(11),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(11),
      O => \axi_rdata[11]_i_6_n_0\
    );
\axi_rdata[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(11),
      I1 => \slv_reg8_reg[6]_4\(11),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(11),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(11),
      O => \axi_rdata[11]_i_7_n_0\
    );
\axi_rdata[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(12),
      I1 => \^dina_ext_low_word\(12),
      I2 => sel0(1),
      I3 => \^control_high_word\(12),
      I4 => sel0(0),
      I5 => \^control_low_word\(12),
      O => \axi_rdata[12]_i_4_n_0\
    );
\axi_rdata[12]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(12),
      I1 => status(12),
      I2 => sel0(1),
      I3 => dout_ext_high_word(12),
      I4 => sel0(0),
      I5 => dout_ext_low_word(12),
      O => \axi_rdata[12]_i_5_n_0\
    );
\axi_rdata[12]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(12),
      I1 => \slv_reg8_reg[2]_0\(12),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(12),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(12),
      O => \axi_rdata[12]_i_6_n_0\
    );
\axi_rdata[12]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(12),
      I1 => \slv_reg8_reg[6]_4\(12),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(12),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(12),
      O => \axi_rdata[12]_i_7_n_0\
    );
\axi_rdata[13]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(13),
      I1 => \^dina_ext_low_word\(13),
      I2 => sel0(1),
      I3 => \^control_high_word\(13),
      I4 => sel0(0),
      I5 => \^control_low_word\(13),
      O => \axi_rdata[13]_i_4_n_0\
    );
\axi_rdata[13]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(13),
      I1 => status(13),
      I2 => sel0(1),
      I3 => dout_ext_high_word(13),
      I4 => sel0(0),
      I5 => dout_ext_low_word(13),
      O => \axi_rdata[13]_i_5_n_0\
    );
\axi_rdata[13]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(13),
      I1 => \slv_reg8_reg[2]_0\(13),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(13),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(13),
      O => \axi_rdata[13]_i_6_n_0\
    );
\axi_rdata[13]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(13),
      I1 => \slv_reg8_reg[6]_4\(13),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(13),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(13),
      O => \axi_rdata[13]_i_7_n_0\
    );
\axi_rdata[14]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(14),
      I1 => \^dina_ext_low_word\(14),
      I2 => sel0(1),
      I3 => \^control_high_word\(14),
      I4 => sel0(0),
      I5 => \^control_low_word\(14),
      O => \axi_rdata[14]_i_4_n_0\
    );
\axi_rdata[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(14),
      I1 => status(14),
      I2 => sel0(1),
      I3 => dout_ext_high_word(14),
      I4 => sel0(0),
      I5 => dout_ext_low_word(14),
      O => \axi_rdata[14]_i_5_n_0\
    );
\axi_rdata[14]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(14),
      I1 => \slv_reg8_reg[2]_0\(14),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(14),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(14),
      O => \axi_rdata[14]_i_6_n_0\
    );
\axi_rdata[14]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(14),
      I1 => \slv_reg8_reg[6]_4\(14),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(14),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(14),
      O => \axi_rdata[14]_i_7_n_0\
    );
\axi_rdata[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(15),
      I1 => \^dina_ext_low_word\(15),
      I2 => sel0(1),
      I3 => \^control_high_word\(15),
      I4 => sel0(0),
      I5 => \^control_low_word\(15),
      O => \axi_rdata[15]_i_4_n_0\
    );
\axi_rdata[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(15),
      I1 => status(15),
      I2 => sel0(1),
      I3 => dout_ext_high_word(15),
      I4 => sel0(0),
      I5 => dout_ext_low_word(15),
      O => \axi_rdata[15]_i_5_n_0\
    );
\axi_rdata[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(15),
      I1 => \slv_reg8_reg[2]_0\(15),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(15),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(15),
      O => \axi_rdata[15]_i_6_n_0\
    );
\axi_rdata[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(15),
      I1 => \slv_reg8_reg[6]_4\(15),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(15),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(15),
      O => \axi_rdata[15]_i_7_n_0\
    );
\axi_rdata[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(16),
      I1 => \^dina_ext_low_word\(16),
      I2 => sel0(1),
      I3 => \^control_high_word\(16),
      I4 => sel0(0),
      I5 => \^control_low_word\(16),
      O => \axi_rdata[16]_i_4_n_0\
    );
\axi_rdata[16]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(16),
      I1 => status(16),
      I2 => sel0(1),
      I3 => dout_ext_high_word(16),
      I4 => sel0(0),
      I5 => dout_ext_low_word(16),
      O => \axi_rdata[16]_i_5_n_0\
    );
\axi_rdata[16]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(16),
      I1 => \slv_reg8_reg[2]_0\(16),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(16),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(16),
      O => \axi_rdata[16]_i_6_n_0\
    );
\axi_rdata[16]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(16),
      I1 => \slv_reg8_reg[6]_4\(16),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(16),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(16),
      O => \axi_rdata[16]_i_7_n_0\
    );
\axi_rdata[17]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(17),
      I1 => \^dina_ext_low_word\(17),
      I2 => sel0(1),
      I3 => \^control_high_word\(17),
      I4 => sel0(0),
      I5 => \^control_low_word\(17),
      O => \axi_rdata[17]_i_4_n_0\
    );
\axi_rdata[17]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(17),
      I1 => status(17),
      I2 => sel0(1),
      I3 => dout_ext_high_word(17),
      I4 => sel0(0),
      I5 => dout_ext_low_word(17),
      O => \axi_rdata[17]_i_5_n_0\
    );
\axi_rdata[17]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(17),
      I1 => \slv_reg8_reg[2]_0\(17),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(17),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(17),
      O => \axi_rdata[17]_i_6_n_0\
    );
\axi_rdata[17]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(17),
      I1 => \slv_reg8_reg[6]_4\(17),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(17),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(17),
      O => \axi_rdata[17]_i_7_n_0\
    );
\axi_rdata[18]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(18),
      I1 => \^dina_ext_low_word\(18),
      I2 => sel0(1),
      I3 => \^control_high_word\(18),
      I4 => sel0(0),
      I5 => \^control_low_word\(18),
      O => \axi_rdata[18]_i_4_n_0\
    );
\axi_rdata[18]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(18),
      I1 => status(18),
      I2 => sel0(1),
      I3 => dout_ext_high_word(18),
      I4 => sel0(0),
      I5 => dout_ext_low_word(18),
      O => \axi_rdata[18]_i_5_n_0\
    );
\axi_rdata[18]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(18),
      I1 => \slv_reg8_reg[2]_0\(18),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(18),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(18),
      O => \axi_rdata[18]_i_6_n_0\
    );
\axi_rdata[18]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(18),
      I1 => \slv_reg8_reg[6]_4\(18),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(18),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(18),
      O => \axi_rdata[18]_i_7_n_0\
    );
\axi_rdata[19]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(19),
      I1 => \^dina_ext_low_word\(19),
      I2 => sel0(1),
      I3 => \^control_high_word\(19),
      I4 => sel0(0),
      I5 => \^control_low_word\(19),
      O => \axi_rdata[19]_i_4_n_0\
    );
\axi_rdata[19]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(19),
      I1 => status(19),
      I2 => sel0(1),
      I3 => dout_ext_high_word(19),
      I4 => sel0(0),
      I5 => dout_ext_low_word(19),
      O => \axi_rdata[19]_i_5_n_0\
    );
\axi_rdata[19]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(19),
      I1 => \slv_reg8_reg[2]_0\(19),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(19),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(19),
      O => \axi_rdata[19]_i_6_n_0\
    );
\axi_rdata[19]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(19),
      I1 => \slv_reg8_reg[6]_4\(19),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(19),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(19),
      O => \axi_rdata[19]_i_7_n_0\
    );
\axi_rdata[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(1),
      I1 => \^dina_ext_low_word\(1),
      I2 => sel0(1),
      I3 => \^control_high_word\(1),
      I4 => sel0(0),
      I5 => \^control_low_word\(1),
      O => \axi_rdata[1]_i_4_n_0\
    );
\axi_rdata[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(1),
      I1 => status(1),
      I2 => sel0(1),
      I3 => dout_ext_high_word(1),
      I4 => sel0(0),
      I5 => dout_ext_low_word(1),
      O => \axi_rdata[1]_i_5_n_0\
    );
\axi_rdata[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(1),
      I1 => \slv_reg8_reg[2]_0\(1),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(1),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(1),
      O => \axi_rdata[1]_i_6_n_0\
    );
\axi_rdata[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(1),
      I1 => \slv_reg8_reg[6]_4\(1),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(1),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(1),
      O => \axi_rdata[1]_i_7_n_0\
    );
\axi_rdata[20]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(20),
      I1 => \^dina_ext_low_word\(20),
      I2 => sel0(1),
      I3 => \^control_high_word\(20),
      I4 => sel0(0),
      I5 => \^control_low_word\(20),
      O => \axi_rdata[20]_i_4_n_0\
    );
\axi_rdata[20]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(20),
      I1 => status(20),
      I2 => sel0(1),
      I3 => dout_ext_high_word(20),
      I4 => sel0(0),
      I5 => dout_ext_low_word(20),
      O => \axi_rdata[20]_i_5_n_0\
    );
\axi_rdata[20]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(20),
      I1 => \slv_reg8_reg[2]_0\(20),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(20),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(20),
      O => \axi_rdata[20]_i_6_n_0\
    );
\axi_rdata[20]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(20),
      I1 => \slv_reg8_reg[6]_4\(20),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(20),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(20),
      O => \axi_rdata[20]_i_7_n_0\
    );
\axi_rdata[21]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(21),
      I1 => \^dina_ext_low_word\(21),
      I2 => sel0(1),
      I3 => \^control_high_word\(21),
      I4 => sel0(0),
      I5 => \^control_low_word\(21),
      O => \axi_rdata[21]_i_4_n_0\
    );
\axi_rdata[21]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(21),
      I1 => status(21),
      I2 => sel0(1),
      I3 => dout_ext_high_word(21),
      I4 => sel0(0),
      I5 => dout_ext_low_word(21),
      O => \axi_rdata[21]_i_5_n_0\
    );
\axi_rdata[21]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(21),
      I1 => \slv_reg8_reg[2]_0\(21),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(21),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(21),
      O => \axi_rdata[21]_i_6_n_0\
    );
\axi_rdata[21]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(21),
      I1 => \slv_reg8_reg[6]_4\(21),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(21),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(21),
      O => \axi_rdata[21]_i_7_n_0\
    );
\axi_rdata[22]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(22),
      I1 => \^dina_ext_low_word\(22),
      I2 => sel0(1),
      I3 => \^control_high_word\(22),
      I4 => sel0(0),
      I5 => \^control_low_word\(22),
      O => \axi_rdata[22]_i_4_n_0\
    );
\axi_rdata[22]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(22),
      I1 => status(22),
      I2 => sel0(1),
      I3 => dout_ext_high_word(22),
      I4 => sel0(0),
      I5 => dout_ext_low_word(22),
      O => \axi_rdata[22]_i_5_n_0\
    );
\axi_rdata[22]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(22),
      I1 => \slv_reg8_reg[2]_0\(22),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(22),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(22),
      O => \axi_rdata[22]_i_6_n_0\
    );
\axi_rdata[22]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(22),
      I1 => \slv_reg8_reg[6]_4\(22),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(22),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(22),
      O => \axi_rdata[22]_i_7_n_0\
    );
\axi_rdata[23]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(23),
      I1 => \^dina_ext_low_word\(23),
      I2 => sel0(1),
      I3 => \^control_high_word\(23),
      I4 => sel0(0),
      I5 => \^control_low_word\(23),
      O => \axi_rdata[23]_i_4_n_0\
    );
\axi_rdata[23]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(23),
      I1 => status(23),
      I2 => sel0(1),
      I3 => dout_ext_high_word(23),
      I4 => sel0(0),
      I5 => dout_ext_low_word(23),
      O => \axi_rdata[23]_i_5_n_0\
    );
\axi_rdata[23]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(23),
      I1 => \slv_reg8_reg[2]_0\(23),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(23),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(23),
      O => \axi_rdata[23]_i_6_n_0\
    );
\axi_rdata[23]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(23),
      I1 => \slv_reg8_reg[6]_4\(23),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(23),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(23),
      O => \axi_rdata[23]_i_7_n_0\
    );
\axi_rdata[24]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(24),
      I1 => \^dina_ext_low_word\(24),
      I2 => sel0(1),
      I3 => \^control_high_word\(24),
      I4 => sel0(0),
      I5 => \^control_low_word\(24),
      O => \axi_rdata[24]_i_4_n_0\
    );
\axi_rdata[24]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(24),
      I1 => status(24),
      I2 => sel0(1),
      I3 => dout_ext_high_word(24),
      I4 => sel0(0),
      I5 => dout_ext_low_word(24),
      O => \axi_rdata[24]_i_5_n_0\
    );
\axi_rdata[24]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(24),
      I1 => \slv_reg8_reg[2]_0\(24),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(24),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(24),
      O => \axi_rdata[24]_i_6_n_0\
    );
\axi_rdata[24]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(24),
      I1 => \slv_reg8_reg[6]_4\(24),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(24),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(24),
      O => \axi_rdata[24]_i_7_n_0\
    );
\axi_rdata[25]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(25),
      I1 => \^dina_ext_low_word\(25),
      I2 => sel0(1),
      I3 => \^control_high_word\(25),
      I4 => sel0(0),
      I5 => \^control_low_word\(25),
      O => \axi_rdata[25]_i_4_n_0\
    );
\axi_rdata[25]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(25),
      I1 => status(25),
      I2 => sel0(1),
      I3 => dout_ext_high_word(25),
      I4 => sel0(0),
      I5 => dout_ext_low_word(25),
      O => \axi_rdata[25]_i_5_n_0\
    );
\axi_rdata[25]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(25),
      I1 => \slv_reg8_reg[2]_0\(25),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(25),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(25),
      O => \axi_rdata[25]_i_6_n_0\
    );
\axi_rdata[25]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(25),
      I1 => \slv_reg8_reg[6]_4\(25),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(25),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(25),
      O => \axi_rdata[25]_i_7_n_0\
    );
\axi_rdata[26]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(26),
      I1 => \^dina_ext_low_word\(26),
      I2 => sel0(1),
      I3 => \^control_high_word\(26),
      I4 => sel0(0),
      I5 => \^control_low_word\(26),
      O => \axi_rdata[26]_i_4_n_0\
    );
\axi_rdata[26]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(26),
      I1 => status(26),
      I2 => sel0(1),
      I3 => dout_ext_high_word(26),
      I4 => sel0(0),
      I5 => dout_ext_low_word(26),
      O => \axi_rdata[26]_i_5_n_0\
    );
\axi_rdata[26]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(26),
      I1 => \slv_reg8_reg[2]_0\(26),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(26),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(26),
      O => \axi_rdata[26]_i_6_n_0\
    );
\axi_rdata[26]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(26),
      I1 => \slv_reg8_reg[6]_4\(26),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(26),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(26),
      O => \axi_rdata[26]_i_7_n_0\
    );
\axi_rdata[27]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(27),
      I1 => \^dina_ext_low_word\(27),
      I2 => sel0(1),
      I3 => \^control_high_word\(27),
      I4 => sel0(0),
      I5 => \^control_low_word\(27),
      O => \axi_rdata[27]_i_4_n_0\
    );
\axi_rdata[27]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(27),
      I1 => status(27),
      I2 => sel0(1),
      I3 => dout_ext_high_word(27),
      I4 => sel0(0),
      I5 => dout_ext_low_word(27),
      O => \axi_rdata[27]_i_5_n_0\
    );
\axi_rdata[27]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(27),
      I1 => \slv_reg8_reg[2]_0\(27),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(27),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(27),
      O => \axi_rdata[27]_i_6_n_0\
    );
\axi_rdata[27]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(27),
      I1 => \slv_reg8_reg[6]_4\(27),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(27),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(27),
      O => \axi_rdata[27]_i_7_n_0\
    );
\axi_rdata[28]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(28),
      I1 => \^dina_ext_low_word\(28),
      I2 => sel0(1),
      I3 => \^control_high_word\(28),
      I4 => sel0(0),
      I5 => \^control_low_word\(28),
      O => \axi_rdata[28]_i_4_n_0\
    );
\axi_rdata[28]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(28),
      I1 => status(28),
      I2 => sel0(1),
      I3 => dout_ext_high_word(28),
      I4 => sel0(0),
      I5 => dout_ext_low_word(28),
      O => \axi_rdata[28]_i_5_n_0\
    );
\axi_rdata[28]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(28),
      I1 => \slv_reg8_reg[2]_0\(28),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(28),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(28),
      O => \axi_rdata[28]_i_6_n_0\
    );
\axi_rdata[28]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(28),
      I1 => \slv_reg8_reg[6]_4\(28),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(28),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(28),
      O => \axi_rdata[28]_i_7_n_0\
    );
\axi_rdata[29]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(29),
      I1 => \^dina_ext_low_word\(29),
      I2 => sel0(1),
      I3 => \^control_high_word\(29),
      I4 => sel0(0),
      I5 => \^control_low_word\(29),
      O => \axi_rdata[29]_i_4_n_0\
    );
\axi_rdata[29]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(29),
      I1 => status(29),
      I2 => sel0(1),
      I3 => dout_ext_high_word(29),
      I4 => sel0(0),
      I5 => dout_ext_low_word(29),
      O => \axi_rdata[29]_i_5_n_0\
    );
\axi_rdata[29]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(29),
      I1 => \slv_reg8_reg[2]_0\(29),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(29),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(29),
      O => \axi_rdata[29]_i_6_n_0\
    );
\axi_rdata[29]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(29),
      I1 => \slv_reg8_reg[6]_4\(29),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(29),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(29),
      O => \axi_rdata[29]_i_7_n_0\
    );
\axi_rdata[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(2),
      I1 => \^dina_ext_low_word\(2),
      I2 => sel0(1),
      I3 => \^control_high_word\(2),
      I4 => sel0(0),
      I5 => \^control_low_word\(2),
      O => \axi_rdata[2]_i_4_n_0\
    );
\axi_rdata[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(2),
      I1 => status(2),
      I2 => sel0(1),
      I3 => dout_ext_high_word(2),
      I4 => sel0(0),
      I5 => dout_ext_low_word(2),
      O => \axi_rdata[2]_i_5_n_0\
    );
\axi_rdata[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(2),
      I1 => \slv_reg8_reg[2]_0\(2),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(2),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(2),
      O => \axi_rdata[2]_i_6_n_0\
    );
\axi_rdata[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(2),
      I1 => \slv_reg8_reg[6]_4\(2),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(2),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(2),
      O => \axi_rdata[2]_i_7_n_0\
    );
\axi_rdata[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(30),
      I1 => \^dina_ext_low_word\(30),
      I2 => sel0(1),
      I3 => \^control_high_word\(30),
      I4 => sel0(0),
      I5 => \^control_low_word\(30),
      O => \axi_rdata[30]_i_4_n_0\
    );
\axi_rdata[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(30),
      I1 => status(30),
      I2 => sel0(1),
      I3 => dout_ext_high_word(30),
      I4 => sel0(0),
      I5 => dout_ext_low_word(30),
      O => \axi_rdata[30]_i_5_n_0\
    );
\axi_rdata[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(30),
      I1 => \slv_reg8_reg[2]_0\(30),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(30),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(30),
      O => \axi_rdata[30]_i_6_n_0\
    );
\axi_rdata[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(30),
      I1 => \slv_reg8_reg[6]_4\(30),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(30),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(30),
      O => \axi_rdata[30]_i_7_n_0\
    );
\axi_rdata[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(31),
      I1 => \^dina_ext_low_word\(31),
      I2 => sel0(1),
      I3 => \^control_high_word\(31),
      I4 => sel0(0),
      I5 => \^control_low_word\(31),
      O => \axi_rdata[31]_i_4_n_0\
    );
\axi_rdata[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(31),
      I1 => status(31),
      I2 => sel0(1),
      I3 => dout_ext_high_word(31),
      I4 => sel0(0),
      I5 => dout_ext_low_word(31),
      O => \axi_rdata[31]_i_5_n_0\
    );
\axi_rdata[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(31),
      I1 => \slv_reg8_reg[2]_0\(31),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(31),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(31),
      O => \axi_rdata[31]_i_6_n_0\
    );
\axi_rdata[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(31),
      I1 => \slv_reg8_reg[6]_4\(31),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(31),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(31),
      O => \axi_rdata[31]_i_7_n_0\
    );
\axi_rdata[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(3),
      I1 => \^dina_ext_low_word\(3),
      I2 => sel0(1),
      I3 => \^control_high_word\(3),
      I4 => sel0(0),
      I5 => \^control_low_word\(3),
      O => \axi_rdata[3]_i_4_n_0\
    );
\axi_rdata[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(3),
      I1 => status(3),
      I2 => sel0(1),
      I3 => dout_ext_high_word(3),
      I4 => sel0(0),
      I5 => dout_ext_low_word(3),
      O => \axi_rdata[3]_i_5_n_0\
    );
\axi_rdata[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(3),
      I1 => \slv_reg8_reg[2]_0\(3),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(3),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(3),
      O => \axi_rdata[3]_i_6_n_0\
    );
\axi_rdata[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(3),
      I1 => \slv_reg8_reg[6]_4\(3),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(3),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(3),
      O => \axi_rdata[3]_i_7_n_0\
    );
\axi_rdata[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(4),
      I1 => \^dina_ext_low_word\(4),
      I2 => sel0(1),
      I3 => \^control_high_word\(4),
      I4 => sel0(0),
      I5 => \^control_low_word\(4),
      O => \axi_rdata[4]_i_4_n_0\
    );
\axi_rdata[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(4),
      I1 => status(4),
      I2 => sel0(1),
      I3 => dout_ext_high_word(4),
      I4 => sel0(0),
      I5 => dout_ext_low_word(4),
      O => \axi_rdata[4]_i_5_n_0\
    );
\axi_rdata[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(4),
      I1 => \slv_reg8_reg[2]_0\(4),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(4),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(4),
      O => \axi_rdata[4]_i_6_n_0\
    );
\axi_rdata[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(4),
      I1 => \slv_reg8_reg[6]_4\(4),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(4),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(4),
      O => \axi_rdata[4]_i_7_n_0\
    );
\axi_rdata[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(5),
      I1 => \^dina_ext_low_word\(5),
      I2 => sel0(1),
      I3 => \^control_high_word\(5),
      I4 => sel0(0),
      I5 => \^control_low_word\(5),
      O => \axi_rdata[5]_i_4_n_0\
    );
\axi_rdata[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(5),
      I1 => status(5),
      I2 => sel0(1),
      I3 => dout_ext_high_word(5),
      I4 => sel0(0),
      I5 => dout_ext_low_word(5),
      O => \axi_rdata[5]_i_5_n_0\
    );
\axi_rdata[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(5),
      I1 => \slv_reg8_reg[2]_0\(5),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(5),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(5),
      O => \axi_rdata[5]_i_6_n_0\
    );
\axi_rdata[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(5),
      I1 => \slv_reg8_reg[6]_4\(5),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(5),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(5),
      O => \axi_rdata[5]_i_7_n_0\
    );
\axi_rdata[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(6),
      I1 => \^dina_ext_low_word\(6),
      I2 => sel0(1),
      I3 => \^control_high_word\(6),
      I4 => sel0(0),
      I5 => \^control_low_word\(6),
      O => \axi_rdata[6]_i_4_n_0\
    );
\axi_rdata[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(6),
      I1 => status(6),
      I2 => sel0(1),
      I3 => dout_ext_high_word(6),
      I4 => sel0(0),
      I5 => dout_ext_low_word(6),
      O => \axi_rdata[6]_i_5_n_0\
    );
\axi_rdata[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(6),
      I1 => \slv_reg8_reg[2]_0\(6),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(6),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(6),
      O => \axi_rdata[6]_i_6_n_0\
    );
\axi_rdata[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(6),
      I1 => \slv_reg8_reg[6]_4\(6),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(6),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(6),
      O => \axi_rdata[6]_i_7_n_0\
    );
\axi_rdata[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(7),
      I1 => \^dina_ext_low_word\(7),
      I2 => sel0(1),
      I3 => \^control_high_word\(7),
      I4 => sel0(0),
      I5 => \^control_low_word\(7),
      O => \axi_rdata[7]_i_4_n_0\
    );
\axi_rdata[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(7),
      I1 => status(7),
      I2 => sel0(1),
      I3 => dout_ext_high_word(7),
      I4 => sel0(0),
      I5 => dout_ext_low_word(7),
      O => \axi_rdata[7]_i_5_n_0\
    );
\axi_rdata[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(7),
      I1 => \slv_reg8_reg[2]_0\(7),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(7),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(7),
      O => \axi_rdata[7]_i_6_n_0\
    );
\axi_rdata[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(7),
      I1 => \slv_reg8_reg[6]_4\(7),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(7),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(7),
      O => \axi_rdata[7]_i_7_n_0\
    );
\axi_rdata[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(8),
      I1 => \^dina_ext_low_word\(8),
      I2 => sel0(1),
      I3 => \^control_high_word\(8),
      I4 => sel0(0),
      I5 => \^control_low_word\(8),
      O => \axi_rdata[8]_i_4_n_0\
    );
\axi_rdata[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(8),
      I1 => status(8),
      I2 => sel0(1),
      I3 => dout_ext_high_word(8),
      I4 => sel0(0),
      I5 => dout_ext_low_word(8),
      O => \axi_rdata[8]_i_5_n_0\
    );
\axi_rdata[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(8),
      I1 => \slv_reg8_reg[2]_0\(8),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(8),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(8),
      O => \axi_rdata[8]_i_6_n_0\
    );
\axi_rdata[8]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(8),
      I1 => \slv_reg8_reg[6]_4\(8),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(8),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(8),
      O => \axi_rdata[8]_i_7_n_0\
    );
\axi_rdata[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina_ext_high_word\(9),
      I1 => \^dina_ext_low_word\(9),
      I2 => sel0(1),
      I3 => \^control_high_word\(9),
      I4 => sel0(0),
      I5 => \^control_low_word\(9),
      O => \axi_rdata[9]_i_4_n_0\
    );
\axi_rdata[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^dina2_ext_word\(9),
      I1 => status(9),
      I2 => sel0(1),
      I3 => dout_ext_high_word(9),
      I4 => sel0(0),
      I5 => dout_ext_low_word(9),
      O => \axi_rdata[9]_i_5_n_0\
    );
\axi_rdata[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[3]_1\(9),
      I1 => \slv_reg8_reg[2]_0\(9),
      I2 => sel0(1),
      I3 => \^dina3_ext_high_word\(9),
      I4 => sel0(0),
      I5 => \^dina3_ext_low_word\(9),
      O => \axi_rdata[9]_i_6_n_0\
    );
\axi_rdata[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \slv_reg8_reg[7]_5\(9),
      I1 => \slv_reg8_reg[6]_4\(9),
      I2 => sel0(1),
      I3 => \slv_reg8_reg[5]_3\(9),
      I4 => sel0(0),
      I5 => \slv_reg8_reg[4]_2\(9),
      O => \axi_rdata[9]_i_7_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => SR(0)
    );
\axi_rdata_reg[0]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[0]_i_2_n_0\,
      I1 => \axi_rdata_reg[0]_i_3_n_0\,
      O => reg_data_out(0),
      S => sel0(3)
    );
\axi_rdata_reg[0]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[0]_i_4_n_0\,
      I1 => \axi_rdata[0]_i_5_n_0\,
      O => \axi_rdata_reg[0]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[0]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[0]_i_6_n_0\,
      I1 => \axi_rdata[0]_i_7_n_0\,
      O => \axi_rdata_reg[0]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => SR(0)
    );
\axi_rdata_reg[10]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[10]_i_2_n_0\,
      I1 => \axi_rdata_reg[10]_i_3_n_0\,
      O => reg_data_out(10),
      S => sel0(3)
    );
\axi_rdata_reg[10]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[10]_i_4_n_0\,
      I1 => \axi_rdata[10]_i_5_n_0\,
      O => \axi_rdata_reg[10]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[10]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[10]_i_6_n_0\,
      I1 => \axi_rdata[10]_i_7_n_0\,
      O => \axi_rdata_reg[10]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => SR(0)
    );
\axi_rdata_reg[11]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[11]_i_2_n_0\,
      I1 => \axi_rdata_reg[11]_i_3_n_0\,
      O => reg_data_out(11),
      S => sel0(3)
    );
\axi_rdata_reg[11]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[11]_i_4_n_0\,
      I1 => \axi_rdata[11]_i_5_n_0\,
      O => \axi_rdata_reg[11]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[11]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[11]_i_6_n_0\,
      I1 => \axi_rdata[11]_i_7_n_0\,
      O => \axi_rdata_reg[11]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => SR(0)
    );
\axi_rdata_reg[12]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[12]_i_2_n_0\,
      I1 => \axi_rdata_reg[12]_i_3_n_0\,
      O => reg_data_out(12),
      S => sel0(3)
    );
\axi_rdata_reg[12]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[12]_i_4_n_0\,
      I1 => \axi_rdata[12]_i_5_n_0\,
      O => \axi_rdata_reg[12]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[12]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[12]_i_6_n_0\,
      I1 => \axi_rdata[12]_i_7_n_0\,
      O => \axi_rdata_reg[12]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => SR(0)
    );
\axi_rdata_reg[13]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[13]_i_2_n_0\,
      I1 => \axi_rdata_reg[13]_i_3_n_0\,
      O => reg_data_out(13),
      S => sel0(3)
    );
\axi_rdata_reg[13]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[13]_i_4_n_0\,
      I1 => \axi_rdata[13]_i_5_n_0\,
      O => \axi_rdata_reg[13]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[13]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[13]_i_6_n_0\,
      I1 => \axi_rdata[13]_i_7_n_0\,
      O => \axi_rdata_reg[13]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => SR(0)
    );
\axi_rdata_reg[14]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[14]_i_2_n_0\,
      I1 => \axi_rdata_reg[14]_i_3_n_0\,
      O => reg_data_out(14),
      S => sel0(3)
    );
\axi_rdata_reg[14]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[14]_i_4_n_0\,
      I1 => \axi_rdata[14]_i_5_n_0\,
      O => \axi_rdata_reg[14]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[14]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[14]_i_6_n_0\,
      I1 => \axi_rdata[14]_i_7_n_0\,
      O => \axi_rdata_reg[14]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => SR(0)
    );
\axi_rdata_reg[15]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[15]_i_2_n_0\,
      I1 => \axi_rdata_reg[15]_i_3_n_0\,
      O => reg_data_out(15),
      S => sel0(3)
    );
\axi_rdata_reg[15]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[15]_i_4_n_0\,
      I1 => \axi_rdata[15]_i_5_n_0\,
      O => \axi_rdata_reg[15]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[15]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[15]_i_6_n_0\,
      I1 => \axi_rdata[15]_i_7_n_0\,
      O => \axi_rdata_reg[15]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => SR(0)
    );
\axi_rdata_reg[16]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[16]_i_2_n_0\,
      I1 => \axi_rdata_reg[16]_i_3_n_0\,
      O => reg_data_out(16),
      S => sel0(3)
    );
\axi_rdata_reg[16]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[16]_i_4_n_0\,
      I1 => \axi_rdata[16]_i_5_n_0\,
      O => \axi_rdata_reg[16]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[16]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[16]_i_6_n_0\,
      I1 => \axi_rdata[16]_i_7_n_0\,
      O => \axi_rdata_reg[16]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => SR(0)
    );
\axi_rdata_reg[17]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[17]_i_2_n_0\,
      I1 => \axi_rdata_reg[17]_i_3_n_0\,
      O => reg_data_out(17),
      S => sel0(3)
    );
\axi_rdata_reg[17]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[17]_i_4_n_0\,
      I1 => \axi_rdata[17]_i_5_n_0\,
      O => \axi_rdata_reg[17]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[17]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[17]_i_6_n_0\,
      I1 => \axi_rdata[17]_i_7_n_0\,
      O => \axi_rdata_reg[17]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => SR(0)
    );
\axi_rdata_reg[18]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[18]_i_2_n_0\,
      I1 => \axi_rdata_reg[18]_i_3_n_0\,
      O => reg_data_out(18),
      S => sel0(3)
    );
\axi_rdata_reg[18]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[18]_i_4_n_0\,
      I1 => \axi_rdata[18]_i_5_n_0\,
      O => \axi_rdata_reg[18]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[18]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[18]_i_6_n_0\,
      I1 => \axi_rdata[18]_i_7_n_0\,
      O => \axi_rdata_reg[18]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => SR(0)
    );
\axi_rdata_reg[19]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[19]_i_2_n_0\,
      I1 => \axi_rdata_reg[19]_i_3_n_0\,
      O => reg_data_out(19),
      S => sel0(3)
    );
\axi_rdata_reg[19]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[19]_i_4_n_0\,
      I1 => \axi_rdata[19]_i_5_n_0\,
      O => \axi_rdata_reg[19]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[19]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[19]_i_6_n_0\,
      I1 => \axi_rdata[19]_i_7_n_0\,
      O => \axi_rdata_reg[19]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => SR(0)
    );
\axi_rdata_reg[1]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[1]_i_2_n_0\,
      I1 => \axi_rdata_reg[1]_i_3_n_0\,
      O => reg_data_out(1),
      S => sel0(3)
    );
\axi_rdata_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[1]_i_4_n_0\,
      I1 => \axi_rdata[1]_i_5_n_0\,
      O => \axi_rdata_reg[1]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[1]_i_6_n_0\,
      I1 => \axi_rdata[1]_i_7_n_0\,
      O => \axi_rdata_reg[1]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => SR(0)
    );
\axi_rdata_reg[20]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[20]_i_2_n_0\,
      I1 => \axi_rdata_reg[20]_i_3_n_0\,
      O => reg_data_out(20),
      S => sel0(3)
    );
\axi_rdata_reg[20]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[20]_i_4_n_0\,
      I1 => \axi_rdata[20]_i_5_n_0\,
      O => \axi_rdata_reg[20]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[20]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[20]_i_6_n_0\,
      I1 => \axi_rdata[20]_i_7_n_0\,
      O => \axi_rdata_reg[20]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => SR(0)
    );
\axi_rdata_reg[21]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[21]_i_2_n_0\,
      I1 => \axi_rdata_reg[21]_i_3_n_0\,
      O => reg_data_out(21),
      S => sel0(3)
    );
\axi_rdata_reg[21]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[21]_i_4_n_0\,
      I1 => \axi_rdata[21]_i_5_n_0\,
      O => \axi_rdata_reg[21]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[21]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[21]_i_6_n_0\,
      I1 => \axi_rdata[21]_i_7_n_0\,
      O => \axi_rdata_reg[21]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => SR(0)
    );
\axi_rdata_reg[22]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[22]_i_2_n_0\,
      I1 => \axi_rdata_reg[22]_i_3_n_0\,
      O => reg_data_out(22),
      S => sel0(3)
    );
\axi_rdata_reg[22]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[22]_i_4_n_0\,
      I1 => \axi_rdata[22]_i_5_n_0\,
      O => \axi_rdata_reg[22]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[22]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[22]_i_6_n_0\,
      I1 => \axi_rdata[22]_i_7_n_0\,
      O => \axi_rdata_reg[22]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => SR(0)
    );
\axi_rdata_reg[23]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[23]_i_2_n_0\,
      I1 => \axi_rdata_reg[23]_i_3_n_0\,
      O => reg_data_out(23),
      S => sel0(3)
    );
\axi_rdata_reg[23]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[23]_i_4_n_0\,
      I1 => \axi_rdata[23]_i_5_n_0\,
      O => \axi_rdata_reg[23]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[23]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[23]_i_6_n_0\,
      I1 => \axi_rdata[23]_i_7_n_0\,
      O => \axi_rdata_reg[23]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => SR(0)
    );
\axi_rdata_reg[24]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[24]_i_2_n_0\,
      I1 => \axi_rdata_reg[24]_i_3_n_0\,
      O => reg_data_out(24),
      S => sel0(3)
    );
\axi_rdata_reg[24]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[24]_i_4_n_0\,
      I1 => \axi_rdata[24]_i_5_n_0\,
      O => \axi_rdata_reg[24]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[24]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[24]_i_6_n_0\,
      I1 => \axi_rdata[24]_i_7_n_0\,
      O => \axi_rdata_reg[24]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => SR(0)
    );
\axi_rdata_reg[25]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[25]_i_2_n_0\,
      I1 => \axi_rdata_reg[25]_i_3_n_0\,
      O => reg_data_out(25),
      S => sel0(3)
    );
\axi_rdata_reg[25]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[25]_i_4_n_0\,
      I1 => \axi_rdata[25]_i_5_n_0\,
      O => \axi_rdata_reg[25]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[25]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[25]_i_6_n_0\,
      I1 => \axi_rdata[25]_i_7_n_0\,
      O => \axi_rdata_reg[25]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => SR(0)
    );
\axi_rdata_reg[26]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[26]_i_2_n_0\,
      I1 => \axi_rdata_reg[26]_i_3_n_0\,
      O => reg_data_out(26),
      S => sel0(3)
    );
\axi_rdata_reg[26]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[26]_i_4_n_0\,
      I1 => \axi_rdata[26]_i_5_n_0\,
      O => \axi_rdata_reg[26]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[26]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[26]_i_6_n_0\,
      I1 => \axi_rdata[26]_i_7_n_0\,
      O => \axi_rdata_reg[26]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => SR(0)
    );
\axi_rdata_reg[27]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[27]_i_2_n_0\,
      I1 => \axi_rdata_reg[27]_i_3_n_0\,
      O => reg_data_out(27),
      S => sel0(3)
    );
\axi_rdata_reg[27]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[27]_i_4_n_0\,
      I1 => \axi_rdata[27]_i_5_n_0\,
      O => \axi_rdata_reg[27]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[27]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[27]_i_6_n_0\,
      I1 => \axi_rdata[27]_i_7_n_0\,
      O => \axi_rdata_reg[27]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => SR(0)
    );
\axi_rdata_reg[28]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[28]_i_2_n_0\,
      I1 => \axi_rdata_reg[28]_i_3_n_0\,
      O => reg_data_out(28),
      S => sel0(3)
    );
\axi_rdata_reg[28]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[28]_i_4_n_0\,
      I1 => \axi_rdata[28]_i_5_n_0\,
      O => \axi_rdata_reg[28]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[28]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[28]_i_6_n_0\,
      I1 => \axi_rdata[28]_i_7_n_0\,
      O => \axi_rdata_reg[28]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => SR(0)
    );
\axi_rdata_reg[29]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[29]_i_2_n_0\,
      I1 => \axi_rdata_reg[29]_i_3_n_0\,
      O => reg_data_out(29),
      S => sel0(3)
    );
\axi_rdata_reg[29]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[29]_i_4_n_0\,
      I1 => \axi_rdata[29]_i_5_n_0\,
      O => \axi_rdata_reg[29]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[29]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[29]_i_6_n_0\,
      I1 => \axi_rdata[29]_i_7_n_0\,
      O => \axi_rdata_reg[29]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => SR(0)
    );
\axi_rdata_reg[2]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[2]_i_2_n_0\,
      I1 => \axi_rdata_reg[2]_i_3_n_0\,
      O => reg_data_out(2),
      S => sel0(3)
    );
\axi_rdata_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[2]_i_4_n_0\,
      I1 => \axi_rdata[2]_i_5_n_0\,
      O => \axi_rdata_reg[2]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[2]_i_6_n_0\,
      I1 => \axi_rdata[2]_i_7_n_0\,
      O => \axi_rdata_reg[2]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => SR(0)
    );
\axi_rdata_reg[30]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[30]_i_2_n_0\,
      I1 => \axi_rdata_reg[30]_i_3_n_0\,
      O => reg_data_out(30),
      S => sel0(3)
    );
\axi_rdata_reg[30]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[30]_i_4_n_0\,
      I1 => \axi_rdata[30]_i_5_n_0\,
      O => \axi_rdata_reg[30]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[30]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[30]_i_6_n_0\,
      I1 => \axi_rdata[30]_i_7_n_0\,
      O => \axi_rdata_reg[30]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => SR(0)
    );
\axi_rdata_reg[31]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[31]_i_2_n_0\,
      I1 => \axi_rdata_reg[31]_i_3_n_0\,
      O => reg_data_out(31),
      S => sel0(3)
    );
\axi_rdata_reg[31]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[31]_i_4_n_0\,
      I1 => \axi_rdata[31]_i_5_n_0\,
      O => \axi_rdata_reg[31]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[31]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[31]_i_6_n_0\,
      I1 => \axi_rdata[31]_i_7_n_0\,
      O => \axi_rdata_reg[31]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => SR(0)
    );
\axi_rdata_reg[3]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[3]_i_2_n_0\,
      I1 => \axi_rdata_reg[3]_i_3_n_0\,
      O => reg_data_out(3),
      S => sel0(3)
    );
\axi_rdata_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[3]_i_4_n_0\,
      I1 => \axi_rdata[3]_i_5_n_0\,
      O => \axi_rdata_reg[3]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[3]_i_6_n_0\,
      I1 => \axi_rdata[3]_i_7_n_0\,
      O => \axi_rdata_reg[3]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => SR(0)
    );
\axi_rdata_reg[4]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[4]_i_2_n_0\,
      I1 => \axi_rdata_reg[4]_i_3_n_0\,
      O => reg_data_out(4),
      S => sel0(3)
    );
\axi_rdata_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[4]_i_4_n_0\,
      I1 => \axi_rdata[4]_i_5_n_0\,
      O => \axi_rdata_reg[4]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[4]_i_6_n_0\,
      I1 => \axi_rdata[4]_i_7_n_0\,
      O => \axi_rdata_reg[4]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => SR(0)
    );
\axi_rdata_reg[5]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[5]_i_2_n_0\,
      I1 => \axi_rdata_reg[5]_i_3_n_0\,
      O => reg_data_out(5),
      S => sel0(3)
    );
\axi_rdata_reg[5]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[5]_i_4_n_0\,
      I1 => \axi_rdata[5]_i_5_n_0\,
      O => \axi_rdata_reg[5]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[5]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[5]_i_6_n_0\,
      I1 => \axi_rdata[5]_i_7_n_0\,
      O => \axi_rdata_reg[5]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => SR(0)
    );
\axi_rdata_reg[6]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[6]_i_2_n_0\,
      I1 => \axi_rdata_reg[6]_i_3_n_0\,
      O => reg_data_out(6),
      S => sel0(3)
    );
\axi_rdata_reg[6]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[6]_i_4_n_0\,
      I1 => \axi_rdata[6]_i_5_n_0\,
      O => \axi_rdata_reg[6]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[6]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[6]_i_6_n_0\,
      I1 => \axi_rdata[6]_i_7_n_0\,
      O => \axi_rdata_reg[6]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => SR(0)
    );
\axi_rdata_reg[7]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[7]_i_2_n_0\,
      I1 => \axi_rdata_reg[7]_i_3_n_0\,
      O => reg_data_out(7),
      S => sel0(3)
    );
\axi_rdata_reg[7]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[7]_i_4_n_0\,
      I1 => \axi_rdata[7]_i_5_n_0\,
      O => \axi_rdata_reg[7]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[7]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[7]_i_6_n_0\,
      I1 => \axi_rdata[7]_i_7_n_0\,
      O => \axi_rdata_reg[7]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => SR(0)
    );
\axi_rdata_reg[8]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[8]_i_2_n_0\,
      I1 => \axi_rdata_reg[8]_i_3_n_0\,
      O => reg_data_out(8),
      S => sel0(3)
    );
\axi_rdata_reg[8]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[8]_i_4_n_0\,
      I1 => \axi_rdata[8]_i_5_n_0\,
      O => \axi_rdata_reg[8]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[8]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[8]_i_6_n_0\,
      I1 => \axi_rdata[8]_i_7_n_0\,
      O => \axi_rdata_reg[8]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => SR(0)
    );
\axi_rdata_reg[9]_i_1\: unisim.vcomponents.MUXF8
     port map (
      I0 => \axi_rdata_reg[9]_i_2_n_0\,
      I1 => \axi_rdata_reg[9]_i_3_n_0\,
      O => reg_data_out(9),
      S => sel0(3)
    );
\axi_rdata_reg[9]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[9]_i_4_n_0\,
      I1 => \axi_rdata[9]_i_5_n_0\,
      O => \axi_rdata_reg[9]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[9]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[9]_i_6_n_0\,
      I1 => \axi_rdata[9]_i_7_n_0\,
      O => \axi_rdata_reg[9]_i_3_n_0\,
      S => sel0(2)
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_reg_0,
      Q => \^s00_axi_rvalid\,
      R => SR(0)
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_wready\,
      I3 => \^aw_en_reg_0\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => SR(0)
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(3),
      O => p_1_in(31)
    );
\slv_reg0[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => \^s_axi_awready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(0),
      O => p_1_in(7)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(0),
      Q => \^control_low_word\(0),
      R => SR(0)
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => \^control_low_word\(10),
      R => SR(0)
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => \^control_low_word\(11),
      R => SR(0)
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => \^control_low_word\(12),
      R => SR(0)
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => \^control_low_word\(13),
      R => SR(0)
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => \^control_low_word\(14),
      R => SR(0)
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => \^control_low_word\(15),
      R => SR(0)
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => \^control_low_word\(16),
      R => SR(0)
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => \^control_low_word\(17),
      R => SR(0)
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => \^control_low_word\(18),
      R => SR(0)
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => \^control_low_word\(19),
      R => SR(0)
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(1),
      Q => \^control_low_word\(1),
      R => SR(0)
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => \^control_low_word\(20),
      R => SR(0)
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => \^control_low_word\(21),
      R => SR(0)
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => \^control_low_word\(22),
      R => SR(0)
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => \^control_low_word\(23),
      R => SR(0)
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => \^control_low_word\(24),
      R => SR(0)
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => \^control_low_word\(25),
      R => SR(0)
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => \^control_low_word\(26),
      R => SR(0)
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => \^control_low_word\(27),
      R => SR(0)
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => \^control_low_word\(28),
      R => SR(0)
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => \^control_low_word\(29),
      R => SR(0)
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(2),
      Q => \^control_low_word\(2),
      R => SR(0)
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => \^control_low_word\(30),
      R => SR(0)
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => \^control_low_word\(31),
      R => SR(0)
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(3),
      Q => \^control_low_word\(3),
      R => SR(0)
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(4),
      Q => \^control_low_word\(4),
      R => SR(0)
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(5),
      Q => \^control_low_word\(5),
      R => SR(0)
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(6),
      Q => \^control_low_word\(6),
      R => SR(0)
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(7),
      Q => \^control_low_word\(7),
      R => SR(0)
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => \^control_low_word\(8),
      R => SR(0)
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => \^control_low_word\(9),
      R => SR(0)
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(0),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(0),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(0),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(0),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^control_high_word\(0),
      R => SR(0)
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^control_high_word\(10),
      R => SR(0)
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^control_high_word\(11),
      R => SR(0)
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^control_high_word\(12),
      R => SR(0)
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^control_high_word\(13),
      R => SR(0)
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^control_high_word\(14),
      R => SR(0)
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^control_high_word\(15),
      R => SR(0)
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \^control_high_word\(16),
      R => SR(0)
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \^control_high_word\(17),
      R => SR(0)
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \^control_high_word\(18),
      R => SR(0)
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \^control_high_word\(19),
      R => SR(0)
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^control_high_word\(1),
      R => SR(0)
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \^control_high_word\(20),
      R => SR(0)
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \^control_high_word\(21),
      R => SR(0)
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \^control_high_word\(22),
      R => SR(0)
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \^control_high_word\(23),
      R => SR(0)
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \^control_high_word\(24),
      R => SR(0)
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \^control_high_word\(25),
      R => SR(0)
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \^control_high_word\(26),
      R => SR(0)
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \^control_high_word\(27),
      R => SR(0)
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \^control_high_word\(28),
      R => SR(0)
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \^control_high_word\(29),
      R => SR(0)
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^control_high_word\(2),
      R => SR(0)
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \^control_high_word\(30),
      R => SR(0)
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \^control_high_word\(31),
      R => SR(0)
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^control_high_word\(3),
      R => SR(0)
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^control_high_word\(4),
      R => SR(0)
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^control_high_word\(5),
      R => SR(0)
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^control_high_word\(6),
      R => SR(0)
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^control_high_word\(7),
      R => SR(0)
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^control_high_word\(8),
      R => SR(0)
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^control_high_word\(9),
      R => SR(0)
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => p_0_in(1),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => p_0_in(1),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => p_0_in(1),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => p_0_in(1),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^dina_ext_low_word\(0),
      R => SR(0)
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^dina_ext_low_word\(10),
      R => SR(0)
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^dina_ext_low_word\(11),
      R => SR(0)
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^dina_ext_low_word\(12),
      R => SR(0)
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^dina_ext_low_word\(13),
      R => SR(0)
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^dina_ext_low_word\(14),
      R => SR(0)
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^dina_ext_low_word\(15),
      R => SR(0)
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \^dina_ext_low_word\(16),
      R => SR(0)
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \^dina_ext_low_word\(17),
      R => SR(0)
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \^dina_ext_low_word\(18),
      R => SR(0)
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \^dina_ext_low_word\(19),
      R => SR(0)
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^dina_ext_low_word\(1),
      R => SR(0)
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \^dina_ext_low_word\(20),
      R => SR(0)
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \^dina_ext_low_word\(21),
      R => SR(0)
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \^dina_ext_low_word\(22),
      R => SR(0)
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \^dina_ext_low_word\(23),
      R => SR(0)
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \^dina_ext_low_word\(24),
      R => SR(0)
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \^dina_ext_low_word\(25),
      R => SR(0)
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \^dina_ext_low_word\(26),
      R => SR(0)
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \^dina_ext_low_word\(27),
      R => SR(0)
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \^dina_ext_low_word\(28),
      R => SR(0)
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \^dina_ext_low_word\(29),
      R => SR(0)
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^dina_ext_low_word\(2),
      R => SR(0)
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \^dina_ext_low_word\(30),
      R => SR(0)
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \^dina_ext_low_word\(31),
      R => SR(0)
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^dina_ext_low_word\(3),
      R => SR(0)
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^dina_ext_low_word\(4),
      R => SR(0)
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^dina_ext_low_word\(5),
      R => SR(0)
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^dina_ext_low_word\(6),
      R => SR(0)
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^dina_ext_low_word\(7),
      R => SR(0)
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^dina_ext_low_word\(8),
      R => SR(0)
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^dina_ext_low_word\(9),
      R => SR(0)
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(3),
      O => \slv_reg3[15]_i_1_n_0\
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(3),
      O => \slv_reg3[23]_i_1_n_0\
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(3),
      O => \slv_reg3[31]_i_1_n_0\
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      I4 => p_0_in(2),
      I5 => p_0_in(3),
      O => \slv_reg3[7]_i_1_n_0\
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^dina_ext_high_word\(0),
      R => SR(0)
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^dina_ext_high_word\(10),
      R => SR(0)
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^dina_ext_high_word\(11),
      R => SR(0)
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^dina_ext_high_word\(12),
      R => SR(0)
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^dina_ext_high_word\(13),
      R => SR(0)
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^dina_ext_high_word\(14),
      R => SR(0)
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^dina_ext_high_word\(15),
      R => SR(0)
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \^dina_ext_high_word\(16),
      R => SR(0)
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \^dina_ext_high_word\(17),
      R => SR(0)
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \^dina_ext_high_word\(18),
      R => SR(0)
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \^dina_ext_high_word\(19),
      R => SR(0)
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^dina_ext_high_word\(1),
      R => SR(0)
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \^dina_ext_high_word\(20),
      R => SR(0)
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \^dina_ext_high_word\(21),
      R => SR(0)
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \^dina_ext_high_word\(22),
      R => SR(0)
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \^dina_ext_high_word\(23),
      R => SR(0)
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \^dina_ext_high_word\(24),
      R => SR(0)
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \^dina_ext_high_word\(25),
      R => SR(0)
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \^dina_ext_high_word\(26),
      R => SR(0)
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \^dina_ext_high_word\(27),
      R => SR(0)
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \^dina_ext_high_word\(28),
      R => SR(0)
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \^dina_ext_high_word\(29),
      R => SR(0)
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^dina_ext_high_word\(2),
      R => SR(0)
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \^dina_ext_high_word\(30),
      R => SR(0)
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \^dina_ext_high_word\(31),
      R => SR(0)
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^dina_ext_high_word\(3),
      R => SR(0)
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^dina_ext_high_word\(4),
      R => SR(0)
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^dina_ext_high_word\(5),
      R => SR(0)
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^dina_ext_high_word\(6),
      R => SR(0)
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^dina_ext_high_word\(7),
      R => SR(0)
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^dina_ext_high_word\(8),
      R => SR(0)
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^dina_ext_high_word\(9),
      R => SR(0)
    );
\slv_reg7[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg7[15]_i_1_n_0\
    );
\slv_reg7[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg7[23]_i_1_n_0\
    );
\slv_reg7[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg7[31]_i_1_n_0\
    );
\slv_reg7[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg7[7]_i_1_n_0\
    );
\slv_reg7_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^dina2_ext_word\(0),
      R => SR(0)
    );
\slv_reg7_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^dina2_ext_word\(10),
      R => SR(0)
    );
\slv_reg7_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^dina2_ext_word\(11),
      R => SR(0)
    );
\slv_reg7_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^dina2_ext_word\(12),
      R => SR(0)
    );
\slv_reg7_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^dina2_ext_word\(13),
      R => SR(0)
    );
\slv_reg7_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^dina2_ext_word\(14),
      R => SR(0)
    );
\slv_reg7_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^dina2_ext_word\(15),
      R => SR(0)
    );
\slv_reg7_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \^dina2_ext_word\(16),
      R => SR(0)
    );
\slv_reg7_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \^dina2_ext_word\(17),
      R => SR(0)
    );
\slv_reg7_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \^dina2_ext_word\(18),
      R => SR(0)
    );
\slv_reg7_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \^dina2_ext_word\(19),
      R => SR(0)
    );
\slv_reg7_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^dina2_ext_word\(1),
      R => SR(0)
    );
\slv_reg7_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \^dina2_ext_word\(20),
      R => SR(0)
    );
\slv_reg7_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \^dina2_ext_word\(21),
      R => SR(0)
    );
\slv_reg7_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \^dina2_ext_word\(22),
      R => SR(0)
    );
\slv_reg7_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \^dina2_ext_word\(23),
      R => SR(0)
    );
\slv_reg7_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \^dina2_ext_word\(24),
      R => SR(0)
    );
\slv_reg7_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \^dina2_ext_word\(25),
      R => SR(0)
    );
\slv_reg7_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \^dina2_ext_word\(26),
      R => SR(0)
    );
\slv_reg7_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \^dina2_ext_word\(27),
      R => SR(0)
    );
\slv_reg7_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \^dina2_ext_word\(28),
      R => SR(0)
    );
\slv_reg7_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \^dina2_ext_word\(29),
      R => SR(0)
    );
\slv_reg7_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^dina2_ext_word\(2),
      R => SR(0)
    );
\slv_reg7_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \^dina2_ext_word\(30),
      R => SR(0)
    );
\slv_reg7_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \^dina2_ext_word\(31),
      R => SR(0)
    );
\slv_reg7_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^dina2_ext_word\(3),
      R => SR(0)
    );
\slv_reg7_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^dina2_ext_word\(4),
      R => SR(0)
    );
\slv_reg7_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^dina2_ext_word\(5),
      R => SR(0)
    );
\slv_reg7_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^dina2_ext_word\(6),
      R => SR(0)
    );
\slv_reg7_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^dina2_ext_word\(7),
      R => SR(0)
    );
\slv_reg7_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^dina2_ext_word\(8),
      R => SR(0)
    );
\slv_reg7_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg7[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^dina2_ext_word\(9),
      R => SR(0)
    );
\slv_reg8[0][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(1),
      O => \slv_reg8[0][15]_i_1_n_0\
    );
\slv_reg8[0][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(2),
      O => \slv_reg8[0][23]_i_1_n_0\
    );
\slv_reg8[0][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(3),
      O => \slv_reg8[0][31]_i_1_n_0\
    );
\slv_reg8[0][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      I4 => p_0_in(2),
      I5 => s00_axi_wstrb(0),
      O => \slv_reg8[0][7]_i_1_n_0\
    );
\slv_reg8[1][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(1),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[1][15]_i_1_n_0\
    );
\slv_reg8[1][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(2),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[1][23]_i_1_n_0\
    );
\slv_reg8[1][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(3),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[1][31]_i_1_n_0\
    );
\slv_reg8[1][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(0),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[1][7]_i_1_n_0\
    );
\slv_reg8[2][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => p_0_in(2),
      O => \slv_reg8[2][15]_i_1_n_0\
    );
\slv_reg8[2][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => p_0_in(2),
      O => \slv_reg8[2][23]_i_1_n_0\
    );
\slv_reg8[2][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => p_0_in(2),
      O => \slv_reg8[2][31]_i_1_n_0\
    );
\slv_reg8[2][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => p_0_in(2),
      O => \slv_reg8[2][7]_i_1_n_0\
    );
\slv_reg8[3][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[3][15]_i_1_n_0\
    );
\slv_reg8[3][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[3][23]_i_1_n_0\
    );
\slv_reg8[3][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[3][31]_i_1_n_0\
    );
\slv_reg8[3][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(2),
      O => \slv_reg8[3][7]_i_1_n_0\
    );
\slv_reg8[4][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(2),
      I4 => p_0_in(0),
      I5 => p_0_in(1),
      O => \slv_reg8[4][15]_i_1_n_0\
    );
\slv_reg8[4][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(2),
      I4 => p_0_in(0),
      I5 => p_0_in(1),
      O => \slv_reg8[4][23]_i_1_n_0\
    );
\slv_reg8[4][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(2),
      I4 => p_0_in(0),
      I5 => p_0_in(1),
      O => \slv_reg8[4][31]_i_1_n_0\
    );
\slv_reg8[4][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(3),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in(2),
      I4 => p_0_in(0),
      I5 => p_0_in(1),
      O => \slv_reg8[4][7]_i_1_n_0\
    );
\slv_reg8[5][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(1),
      I5 => p_0_in(1),
      O => \slv_reg8[5][15]_i_1_n_0\
    );
\slv_reg8[5][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(2),
      I5 => p_0_in(1),
      O => \slv_reg8[5][23]_i_1_n_0\
    );
\slv_reg8[5][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(3),
      I5 => p_0_in(1),
      O => \slv_reg8[5][31]_i_1_n_0\
    );
\slv_reg8[5][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      I4 => s00_axi_wstrb(0),
      I5 => p_0_in(1),
      O => \slv_reg8[5][7]_i_1_n_0\
    );
\slv_reg8[6][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => s00_axi_wstrb(1),
      I4 => p_0_in(1),
      I5 => p_0_in(0),
      O => \slv_reg8[6][15]_i_1_n_0\
    );
\slv_reg8[6][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => s00_axi_wstrb(2),
      I4 => p_0_in(1),
      I5 => p_0_in(0),
      O => \slv_reg8[6][23]_i_1_n_0\
    );
\slv_reg8[6][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => s00_axi_wstrb(3),
      I4 => p_0_in(1),
      I5 => p_0_in(0),
      O => \slv_reg8[6][31]_i_1_n_0\
    );
\slv_reg8[6][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => s00_axi_wstrb(0),
      I4 => p_0_in(1),
      I5 => p_0_in(0),
      O => \slv_reg8[6][7]_i_1_n_0\
    );
\slv_reg8[7][15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg8[7][15]_i_1_n_0\
    );
\slv_reg8[7][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg8[7][23]_i_1_n_0\
    );
\slv_reg8[7][31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg8[7][31]_i_1_n_0\
    );
\slv_reg8[7][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(2),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in(0),
      I4 => p_0_in(1),
      I5 => p_0_in(3),
      O => \slv_reg8[7][7]_i_1_n_0\
    );
\slv_reg8_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^dina3_ext_low_word\(0),
      R => SR(0)
    );
\slv_reg8_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^dina3_ext_low_word\(10),
      R => SR(0)
    );
\slv_reg8_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^dina3_ext_low_word\(11),
      R => SR(0)
    );
\slv_reg8_reg[0][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^dina3_ext_low_word\(12),
      R => SR(0)
    );
\slv_reg8_reg[0][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^dina3_ext_low_word\(13),
      R => SR(0)
    );
\slv_reg8_reg[0][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^dina3_ext_low_word\(14),
      R => SR(0)
    );
\slv_reg8_reg[0][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^dina3_ext_low_word\(15),
      R => SR(0)
    );
\slv_reg8_reg[0][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \^dina3_ext_low_word\(16),
      R => SR(0)
    );
\slv_reg8_reg[0][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \^dina3_ext_low_word\(17),
      R => SR(0)
    );
\slv_reg8_reg[0][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \^dina3_ext_low_word\(18),
      R => SR(0)
    );
\slv_reg8_reg[0][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \^dina3_ext_low_word\(19),
      R => SR(0)
    );
\slv_reg8_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^dina3_ext_low_word\(1),
      R => SR(0)
    );
\slv_reg8_reg[0][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \^dina3_ext_low_word\(20),
      R => SR(0)
    );
\slv_reg8_reg[0][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \^dina3_ext_low_word\(21),
      R => SR(0)
    );
\slv_reg8_reg[0][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \^dina3_ext_low_word\(22),
      R => SR(0)
    );
\slv_reg8_reg[0][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \^dina3_ext_low_word\(23),
      R => SR(0)
    );
\slv_reg8_reg[0][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \^dina3_ext_low_word\(24),
      R => SR(0)
    );
\slv_reg8_reg[0][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \^dina3_ext_low_word\(25),
      R => SR(0)
    );
\slv_reg8_reg[0][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \^dina3_ext_low_word\(26),
      R => SR(0)
    );
\slv_reg8_reg[0][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \^dina3_ext_low_word\(27),
      R => SR(0)
    );
\slv_reg8_reg[0][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \^dina3_ext_low_word\(28),
      R => SR(0)
    );
\slv_reg8_reg[0][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \^dina3_ext_low_word\(29),
      R => SR(0)
    );
\slv_reg8_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^dina3_ext_low_word\(2),
      R => SR(0)
    );
\slv_reg8_reg[0][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \^dina3_ext_low_word\(30),
      R => SR(0)
    );
\slv_reg8_reg[0][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \^dina3_ext_low_word\(31),
      R => SR(0)
    );
\slv_reg8_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^dina3_ext_low_word\(3),
      R => SR(0)
    );
\slv_reg8_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^dina3_ext_low_word\(4),
      R => SR(0)
    );
\slv_reg8_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^dina3_ext_low_word\(5),
      R => SR(0)
    );
\slv_reg8_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^dina3_ext_low_word\(6),
      R => SR(0)
    );
\slv_reg8_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^dina3_ext_low_word\(7),
      R => SR(0)
    );
\slv_reg8_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^dina3_ext_low_word\(8),
      R => SR(0)
    );
\slv_reg8_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[0][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^dina3_ext_low_word\(9),
      R => SR(0)
    );
\slv_reg8_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \^dina3_ext_high_word\(0),
      R => SR(0)
    );
\slv_reg8_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \^dina3_ext_high_word\(10),
      R => SR(0)
    );
\slv_reg8_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \^dina3_ext_high_word\(11),
      R => SR(0)
    );
\slv_reg8_reg[1][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \^dina3_ext_high_word\(12),
      R => SR(0)
    );
\slv_reg8_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \^dina3_ext_high_word\(13),
      R => SR(0)
    );
\slv_reg8_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \^dina3_ext_high_word\(14),
      R => SR(0)
    );
\slv_reg8_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \^dina3_ext_high_word\(15),
      R => SR(0)
    );
\slv_reg8_reg[1][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \^dina3_ext_high_word\(16),
      R => SR(0)
    );
\slv_reg8_reg[1][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \^dina3_ext_high_word\(17),
      R => SR(0)
    );
\slv_reg8_reg[1][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \^dina3_ext_high_word\(18),
      R => SR(0)
    );
\slv_reg8_reg[1][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \^dina3_ext_high_word\(19),
      R => SR(0)
    );
\slv_reg8_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \^dina3_ext_high_word\(1),
      R => SR(0)
    );
\slv_reg8_reg[1][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \^dina3_ext_high_word\(20),
      R => SR(0)
    );
\slv_reg8_reg[1][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \^dina3_ext_high_word\(21),
      R => SR(0)
    );
\slv_reg8_reg[1][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \^dina3_ext_high_word\(22),
      R => SR(0)
    );
\slv_reg8_reg[1][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \^dina3_ext_high_word\(23),
      R => SR(0)
    );
\slv_reg8_reg[1][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \^dina3_ext_high_word\(24),
      R => SR(0)
    );
\slv_reg8_reg[1][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \^dina3_ext_high_word\(25),
      R => SR(0)
    );
\slv_reg8_reg[1][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \^dina3_ext_high_word\(26),
      R => SR(0)
    );
\slv_reg8_reg[1][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \^dina3_ext_high_word\(27),
      R => SR(0)
    );
\slv_reg8_reg[1][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \^dina3_ext_high_word\(28),
      R => SR(0)
    );
\slv_reg8_reg[1][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \^dina3_ext_high_word\(29),
      R => SR(0)
    );
\slv_reg8_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \^dina3_ext_high_word\(2),
      R => SR(0)
    );
\slv_reg8_reg[1][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \^dina3_ext_high_word\(30),
      R => SR(0)
    );
\slv_reg8_reg[1][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \^dina3_ext_high_word\(31),
      R => SR(0)
    );
\slv_reg8_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \^dina3_ext_high_word\(3),
      R => SR(0)
    );
\slv_reg8_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \^dina3_ext_high_word\(4),
      R => SR(0)
    );
\slv_reg8_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \^dina3_ext_high_word\(5),
      R => SR(0)
    );
\slv_reg8_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \^dina3_ext_high_word\(6),
      R => SR(0)
    );
\slv_reg8_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \^dina3_ext_high_word\(7),
      R => SR(0)
    );
\slv_reg8_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \^dina3_ext_high_word\(8),
      R => SR(0)
    );
\slv_reg8_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[1][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \^dina3_ext_high_word\(9),
      R => SR(0)
    );
\slv_reg8_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg8_reg[2]_0\(0),
      R => SR(0)
    );
\slv_reg8_reg[2][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg8_reg[2]_0\(10),
      R => SR(0)
    );
\slv_reg8_reg[2][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg8_reg[2]_0\(11),
      R => SR(0)
    );
\slv_reg8_reg[2][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg8_reg[2]_0\(12),
      R => SR(0)
    );
\slv_reg8_reg[2][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg8_reg[2]_0\(13),
      R => SR(0)
    );
\slv_reg8_reg[2][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg8_reg[2]_0\(14),
      R => SR(0)
    );
\slv_reg8_reg[2][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg8_reg[2]_0\(15),
      R => SR(0)
    );
\slv_reg8_reg[2][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg8_reg[2]_0\(16),
      R => SR(0)
    );
\slv_reg8_reg[2][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg8_reg[2]_0\(17),
      R => SR(0)
    );
\slv_reg8_reg[2][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg8_reg[2]_0\(18),
      R => SR(0)
    );
\slv_reg8_reg[2][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg8_reg[2]_0\(19),
      R => SR(0)
    );
\slv_reg8_reg[2][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg8_reg[2]_0\(1),
      R => SR(0)
    );
\slv_reg8_reg[2][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg8_reg[2]_0\(20),
      R => SR(0)
    );
\slv_reg8_reg[2][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg8_reg[2]_0\(21),
      R => SR(0)
    );
\slv_reg8_reg[2][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg8_reg[2]_0\(22),
      R => SR(0)
    );
\slv_reg8_reg[2][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg8_reg[2]_0\(23),
      R => SR(0)
    );
\slv_reg8_reg[2][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg8_reg[2]_0\(24),
      R => SR(0)
    );
\slv_reg8_reg[2][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg8_reg[2]_0\(25),
      R => SR(0)
    );
\slv_reg8_reg[2][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg8_reg[2]_0\(26),
      R => SR(0)
    );
\slv_reg8_reg[2][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg8_reg[2]_0\(27),
      R => SR(0)
    );
\slv_reg8_reg[2][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg8_reg[2]_0\(28),
      R => SR(0)
    );
\slv_reg8_reg[2][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg8_reg[2]_0\(29),
      R => SR(0)
    );
\slv_reg8_reg[2][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg8_reg[2]_0\(2),
      R => SR(0)
    );
\slv_reg8_reg[2][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg8_reg[2]_0\(30),
      R => SR(0)
    );
\slv_reg8_reg[2][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg8_reg[2]_0\(31),
      R => SR(0)
    );
\slv_reg8_reg[2][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg8_reg[2]_0\(3),
      R => SR(0)
    );
\slv_reg8_reg[2][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg8_reg[2]_0\(4),
      R => SR(0)
    );
\slv_reg8_reg[2][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg8_reg[2]_0\(5),
      R => SR(0)
    );
\slv_reg8_reg[2][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg8_reg[2]_0\(6),
      R => SR(0)
    );
\slv_reg8_reg[2][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg8_reg[2]_0\(7),
      R => SR(0)
    );
\slv_reg8_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg8_reg[2]_0\(8),
      R => SR(0)
    );
\slv_reg8_reg[2][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[2][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg8_reg[2]_0\(9),
      R => SR(0)
    );
\slv_reg8_reg[3][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg8_reg[3]_1\(0),
      R => SR(0)
    );
\slv_reg8_reg[3][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg8_reg[3]_1\(10),
      R => SR(0)
    );
\slv_reg8_reg[3][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg8_reg[3]_1\(11),
      R => SR(0)
    );
\slv_reg8_reg[3][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg8_reg[3]_1\(12),
      R => SR(0)
    );
\slv_reg8_reg[3][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg8_reg[3]_1\(13),
      R => SR(0)
    );
\slv_reg8_reg[3][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg8_reg[3]_1\(14),
      R => SR(0)
    );
\slv_reg8_reg[3][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg8_reg[3]_1\(15),
      R => SR(0)
    );
\slv_reg8_reg[3][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg8_reg[3]_1\(16),
      R => SR(0)
    );
\slv_reg8_reg[3][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg8_reg[3]_1\(17),
      R => SR(0)
    );
\slv_reg8_reg[3][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg8_reg[3]_1\(18),
      R => SR(0)
    );
\slv_reg8_reg[3][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg8_reg[3]_1\(19),
      R => SR(0)
    );
\slv_reg8_reg[3][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg8_reg[3]_1\(1),
      R => SR(0)
    );
\slv_reg8_reg[3][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg8_reg[3]_1\(20),
      R => SR(0)
    );
\slv_reg8_reg[3][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg8_reg[3]_1\(21),
      R => SR(0)
    );
\slv_reg8_reg[3][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg8_reg[3]_1\(22),
      R => SR(0)
    );
\slv_reg8_reg[3][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg8_reg[3]_1\(23),
      R => SR(0)
    );
\slv_reg8_reg[3][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg8_reg[3]_1\(24),
      R => SR(0)
    );
\slv_reg8_reg[3][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg8_reg[3]_1\(25),
      R => SR(0)
    );
\slv_reg8_reg[3][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg8_reg[3]_1\(26),
      R => SR(0)
    );
\slv_reg8_reg[3][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg8_reg[3]_1\(27),
      R => SR(0)
    );
\slv_reg8_reg[3][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg8_reg[3]_1\(28),
      R => SR(0)
    );
\slv_reg8_reg[3][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg8_reg[3]_1\(29),
      R => SR(0)
    );
\slv_reg8_reg[3][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg8_reg[3]_1\(2),
      R => SR(0)
    );
\slv_reg8_reg[3][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg8_reg[3]_1\(30),
      R => SR(0)
    );
\slv_reg8_reg[3][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg8_reg[3]_1\(31),
      R => SR(0)
    );
\slv_reg8_reg[3][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg8_reg[3]_1\(3),
      R => SR(0)
    );
\slv_reg8_reg[3][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg8_reg[3]_1\(4),
      R => SR(0)
    );
\slv_reg8_reg[3][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg8_reg[3]_1\(5),
      R => SR(0)
    );
\slv_reg8_reg[3][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg8_reg[3]_1\(6),
      R => SR(0)
    );
\slv_reg8_reg[3][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg8_reg[3]_1\(7),
      R => SR(0)
    );
\slv_reg8_reg[3][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg8_reg[3]_1\(8),
      R => SR(0)
    );
\slv_reg8_reg[3][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[3][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg8_reg[3]_1\(9),
      R => SR(0)
    );
\slv_reg8_reg[4][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg8_reg[4]_2\(0),
      R => SR(0)
    );
\slv_reg8_reg[4][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg8_reg[4]_2\(10),
      R => SR(0)
    );
\slv_reg8_reg[4][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg8_reg[4]_2\(11),
      R => SR(0)
    );
\slv_reg8_reg[4][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg8_reg[4]_2\(12),
      R => SR(0)
    );
\slv_reg8_reg[4][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg8_reg[4]_2\(13),
      R => SR(0)
    );
\slv_reg8_reg[4][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg8_reg[4]_2\(14),
      R => SR(0)
    );
\slv_reg8_reg[4][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg8_reg[4]_2\(15),
      R => SR(0)
    );
\slv_reg8_reg[4][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg8_reg[4]_2\(16),
      R => SR(0)
    );
\slv_reg8_reg[4][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg8_reg[4]_2\(17),
      R => SR(0)
    );
\slv_reg8_reg[4][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg8_reg[4]_2\(18),
      R => SR(0)
    );
\slv_reg8_reg[4][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg8_reg[4]_2\(19),
      R => SR(0)
    );
\slv_reg8_reg[4][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg8_reg[4]_2\(1),
      R => SR(0)
    );
\slv_reg8_reg[4][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg8_reg[4]_2\(20),
      R => SR(0)
    );
\slv_reg8_reg[4][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg8_reg[4]_2\(21),
      R => SR(0)
    );
\slv_reg8_reg[4][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg8_reg[4]_2\(22),
      R => SR(0)
    );
\slv_reg8_reg[4][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg8_reg[4]_2\(23),
      R => SR(0)
    );
\slv_reg8_reg[4][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg8_reg[4]_2\(24),
      R => SR(0)
    );
\slv_reg8_reg[4][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg8_reg[4]_2\(25),
      R => SR(0)
    );
\slv_reg8_reg[4][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg8_reg[4]_2\(26),
      R => SR(0)
    );
\slv_reg8_reg[4][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg8_reg[4]_2\(27),
      R => SR(0)
    );
\slv_reg8_reg[4][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg8_reg[4]_2\(28),
      R => SR(0)
    );
\slv_reg8_reg[4][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg8_reg[4]_2\(29),
      R => SR(0)
    );
\slv_reg8_reg[4][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg8_reg[4]_2\(2),
      R => SR(0)
    );
\slv_reg8_reg[4][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg8_reg[4]_2\(30),
      R => SR(0)
    );
\slv_reg8_reg[4][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg8_reg[4]_2\(31),
      R => SR(0)
    );
\slv_reg8_reg[4][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg8_reg[4]_2\(3),
      R => SR(0)
    );
\slv_reg8_reg[4][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg8_reg[4]_2\(4),
      R => SR(0)
    );
\slv_reg8_reg[4][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg8_reg[4]_2\(5),
      R => SR(0)
    );
\slv_reg8_reg[4][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg8_reg[4]_2\(6),
      R => SR(0)
    );
\slv_reg8_reg[4][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg8_reg[4]_2\(7),
      R => SR(0)
    );
\slv_reg8_reg[4][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg8_reg[4]_2\(8),
      R => SR(0)
    );
\slv_reg8_reg[4][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[4][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg8_reg[4]_2\(9),
      R => SR(0)
    );
\slv_reg8_reg[5][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg8_reg[5]_3\(0),
      R => SR(0)
    );
\slv_reg8_reg[5][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg8_reg[5]_3\(10),
      R => SR(0)
    );
\slv_reg8_reg[5][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg8_reg[5]_3\(11),
      R => SR(0)
    );
\slv_reg8_reg[5][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg8_reg[5]_3\(12),
      R => SR(0)
    );
\slv_reg8_reg[5][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg8_reg[5]_3\(13),
      R => SR(0)
    );
\slv_reg8_reg[5][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg8_reg[5]_3\(14),
      R => SR(0)
    );
\slv_reg8_reg[5][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg8_reg[5]_3\(15),
      R => SR(0)
    );
\slv_reg8_reg[5][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg8_reg[5]_3\(16),
      R => SR(0)
    );
\slv_reg8_reg[5][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg8_reg[5]_3\(17),
      R => SR(0)
    );
\slv_reg8_reg[5][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg8_reg[5]_3\(18),
      R => SR(0)
    );
\slv_reg8_reg[5][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg8_reg[5]_3\(19),
      R => SR(0)
    );
\slv_reg8_reg[5][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg8_reg[5]_3\(1),
      R => SR(0)
    );
\slv_reg8_reg[5][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg8_reg[5]_3\(20),
      R => SR(0)
    );
\slv_reg8_reg[5][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg8_reg[5]_3\(21),
      R => SR(0)
    );
\slv_reg8_reg[5][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg8_reg[5]_3\(22),
      R => SR(0)
    );
\slv_reg8_reg[5][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg8_reg[5]_3\(23),
      R => SR(0)
    );
\slv_reg8_reg[5][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg8_reg[5]_3\(24),
      R => SR(0)
    );
\slv_reg8_reg[5][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg8_reg[5]_3\(25),
      R => SR(0)
    );
\slv_reg8_reg[5][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg8_reg[5]_3\(26),
      R => SR(0)
    );
\slv_reg8_reg[5][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg8_reg[5]_3\(27),
      R => SR(0)
    );
\slv_reg8_reg[5][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg8_reg[5]_3\(28),
      R => SR(0)
    );
\slv_reg8_reg[5][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg8_reg[5]_3\(29),
      R => SR(0)
    );
\slv_reg8_reg[5][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg8_reg[5]_3\(2),
      R => SR(0)
    );
\slv_reg8_reg[5][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg8_reg[5]_3\(30),
      R => SR(0)
    );
\slv_reg8_reg[5][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg8_reg[5]_3\(31),
      R => SR(0)
    );
\slv_reg8_reg[5][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg8_reg[5]_3\(3),
      R => SR(0)
    );
\slv_reg8_reg[5][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg8_reg[5]_3\(4),
      R => SR(0)
    );
\slv_reg8_reg[5][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg8_reg[5]_3\(5),
      R => SR(0)
    );
\slv_reg8_reg[5][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg8_reg[5]_3\(6),
      R => SR(0)
    );
\slv_reg8_reg[5][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg8_reg[5]_3\(7),
      R => SR(0)
    );
\slv_reg8_reg[5][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg8_reg[5]_3\(8),
      R => SR(0)
    );
\slv_reg8_reg[5][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[5][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg8_reg[5]_3\(9),
      R => SR(0)
    );
\slv_reg8_reg[6][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg8_reg[6]_4\(0),
      R => SR(0)
    );
\slv_reg8_reg[6][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg8_reg[6]_4\(10),
      R => SR(0)
    );
\slv_reg8_reg[6][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg8_reg[6]_4\(11),
      R => SR(0)
    );
\slv_reg8_reg[6][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg8_reg[6]_4\(12),
      R => SR(0)
    );
\slv_reg8_reg[6][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg8_reg[6]_4\(13),
      R => SR(0)
    );
\slv_reg8_reg[6][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg8_reg[6]_4\(14),
      R => SR(0)
    );
\slv_reg8_reg[6][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg8_reg[6]_4\(15),
      R => SR(0)
    );
\slv_reg8_reg[6][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg8_reg[6]_4\(16),
      R => SR(0)
    );
\slv_reg8_reg[6][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg8_reg[6]_4\(17),
      R => SR(0)
    );
\slv_reg8_reg[6][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg8_reg[6]_4\(18),
      R => SR(0)
    );
\slv_reg8_reg[6][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg8_reg[6]_4\(19),
      R => SR(0)
    );
\slv_reg8_reg[6][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg8_reg[6]_4\(1),
      R => SR(0)
    );
\slv_reg8_reg[6][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg8_reg[6]_4\(20),
      R => SR(0)
    );
\slv_reg8_reg[6][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg8_reg[6]_4\(21),
      R => SR(0)
    );
\slv_reg8_reg[6][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg8_reg[6]_4\(22),
      R => SR(0)
    );
\slv_reg8_reg[6][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg8_reg[6]_4\(23),
      R => SR(0)
    );
\slv_reg8_reg[6][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg8_reg[6]_4\(24),
      R => SR(0)
    );
\slv_reg8_reg[6][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg8_reg[6]_4\(25),
      R => SR(0)
    );
\slv_reg8_reg[6][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg8_reg[6]_4\(26),
      R => SR(0)
    );
\slv_reg8_reg[6][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg8_reg[6]_4\(27),
      R => SR(0)
    );
\slv_reg8_reg[6][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg8_reg[6]_4\(28),
      R => SR(0)
    );
\slv_reg8_reg[6][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg8_reg[6]_4\(29),
      R => SR(0)
    );
\slv_reg8_reg[6][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg8_reg[6]_4\(2),
      R => SR(0)
    );
\slv_reg8_reg[6][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg8_reg[6]_4\(30),
      R => SR(0)
    );
\slv_reg8_reg[6][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg8_reg[6]_4\(31),
      R => SR(0)
    );
\slv_reg8_reg[6][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg8_reg[6]_4\(3),
      R => SR(0)
    );
\slv_reg8_reg[6][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg8_reg[6]_4\(4),
      R => SR(0)
    );
\slv_reg8_reg[6][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg8_reg[6]_4\(5),
      R => SR(0)
    );
\slv_reg8_reg[6][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg8_reg[6]_4\(6),
      R => SR(0)
    );
\slv_reg8_reg[6][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg8_reg[6]_4\(7),
      R => SR(0)
    );
\slv_reg8_reg[6][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg8_reg[6]_4\(8),
      R => SR(0)
    );
\slv_reg8_reg[6][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[6][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg8_reg[6]_4\(9),
      R => SR(0)
    );
\slv_reg8_reg[7][0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg8_reg[7]_5\(0),
      R => SR(0)
    );
\slv_reg8_reg[7][10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg8_reg[7]_5\(10),
      R => SR(0)
    );
\slv_reg8_reg[7][11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg8_reg[7]_5\(11),
      R => SR(0)
    );
\slv_reg8_reg[7][12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg8_reg[7]_5\(12),
      R => SR(0)
    );
\slv_reg8_reg[7][13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg8_reg[7]_5\(13),
      R => SR(0)
    );
\slv_reg8_reg[7][14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg8_reg[7]_5\(14),
      R => SR(0)
    );
\slv_reg8_reg[7][15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg8_reg[7]_5\(15),
      R => SR(0)
    );
\slv_reg8_reg[7][16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg8_reg[7]_5\(16),
      R => SR(0)
    );
\slv_reg8_reg[7][17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg8_reg[7]_5\(17),
      R => SR(0)
    );
\slv_reg8_reg[7][18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg8_reg[7]_5\(18),
      R => SR(0)
    );
\slv_reg8_reg[7][19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg8_reg[7]_5\(19),
      R => SR(0)
    );
\slv_reg8_reg[7][1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg8_reg[7]_5\(1),
      R => SR(0)
    );
\slv_reg8_reg[7][20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg8_reg[7]_5\(20),
      R => SR(0)
    );
\slv_reg8_reg[7][21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg8_reg[7]_5\(21),
      R => SR(0)
    );
\slv_reg8_reg[7][22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg8_reg[7]_5\(22),
      R => SR(0)
    );
\slv_reg8_reg[7][23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg8_reg[7]_5\(23),
      R => SR(0)
    );
\slv_reg8_reg[7][24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg8_reg[7]_5\(24),
      R => SR(0)
    );
\slv_reg8_reg[7][25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg8_reg[7]_5\(25),
      R => SR(0)
    );
\slv_reg8_reg[7][26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg8_reg[7]_5\(26),
      R => SR(0)
    );
\slv_reg8_reg[7][27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg8_reg[7]_5\(27),
      R => SR(0)
    );
\slv_reg8_reg[7][28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg8_reg[7]_5\(28),
      R => SR(0)
    );
\slv_reg8_reg[7][29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg8_reg[7]_5\(29),
      R => SR(0)
    );
\slv_reg8_reg[7][2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg8_reg[7]_5\(2),
      R => SR(0)
    );
\slv_reg8_reg[7][30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg8_reg[7]_5\(30),
      R => SR(0)
    );
\slv_reg8_reg[7][31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg8_reg[7]_5\(31),
      R => SR(0)
    );
\slv_reg8_reg[7][3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg8_reg[7]_5\(3),
      R => SR(0)
    );
\slv_reg8_reg[7][4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg8_reg[7]_5\(4),
      R => SR(0)
    );
\slv_reg8_reg[7][5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg8_reg[7]_5\(5),
      R => SR(0)
    );
\slv_reg8_reg[7][6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg8_reg[7]_5\(6),
      R => SR(0)
    );
\slv_reg8_reg[7][7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg8_reg[7]_5\(7),
      R => SR(0)
    );
\slv_reg8_reg[7][8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg8_reg[7]_5\(8),
      R => SR(0)
    );
\slv_reg8_reg[7][9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg8[7][15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg8_reg[7]_5\(9),
      R => SR(0)
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s_axi_arready\,
      O => \slv_reg_rden__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXISlave8Ports is
  port (
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    control_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    control_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina_ext_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina_ext_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina2_ext_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina3_ext_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina3_ext_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    status : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dout_ext_high_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dout_ext_low_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXISlave8Ports;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXISlave8Ports is
  signal AXI_Slave8Ports_new_v1_0_S00_AXI_inst_n_4 : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
begin
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
AXI_Slave8Ports_new_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXI_Slave8Ports_new_v1_0_S00_AXI
     port map (
      SR(0) => \slv_reg0[31]_i_1_n_0\,
      S_AXI_ARREADY => \^s_axi_arready\,
      S_AXI_AWREADY => \^s_axi_awready\,
      S_AXI_WREADY => \^s_axi_wready\,
      aw_en_reg_0 => AXI_Slave8Ports_new_v1_0_S00_AXI_inst_n_4,
      aw_en_reg_1 => aw_en_i_1_n_0,
      axi_bvalid_reg_0 => axi_bvalid_i_1_n_0,
      axi_rvalid_reg_0 => axi_rvalid_i_1_n_0,
      control_high_word(31 downto 0) => control_high_word(31 downto 0),
      control_low_word(31 downto 0) => control_low_word(31 downto 0),
      dina2_ext_word(31 downto 0) => dina2_ext_word(31 downto 0),
      dina3_ext_high_word(31 downto 0) => dina3_ext_high_word(31 downto 0),
      dina3_ext_low_word(31 downto 0) => dina3_ext_low_word(31 downto 0),
      dina_ext_high_word(31 downto 0) => dina_ext_high_word(31 downto 0),
      dina_ext_low_word(31 downto 0) => dina_ext_low_word(31 downto 0),
      dout_ext_high_word(31 downto 0) => dout_ext_high_word(31 downto 0),
      dout_ext_low_word(31 downto 0) => dout_ext_low_word(31 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(3 downto 0),
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(3 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bvalid => \^s00_axi_bvalid\,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rvalid => \^s00_axi_rvalid\,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      status(31 downto 0) => status(31 downto 0)
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => AXI_Slave8Ports_new_v1_0_S00_AXI_inst_n_4,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => \^s_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \slv_reg0[31]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    control_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    control_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina_ext_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina_ext_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina2_ext_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina3_ext_low_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dina3_ext_high_word : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dout_ext_low_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dout_ext_high_word : in STD_LOGIC_VECTOR ( 31 downto 0 );
    status : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "OpenNTT_BD_AXISlave8Ports_1_0,AXISlave8Ports,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "AXISlave8Ports,Vivado 2022.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN OpenNTT_BD_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN OpenNTT_BD_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
begin
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXISlave8Ports
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      S_AXI_WREADY => s00_axi_wready,
      control_high_word(31 downto 0) => control_high_word(31 downto 0),
      control_low_word(31 downto 0) => control_low_word(31 downto 0),
      dina2_ext_word(31 downto 0) => dina2_ext_word(31 downto 0),
      dina3_ext_high_word(31 downto 0) => dina3_ext_high_word(31 downto 0),
      dina3_ext_low_word(31 downto 0) => dina3_ext_low_word(31 downto 0),
      dina_ext_high_word(31 downto 0) => dina_ext_high_word(31 downto 0),
      dina_ext_low_word(31 downto 0) => dina_ext_low_word(31 downto 0),
      dout_ext_high_word(31 downto 0) => dout_ext_high_word(31 downto 0),
      dout_ext_low_word(31 downto 0) => dout_ext_low_word(31 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(5 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(5 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      status(31 downto 0) => status(31 downto 0)
    );
end STRUCTURE;
