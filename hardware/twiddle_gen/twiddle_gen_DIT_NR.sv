/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps
`include "package.svh"

// Parametric twiddle factor generation for DIT NR NTT
module TwiddleGen_DIT_NR #(
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
  localparam MUL_LAT = INTMUL_LAT + MODRED_LAT;
  localparam MODMUL_LAT_CEIL = MUL_LAT == 4 || MUL_LAT == 8 || MUL_LAT == 16 ? 2<<$clog2(MUL_LAT) : 1<<$clog2(MUL_LAT);
  if(MUL_LAT <= 1 || (MODMUL_LAT_CEIL != 4 && MODMUL_LAT_CEIL != 8 && MODMUL_LAT_CEIL != 16 && MODMUL_LAT_CEIL != 32)) $error("Invalid modred latency\n");
  localparam SPECIAL_STAGE = LOGN-$clog2(MODMUL_LAT_CEIL);
  
  localparam TW_ROM_DEPTH = `ROM_ADDR_WIDTH;
  localparam string rom_filename = $sformatf("%s/tool/RomContent/twiddle_mem_DIT_NR_n%0d_pe%0d_lat%0d_MontRed_0.mem", `OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT_CEIL);

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
  logic [TW_ROM_DEPTH-1:0] omega_i_counter,rom_base_addr_reg;
  logic update_omega_c, update_omega_i_counter;
  always_ff @( posedge clk ) begin
    rom_base_addr_reg <= rom_base_addr[TW_ROM_DEPTH-1:0];
    if (rst) begin
      omega_i_counter <= rom_base_addr_reg;
    end else begin
      if(update_omega_i_counter)
        omega_i_counter <= omega_i_counter + 1'd1;
    end
  end
  assign update_omega_c = s >= $clog2(PE) && s < LOGN - $clog2(MODMUL_LAT_CEIL) - 1 && i == {$clog2(N/2/PE){1'd1}}-MODMUL_LAT_CEIL;
  assign tw_rom_addr = omega_i_counter;

  // control signals:
  logic update_mult;
  assign update_mult = i != {($clog2(N/2/PE)){1'd0}} && (i & ((N/2-1) >> s)) == {($clog2(N/2/PE)){1'd0}};
  assign i_adv = i+ROM_RD_LAT+MODMUL_LAT_CEIL;
  assign update_omega_i_counter = s > 0 && i_adv == {$clog2(N/2/PE){1'd1}} || s == {$clog2(LOGN){1'd0}} && i == {$clog2(N/2/PE){1'd0}};

  //////// datapath /////////////
  logic [LOGQ-1:0] one_reg;
  always_ff @( posedge clk ) begin
    if(rst)
      one_reg <= tw_rom_data[0];
  end

  logic [LOGQ-1:0] tw_out_internal_DN [0:PE-1];
  logic [LOGQ-1:0] tw_out_internal_DP [0:PE-1];
  logic [LOGQ-1:0] fifo_dout[0:PE/2-1];
  // omega_c
  logic [LOGQ-1:0] omega_c, omega_c_next;
  always_ff @( posedge clk ) begin
    if (rst)
      omega_c <= one_reg;
    else if(update_omega_c)
      omega_c <= omega_c_next;

    if(i == {{($clog2(N/2/PE)-1){1'd0}}, 1'd1})
      omega_c_next <= tw_out_internal_DP[1];
  end

  // modmult
  logic [LOGQ-1:0] modmul_out_delayed [0:PE-1];
  logic [LOGQ-1:0] modmul_in [0:PE-1];
  logic [LOGQ-1:0] modmul_omega_in [0:PE-1];
  generate
    for(genvar g=0; g < PE; g=g+1) begin
      if(g < PE/2) begin
        assign modmul_in[g]       = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? fifo_dout[g] : rst ? one_reg : tw_out_internal_DP[g];
        assign modmul_omega_in[g] = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? one_reg : omega_c;
      end else begin
        assign modmul_in[g]       = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? tw_rom_data[0] : rst ? one_reg : tw_out_internal_DP[g];
        assign modmul_omega_in[g] = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 ? fifo_dout[g-PE/2] : omega_c;
      end

      logic [LOGQ-1:0] modmul_out;
      if(INSTANTIATE_MODMULT) begin
        logic [2*LOGQ-1:0] imul;
        logic [LOGQ-1:0] q_reg;
        shiftreg #(.DELAY(2), .LOGQ(LOGQ)) sr_q (.clk(clk),.data_in(q),.data_out(q_reg));
        intmul #(LOGQ,LOGQ,INTMUL_LAT,INTMUL_TYPE) intmul_i(clk,modmul_in[g],modmul_omega_in[g],imul);
        modred #(LOGQ,Q_VALUE,WORD_SIZE,MODRED_LAT,MODRED_TYPE,MODRED_L,MODRED_COREMUL_LAT) modred_i(clk,imul,q_reg,modmul_out);
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
  logic fifo_shift;
  logic [LOGQ-1:0] fifo_din[0:PE/2-1];
  generate
    for(genvar g=0; g < PE/2; g=g+1) begin
      FIFO #(.DEPTH(MODMUL_LAT_CEIL), .WIDTH(LOGQ)) fifo (
        .clk(clk),
        .rst(rst),
        .rst_val(one_reg),
        .shift(fifo_shift), 
        .data_in(fifo_din[g]),
        .data_out(fifo_dout[g]),
        .last_data_in()
      );
    end
  endgenerate
  assign fifo_shift = i_1DP > N/2/PE-MODMUL_LAT_CEIL-1 || i < MODMUL_LAT_CEIL; 
  
  // fifo data in:
  logic [$clog2(LOGN):0] sh_val_signed_1;
  assign sh_val_signed_1 = s-SPECIAL_STAGE+1;
  logic b_sel;
  assign b_sel = sh_val_signed_1[$clog2(LOGN)] || (i & ((MODMUL_LAT_CEIL >> 1) >> sh_val_signed_1[$clog2(LOGN)-1:0])) == {$clog2(N/2/PE){1'd0}} ? 1'd0 : 1'd1;
  generate
    for(genvar g=0; g < PE/2; g=g+1) begin
      assign fifo_din[g] = tw_out_internal_DN[g*2+b_sel];
    end
  endgenerate


  // output logic:
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
