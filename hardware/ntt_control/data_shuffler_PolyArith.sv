/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Rearranges the Add/Mul/Sub computation results to go to correct RAM address
module DataShuffler_PolyArith #(
    parameter BTF_TYPE = "unified", // unified, ct, gs
    parameter LOGN = 0,
    parameter LOGQ = 0,
    parameter PE = 0,
    parameter NUM_POLY = 2,

    parameter BRAM_RD_LAT = 2,
    parameter ADD_SUB_LAT = 2,
    parameter BFU_LAT = 0
  ) (
    input clk,
    input rst,

    input [1:0] opcode, // 0: NTT, 1: modmult, 2: modadd 3: modsub

    input valid_in,
    input swap,

    input [LOGQ-1:0] montgomery_factor,

    input [$clog2(NUM_POLY*(1<<LOGN)/2/PE)-1:0] addr,
    input [LOGQ-1:0] rdata [0:PE-1][0:1],

    output logic [LOGQ-1:0] bf_a [0:PE-1],
    output logic [LOGQ-1:0] bf_b [0:PE-1],
    output logic [LOGQ-1:0] bf_c [0:PE-1],

    output ident_store,
    output swap_store,
    output [$clog2(PE):0] dest_rom_gap,

    output [$clog2(NUM_POLY*(1<<LOGN)/2/PE)-1:0] waddr,
    output valid_out
  );

  logic mult_opcode,add_opcode,sub_opcode;
  always_ff @( posedge clk ) begin
    mult_opcode <= opcode == 2'd1;
    add_opcode  <= opcode == 2'd2;
    sub_opcode  <= opcode == 2'd3;
  end

  logic swap_delay;
  shiftreg #(.DELAY(1+BRAM_RD_LAT),.LOGQ(1)) sr_swap (.clk(clk), .data_in(swap), .data_out(swap_delay));

  logic [LOGQ-1:0] rdata_bank0_1DP[0:PE-1];
  logic [LOGQ-1:0] rdata_bank0_2DP[0:PE-1];
  logic [LOGQ-1:0] rdata_bank1_2DP[0:PE-1];
  logic [LOGQ-1:0] rdata_bank1_3DP[0:PE-1];
  logic [LOGQ-1:0] op_a[0:PE-1];
  logic [LOGQ-1:0] op_b[0:PE-1];
  generate
    for(genvar p = 0; p < PE; p += 1) begin
      shiftreg #(.DELAY(1),.LOGQ(LOGQ)) sr0 (.clk(clk), .data_in(rdata[p][0]),        .data_out(rdata_bank0_1DP[p]));
      shiftreg #(.DELAY(1),.LOGQ(LOGQ)) sr1 (.clk(clk), .data_in(rdata_bank0_1DP[p]), .data_out(rdata_bank0_2DP[p]));
      shiftreg #(.DELAY(2),.LOGQ(LOGQ)) sr2 (.clk(clk), .data_in(rdata[p][1]),        .data_out(rdata_bank1_2DP[p]));
      shiftreg #(.DELAY(1),.LOGQ(LOGQ)) sr3 (.clk(clk), .data_in(rdata_bank1_2DP[p]), .data_out(rdata_bank1_3DP[p]));
      
      if(BTF_TYPE == "unified" || BTF_TYPE == "ct") begin
        always_ff @( posedge clk ) begin 
          bf_a[p] <= mult_opcode ? {LOGQ{1'd0}} : op_a[p];
          bf_b[p] <= op_b[p];
          bf_c[p] <= mult_opcode ? op_a[p] : montgomery_factor;
        end
      end else begin
        logic [LOGQ-1:0] bf_c_tmp;
        always_ff @( posedge clk ) begin 
          bf_a[p] <= op_a[p];
          bf_b[p] <= mult_opcode ? {LOGQ{1'd0}} : op_b[p];
          bf_c_tmp <= mult_opcode ? op_b[p] : montgomery_factor;
        end
        shiftreg #(.DELAY(ADD_SUB_LAT),.LOGQ(LOGQ)) sr_bf_c (.clk(clk), .data_in(bf_c_tmp), .data_out(bf_c[p]));
      end
    end
  endgenerate
  
  assign op_a = swap_delay ? rdata_bank0_1DP : rdata_bank1_2DP;
  assign op_b = swap_delay ? rdata_bank0_2DP : rdata_bank1_3DP;

  //////////// store logic ////////
  logic valid_1DP,valid_2DP,valid_delay;
  logic [$clog2(NUM_POLY*(1<<LOGN)/2/PE)-1:0] addr_delay, addr_1DP;
  always_ff @( posedge clk ) begin
    if (~valid_in)
      valid_1DP <= 1'd0;
    else
      valid_1DP <= ~valid_1DP;
    
    valid_2DP <= valid_1DP;
    addr_1DP <= addr;
  end

  shiftreg #(.DELAY(2+BFU_LAT+BRAM_RD_LAT),.LOGQ(1)) sr_valid (.clk(clk), .data_in(valid_delay), .data_out(valid_out));
  shiftreg #(.DELAY(2+BFU_LAT+BRAM_RD_LAT),.LOGQ($clog2(NUM_POLY*(1<<LOGN)/2/PE))) sr_addr (.clk(clk), .data_in(addr_delay), .data_out(waddr));
  
  if(BTF_TYPE == "unified" || BTF_TYPE == "ct") begin
    assign swap_store = sub_opcode ? 1'd0 : 1'd1;
    assign valid_delay = sub_opcode ? valid_2DP : valid_1DP;
    assign addr_delay  = sub_opcode ? addr_1DP : addr;
  end else begin
    assign swap_store = add_opcode ? 1'd1 : 1'd0;
    assign valid_delay = add_opcode ? valid_1DP : valid_2DP;
    assign addr_delay  = add_opcode ? addr : addr_1DP;
  end
  assign ident_store = 1'd0;
  assign dest_rom_gap = {{$clog2(PE){1'd0}},1'd1};
  
endmodule