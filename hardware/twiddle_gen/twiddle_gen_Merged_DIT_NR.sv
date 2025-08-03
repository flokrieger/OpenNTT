/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps


// Parametric twiddle factor generation for MemOpt merged DIT NR transformations
module TwiddleGen_Merged_DIT_NR 
  import FLP_pkg::*;
  #(
  parameter NTT = 1,
  
  parameter LOGQ = 0,
  parameter LOGN = 0,
  parameter PE = 2,

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
  output [LOGQ-1:0] tw_out [0:PE-1],
  input [ROM_ADDR_WIDTH-1:0] rom_base_addr,

  output [LOGQ-1:0] modmul_a[0:PE-1],
  output [LOGQ-1:0] modmul_b[0:PE-1],
  input [LOGQ-1:0] modmul_c[0:PE-1]
);

  localparam N = 1<<LOGN;
  localparam MUL_LAT = NTT ? INTMUL_LAT + MODRED_LAT : DELAY_COMPLEX_MULT;
  localparam MODMUL_LAT_CEIL = MUL_LAT <= 4 || MUL_LAT == 8 || MUL_LAT == 16 ? 2<<$clog2(MUL_LAT) : 1<<$clog2(MUL_LAT);
  if(MUL_LAT <= 1 || (MODMUL_LAT_CEIL != 4 && MODMUL_LAT_CEIL != 8 && MODMUL_LAT_CEIL != 16 && MODMUL_LAT_CEIL != 32)) $error("Invalid modred latency\n");
  localparam SPECIAL_STAGE = LOGN-$clog2(MODMUL_LAT_CEIL);
  localparam SUB_VAL = MODMUL_LAT_CEIL == 4 ? 1 : MODMUL_LAT_CEIL == 8 ? 3 : MODMUL_LAT_CEIL == 16 ? 7 : 15;
  
  localparam TW_ROM_DEPTH = open_ntt_pkg::ROM_ADDR_WIDTH;
  localparam string rom_filename = NTT ? $sformatf("%s/tool/RomContent/twiddle_mem_Merged_DIT_NR_n%0d_pe%0d_lat%0d_MontRed_0.mem", open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT_CEIL) :
                                         $sformatf("%s/tool/RomContent/twiddle_mem_Merged_DIT_NR_n%0d_pe%0d_lat%0d_FFT_0.mem",     open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT_CEIL);

  if (N/2/PE <= 2* MODMUL_LAT_CEIL)
    $error("Invalid MODMUL_LAT_CEIL");

  // logic to initialize one_reg
  logic rst_1DP,update_one,update_one_delayed;
  always_ff @( posedge clk ) begin
    rst_1DP <= rst;
  end
  assign update_one = rst & ~rst_1DP;
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ(1)) sr0 (
      .clk(clk),
      .data_in(update_one),
      .data_out(update_one_delayed)
  );

  // Twiddle rom instance:
  logic [TW_ROM_DEPTH-1:0] tw_rom_addr;
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

  // stage iterator:
  logic [$clog2(LOGN)-1:0] s;
  logic stage_done;
  always_ff @( posedge clk ) begin
    if (rst) begin
      s <= 0;
    end else if (stage_done && s != LOGN-1) begin
      s <= s + 1;
    end
  end
  
  // butterfly iterator:
  logic [$clog2(N/2/PE)-1:0] i, i_adv, i_1DP;
  always_ff @( posedge clk ) begin
    if (rst) begin
      i <= 0;
    end else begin
      i <= i + 1;
    end
    i_1DP <= i;
  end
  assign stage_done = i == {$clog2(N/2/PE){1'd1}};
  
  // rom address generation logic:
  logic [TW_ROM_DEPTH-1:0] cache_counter,rom_base_addr_reg;
  logic update_omega_c, update_cache_counter,update_cache_counter_tmp,update_cache_counter_tmp2;
  always_ff @( posedge clk ) begin
    rom_base_addr_reg <= rom_base_addr[TW_ROM_DEPTH-1:0];
    if (rst) begin
      cache_counter <= rom_base_addr_reg+1;
    end else begin
      if(update_cache_counter)
      cache_counter <= cache_counter + 1'd1;
    end
  end
  assign update_omega_c = s >= $clog2(PE) && s < LOGN - $clog2(MODMUL_LAT_CEIL) - 1 && i == {$clog2(N/2/PE){1'd1}}-MODMUL_LAT_CEIL;
  assign tw_rom_addr = update_one ? rom_base_addr_reg : cache_counter;

  // control signals:
  logic update_mult;
  assign update_mult = i != {($clog2(N/2/PE)){1'd0}} && (i & ((N/2-1) >> s)) == {($clog2(N/2/PE)){1'd0}};
  assign i_adv = i+ROM_RD_LAT+MODMUL_LAT_CEIL;
  assign update_cache_counter_tmp = i >= N/2/PE-MODMUL_LAT_CEIL-1;
  assign update_cache_counter_tmp2 = ((i+1+MODMUL_LAT_CEIL-SUB_VAL) & (MODMUL_LAT_CEIL/2-1 >> s-SPECIAL_STAGE+1)) == {$clog2(N/2/PE){1'd0}};
  assign update_cache_counter = s < SPECIAL_STAGE && i == MODMUL_LAT_CEIL-1-1 || s >= SPECIAL_STAGE-1 && update_cache_counter_tmp && update_cache_counter_tmp2;

  //////// datapath /////////////
  logic [LOGQ-1:0] one_reg;
  always_ff @( posedge clk ) begin
    if(update_one_delayed)
      one_reg <= tw_rom_data[0];
  end

  logic [LOGQ-1:0] tw_out_internal_DP [0:PE-1];
  logic [LOGQ-1:0] omega_i [1:PE-1];

  // omega_c
  logic [LOGQ-1:0] omega_c, omega_c_next;
  always_ff @( posedge clk ) begin
    if (rst)
      omega_c <= one_reg;
    else if(update_omega_c)
      omega_c <= omega_c_next;

    if(i_1DP == {($clog2(N/2/PE)){1'd0}} || PE > 1)
      omega_c_next <= PE > 1 ? omega_i[1] : tw_out_internal_DP[0];
  end

  logic [LOGQ-1:0] omega_i_next [PE/2:PE-1];
  logic [LOGQ-1:0] omega_i_DN [1:PE-1];
  logic update_omega_i, update_omega_i_next;
  assign update_omega_i = i+MODMUL_LAT_CEIL == {$clog2(N/2/PE){1'd1}};
  assign update_omega_i_next = i_1DP == {$clog2(N/2/PE){1'd0}};
  generate
    for(genvar g=1; g < PE; g=g+1) begin
      always_ff @( posedge clk ) begin
        if (rst)
          omega_i[g] <= one_reg;
        else if(update_omega_i)
          omega_i[g] <= omega_i_DN[g];
      end
    end
  endgenerate
  
  generate
    for(genvar g=1; g < PE/2; g=g+1) begin
      assign omega_i_DN[g] = omega_i[2*g];
    end 
    for(genvar g=PE/2; g < PE; g=g+1) begin
      assign omega_i_DN[g] = omega_i_next[g];
    
      always_ff @( posedge clk ) begin
        if(update_omega_i_next)
          omega_i_next[g] <= tw_out_internal_DP[(g-PE/2)*2];
      end
    end 
  endgenerate

  // modmult
  logic [LOGQ-1:0] modmul_out_delayed [0:PE-1];
  logic [LOGQ-1:0] modmul_in [0:PE-1];
  logic [LOGQ-1:0] modmul_omega_in [0:PE-1];
  generate
    for(genvar g=0; g < PE; g=g+1) begin
      if(g == 0) begin
        assign modmul_in[g]       = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? tw_rom_data[0] : rst ? tw_rom_data[0] : tw_out_internal_DP[g];
        assign modmul_omega_in[g] = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? one_reg : omega_c;
      end else begin
        assign modmul_in[g]       = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? tw_rom_data[0] : rst ? tw_rom_data[0] : tw_out_internal_DP[g];
        assign modmul_omega_in[g] = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? omega_i[g] : omega_c;
      end

      logic [LOGQ-1:0] modmul_out;
      if(INSTANTIATE_MODMULT) begin
        if(NTT) begin
          logic [2*LOGQ-1:0] imul;
          logic [LOGQ-1:0] q_reg;
          shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_q (.clk(clk),.data_in(q),.data_out(q_reg));
          intmul #(LOGQ,LOGQ,INTMUL_LAT,INTMUL_TYPE) intmul_i(clk,modmul_in[g],modmul_omega_in[g],imul);
          modred #(LOGQ,Q_VALUE,WORD_SIZE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT) modred_i(clk,imul,q_reg,modmul_out);
        end else begin
          ComplexMultiplier cmul (
            .clk(clk),
            .start(),
            .a(modmul_in[g]),
            .b(modmul_omega_in[g]),
            .c(modmul_out),
            .done()
          );
        end
      end else begin
        assign modmul_a[g] = modmul_in[g];
        assign modmul_b[g] = modmul_omega_in[g];
        assign modmul_out = modmul_c[g];
      end
      shiftreg #(
          .DELAY(MODMUL_LAT_CEIL-MUL_LAT-1), 
          .LOGQ(LOGQ)
      ) sr (
          .clk(clk),
          .data_in(modmul_out),
          .data_out(modmul_out_delayed[g])
      );
    end
  endgenerate

  
  // output logic:
  logic [LOGQ-1:0] tw_out_internal_DN [0:PE-1];
  generate
    for(genvar g=0; g < PE; g=g+1) begin
      assign tw_out_internal_DN[g] = i < MODMUL_LAT_CEIL ? modmul_out_delayed[g] :
                                     update_mult    ? modmul_out_delayed[g] :
                                     tw_out_internal_DP[g];
      always @(posedge clk) begin
        tw_out_internal_DP[g] <= tw_out_internal_DN[g];
      end 
    end
  endgenerate
  assign tw_out = tw_out_internal_DP;
endmodule
