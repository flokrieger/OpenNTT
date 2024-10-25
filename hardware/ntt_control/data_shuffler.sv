/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

`timescale 1ns/1ps

// Rearranges the NTT butterfly results to go to correct RAM address

module DataShuffler #(
    parameter LOGQ = 0,
    parameter LOGN = 0,
    parameter PE = 0
  ) (
    input clk,
    input valid,
    input ident_store,
    input [$clog2(PE):0] dest_rom_gap,
    input swap_store,
    input is_poly_arith,

    input [$clog2((1<<LOGN)/2/PE)-1:0] bf_rd_addr,
    input [LOGQ-1:0]                   bf_data [0:PE-1][0:1],

    output                              wen,
    output [$clog2((1<<LOGN)/2/PE)-1:0] waddr,
    output [LOGQ-1:0]                   wdata [0:PE-1][0:1]
  );

  localparam ADDR_WIDTH = $clog2((1<<LOGN)/2/PE);
  localparam LAT_REORDER = 2;
  localparam LAT_OVERALL = LAT_REORDER+1;

  // control & address logic:
  logic ident_store_delay,valid_delay,valid_delay_DP;
  shiftreg #(.DELAY(LAT_REORDER), .LOGQ(2)) sr_ident_store (
      .clk(clk), 
      .data_in({ident_store,valid}), 
      .data_out({ident_store_delay, valid_delay})
    );

  logic [ADDR_WIDTH-1:0] waddr_internal,waddr_internal_DP;
  shiftreg #(.DELAY(LAT_REORDER), .LOGQ(ADDR_WIDTH)) sr_waddr (.clk(clk), .data_in(bf_rd_addr), .data_out(waddr_internal));

  logic swap;
  always_ff @( posedge clk ) begin
    if(is_poly_arith)
      swap <= swap_store; 
    else if (~valid_delay)
      swap <= 1'd0;
    else
      swap <= ~swap;
  end
  
  logic [LOGQ-1:0] wdata_internal [0:PE-1][0:1];
  logic [LOGQ-1:0] op0 [0:PE-1];
  logic [LOGQ-1:0] op1 [0:PE-1];
  generate
    for(genvar p = 0; p < PE; p = p + 1) begin   
      // data reordering:
      logic [LOGQ-1:0] wdata_e [0:1];
      logic [LOGQ-1:0] wdata_o [0:1];
      shiftreg #(.DELAY(1), .LOGQ(LOGQ)) sr_wdata_e1 (.clk(clk), .data_in(bf_data[p][0]), .data_out(wdata_e[1]));
      shiftreg #(.DELAY(1), .LOGQ(LOGQ)) sr_wdata_e0 (.clk(clk), .data_in(wdata_e[1]),    .data_out(wdata_e[0]));
      shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_wdata_o1 (.clk(clk), .data_in(bf_data[p][1]), .data_out(wdata_o[1]));
      shiftreg #(.DELAY(1), .LOGQ(LOGQ)) sr_wdata_o0 (.clk(clk), .data_in(wdata_o[1]),    .data_out(wdata_o[0]));

      // reorder within one BRAM bank set:
      assign op0[p] = ident_store_delay ? wdata_e[0] : swap ? wdata_e[0] : wdata_o[0];
      assign op1[p] = ident_store_delay ? wdata_o[1] : swap ? wdata_e[1] : wdata_o[1];
      
      // reorder across BRAM bank sets (multiple PE):
      if(PE == 1) begin
        assign wdata_internal[p][0] = op0[p]; 
        assign wdata_internal[p][1] = op1[p]; 
      end else begin
        logic [$clog2(PE*2)-1:0] op0_addr, op1_addr;
        
        logic [$clog2(PE):0] dest_rom_gap_1DP;
        logic op_addr_sel_1DP;
        always_ff @( posedge clk ) begin
          dest_rom_gap_1DP <= dest_rom_gap;
          op_addr_sel_1DP <= (p & (dest_rom_gap>>1)) == {($clog2(PE)+1){1'd0}} ? 1'd1 : 1'd0;
          op0_addr <= op_addr_sel_1DP ? p*2                    : p*2 + 1 - dest_rom_gap_1DP;
          op1_addr <= op_addr_sel_1DP ? p*2 + dest_rom_gap_1DP : p*2 + 1;
        end

        assign wdata_internal[p][0] = op0_addr[0] == 1'd1 ? op1[op0_addr>>1] : op0[op0_addr>>1]; 
        assign wdata_internal[p][1] = op1_addr[0] == 1'd1 ? op1[op1_addr>>1] : op0[op1_addr>>1];
        // assign wdata_internal[op0_addr>>1][op0_addr[0]] = op0; 
        // assign wdata_internal[op1_addr>>1][op1_addr[0]] = op1;
      end
    end
  endgenerate

  // final register:
  logic [LOGQ-1:0] wdata_internal_DP [0:PE-1][0:1];
  always_ff @( posedge clk ) begin
    wdata_internal_DP <= wdata_internal;
    waddr_internal_DP <= waddr_internal;
    valid_delay_DP    <= valid_delay;
  end
  assign wdata = wdata_internal_DP;
  assign waddr = waddr_internal_DP;
  assign wen   = valid_delay_DP;

endmodule