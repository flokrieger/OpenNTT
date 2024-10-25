/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Address Generator Unit for NTT transformation
module AddrGen #(
    parameter LOGN = 0,
    parameter PE = 0,
    parameter LATENCY = 1,
    parameter IS_NR = 0
  ) (
    input clk,
    input rst,
    output ident_store,
    output [$clog2(PE):0] dest_rom_gap,

    output done,
    output [$clog2((1<<LOGN)/2/PE)-1:0] addr_out
  );

  localparam N = 1<<LOGN;

  logic [$clog2(N/2/PE):0] s_DP, s_DN;
  logic [$clog2(N/2/PE)-1:0] s_m_1_DP;
  logic [$clog2(N)-1:0] m,m_m_1,v;
  logic [$clog2(LOGN)-1:0] stage_DP,stage_DN;
  logic stage_done, k_loop_done, j_loop_done;

  BitReverse #($clog2(N)) br_v (.in(m),.out(v));
  always_ff @( posedge clk ) begin
    if(rst) begin
      m <= 1;
      m_m_1 <= 0;
      stage_DP <= 0;
      s_DP     <=  IS_NR ? (PE == 1 ? N/2 : N/4) : N/2/PE;
      s_m_1_DP <= (IS_NR ? (PE == 1 ? N/2 : N/4) : N/2/PE) - 1;
    end
    else if(stage_done) begin
      m <= m << 1;
      m_m_1 <= {m_m_1[$clog2(N)-2:0], 1'd1};
      stage_DP <= stage_DN;
      s_DP <= s_DN;
      s_m_1_DP <= s_DN - 1;
    end
  end
  assign stage_DN = stage_DP + 1;
  assign done = stage_done && v[0] == 1'd1;

  logic [$clog2(N/2/PE)-1:0] k;
  always_ff @(posedge clk) begin
    if(rst || stage_done) begin
      k <= {$clog2(N/2/PE){1'd0}};
    end else if(j_loop_done) begin
      k <= k + 1;
    end
  end
  assign stage_done = k_loop_done && j_loop_done;

  logic [$clog2(N/2/PE)-1:0] j;
  always_ff @(posedge clk) begin
    if(rst || j_loop_done) begin
      j <= {$clog2(N/2/PE){1'd0}};
    end else begin
      j <= j + 1;
    end
  end
  assign j_loop_done = j == s_m_1_DP;

  logic [$clog2(PE):0] dest_rom_gap_internal;
  logic ident_store_internal;
  logic [$clog2((1<<LOGN)/2/PE)-1:0] base, addr, addr_DP;
  if (IS_NR) begin
    assign s_DN = PE == 1 || stage_DP >= $clog2(PE)-1 ? v>>1 : N/2/PE;
    assign k_loop_done = stage_DP < $clog2(PE) || k == (m_m_1 >> $clog2(PE));

    logic [$clog2(N/2/PE)-1:0] k_br;
    BitReverse #($clog2(N/2/PE)) br_k (.in(k),.out(k_br));

    assign base = j[0] == 1'd0 ? j>>1 : (j>>1) + (s_DP>>1);
    assign addr = stage_DP >= $clog2(PE) ? base + k_br : j;
    assign ident_store_internal = v[0] == 1'd1 || stage_DP < $clog2(PE);
    assign dest_rom_gap_internal = stage_DP < $clog2(PE) ? PE >> stage_DP : 1;
  end else begin
    assign s_DN =        stage_DN < LOGN-$clog2(PE) ? s_DP >> 1 : 1;
    assign k_loop_done = stage_DP < LOGN-$clog2(PE) ? (k == m_m_1) : (k == N/2/PE-1);
  
    logic [$clog2(N/2/PE)-1:0] j_br;
    BitReverse #($clog2(N/2/PE)) br_j (.in(j>>1), .out(j_br));

    assign base = j_br + k;
    assign addr = j[0] == 1'd1 ? base + m : base;
    assign ident_store_internal = stage_DP >= LOGN-$clog2(PE)-1;
    assign dest_rom_gap_internal = stage_DP >= LOGN-$clog2(PE)-1 && v[0] == 1'd0 ? PE >> (LOGN-2-stage_DP) : 1;
  end

  shiftreg #(
        .DELAY(LATENCY), 
        .LOGQ(($clog2(PE)+1)+1+$clog2((1<<LOGN)/2/PE))
    ) sr_out (
        .clk(clk),
        .data_in({dest_rom_gap_internal,ident_store_internal,addr}),
        .data_out({dest_rom_gap,ident_store,addr_DP})
    );
  assign addr_out = addr_DP;

endmodule