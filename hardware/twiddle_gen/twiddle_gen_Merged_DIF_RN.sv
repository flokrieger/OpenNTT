/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps
`include "package.svh"

// Parametric twiddle factor generation for Merged DIF RN NTT
module TwiddleGen_Merged_DIF_RN #(
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
  localparam MULFACT = MODMUL_LAT_CEIL == 4 ? 1 : (MODMUL_LAT_CEIL == 8 ? 2 : MODMUL_LAT_CEIL == 16 ? 4 : 8);

  if (N/2/PE <= 2* MODMUL_LAT_CEIL)
    $error("Invalid MODMUL_LAT_CEIL");

  // logic to initialize omega_i
  logic rst_1DP,update_one,update_one_delayed,init_omega_c;
  always_ff @( posedge clk ) begin
    rst_1DP <= rst;
    init_omega_c <= update_one_delayed;
  end
  assign update_one = rst & ~rst_1DP;
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ(1)) sr0 (
      .clk(clk),
      .data_in(update_one),
      .data_out(update_one_delayed)
  );
  logic [PE-1:0] init_omega_i;
  always_ff @( posedge clk ) begin
    if(PE > 1)
        init_omega_i <= {init_omega_i[PE-2:0], init_omega_c};
    else
        init_omega_i <= init_omega_c;
  end

  logic rst_delayed, increment;
  shiftreg #(.DELAY(ROM_RD_LAT+1+PE), .LOGQ(1)) sr1 (
    .clk(clk),
    .data_in(rst),
    .data_out(rst_delayed)
  );
  assign increment = rst & ~rst_delayed;


  // Twiddle rom instance:
  logic [ROM_ADDR_WIDTH-1:0] tw_rom_addr;
  logic [LOGQ-1:0] tw_rom_data [0:0];
  
  localparam string rom_filename = $sformatf("%s/tool/RomContent/twiddle_mem_Merged_DIF_RN_n%0d_pe%0d_lat%0d_MontRed_0.mem", `OPEN_NTT_PATH, 1<<LOGN, PE, MODMUL_LAT_CEIL);
  localparam TW_ROM_DEPTH = ROM_ADDR_WIDTH;
  
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
  logic [$clog2(LOGN)-1:0] s_initial, s, s_delay;
  logic stage_done_initial, stage_done;
  always_ff @( posedge clk ) begin
    if (rst) begin
      s_initial <= 0;
    end else if (stage_done_initial && s_initial != LOGN-1) begin
      s_initial <= s_initial + 1;
    end
  end
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ($clog2(LOGN))) s_del0 (
    .clk(clk),
    .data_in(s_initial),
    .data_out(s)
  );
  shiftreg #(.DELAY(MODMUL_LAT_CEIL), .LOGQ($clog2(LOGN))) s_del1 (
          .clk(clk),
          .data_in(s),
          .data_out(s_delay)
      );

  // butterfly iterator:
  logic [$clog2(N/2/PE)-1:0] i_initial, i, i_delay;
  always_ff @( posedge clk ) begin
    if (rst) begin
      i_initial <= 0;
    end else begin
      i_initial <= i_initial + 1;
    end
  end
  assign stage_done_initial = i_initial == {$clog2(N/2/PE){1'd1}};
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ(1)) stage_done_del0 (
          .clk(clk),
          .data_in(stage_done_initial),
          .data_out(stage_done)
      );
  shiftreg #(.DELAY(ROM_RD_LAT), .LOGQ($clog2(N/2/PE))) i_del0 (
          .clk(clk),
          .data_in(i_initial),
          .data_out(i)
      );
  shiftreg #(.DELAY(MODMUL_LAT_CEIL), .LOGQ($clog2(N/2/PE))) i_del1 (
          .clk(clk),
          .data_in(i),
          .data_out(i_delay)
      );

  // rom address generation logic:
  logic update_rom_addr;
  logic [ROM_ADDR_WIDTH-1:0] tw_rom_addr_init,tw_rom_addr_fill,rom_base_addr_reg;
  always_ff @( posedge clk ) begin
    rom_base_addr_reg <= rom_base_addr;
    if (rst) begin
      tw_rom_addr_init <= tw_rom_addr_init + 1;;
      tw_rom_addr_fill <= rom_base_addr_reg+PE+1;
    end else begin
      tw_rom_addr_init <= rom_base_addr_reg;
      tw_rom_addr_fill <= update_rom_addr ? tw_rom_addr_fill + 1'd1 : tw_rom_addr_fill;
    end
  end
  assign update_rom_addr = (s_initial == {$clog2(LOGN){1'd0}} && i_initial < MODMUL_LAT_CEIL) || stage_done_initial;
  assign tw_rom_addr = increment ? tw_rom_addr_init : tw_rom_addr_fill;

  // control signals:
  logic stage_repeats, rep;
  assign stage_repeats = s != {$clog2(LOGN){1'd0}};
  logic [$clog2(N/2/PE)-1:0] t;
  assign t = $clog2(N/2/PE) > $clog2(MODMUL_LAT_CEIL) ? {i[$clog2(N/2/PE)-1:$clog2(MODMUL_LAT_CEIL)], {$clog2(MODMUL_LAT_CEIL){1'd0}}} : 0;
  assign rep = s >= LOGN-1-$clog2(PE) || 
              (stage_repeats && (t & (N/2/PE-1 >> (s))) == {$clog2(N/2/PE){1'd0}} && i != {$clog2(N/2/PE){1'd0}});

  ////////////// data path ////////////
  logic [LOGQ-1:0] one_reg;
  always_ff @( posedge clk ) begin
    if(update_one_delayed)
      one_reg <= tw_rom_data[0];
  end

  logic [LOGQ-1:0] tw_out_internal [0:PE-1];
  // wi register:
  logic [LOGQ-1:0] wi [0:PE-1];
  logic [LOGQ-1:0] wi_next [0:PE-1];
  generate
    for(genvar g=1; g < PE; g=g+1) begin
      always @(posedge clk) begin
        if (init_omega_i[g-1]) begin
          wi[g] <= tw_rom_data[0];
        end else if(stage_done) begin
          wi[g] <= wi_next[g];
        end
          
        if (g % 2 == 0) begin // even
          if(i_delay == {$clog2(N/2/PE){1'd0}}) begin
            wi_next[g] <= tw_out_internal[g/2];
          end
        end else begin // odd
          if(s_delay <  LOGN-1-$clog2(PE)-1 && i_delay == {{($clog2(N/2/PE)-2){1'd0}},2'd2} || 
             s_delay >= LOGN-1-$clog2(PE)-1 && i_delay == {{($clog2(N/2/PE)-2){1'd0}},2'd1}) begin
            wi_next[g] <= tw_out_internal[g/2];
          end
        end
      end
    end
  endgenerate
  assign wi[0] = one_reg;

  // omega_c:
  logic update_omega_c, update_omega_c_next;
  logic [LOGQ-1:0] omega_c, omega_c_next;
  always_ff @( posedge clk ) begin
    if (init_omega_c) begin
      omega_c <= tw_rom_data[0];
    end else if(update_omega_c) begin
        omega_c <= tw_rom_data[0];
    end
  end
  assign update_omega_c = stage_done;

  // omega_pivot:
  logic [LOGQ-1:0] fifo_dout_tmp[0:1];
  logic update_omega_pivot;
  logic [LOGQ-1:0] omega_pivot;
  always_ff @( posedge clk ) begin
    if (rst) begin
      omega_pivot <= one_reg;
    end else if(update_omega_pivot) begin
      omega_pivot <= s[0] == 1'd0 ? fifo_dout_tmp[1] : fifo_dout_tmp[0];
    end
  end
  assign update_omega_pivot = i == {$clog2(N/2/PE){1'd1}};

  // fifo:
  logic fifo_shift [0:1];
  logic [LOGQ-1:0] fifo_din_tmp[0:1];
  logic [LOGQ-1:0] fifo_dout, fifo_din;
  logic fifo_put, fifo_rotate;
  FIFO #(.DEPTH(MODMUL_LAT_CEIL), .WIDTH(LOGQ)) fifo0 (
    .clk(clk),
    .rst(rst),
    .rst_val(),
    .shift(fifo_shift[0]), 
    .data_in(fifo_din_tmp[0]),
    .data_out(fifo_dout_tmp[0]),
    .last_data_in()
  );
  FIFO #(.DEPTH(MODMUL_LAT_CEIL), .WIDTH(LOGQ)) fifo1 (
    .clk(clk),
    .rst(rst),
    .rst_val(),
    .shift(fifo_shift[1]), 
    .data_in(fifo_din_tmp[1]),
    .data_out(fifo_dout_tmp[1]),
    .last_data_in()
  );
  assign fifo_dout       = s[0] == 1'd0 ? fifo_dout_tmp[0] : fifo_dout_tmp[1];
  assign fifo_din_tmp[0] = s[0] == 1'd0 ? fifo_dout_tmp[0] : fifo_din;
  assign fifo_din_tmp[1] = s[0] == 1'd1 ? fifo_dout_tmp[1] : fifo_din;
  assign fifo_shift[0]   = s[0] == 1'd0 ? fifo_rotate : fifo_put;
  assign fifo_shift[1]   = s[0] == 1'd1 ? fifo_rotate : fifo_put;

  assign fifo_rotate = !(i < MODMUL_LAT_CEIL && s == {$clog2(LOGN){1'd0}}) && (i < MODMUL_LAT_CEIL || rep) && s != LOGN-1;
  assign fifo_put = (i_delay>>1) < MODMUL_LAT_CEIL && (i_delay[1] == 1'd0 && s_delay <  LOGN-2-$clog2(PE) ||
                                                  i_delay[0] == 1'd0 && s_delay >= LOGN-2-$clog2(PE));
  assign fifo_din = tw_out_internal[0];
  
  // modmult
  logic [LOGQ-1:0] modmul_out_delayed [0:PE-1];
  logic [LOGQ-1:0] modmul_in [0:PE-1];
  logic [LOGQ-1:0] modmul_omega_in [0:PE-1];
  generate
    for(genvar g=0; g < PE; g=g+1) begin
      assign modmul_in[g] = i < MODMUL_LAT_CEIL && s == {$clog2(LOGN){1'd0}} ? tw_rom_data[0] : 
                            i < MODMUL_LAT_CEIL || rep                       ? fifo_dout : tw_out_internal[g];
      if (g == 0)
        assign modmul_omega_in[g] = i < MODMUL_LAT_CEIL && s == {$clog2(LOGN){1'd0}} || i < MODMUL_LAT_CEIL || rep ? omega_pivot : omega_c;
      else
        assign modmul_omega_in[g] = i < MODMUL_LAT_CEIL && s == {$clog2(LOGN){1'd0}} || i < MODMUL_LAT_CEIL || rep ? wi[g] : omega_c;

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

  // output logic:
  generate
    for(genvar g=0; g < PE; g=g+1) begin
      always @(posedge clk) begin
        tw_out_internal[g] <= modmul_out_delayed[g];
      end 
    end
  endgenerate
  assign tw_out = tw_out_internal;
endmodule