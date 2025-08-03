/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Parametric twiddle factor generation for MemOpt DIT transformations with 1 PE
module TwiddleGen_DIT_PE1 
    import FLP_pkg::*;
    #(
    parameter NTT = 1,
    
    parameter LOGQ = 0,
    parameter LOGN = 0,
    parameter NR = 0,
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
    output [LOGQ-1:0] tw_out [0:0],
    input [ROM_ADDR_WIDTH-1:0] rom_base_addr,

    output [LOGQ-1:0] modmul_a[0:0],
    output [LOGQ-1:0] modmul_b[0:0],
    input [LOGQ-1:0] modmul_c[0:0]
  );

  localparam N = 1<<LOGN;
  localparam MUL_LAT = NTT ? INTMUL_LAT + MODRED_LAT : DELAY_COMPLEX_MULT;
  localparam MODMUL_LAT_CEIL = MUL_LAT == 4 || MUL_LAT == 8 || MUL_LAT == 16 ? 2<<$clog2(MUL_LAT) : 1<<$clog2(MUL_LAT);
  if(MUL_LAT <= 1 || (MODMUL_LAT_CEIL != 4 && MODMUL_LAT_CEIL != 8 && MODMUL_LAT_CEIL != 16 && MODMUL_LAT_CEIL != 32)) $error("Invalid modred latency\n");
  localparam PE = 1;
  
  localparam TW_ROM_DEPTH = open_ntt_pkg::ROM_ADDR_WIDTH;
  localparam rom_filename = NTT ? $sformatf("%s/tool/RomContent/twiddle_mem_DIT_%s_n%0d_pe1_lat%0d_MontRed_0.mem", open_ntt_pkg::OPEN_NTT_PATH, NR ? "NR" : "RN", 1<<LOGN, MODMUL_LAT_CEIL) : 
                                  $sformatf("%s/tool/RomContent/twiddle_mem_DIT_%s_n%0d_pe1_lat%0d_FFT_0.mem",     open_ntt_pkg::OPEN_NTT_PATH, NR ? "NR" : "RN", 1<<LOGN, MODMUL_LAT_CEIL);

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

  // rom address generation logic:
  logic [TW_ROM_DEPTH-1:0] cache_counter,rom_base_addr_reg;
  logic update_cache_counter, update_omega_c;

  always_ff @( posedge clk ) begin
    rom_base_addr_reg <= rom_base_addr[TW_ROM_DEPTH-1:0];
    if (rst) begin
      cache_counter <= rom_base_addr_reg;
    end else if (update_cache_counter) begin
      cache_counter <= cache_counter + 1;
    end
  end
  assign tw_rom_addr = cache_counter;

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
  logic [$clog2(N/2)-1:0] i, i_delayed;
  always_ff @( posedge clk ) begin
    if (rst) begin
      i <= 0;
    end else begin
      i <= i + 1;
    end
  end
  assign stage_done = i == {$clog2(N/2){1'd1}};
  
  assign update_cache_counter = (i < MODMUL_LAT_CEIL && i != 0 && (i & ((N/2 >> s) - 1)) == 0 && s > LOGN-$clog2(MODMUL_LAT_CEIL)) || update_omega_c || (s == {$clog2(LOGN){1'd0}} && i == {$clog2(N/2){1'd0}});

  // control_signals:
  logic update_mult,update_mult_delayed;
  shiftreg #(
    .DELAY(ROM_RD_LAT+1), 
    .LOGQ($clog2(N/2)+1)
  ) sr1 (
      .clk(clk),
      .data_in({update_mult,i}),
      .data_out({update_mult_delayed,i_delayed})
  );
  assign update_mult = i != 0 && (i & ((N/2 >> s) - 1)) == 0;
  assign update_omega_c = i+ROM_RD_LAT-1 == {$clog2(N/2){1'd1}} && (s < LOGN-$clog2(MODMUL_LAT_CEIL)-1 || s > LOGN-2) && s != LOGN-1;

  // datapath:
  logic [LOGQ-1:0] one_reg;
  always_ff @( posedge clk ) begin
    if(rst)
      one_reg <= tw_rom_data[0];
  end

  logic [LOGQ-1:0] modmul_out, modmul_out_delayed, modmul_in, omega_c;
  if(INSTANTIATE_MODMULT) begin
    if(NTT) begin
      logic [2*LOGQ-1:0] imul;
      logic [LOGQ-1:0] q_reg;
      shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_q (.clk(clk),.data_in(q),.data_out(q_reg));
      intmul #(LOGQ,LOGQ,INTMUL_LAT,INTMUL_TYPE) intmul_i(clk,modmul_in,omega_c,imul);
      modred #(LOGQ,Q_VALUE,WORD_SIZE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT) modred_i(clk,imul,q_reg,modmul_out);
    end else begin
      ComplexMultiplier cmul (
            .clk(clk),
            .start(),
            .a(modmul_in),
            .b(omega_c),
            .c(modmul_out),
            .done()
          );
    end
  end else begin
    assign modmul_a[0] = modmul_in;
    assign modmul_b[0] = omega_c;
    assign modmul_out = modmul_c[0];
  end
  shiftreg #(
      .DELAY(MODMUL_LAT_CEIL-MUL_LAT-1), 
      .LOGQ(LOGQ)
  ) sr (
      .clk(clk),
      .data_in(modmul_out),
      .data_out(modmul_out_delayed)
  );

  logic [LOGQ-1:0] tw_out_internal;
  always_ff @( posedge clk ) begin
    tw_out_internal <= i_delayed < (N/2 >> s) ? one_reg : 
                       i_delayed < MODMUL_LAT_CEIL ? tw_rom_data[0] :
                       update_mult_delayed ? modmul_out_delayed :
                       tw_out_internal;
  end
  assign modmul_in = tw_out_internal;
  assign tw_out[0] = tw_out_internal;

  // omega_c:
  always_ff @( posedge clk ) begin
    if (rst)
      omega_c <= one_reg;
    else if(update_omega_c)
      omega_c <= tw_rom_data[0];
  end

endmodule