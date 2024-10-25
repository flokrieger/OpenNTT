/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// parametric ROM module

`default_nettype wire

module rom # (
    parameter MEM_WIDTH = 0,     
    parameter MEM_DEPTH = 0, // in log2
    parameter MEM_COUNT = 0, // at least 1
    parameter ROM_CONTENT = "r.data", // use *.mem for xpm
    parameter READ_LATENCY = 0, // at least 1
    parameter OUTPUT_REG = 0, // 0: no output register, 1: output register using DFFs
    parameter MEM_TYPE = "" // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                            //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)
) (   
    input                  clk,
    input  [MEM_DEPTH-1:0] raddr,
    output [MEM_WIDTH-1:0] dout [0:MEM_COUNT-1]
);

if (MEM_TYPE == "asic") begin
    my_custom_rom (clk,raddr,dout); // CHANGE MODULE NAME/INTERFACE
end
else if ((MEM_TYPE == "xpm_block") || (MEM_TYPE == "xpm_distributed") || (MEM_TYPE == "xpm_auto") || (MEM_TYPE == "xpm_ultra")) begin
    wire[MEM_WIDTH*MEM_COUNT-1:0] dout_rom;
    reg [MEM_WIDTH*MEM_COUNT-1:0] dout_rom_reg;
    
    localparam XPM_MEM_TYPE = (MEM_TYPE == "xpm_block") ? "block" : 
                              (MEM_TYPE == "xpm_ultra") ? "ultra" : 
                              (MEM_TYPE == "xpm_distributed") ? "distributed" : "auto";

    // https://docs.xilinx.com/r/en-US/ug974-vivado-ultrascale-libraries/XPM_MEMORY_SPROM
    // xpm_memory_sprom: Single Port RAM
    // Xilinx Parameterized Macro, version 2023.2
    xpm_memory_sprom #(
    .ADDR_WIDTH_A(MEM_DEPTH),                         // DECIMAL
    .MEMORY_INIT_FILE(ROM_CONTENT),                   // String
    .MEMORY_PRIMITIVE(XPM_MEM_TYPE),                  // String
    .MEMORY_SIZE(MEM_WIDTH*MEM_COUNT*(1<<MEM_DEPTH)), // DECIMAL
    .READ_DATA_WIDTH_A(MEM_WIDTH*MEM_COUNT),
    .READ_LATENCY_A(READ_LATENCY)                     // DECIMAL
    )
    xpm_memory_sprom_inst (
    .dbiterra(),
    .douta(dout_rom),                
    .sbiterra(),             
    .addra(raddr),                  
    .clka(clk),                      
    .ena(1'b1),
    .regcea(1'b1),
    .injectsbiterra(1'b0),
    .injectdbiterra(1'b0),
    .rsta(1'b0),
    .sleep(1'b0)
    );
    // End of xpm_memory_sprom_inst instantiation
    
    // output register
    if(OUTPUT_REG == 1) begin
        always @(posedge clk) begin
            dout_rom_reg <= dout_rom;
        end
    end
    else begin
        always @(*) begin
            dout_rom_reg = dout_rom;
        end
    end

    for (genvar j=0; j<MEM_COUNT; j=j+1) begin
        assign dout[j] = dout_rom_reg[MEM_WIDTH*j+:MEM_WIDTH];
    end
end
else begin // other options
    reg [MEM_WIDTH*MEM_COUNT-1:0] dout_rom;
    wire[MEM_WIDTH*MEM_COUNT-1:0] dout_rom_w;
    reg [MEM_WIDTH*MEM_COUNT-1:0] dout_rom_reg;

    localparam FPGA_MEM_TYPE = (MEM_TYPE == "fpga_block") ? "block" : 
                               (MEM_TYPE == "fpga_ultra") ? "ultra" : 
                               (MEM_TYPE == "fpga_distributed") ? "distributed" : "";
    
    // ROM content
    (* rom_style=FPGA_MEM_TYPE *) reg [MEM_WIDTH*MEM_COUNT-1:0] rom [(1<<MEM_DEPTH)-1:0];
    initial begin
        $readmemh(ROM_CONTENT, rom);
    end

    // read operation (one cycle)
    always @(posedge clk) begin
        dout_rom <= rom[raddr];
    end

    // shift register
    shiftreg #(.LOGQ(MEM_WIDTH), .DELAY(READ_LATENCY-1)) sr(clk,dout_rom,dout_rom_w);

   // output register
    if(OUTPUT_REG == 1) begin
        always @(posedge clk) begin
            dout_rom_reg <= dout_rom_w;
        end
    end
    else begin
        always @(*) begin
            dout_rom_reg = dout_rom_w;
        end
    end

    for (genvar j=0; j<MEM_COUNT; j=j+1) begin
        assign dout[j] = dout_rom_reg[MEM_WIDTH*j+:MEM_WIDTH];
    end
end

endmodule
