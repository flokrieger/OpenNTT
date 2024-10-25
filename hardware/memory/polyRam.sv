/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// RAM module wrapper to instantiate two-banked RAM to feed one butterfly

module PolyRAM # (
    parameter MEM_WIDTH = 0,     
    parameter MEM_DEPTH = 0, // in log2
    parameter READ_LATENCY = 0, // at least 1 (use xpm if it is more than 2)
    parameter OUTPUT_REG = 0, // 0: no output register, 1: output register using DFFs
    parameter MEM_TYPE = "" // options: "xpm_auto", "xpm_block", "xpm_distributed", "xpm_mixed", "xpm_ultra",  
                            //          "fpga_block", "fpga_ultra", "fpga_distributed", "fpga_registers", "" (i.e., sim), "custom" (i.e., asic)
) (   
    input                  clk,
    input                  rst,
    input                  io_bank0_wen,
    input                  io_bank1_wen,
    input  [MEM_DEPTH-1:0] io_waddr,
    input  [MEM_DEPTH-1:0] io_raddr,
    input  [MEM_WIDTH-1:0] io_wdata,

    input                  core_wen,
    input  [MEM_DEPTH-1:0] core_waddr,
    input  [MEM_DEPTH-1:0] core_raddr,
    input  [MEM_WIDTH-1:0] wdata_bank0,
    input  [MEM_WIDTH-1:0] wdata_bank1,
    
    output [MEM_WIDTH-1:0] rdata_bank0,
    output [MEM_WIDTH-1:0] rdata_bank1
);

ram # (
  .MEM_WIDTH(MEM_WIDTH),     
  .MEM_DEPTH(MEM_DEPTH),
  .READ_LATENCY(READ_LATENCY),
  .OUTPUT_REG(OUTPUT_REG),
  .MEM_TYPE(MEM_TYPE)
  ) ram_bank0 (   
    .clk(clk),
    .wen(  rst ? io_bank0_wen : core_wen),
    .waddr(rst ? io_waddr     : core_waddr),
    .din(  rst ? io_wdata     : wdata_bank0),
    .raddr(rst ? io_raddr     : core_raddr),
    .dout( rdata_bank0)
);
ram # (
  .MEM_WIDTH(MEM_WIDTH),     
  .MEM_DEPTH(MEM_DEPTH),
  .READ_LATENCY(READ_LATENCY),
  .OUTPUT_REG(OUTPUT_REG),
  .MEM_TYPE(MEM_TYPE)
  ) ram_bank1 (   
    .clk(clk),
    .wen(  rst ? io_bank1_wen : core_wen),
    .waddr(rst ? io_waddr     : core_waddr),
    .din(  rst ? io_wdata     : wdata_bank1),
    .raddr(rst ? io_raddr     : core_raddr),
    .dout( rdata_bank1)
);

endmodule
