#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2022.2/bin
else
  PATH=/tools/Xilinx/Vitis/2022.2/bin:/tools/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/fkrieger/Desktop/openNTT/vivado/vivado.runs/OpenNTT_BD_axi_bram_ctrl_0_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log OpenNTT_BD_axi_bram_ctrl_0_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source OpenNTT_BD_axi_bram_ctrl_0_0.tcl