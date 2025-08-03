/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Twiddle factor generation for a single PE using RoutOpt DIF RN transformations
module TwiddleGen_rout_DIF_RN_peModule #(
  parameter NTT = 1,
  
  parameter LOGQ = 0,
  parameter LOGN = 0,
  parameter PE = 0,
  parameter PE_NUMBER = 2,
  parameter IS_MERGED = 0,

  // twiddle rom:
  parameter ROM_RD_LAT = 2,
  parameter MEM_TYPE = "", // options: "xpm_block", "xpm_distributed", "xpm_auto", "xpm_ultra,  
                           //          "fpga_block", "fpga_ultra", "fpga_distributed", "" (i.e., sim), "custom" (i.e., asic)
  parameter ROM_ADDR_WIDTH = 32,
  
  // integer multiplier:
  parameter INSTANTIATE_MODMULT = 1, // 1: instantiate own modular multiplier, 0: use external modular multiplier
  parameter INTMUL_LAT = 0, // should be at least 1 (valid only if INTMUL_TYPE="")
  parameter INTMUL_TYPE = "", // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)

  // modular reduction:
  parameter [LOGQ-1:0] Q_VALUE = 0, // != 0: q is constant
  parameter WORD_SIZE = 0, // Last WORD_SIZE digit of q will be 00...001
  parameter MODRED_LAT = 0,
  parameter MODRED_TYPE = "default", // options: "default" (WL Montgomery), "custom", "" (i.e., for sim)
  // parameters for default case
  parameter MODRED_L = 4,  // montgomery loop count (calculated as $ceil(LOGQ/WORD_SIZE))
  parameter MODRED_COREMUL_LAT = 1 // latency of multiply and add units in WL Montgomery	

) (
  input clk,
  input rst,
  input [LOGQ-1:0] q,
  output [LOGQ-1:0] tw_out,
  input [ROM_ADDR_WIDTH-1:0] rom_base_addr,

  output [LOGQ-1:0] modmul_a,
  output [LOGQ-1:0] modmul_b,
  input [LOGQ-1:0] modmul_c
);

  localparam N = 1<<LOGN;
  localparam MODMUL_LAT = NTT ? INTMUL_LAT + MODRED_LAT : FLP_pkg::DELAY_COMPLEX_MULT;
  
  localparam TW_ROM_DEPTH = open_ntt_pkg::ROM_ADDR_WIDTH;
  localparam string rom_filename = IS_MERGED ? $sformatf("%s/tool/RomContent/twiddle_mem_rout_Merged_DIF_RN_n%0d_pe%0d_lat%0d%s%0d.mem", open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT, !NTT?"_FFT_":MODRED_TYPE=="default"?"_MontRed_":"_", PE_NUMBER) :
                                               $sformatf("%s/tool/RomContent/twiddle_mem_rout_DIF_RN_n%0d_pe%0d_lat%0d%s%0d.mem",        open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT, !NTT?"_FFT_":MODRED_TYPE=="default"?"_MontRed_":"_", PE_NUMBER);

  // Twiddle rom instance:
  logic [TW_ROM_DEPTH-1:0] tw_rom_addr,rom_base_addr_reg;
  logic [LOGQ-1:0] tw_rom_data [0:0];

  rom #(
      .MEM_WIDTH(LOGQ),     
      .MEM_DEPTH(TW_ROM_DEPTH),
      .MEM_COUNT(1),
      .ROM_CONTENT(rom_filename),
      .READ_LATENCY(ROM_RD_LAT),
      .OUTPUT_REG(0),
      .MEM_TYPE(MEM_TYPE)
  ) tw_rom (
      .clk(clk),
      .raddr(tw_rom_addr),
      .dout(tw_rom_data)
  );

  // rst delay:
  logic rst_internal;
  if (MODMUL_LAT % 2 == 1) begin
    always_ff @( posedge clk ) begin
      rst_internal <= rst;
    end
  end else begin
    assign rst_internal = rst;
  end

  // stage iterator:
  logic [$clog2(LOGN)-1:0] s_i;
  logic stage_done_initial;
  always_ff @( posedge clk ) begin
    if (rst_internal) begin
      s_i <= 0;
    end else if (stage_done_initial && s_i != LOGN-1) begin
      s_i <= s_i + 1;
    end
  end

  // butterfly iterator:
  logic [$clog2(N/2/PE)-1:0] i_i, i_rom;
  always_ff @( posedge clk ) begin
    if (rst_internal) begin
      i_i <= 0;
    end else begin
      i_i <= i_i + 1;
    end
  end
  assign stage_done_initial = i_i == {$clog2(N/2/PE){1'd1}};
  shiftreg #(.DELAY(ROM_RD_LAT+1), .LOGQ($clog2(N/2/PE))) i_del0 (
          .clk(clk),
          .data_in(i_i),
          .data_out(i_rom)
      );

  // rom address generation logic:
  logic [$clog2(N/2/PE):0] nr_rep;
  logic rep;
  logic inc_rom_addr, sub_nr_rep_rom_addr, sub_modmullat_rom_addr;
  always_ff @( posedge clk ) begin
    rom_base_addr_reg <= rom_base_addr[TW_ROM_DEPTH-1:0];
    if (rst)
      tw_rom_addr <= rom_base_addr_reg;
    else if(sub_nr_rep_rom_addr)
      tw_rom_addr <= tw_rom_addr - nr_rep + 1;
    else if(sub_modmullat_rom_addr)
      tw_rom_addr <= tw_rom_addr - MODMUL_LAT + 1;
    else if(inc_rom_addr)
      tw_rom_addr <= tw_rom_addr + 1'd1;
  end
  logic is_omega_c_addr, is_omega_c_addr_delayed;
  logic  [$clog2(N/2/PE)-1:0] i_p_1;
  assign i_p_1 = MODMUL_LAT%2 == 0 ? i_i+1 : i_i+2;
  assign is_omega_c_addr = rst_internal || i_p_1 < (MODMUL_LAT%2 == 0 ? 1 : 2) && (nr_rep >> 1 > MODMUL_LAT);
  shiftreg #(.DELAY(ROM_RD_LAT+1), .LOGQ(1)) is_omega_c_addr_delay (
    .clk(clk),
    .data_in(is_omega_c_addr),
    .data_out(is_omega_c_addr_delayed)
  );

  logic take_from_rom,take_from_rom_delayed;
  always_comb begin
    inc_rom_addr = is_omega_c_addr;
    sub_nr_rep_rom_addr = 1'd0;
    sub_modmullat_rom_addr = 1'd0;
    take_from_rom = 1'd1;
    if(nr_rep < MODMUL_LAT) begin
      inc_rom_addr = 1'd1;
      sub_nr_rep_rom_addr = (i_i & (nr_rep-1)) == {$clog2(N/2/PE){1'd0}} && i_i != {$clog2(N/2/PE){1'd0}};
    end else if(i_i < MODMUL_LAT) begin
      inc_rom_addr = 1'd1;
    end else if(rep && (i_i & ((1<<$clog2(MODMUL_LAT)) - 1)) < MODMUL_LAT)begin
      inc_rom_addr = 1'd1;
      sub_modmullat_rom_addr = (i_i>>$clog2(MODMUL_LAT)<<$clog2(MODMUL_LAT)) == i_i;
    end else begin
      take_from_rom = 1'd0;
    end
  end
  shiftreg #(.DELAY(ROM_RD_LAT+1), .LOGQ(1)) take_from_rom_delay (
    .clk(clk),
    .data_in(take_from_rom),
    .data_out(take_from_rom_delayed)
  );

  // control signals:
  logic stage_repeats;
  assign stage_repeats = s_i != {$clog2(LOGN){1'd0}};
  logic [$clog2(N/2/PE)-1:0] t;
  assign t = $clog2(N/2/PE) > $clog2(MODMUL_LAT) ? {i_i[$clog2(N/2/PE)-1:$clog2(MODMUL_LAT)], {$clog2(MODMUL_LAT){1'd0}}} : 0;
  assign rep = s_i >= LOGN-1-$clog2(PE) ? 1'd1 : (stage_repeats && (t & (N/2/PE-1 >> (s_i))) == {$clog2(N/2/PE){1'd0}} && i_i != {$clog2(N/2/PE){1'd0}});

  always_ff @( posedge clk ) begin
    if (rst_internal)
      nr_rep <= N/2/PE;
    else if (stage_done_initial && nr_rep[0] == 1'd0)
      nr_rep <= nr_rep >> 1;
  end

  ////////////// data path ////////////
  logic [LOGQ-1:0] tw_out_internal_DP;

  // omega_c:
  logic update_omega_c, update_omega_c_1DP;
  logic [LOGQ-1:0] omega_c [0:1];
  logic [LOGQ-1:0] omega_c_1DP [0:1];
  always_ff @( posedge clk ) begin
    if(rst_internal) begin
      omega_c[0] <= tw_rom_data[0];
      omega_c[1] <= tw_rom_data[0];
    end else if(update_omega_c) begin
      if (update_omega_c_1DP && update_omega_c && MODMUL_LAT % 2 == 1)  
        omega_c[1] <= tw_rom_data[0];
      else 
        omega_c[0] <= tw_rom_data[0];
    end
    omega_c_1DP <= omega_c;
    update_omega_c_1DP <= update_omega_c;
  end
  assign update_omega_c = is_omega_c_addr_delayed;


  // modmult
  logic [LOGQ-1:0] modmul_in;
  logic [LOGQ-1:0] modmul_omega_in;
  logic [LOGQ-1:0] modmul_out;
  logic omega_c_sel;
  logic first_fill;
  assign first_fill = s_i == {$clog2(LOGN){1'd0}} && i_rom < MODMUL_LAT;
  assign omega_c_sel = MODMUL_LAT % 2 == 0 ? 1'd0 : i_rom[0];
  assign modmul_in        = i_rom < MODMUL_LAT || take_from_rom_delayed ? tw_rom_data[0] : modmul_out;
  assign modmul_omega_in  = omega_c[omega_c_sel];

  logic [2*LOGQ-1:0] imul;
  if(INSTANTIATE_MODMULT) begin  
    if(NTT) begin
      logic [2*LOGQ-1:0] imul;
      logic [LOGQ-1:0] q_reg;
      shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_q (.clk(clk),.data_in(q),.data_out(q_reg));
      intmul #(LOGQ,LOGQ,INTMUL_LAT,INTMUL_TYPE) intmul_i(clk,modmul_in,modmul_omega_in,imul);
      modred #(LOGQ,Q_VALUE,WORD_SIZE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT) modred_i(clk,imul,q_reg,modmul_out);
    end else begin
      ComplexMultiplier cmul (
            .clk(clk),
            .start(),
            .a(modmul_in),
            .b(modmul_omega_in),
            .c(modmul_out),
            .done()
          );
    end
  end else begin
    assign modmul_a = modmul_in;
    assign modmul_b = modmul_omega_in;
    assign modmul_out = modmul_c;
  end

  // output logic:
  always @(posedge clk) begin
    tw_out_internal_DP <= first_fill || take_from_rom_delayed ? tw_rom_data[0] : modmul_out;
  end 
  assign tw_out = tw_out_internal_DP;
endmodule
