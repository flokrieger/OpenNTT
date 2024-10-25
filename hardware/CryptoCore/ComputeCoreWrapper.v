/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns / 1ps

// Top module for CryptoCore: instantiates ComputeCore and the
// instruction set control unit (ISA_Control), which sends the instructions
// to CryptoCore.

module ComputeCoreWrapper #(parameter BRAM_ADDR_WIDTH = 20) (clk, 
                    // AXI registers for controlling the co-processor
                    control_low_word, control_high_word, 
                    dina_ext_low_word, dina_ext_high_word, 
                    dina2_ext_word,
                    dina3_ext_low_word, dina3_ext_high_word,
                    dout_ext_low_word, dout_ext_high_word, 
                    status,
                    // DMA interface: 
                    dma_bram_byte_wea, 
                    dma_bram_abs_addr, 
                    dma_bram_dina, 
                    dma_bram_doutb, 
                    dma_bram_en);


localparam LOG_COMMAND = 8;         

input clk;
input [31:0] control_low_word, control_high_word;
input [31:0] dina_ext_low_word, dina_ext_high_word, dina2_ext_word;
input [31:0] dina3_ext_low_word, dina3_ext_high_word;

output [31:0] dout_ext_low_word, dout_ext_high_word;
output [31:0] status;

input [7:0] dma_bram_byte_wea;
input [BRAM_ADDR_WIDTH-1:0] dma_bram_abs_addr;
input [63:0] dma_bram_dina;
output [63:0] dma_bram_doutb;
input dma_bram_en;

wire [63:0] dina_ext = {dina_ext_high_word,dina_ext_low_word};
reg [63:0] dina_ext_DP;
wire [63:0] dout_ext;
reg [63:0] dout_ext_DP;
reg [31:0] status;
wire rst_core;

wire [19:0] address_ext;
wire [2:0] bram_sel;
wire wea_ext, wea_ext_ISA;
reg grant_ext, wea_ext_core;

wire [LOG_COMMAND-1:0] command_in;
wire command_we;

wire rst_ISA, start_ISA;
wire done_ins_computation; 
wire done_all_computation; // This becomes 1 when the cryptoprocessor has finished executing all instructions.

wire [31:0] status_wire;
wire [30:0] cycle_count;

assign address_ext = control_low_word[19:0];
assign wea_ext = control_low_word[20];
always @(posedge clk) grant_ext <= control_low_word[22];
assign bram_sel = control_low_word[31:29];

assign {dout_ext_high_word,dout_ext_low_word} = dout_ext_DP;
assign status_wire = {cycle_count[29:0], 1'd0, done_all_computation};
always @(posedge clk)  dout_ext_DP <= dout_ext;
always @(posedge clk)  wea_ext_core <= (wea_ext==1'b1 & control_low_word[21]==1'b0) ? 1'b1 : 1'b0;
always @(posedge clk)  dina_ext_DP <= dina_ext;

always @(posedge clk)
    status <= status_wire;
    
ComputeCore #(.LOG_COMMAND(LOG_COMMAND), .BRAM_ADDR_WIDTH(BRAM_ADDR_WIDTH)) CORE(
    .clk(clk), 
    .rst(rst_core), 
    .address_ext(address_ext), 
    .dina_ext(dina_ext), 
    .dina2_ext(dina2_ext_word),
    .dina3_ext({dina3_ext_high_word,dina3_ext_low_word}),
    .doutb_ext(dout_ext),
    .wea_ext(wea_ext_core),
		.command_in(command_in), 
    .command_we(command_we),
		.done_ins_computation(done_ins_computation),
		.grant_ext_io(grant_ext),
    .dma_byte_wea(dma_bram_byte_wea), 
    .dma_rwaddr(dma_bram_abs_addr), 
    .dma_wdata(dma_bram_dina), 
    .dma_rdata(dma_bram_doutb), 
    .dma_en(dma_bram_en));


assign rst_core = control_high_word[0];
assign rst_ISA = control_high_word[0];
assign start_ISA = control_high_word[1];
assign wea_ext_ISA = (wea_ext==1'b1 & control_low_word[21]==1'b1) ? 1'b1 : 1'b0;

ISA_control #(LOG_COMMAND) ISA_CTRL(clk, rst_ISA, start_ISA, done_ins_computation,
                  address_ext[4:0], dina_ext, wea_ext_ISA,
									command_in,	command_we,
									done_all_computation,
									cycle_count);

endmodule
