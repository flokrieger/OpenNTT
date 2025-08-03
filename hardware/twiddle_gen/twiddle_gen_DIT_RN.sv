/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Parametric twiddle factor generation for MemOpt DIT RN transformations
module TwiddleGen_DIT_RN 
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
  localparam MODMUL_LAT_CEIL = MUL_LAT == 4 || MUL_LAT == 8 || MUL_LAT == 16 ? 2<<$clog2(MUL_LAT) : 1<<$clog2(MUL_LAT);
  if(MUL_LAT <= 1 || (MODMUL_LAT_CEIL != 4 && MODMUL_LAT_CEIL != 8 && MODMUL_LAT_CEIL != 16 && MODMUL_LAT_CEIL != 32)) $error("Invalid modred latency\n");
  localparam SPECIAL_STAGE = LOGN - $clog2(PE) - $clog2(MODMUL_LAT_CEIL);
  
  localparam TW_ROM_DEPTH = open_ntt_pkg::ROM_ADDR_WIDTH;
  localparam string rom_filename = NTT ? $sformatf("%s/tool/RomContent/twiddle_mem_DIT_RN_n%0d_pe%0d_lat%0d_MontRed_0.mem", open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT_CEIL) : 
                                         $sformatf("%s/tool/RomContent/twiddle_mem_DIT_RN_n%0d_pe%0d_lat%0d_FFT_0.mem",     open_ntt_pkg::OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT_CEIL);

  if (N/2/PE <= 2* MODMUL_LAT_CEIL)
    $error("Invalid MODMUL_LAT_CEIL");
    
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
  logic [$clog2(N/2/PE)-1:0] i, i_delayed;
  always_ff @( posedge clk ) begin
    if (rst) begin
      i <= 0;
    end else begin
      i <= i + 1;
    end
  end
  assign stage_done = i == {$clog2(N/2/PE){1'd1}};
  
  // rom address generation logic:
  logic [TW_ROM_DEPTH-1:0] cache_counter,rom_base_addr_reg;
  logic update_omega_c_from_cache, update_omega_c, update_new_omega_counter;
  logic [$clog2(MODMUL_LAT_CEIL):0] magic;

  always_ff @( posedge clk ) begin
    rom_base_addr_reg <= rom_base_addr[TW_ROM_DEPTH-1:0];
    if (rst) begin
      cache_counter <= rom_base_addr_reg;
    end else begin
      if (update_omega_c_from_cache || update_new_omega_counter || s == {$clog2(LOGN){1'd0}} && i == {$clog2(N/2/PE){1'd0}})
        cache_counter <= cache_counter + 1;
    end
  end
  logic [$clog2(MODMUL_LAT_CEIL):0] added_fifo;
  assign update_new_omega_counter = added_fifo == MODMUL_LAT_CEIL-2 && s >= SPECIAL_STAGE-1 && (!(magic != {($clog2(MODMUL_LAT_CEIL)+1){1'd0}} && ((i+1 & magic) == {($clog2(N/2/PE)){1'd0}})) || magic == {($clog2(MODMUL_LAT_CEIL)+1){1'd0}}) && ((i+1 & magic-1) == magic-1 || magic == {($clog2(MODMUL_LAT_CEIL)+1){1'd0}});
  assign tw_rom_addr = cache_counter;
  assign update_omega_c_from_cache = stage_done &&  s < SPECIAL_STAGE-1;
  assign update_omega_c            = stage_done && (s < SPECIAL_STAGE-1 || s > LOGN-2-$clog2(PE));

  logic add_to_fifo0,add_to_fifo1;
  always_ff @( posedge clk ) begin
    if(rst || stage_done)
      added_fifo <= 0;
    else if(add_to_fifo0 || add_to_fifo1)
      added_fifo <= added_fifo + add_to_fifo0 + add_to_fifo1;
  end
  assign add_to_fifo0 = added_fifo < MODMUL_LAT_CEIL && (s < SPECIAL_STAGE-1 && i[0] == 1'd0 ||                         (   magic != {($clog2(MODMUL_LAT_CEIL)+1){1'd0}} && ((i & magic) == 0)  || magic == {($clog2(MODMUL_LAT_CEIL)+1){1'd0}}));
  assign add_to_fifo1 = added_fifo < MODMUL_LAT_CEIL && (s < SPECIAL_STAGE-1 && i[0] == 1'd1 || s >= SPECIAL_STAGE-1 && ((!(magic != {($clog2(MODMUL_LAT_CEIL)+1){1'd0}} && ((i & magic) == 0)) || magic == {($clog2(MODMUL_LAT_CEIL)+1){1'd0}})));

  // control signals
  logic [$clog2(N/2/PE):0] tmp;
  assign tmp = N/2/PE >> s;
  logic update_mult;
  assign update_mult = i > 0 && (tmp == {($clog2(N/2/PE)+1){1'd0}} || ((i & (tmp-1)) == {($clog2(N/2/PE)){1'd0}}));
  logic last_butterflies, last_butterflies_1DP;
  assign last_butterflies = i >= {$clog2(N/2/PE){1'd1}} - MODMUL_LAT_CEIL+1 || rst;
  always_ff @( posedge clk ) begin
    last_butterflies_1DP <= last_butterflies;
  end

  assign magic = MODMUL_LAT_CEIL >> (s-SPECIAL_STAGE+2);

  ////////////// data path ////////////
  logic [LOGQ-1:0] one_reg;
  always_ff @( posedge clk ) begin
    if(rst)
      one_reg <= tw_rom_data[0];
  end

  logic [LOGQ-1:0] tw_out_internal [0:PE-1];
  logic [LOGQ-1:0] modmul_out_delayed [0:PE-1];
  logic [LOGQ-1:0] fifo_dout,fifo_dout_1DP,fifo0_last_data_in,fifo0_last_data_in_1DP;

  // wi register:
  logic [LOGQ-1:0] wi [0:PE-1];
  generate
    for(genvar g=1; g < PE; g=g+1) begin
      always @(posedge clk) begin
        if((g & 1) == 1) begin // odd
          if(rst)
            wi[g] <= one_reg;
          else if ( i == {1'd1, {($clog2(N/2/PE)-1){1'd0}}} && s >= LOGN-$clog2(PE)-1) // half of stage is done
            wi[g] <= modmul_out_delayed[g/2];
        end else begin// even
          if(rst)
            wi[g] <= one_reg;
          else if ( i == {$clog2(N/2/PE){1'd0}} )
            wi[g] <= modmul_out_delayed[g/2];
        end
      end
    end
  endgenerate
  assign wi[0] = one_reg;

  // omega_c:
  logic [LOGQ-1:0] omega_c, omega_c_next;
  always_ff @( posedge clk ) begin
    if (rst)
      omega_c <= one_reg;
    else if(update_omega_c)
      omega_c <= update_omega_c_from_cache ? tw_rom_data[0] : omega_c_next;

    if(i == MODMUL_LAT_CEIL/2+1)
      omega_c_next <= tw_out_internal[0];
  end

  // modmult
  logic [LOGQ-1:0] modmul_in [0:PE-1];
  logic [LOGQ-1:0] modmul_omega_in [0:PE-1];
  logic fifo_1_shift_in, fifo_1_shift_in_delayed;
  shiftreg #(.DELAY(MODMUL_LAT_CEIL-1),.LOGQ(1)) sr_fifo1_shift_in (.clk(clk),.data_in(fifo_1_shift_in),.data_out(fifo_1_shift_in_delayed));
  generate
    for(genvar g=0; g < PE; g=g+1) begin
      if (g==PE/2)begin
        assign modmul_in[g]       = fifo_1_shift_in ? tw_rom_data[0]     : last_butterflies_1DP ? fifo_dout_1DP : tw_out_internal[g];
        assign modmul_omega_in[g] = fifo_1_shift_in ? (s >= LOGN-$clog2(PE)-1 ? fifo0_last_data_in_1DP : fifo0_last_data_in) : last_butterflies_1DP ? wi[g] : omega_c;
      end else begin
        assign modmul_in[g] = last_butterflies_1DP ? fifo_dout_1DP : tw_out_internal[g];
        assign modmul_omega_in[g] = last_butterflies_1DP ? wi[g] : omega_c;
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

  // fifo:
  logic fifo_shift [0:1];
  logic [LOGQ-1:0] fifo_din[0:1];
  logic [LOGQ-1:0] fifo_dout_tmp[0:1];
  always_ff @( posedge clk ) begin
    fifo0_last_data_in_1DP <= fifo0_last_data_in;
  end
  FIFO #(.DEPTH(MODMUL_LAT_CEIL/2), .WIDTH(LOGQ)) fifo0 (
    .clk(clk),
    .rst(rst),
    .rst_val(one_reg),
    .shift(fifo_shift[0]), 
    .data_in(fifo_din[0]),
    .data_out(fifo_dout_tmp[0]),
    .last_data_in(fifo0_last_data_in)
  );
  FIFO #(.DEPTH(MODMUL_LAT_CEIL/2), .WIDTH(LOGQ)) fifo1 (
    .clk(clk),
    .rst(rst),
    .rst_val(one_reg),
    .shift(fifo_shift[1]), 
    .data_in(fifo_din[1]),
    .data_out(fifo_dout_tmp[1]),
    .last_data_in()
  );
  assign fifo_shift[0] = add_to_fifo0 || (last_butterflies && s >= SPECIAL_STAGE && i[0] == 1'd0);
  
  logic add_to_fifo1_1DP,add_to_fifo1_2DP;
  assign fifo_1_shift_in = s != LOGN-1 && (s >= LOGN-$clog2(PE)-1 ? add_to_fifo1_2DP : add_to_fifo1);
  assign fifo_shift[1] = fifo_1_shift_in_delayed || (last_butterflies && s >= SPECIAL_STAGE && i[0] == 1'd1);
  always_ff @( posedge clk ) begin
    add_to_fifo1_1DP <= add_to_fifo1;
    add_to_fifo1_2DP <= add_to_fifo1_1DP;
  end
  
  assign fifo_din[0] = i < MODMUL_LAT_CEIL-1 ? modmul_out_delayed[0] : 
                          update_mult    ? modmul_out_delayed[0] :
                          tw_out_internal[0];
  assign fifo_din[1] = s < SPECIAL_STAGE-1 ? tw_out_internal[0] : modmul_out_delayed[PE/2];
  logic fifo_dout_sel;
  assign fifo_dout_sel = ($clog2(MODMUL_LAT_CEIL)-1) < (s-SPECIAL_STAGE+1) ? i[0] : i[($clog2(MODMUL_LAT_CEIL)-1)-(s-SPECIAL_STAGE+1)];
  assign fifo_dout = fifo_dout_sel ? fifo_dout_tmp[1] : fifo_dout_tmp[0];

  always_ff @( posedge clk ) begin
    fifo_dout_1DP <= fifo_dout;
  end
  // output logic:
  generate
    for(genvar g=0; g < PE; g=g+1) begin
      always @(posedge clk) begin
        if(g==PE/2)begin
          tw_out_internal[g] <= i < MODMUL_LAT_CEIL-1 || update_mult ? (s == LOGN-1 ? modmul_out_delayed[g] : modmul_out_delayed[0]) : 
                                tw_out_internal[g];  
        end else begin
          tw_out_internal[g] <= i < MODMUL_LAT_CEIL-1 || update_mult ? modmul_out_delayed[g] : 
                                tw_out_internal[g];  
        end
      end 
    end
  endgenerate
  assign tw_out = tw_out_internal;
endmodule
