/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Arithmetic and Control Core for NTT and FFT. Handles everything but has no RAM instance  
module NTTCore 
  import FLP_pkg::*;
  #(
    parameter NTT = 1,

    parameter LOGQ = 28,
    parameter LOGN = 11,
    parameter PE = 8,

    // NTT params:
    parameter NTT_TYPE = "mfntt_dit_nr-mintt_dif_rn", // standalones: fntt_dit_nr, fntt_dif_nr, intt_dit_rn, intt_dif_rn, mfntt_dit_nr, mintt_dif_rn
                                                      // unifieds:    fntt_dit_nr-intt_dit_rn, mfntt_dit_nr-mintt_dif_rn
    parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant  
    parameter WORD_SIZE = 12, // Last WORD_SIZE digit of q will be 00...001

    // Butterfly params:
    parameter ADD_LAT = 1, // options: 0, 1 or 2 (Latency for ADD/SUB)
    parameter INTMUL_LAT = 2, // should be at least 1 (valid only if INTMUL_TYPE="")
    parameter INTMUL_TYPE = "fpga_dsp", // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)
    parameter MODRED_TYPE = "default", // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
    parameter MODRED_LAT = 1, // ignored for "default" (WL Montgomery) 
    parameter MODRED_COREMUL_LAT = 1, // latency of multiply and add units in WL Montgomery	, only used in "default" (WL Montgomery) 

    // NTT config: 
    parameter INSTANTIATE_MULT_ADD = 0, // 1: support polynomial addition / multiplication etc.
    parameter NUM_POLY_MEMS = 1,

    // Memory configuration:
    parameter MEMORY_OPTIMIZED = 0,
    parameter TW_ROM_MEM_TYPE = "fpga_block", // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                                              //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)
    parameter ROM_ADDR_WIDTH = 32,
    parameter RAM_RD_LAT = 2,
    parameter ROM_RD_LAT = 2,

    parameter NO_BFU = 0 // for debug only
  ) 
  (
    input clk,
    input rst,
    input forward, // only used in case of unifieds.
    input [1:0] opcode,

    input [LOGQ-1:0] q,
    input [LOGQ-1:0] montgomery_factor,
    input [ROM_ADDR_WIDTH-1:0] rom_base_addr,

    output ram_wen,
    output [$clog2(NUM_POLY_MEMS*(1<<LOGN)/2/PE)-1:0] ram_raddr,
    output [$clog2(NUM_POLY_MEMS*(1<<LOGN)/2/PE)-1:0] ram_waddr,
    input  [LOGQ-1:0] ram_rdata [0:PE-1][0:1],
    output [LOGQ-1:0] ram_wdata [0:PE-1][0:1],

    input [$clog2(NUM_POLY_MEMS)-1:0] poly_base_a,
    input [$clog2(NUM_POLY_MEMS)-1:0] poly_base_b,

    output done
  );

  localparam N = 1<<LOGN;
  localparam ADDR_WIDTH = $clog2((1<<LOGN)/2/PE);
  localparam ADDR_GEN_LATENCY = 1;
  localparam MODRED_L = $rtoi($ceil(1.0*LOGQ/(1.0*WORD_SIZE)));
  localparam MODRED_LAT_INTERNAL = MODRED_TYPE == "default" ? MODRED_L*2 + ((LOGQ-WORD_SIZE <= 24) ? (((2*LOGQ-47-1)/WORD_SIZE)*(0+1)) : (MODRED_L*(0+1))) + (0+1) : MODRED_LAT;
  localparam BTF_SIM_LAT = 2; // debug only

  localparam IS_MERGED      = NTT_TYPE == "mfntt_dit_nr" || NTT_TYPE == "mintt_dif_rn" || NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn";
  localparam IS_UNIFIED     = NTT_TYPE == "fntt_dit_nr-intt_dit_rn" || NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn";
  localparam IS_DIT         = NTT_TYPE == "fntt_dit_nr" || NTT_TYPE == "intt_dit_rn" || NTT_TYPE == "mfntt_dit_nr";
  localparam IS_INVERSE     = NTT_TYPE == "intt_dit_rn" || NTT_TYPE == "intt_dif_rn" || NTT_TYPE == "mintt_dif_rn";
  localparam INSTANTIATE_NR = NTT_TYPE == "fntt_dit_nr" || NTT_TYPE == "fntt_dif_nr" || NTT_TYPE == "mfntt_dit_nr" || IS_UNIFIED;
  localparam INSTANTIATE_RN = NTT_TYPE == "intt_dit_rn" || NTT_TYPE == "intt_dif_rn" || NTT_TYPE == "mintt_dif_rn" || IS_UNIFIED;
  localparam BTF_TYPE = IS_UNIFIED ? "unified" : IS_DIT ? "ct" : "gs";

  if(INSTANTIATE_NR == 0 && INSTANTIATE_RN == 0)
    $error("invalid ntt type");

  localparam BTF_LAT = NO_BFU ? BTF_SIM_LAT : NTT ? (ADD_LAT + INTMUL_LAT + MODRED_LAT_INTERNAL + (IS_UNIFIED || IS_INVERSE ? 1 : 0)) : FFT_BF_LAT;
  localparam DATA_SHUFFLER_LAT_OVERALL = 3;
  if(RAM_RD_LAT + BTF_LAT + DATA_SHUFFLER_LAT_OVERALL > (1<<LOGN)/4/PE)
    $error("Error: Latency parameters will cause conflicts!");
    
  // input regs:
  logic [ROM_ADDR_WIDTH-1:0] rom_base_addr_reg;
  always_ff @( posedge clk ) rom_base_addr_reg <= rom_base_addr;
  logic forward_internal;
  if(IS_UNIFIED)
    shiftreg #(.DELAY(2), .LOGQ(1)) sr_forward (.clk(clk),.data_in(forward),.data_out(forward_internal));
  else if(IS_INVERSE)
    assign forward_internal = 1'd0;
  else
    assign forward_internal = 1'd1;

  logic [$clog2(NUM_POLY_MEMS)-1:0] poly_base_a_DP,poly_base_b_DP;
  logic ntt_opcode, add_opcode, sub_opcode, mult_opcode; 
  logic [LOGQ-1:0] montgomery_factor_DP;
  always_ff @( posedge clk ) begin
    poly_base_a_DP       <= poly_base_a;
    poly_base_b_DP       <= poly_base_b;
    ntt_opcode           <= INSTANTIATE_MULT_ADD == 0 || opcode == 2'd0;
    mult_opcode          <= INSTANTIATE_MULT_ADD && opcode == 2'd1;
    add_opcode           <= INSTANTIATE_MULT_ADD && opcode == 2'd2;
    sub_opcode           <= INSTANTIATE_MULT_ADD && opcode == 2'd3;
    montgomery_factor_DP <= INSTANTIATE_MULT_ADD ? montgomery_factor : {LOGQ{1'dX}};
  end

  // Address generation:
  logic rst_addr_gen_nr,rst_addr_gen_rn,done_nr,done_rn,done_internal,done_polyArith;
  logic ident_store_nr, ident_store_rn, ident_store, ident_store_delayed;
  logic [ADDR_WIDTH-1:0] rd_addr_nr, rd_addr_rn, rd_addr, rd_addr_delayed;
  logic [$clog2(PE):0] dest_rom_gap,dest_rom_gap_nr,dest_rom_gap_rn,dest_rom_gap_delayed;
  if(IS_UNIFIED) begin
    assign {dest_rom_gap,ident_store,rd_addr} = forward_internal ? {dest_rom_gap_nr,ident_store_nr,rd_addr_nr} : {dest_rom_gap_rn,ident_store_rn,rd_addr_rn};
  end else begin
    assign {dest_rom_gap,ident_store,rd_addr} = INSTANTIATE_NR   ? {dest_rom_gap_nr,ident_store_nr,rd_addr_nr} : {dest_rom_gap_rn,ident_store_rn,rd_addr_rn};
  end
  if(INSTANTIATE_NR) begin
    AddrGen #(
        .LOGN(LOGN),
        .PE(PE),
        .LATENCY(ADDR_GEN_LATENCY),
        .IS_NR(1)
      ) addr_gen_nr (
        .clk(clk),
        .rst(rst_addr_gen_nr),
        .ident_store(ident_store_nr),
        .dest_rom_gap(dest_rom_gap_nr),
        .done(done_nr),
        .addr_out(rd_addr_nr)
    );
  end
  if(INSTANTIATE_RN) begin
    AddrGen #(
        .LOGN(LOGN),
        .PE(PE),
        .LATENCY(ADDR_GEN_LATENCY),
        .IS_NR(0)
      ) addr_gen_rn (
        .clk(clk),
        .rst(rst_addr_gen_rn),
        .ident_store(ident_store_rn),
        .dest_rom_gap(dest_rom_gap_rn),
        .done(done_rn),
        .addr_out(rd_addr_rn)
    );
  end

  logic [$clog2(NUM_POLY_MEMS)+ADDR_WIDTH-1:0] raddr_polyArith;
  logic [$clog2(NUM_POLY_MEMS)+ADDR_WIDTH-1:0] waddr_polyArith;
  logic [LOGQ-1:0] bf_a_polyArith [0:PE-1];
  logic [LOGQ-1:0] bf_b_polyArith [0:PE-1];
  logic [LOGQ-1:0] bf_c_polyArith [0:PE-1];
  logic [$clog2(PE):0] dest_rom_gap_PolyArith;
  logic ident_store_PolyArith, swap_store_PolyArith, valid_PolyArith;
  if(INSTANTIATE_MULT_ADD) begin
    logic valid_polyArith_internal, swap_polyArith;
    logic [$clog2(NUM_POLY_MEMS*(1<<LOGN)/2/PE)-1:0] poly_base_a_arith, poly_base_b_arith;
    assign poly_base_a_arith = poly_base_a_DP*(N/2/PE);
    assign poly_base_b_arith = poly_base_b_DP*(N/2/PE);
    AddrGen_PolyArith #(
      .LOGN(LOGN),
      .PE(PE),
      .BTF_TYPE(BTF_TYPE),
      .NUM_POLY(NUM_POLY_MEMS),
      .BFU_LAT(BTF_LAT),
      .SHUFFLER_LAT(DATA_SHUFFLER_LAT_OVERALL),
      .BRAM_RD_LAT(RAM_RD_LAT)
    ) addr_gen_polyArith (
      .clk(clk),
      .rst(ntt_opcode ? 1'd1 : rst),
      .sub_opcode(sub_opcode),
      .poly_base_a(poly_base_a_arith),
      .poly_base_b(poly_base_b_arith),
      .valid(valid_polyArith_internal),
      .swap(swap_polyArith),
      .done(done_polyArith),
      .addr_out(raddr_polyArith)
    );

    logic [LOGQ-1:0] mf;
    assign mf = NTT ? (MODRED_TYPE == "default" ? montgomery_factor_DP : {{(LOGQ-1){1'd0}},1'd1}) :
                      COMPLEX_ONE_ENCODING;
    DataShuffler_PolyArith #(
      .BTF_TYPE(BTF_TYPE),
      .LOGN(LOGN),
      .LOGQ(LOGQ),
      .PE(PE),
      .NUM_POLY(NUM_POLY_MEMS),
      .BRAM_RD_LAT(RAM_RD_LAT),
      .ADD_SUB_LAT(ADD_LAT),
      .BFU_LAT(BTF_LAT)
    ) data_shuffler_PolyArith (
      .clk(clk),
      .rst(ntt_opcode ? 1'd1 : rst),
      .opcode(opcode),
      .valid_in(valid_polyArith_internal),
      .montgomery_factor(mf),
      .swap(swap_polyArith),
      .addr(raddr_polyArith),
      .rdata(ram_rdata),
      .bf_a(bf_a_polyArith),
      .bf_b(bf_b_polyArith),
      .bf_c(bf_c_polyArith),
      .ident_store(ident_store_PolyArith),
      .swap_store(swap_store_PolyArith),
      .dest_rom_gap(dest_rom_gap_PolyArith),
      .waddr(waddr_polyArith),
      .valid_out(valid_PolyArith)
    );
  end
  assign done_internal = (forward_internal ? done_nr : done_rn);

  // Twiddle factor generation:
  logic [LOGQ-1:0] tw [0:PE-1];
  logic rst_tw_gen;
  TwiddleGen #(
      .NTT(NTT),
      .LOGQ(LOGQ),
      .LOGN(LOGN),
      .PE(PE),
      .MEMORY_OPTIMIZED(MEMORY_OPTIMIZED),
      .NTT_TYPE(NTT_TYPE),
      .ROM_RD_LAT(ROM_RD_LAT),
      .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH),
      .MEM_TYPE(TW_ROM_MEM_TYPE),
      .INTMUL_LAT(INTMUL_LAT),
      .INTMUL_TYPE(INTMUL_TYPE),
      .Q_VALUE(Q_VALUE),
      .WORD_SIZE(WORD_SIZE),
      .MODRED_LAT(MODRED_LAT_INTERNAL),
      .MODRED_TYPE(MODRED_TYPE),
      .MODRED_L(MODRED_L),
      .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT)
    ) tw_gen (
      .clk(clk),
      .rst(rst_tw_gen),
      .forward(forward_internal),
      .rom_base_addr(rom_base_addr_reg),
      .q(q),
      .tw_out(tw)
    );
  // latency constants for twiddle generation:
   localparam MULT_LAT = NTT ? INTMUL_LAT + MODRED_LAT_INTERNAL : DELAY_COMPLEX_MULT;
  localparam MODMUL_LAT_CEIL = MULT_LAT == 4 || MULT_LAT == 8 || MULT_LAT == 16 ? 2<<$clog2(MULT_LAT) : 1<<$clog2(MULT_LAT);
  localparam TW_GEN_LATENCY_PRIM = !MEMORY_OPTIMIZED ? ((NTT_TYPE == "fntt_dif_nr" || NTT_TYPE == "intt_dif_rn" || NTT_TYPE == "mintt_dif_rn") && (MULT_LAT) % 2 == 1 ? ROM_RD_LAT + 2 : ROM_RD_LAT + 1): 
                                NTT_TYPE == "fntt_dit_nr" || NTT_TYPE == "intt_dit_rn" || NTT_TYPE == "fntt_dit_nr-intt_dit_rn" ? (PE == 1 ? ROM_RD_LAT+2 : 1) :
                                NTT_TYPE == "mfntt_dit_nr" || NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn" ? 1 :
                                NTT_TYPE == "fntt_dif_nr" || NTT_TYPE == "intt_dif_rn" || NTT_TYPE == "mintt_dif_rn" ? ROM_RD_LAT + MODMUL_LAT_CEIL - 1 : 0;
  localparam TW_GEN_LATENCY_SEC = !MEMORY_OPTIMIZED && NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn" ? ROM_RD_LAT + 1 + ((MULT_LAT) % 2 == 1 ? 1:0) : 
                                MEMORY_OPTIMIZED && NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn" ? ROM_RD_LAT + MODMUL_LAT_CEIL - 1 : TW_GEN_LATENCY_PRIM;   

  // butterflies:
  logic [LOGQ-1:0] btf_out [0:PE-1][0:1];
  logic valid_delayed;
  logic wen;
  logic [ADDR_WIDTH-1:0] waddr;
  logic [LOGQ-1:0]       wdata [0:PE-1][0:1];
  
  logic do_dit, do_div_by_2;
  assign do_div_by_2 = IS_INVERSE ? 1'd1 : IS_UNIFIED ? ~forward_internal : 1'd0;
  assign do_dit = NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn" ? forward_internal : IS_DIT || NTT_TYPE == "fntt_dit_nr-intt_dit_rn" ? 1'd1 : 1'd0;
  generate
    for(genvar g = 0; g < PE; g = g + 1) begin    
      if(NO_BFU) begin
        shiftreg #(.DELAY(BTF_LAT), .LOGQ(2*LOGQ)) bf_dummy (.clk(clk), .data_in({ram_rdata[g][0],ram_rdata[g][1]}), .data_out({btf_out[g][0],btf_out[g][1]}));
      end else if(NTT) begin
        logic [LOGQ-1:0] q_reg;
        logic [1:0] opcode_reg;
        shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_q (.clk(clk),.data_in(q),.data_out(q_reg));
        shiftreg #(.DELAY(2), .LOGQ(2)) sr_opcode (.clk(clk),.data_in(opcode),.data_out(opcode_reg));
        btf_uni #(
            .LOGQ(LOGQ),
            .Q_VALUE(Q_VALUE), // != 0: q is constant  
            .WORD_SIZE(WORD_SIZE), // Last WORD_SIZE digit of q will be 00...001
            .MODADD_LAT(ADD_LAT), // options: 0, 1 or 2 (Latency for ADD/SUB)
            .INTMUL_LAT(INTMUL_LAT), // should be at least 1 (valid only if INTMUL_TYPE="")
            .INTMUL_TYPE(INTMUL_TYPE), // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)
            .MODRED_LAT(MODRED_LAT_INTERNAL), 
            .MODRED_TYPE(MODRED_TYPE), // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
            .MODRED_L(MODRED_L),  // montgomery loop count (calculated as $ceil(LOGQ/WORD_SIZE))
            .MODRED_COREMUL_LAT(MODRED_COREMUL_LAT), // latency of multiply and add units in WL Montgomery	
            .BTF_TYPE(BTF_TYPE), // "unified" or "ct" (DIT) or "gs" (DIF)
            .SHIFT_AE(1), // 1: shift input a/output e by MODRED_LAT+INTMUL_LAT
            .DIV_BY_2(IS_UNIFIED || IS_INVERSE)  // instantiate division-by-2 module
          ) btf (
            .clk(clk),
            .dif_dit(do_dit), // 0: dif, 1: dit (by default, it is 0)
            .div_by_2(do_div_by_2), // perform final division by 2 if high
            .opcode(opcode_reg), // 0: butterfly, 1: multiply, 2: modadd / modsub
            .q(q_reg),
            .a(ntt_opcode ? ram_rdata[g][0] : bf_a_polyArith[g]),
            .b(ntt_opcode ? ram_rdata[g][1] : bf_b_polyArith[g]),
            .w(ntt_opcode ? tw[g]           : bf_c_polyArith[g]),
            .e(btf_out[g][0]),
            .o(btf_out[g][1]),
            .add_out(),
            .sub_out(),
            .mult_out()
        );
      end else begin
        logic [1:0] opcode_reg;
        shiftreg #(.DELAY(2), .LOGQ(2)) sr_opcode (.clk(clk),.data_in(opcode),.data_out(opcode_reg));
        FFTButterfly #(
            .BTF_TYPE(BTF_TYPE), // "unified" or "ct" (DIT) or "gs" (DIF)
            .DIV_BY_2(IS_UNIFIED || IS_INVERSE)  // instantiate division-by-2 module
          ) btf (
            .clk(clk),
            .dif_dit(do_dit), // 0: dif, 1: dit (by default, it is 0)
            .div_by_2(do_div_by_2), // perform final division by 2 if high
            .opcode(opcode_reg), // 0: butterfly, 1: multiply, 2: modadd / modsub
            .a(ntt_opcode ? ram_rdata[g][0] : bf_a_polyArith[g]),
            .b(ntt_opcode ? ram_rdata[g][1] : bf_b_polyArith[g]),
            .w(ntt_opcode ? tw[g]           : bf_c_polyArith[g]),
            .e(btf_out[g][0]),
            .o(btf_out[g][1])
          );
      end
    end
  endgenerate

  // Shift register for destination address:
  shiftreg #(.DELAY(BTF_LAT+RAM_RD_LAT), .LOGQ(($clog2(PE)+1)+1+ADDR_WIDTH)) addr_delay_bf (
    .clk(clk), .data_in({dest_rom_gap,ident_store,rd_addr}), 
    .data_out({dest_rom_gap_delayed,ident_store_delayed,rd_addr_delayed}));
  shiftreg #(.DELAY(BTF_LAT+RAM_RD_LAT), .LOGQ(1)) valid_delay_bf (.clk(clk), .data_in(forward_internal ? ~rst_addr_gen_nr : ~rst_addr_gen_rn), .data_out(valid_delayed));

  // Store logic:
  logic done_DP;
  assign ram_wen   = wen & ~done_DP;
  assign ram_waddr = NUM_POLY_MEMS > 1 ? {poly_base_a_DP,waddr} : waddr;
  assign ram_raddr = NUM_POLY_MEMS > 1 ? (ntt_opcode ? {poly_base_a_DP,rd_addr} : raddr_polyArith) : rd_addr;
  assign ram_wdata = wdata;

  DataShuffler #(
      .LOGQ(LOGQ),
      .LOGN(LOGN),
      .PE(PE)
    ) data_shuffler (
      .clk(clk),
      .valid       (ntt_opcode ? valid_delayed       : valid_PolyArith),
      .ident_store (ntt_opcode ? ident_store_delayed : ident_store_PolyArith),
      .dest_rom_gap(ntt_opcode ? dest_rom_gap_delayed: dest_rom_gap_PolyArith),
      .swap_store(swap_store_PolyArith),
      .is_poly_arith(~ntt_opcode),
      .bf_rd_addr  (ntt_opcode ? rd_addr_delayed     : waddr_polyArith[ADDR_WIDTH-1:0]),
      .bf_data(btf_out),
      .wen(wen),
      .waddr(waddr),
      .wdata(wdata)
  );

  // reset generation:
  logic rst_ntt_prim, rst_ntt_sec, rst_tw_prim, rst_tw_sec, rst_tmp_prim, rst_tmp_sec;
  // latency in cc the twiddle factor should arrive at BF after the inputs:
  localparam TW_LAT_PRIM = IS_UNIFIED || IS_DIT ? RAM_RD_LAT + 1 : ADD_LAT + RAM_RD_LAT; // ? DIT : DIR
  localparam TW_LAT_SEC  = NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn" ? ADD_LAT + RAM_RD_LAT : TW_LAT_PRIM;

  localparam signed DIFF_PRIM = TW_GEN_LATENCY_PRIM - TW_LAT_PRIM;
  localparam signed DIFF_SEC = TW_GEN_LATENCY_SEC - TW_LAT_SEC;
  if(DIFF_PRIM < 0) begin // delay tw generation
    assign rst_ntt_prim = rst;
    shiftreg #(.DELAY(-DIFF_PRIM), .LOGQ(1)) rst_del1 (.clk(clk), .data_in(rst), .data_out(rst_tmp_prim));
    assign rst_tw_prim = rst_tmp_prim;
  end else begin // delay ntt
    assign rst_tw_prim = rst;
    shiftreg #(.DELAY(DIFF_PRIM), .LOGQ(1)) rst_del2 (.clk(clk), .data_in(rst), .data_out(rst_tmp_prim));
    assign rst_ntt_prim = rst_tmp_prim;
  end

  if(DIFF_SEC < 0) begin // delay tw generation
    assign rst_ntt_sec = rst;
    shiftreg #(.DELAY(-DIFF_SEC), .LOGQ(1)) rst_del3 (.clk(clk), .data_in(rst), .data_out(rst_tmp_sec));
    assign rst_tw_sec = rst_tmp_sec;
  end else begin // delay ntt
    assign rst_tw_sec = rst;
    shiftreg #(.DELAY(DIFF_SEC), .LOGQ(1)) rst_del4 (.clk(clk), .data_in(rst), .data_out(rst_tmp_sec));
    assign rst_ntt_sec = rst_tmp_sec;
  end

  if(IS_UNIFIED) begin
    assign rst_addr_gen_nr = rst_ntt_prim;
    assign rst_addr_gen_rn = rst_ntt_sec;
    assign rst_tw_gen = ntt_opcode ? (forward_internal ? rst_tw_prim : rst_tw_sec) : 1'd1;    
  end else begin
    assign rst_addr_gen_nr = rst_ntt_prim;
    assign rst_addr_gen_rn = rst_ntt_prim;
    assign rst_tw_gen = ntt_opcode ? rst_tw_prim : 1'd1;
  end

  logic done_tmp;
  assign done = ntt_opcode ? done_tmp : done_polyArith;
  shiftreg #(.DELAY(BTF_LAT+RAM_RD_LAT+DATA_SHUFFLER_LAT_OVERALL+1), .LOGQ(1)) done_delay1 (
    .clk(clk), .data_in(done_internal), .data_out(done_tmp));
  always_ff @( posedge clk ) begin
    if(rst)
      done_DP <= 1'd0;
    else if(done)
      done_DP <= 1'd1;
  end
endmodule