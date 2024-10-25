/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Address Generator Unit for polynomial arithmetic (i.e. Add, Mul, Sub)
module AddrGen_PolyArith #(
    parameter LOGN = 0,
    parameter PE = 0,
    parameter BTF_TYPE = "unified",
    parameter NUM_POLY = 2,
    parameter BFU_LAT = 0,
    parameter SHUFFLER_LAT = 0,
    parameter BRAM_RD_LAT = 0
  ) (
    input clk,
    input rst,

    input sub_opcode,

    input [$clog2(NUM_POLY*(1<<LOGN)/2/PE)-1:0] poly_base_a,
    input [$clog2(NUM_POLY*(1<<LOGN)/2/PE)-1:0] poly_base_b,

    output logic valid,
    output logic swap,

    output logic done,
    output logic [$clog2(NUM_POLY*(1<<LOGN)/2/PE)-1:0] addr_out
  );

  logic [$clog2(NUM_POLY*(1<<LOGN)/2/PE)-1:0] poly_base_a_DP,poly_base_b_DP;
  shiftreg #(.DELAY(1),.LOGQ(2*$clog2(NUM_POLY*(1<<LOGN)/2/PE))) sr (.clk(clk), .data_in({poly_base_a,poly_base_b}), .data_out({poly_base_a_DP,poly_base_b_DP}));

  logic [$clog2((1<<LOGN)/2/PE)-1:0] addr_reg;
  logic o, done_internal, done_internal_1DP;
  always_ff @( posedge clk ) begin
    if(rst) begin
      {addr_reg,o} <= {($clog2((1<<LOGN)/2/PE)+1){1'd0}};
    end else if (~done_internal) begin
      {addr_reg,o} <= {addr_reg,o} + 1'd1;
    end

    addr_out <= addr_reg + (o ? poly_base_a_DP : poly_base_b_DP);
    swap <= done_internal ? ~swap : o;
    valid <= ~rst & ~done_internal;
    done_internal_1DP <= done_internal;
  end
  assign done_internal = {addr_reg,o} == {($clog2((1<<LOGN)/2/PE)+1){1'd1}};
  shiftreg #(.DELAY(1+BFU_LAT+SHUFFLER_LAT+BRAM_RD_LAT+2 + (BTF_TYPE == "gs" ? 2 : 0)),.LOGQ(1)) sr_done (.clk(clk), .data_in(sub_opcode ? done_internal_1DP : done_internal), .data_out(done));
endmodule
