/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// parametric RAM module

`default_nettype wire

module ram # (
    parameter MEM_WIDTH = 0,     
    parameter MEM_DEPTH = 0, // in log2
    parameter READ_LATENCY = 0, // at least 1 (use xpm if it is more than 2)
    parameter OUTPUT_REG = 0, // 0: no output register, 1: output register using DFFs
    parameter MEM_TYPE = "" // options: "xpm_auto", "xpm_block", "xpm_distributed", "xpm_mixed", "xpm_ultra",  
                            //          "fpga_block", "fpga_ultra", "fpga_distributed", "fpga_registers", "" (i.e., sim), "custom" (i.e., asic)
) (   
    input                  clk,
    input                  wen,
    input  [MEM_DEPTH-1:0] waddr,
    input  [MEM_WIDTH-1:0] din,
    input  [MEM_DEPTH-1:0] raddr,
    output [MEM_WIDTH-1:0] dout
);

if (MEM_TYPE == "asic") begin
    my_custom_ram (clk,wen,waddr,din,raddr,dout); // CHANGE MODULE NAME/INTERFACE
end
else if ((MEM_TYPE == "xpm_auto") || (MEM_TYPE == "xpm_block") || (MEM_TYPE == "xpm_distributed") || (MEM_TYPE == "xpm_mixed") || (MEM_TYPE == "xpm_ultra")) begin
    wire[MEM_WIDTH-1:0] dout_ram;
    reg [MEM_WIDTH-1:0] dout_ram_reg;
    
    localparam XPM_MEM_TYPE = (MEM_TYPE == "xpm_block") ? "block" : 
                              (MEM_TYPE == "xpm_ultra") ? "ultra" : 
                              (MEM_TYPE == "xpm_distributed") ? "distributed" : 
                              (MEM_TYPE == "xpm_mixed") ? "mixed" : "auto";

    // https://docs.xilinx.com/r/en-US/ug974-vivado-ultrascale-libraries/XPM_MEMORY_SDPRAM 
    // xpm_memory_sdpram: Simple Dual Port RAM
    // Xilinx Parameterized Macro, version 2023.1
    xpm_memory_sdpram #(
    .ADDR_WIDTH_A(MEM_DEPTH),              // DECIMAL
    .ADDR_WIDTH_B(MEM_DEPTH),              // DECIMAL
    .BYTE_WRITE_WIDTH_A(MEM_WIDTH),        // DECIMAL
    .MEMORY_PRIMITIVE(XPM_MEM_TYPE),       // String
    .MEMORY_SIZE(MEM_WIDTH*(1<<MEM_DEPTH)),// DECIMAL
    .READ_DATA_WIDTH_B(MEM_WIDTH),         // DECIMAL
    .READ_LATENCY_B(READ_LATENCY),         // DECIMAL
    .WRITE_DATA_WIDTH_A(MEM_WIDTH)         // DECIMAL
    )
    xpm_memory_sdpram_inst (
    .dbiterrb(),
    .doutb(dout_ram),                // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
    .sbiterrb(),             
    .addra(waddr),                   // ADDR_WIDTH_A-bit input: Address for port A write operations.
    .addrb(raddr),                   // ADDR_WIDTH_B-bit input: Address for port B read operations.
    .clka(clk),                      // 1-bit input: Clock signal for port A
    .clkb(clk),                      // 1-bit input: Clock signal for port B
    .dina(din),                      // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
    .ena(1'b1),                      // 1-bit input: Memory enable signal for port A. 
    .enb(1'b1),                      // 1-bit input: Memory enable signal for port B. 
    .injectdbiterra(1'b0),
    .injectsbiterra(1'b0), 
    .regceb(1'b1),                   // 1-bit input: Clock Enable for the last register stage on the output data path.
    .rstb(1'b0),                     // 1-bit input: Reset signal for the final port B output register stage.
    .sleep(),                       
    .wea(wen)                        // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                                     // for port A input data port dina. 1 bit wide when word-wide writes are
                                     // used. 
    );
    // End of xpm_memory_sdpram_inst instantiation
    
    // output register
    if(OUTPUT_REG == 1) begin
        always @(posedge clk) begin
            dout_ram_reg <= dout_ram;
        end
    end
    else begin
        always @(*) begin
            dout_ram_reg = dout_ram;
        end
    end

    assign dout = dout_ram_reg;
end
else begin // other options
    reg [MEM_WIDTH-1:0] dout_ram;
    wire[MEM_WIDTH-1:0] dout_ram_w;
    reg [MEM_WIDTH-1:0] dout_ram_reg;

    localparam FPGA_MEM_TYPE = (MEM_TYPE == "fpga_block") ? "block" : 
                               (MEM_TYPE == "fpga_ultra") ? "ultra" : 
                               (MEM_TYPE == "fpga_distributed") ? "distributed" : 
                               (MEM_TYPE == "fpga_registers") ? "registers" : "";

    (* ram_style=FPGA_MEM_TYPE *) reg [MEM_WIDTH-1:0] ram [(1<<MEM_DEPTH)-1:0];

    // write operation
    always @(posedge clk) begin
        if(wen)
            ram[waddr] <= din;
    end

    // read operation (one cycle)
    always @(posedge clk) begin
        dout_ram <= ram[raddr];
    end

    // shift register
    shiftreg #(.LOGQ(MEM_WIDTH), .DELAY(READ_LATENCY-1)) sr(clk,dout_ram,dout_ram_w);

   // output register
    if(OUTPUT_REG == 1) begin
        always @(posedge clk) begin
            dout_ram_reg <= dout_ram_w;
        end
    end
    else begin
        always @(*) begin
            dout_ram_reg = dout_ram_w;
        end
    end

    assign dout = dout_ram_reg;
end

endmodule
