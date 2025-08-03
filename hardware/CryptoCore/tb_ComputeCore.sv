/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

// Top testbench for OpenNTT. It sends test data and instructions for
// NTT and/or PWM to the ComputeCore. After finishing the execution,
// the results are compared to the reference output

`define abs(x) (x < 0 ? -x : x)

module tb_ComputeCore();
  localparam LOGN = open_ntt_pkg::LOGN;
  localparam PE = open_ntt_pkg::PE;
  localparam N = 1<<LOGN;
  localparam LOGQ = open_ntt_pkg::LOGQ;


  reg clk = 0;
  logic rst,valid;
  always #5 clk=~clk;

  logic [31:0] status, dina2_ext_word,control_low_word,control_high_word,dina_ext_low_word,dina_ext_high_word, dout_ext_low_word, dout_ext_high_word,dina3_ext_low_word,dina3_ext_high_word;
  logic [7:0] dma_bram_byte_wea = 0;
  logic [19:0] dma_bram_abs_addr;
  logic [63:0] dma_bram_dina;
  logic [63:0] dma_bram_doutb;
  logic dma_bram_en = 0;
  ComputeCoreWrapper dut(clk, 
                    control_low_word, control_high_word, 
                    dina_ext_low_word, dina_ext_high_word, 
                    dina2_ext_word,
                    dina3_ext_low_word, dina3_ext_high_word,
                    dout_ext_low_word, dout_ext_high_word, 
                    status,
                    dma_bram_byte_wea, 
                    dma_bram_abs_addr, 
                    dma_bram_dina, 
                    dma_bram_doutb, 
                    dma_bram_en);
  
  integer ref_fd_in,ref_fd_out,i,j;
  logic [LOGQ-1:0] dummy;
  logic [2*LOGQ-1:0] tmp;
  string line;
  logic error = 0;

  integer l,b,e;
  logic [LOGQ-1:0] inout_buffer [0:N/2/PE-1][0:PE-1][0:1];
  logic [LOGQ-1:0] poly_arith_in_a [0:N-1];
  logic [LOGQ-1:0] poly_arith_in_b [0:N-1];
  logic [LOGQ-1:0] poly_arith_out [0:N-1];
  string fname_forw_in,fname_forw_out,fname_inv_in,fname_inv_out;
  // take from package:
  logic [open_ntt_pkg::ROM_ADDR_WIDTH-1:0] rom_base_addr_forw = open_ntt_pkg::TB_base_forward;
  logic [open_ntt_pkg::ROM_ADDR_WIDTH-1:0] rom_base_addr_inv = open_ntt_pkg::TB_base_inverse;
  integer modulus_num = 0;
  logic forward = 1;
  logic [LOGQ-1:0] q,R,R_inv;
  logic [LOGQ-1:0] expected;
  logic [open_ntt_pkg::ROM_ADDR_WIDTH-1:0] rom_base_addr;

  assign rom_base_addr = forward ? rom_base_addr_forw : rom_base_addr_inv;
  assign q = open_ntt_pkg::TB_Q_ARR[modulus_num];
  assign R = open_ntt_pkg::TB_R_ARR[modulus_num];
  assign R_inv = open_ntt_pkg::TB_R_INV_ARR[modulus_num];

  real expected_float, result_float;
  integer poly_select;
  integer t, opcode;
  initial begin
    
    if(open_ntt_pkg::NTT) begin
      ////// NTT tests ///////
      for(modulus_num = 0; error == 0 && modulus_num < open_ntt_pkg::TB_NUMQ; modulus_num += 1)begin
        for(integer forward_t = open_ntt_pkg::TB_base_inverse == 0 ? 1 : 0; error == 0 && forward_t < (open_ntt_pkg::TB_base_forward == 0 ? 1 : 2); forward_t += 1)begin
          for(poly_select = 0; error == 0 && poly_select < open_ntt_pkg::NUM_POLY_MEMS; poly_select +=1)begin
            forward = forward_t[0];
            control_low_word = 0;
            control_high_word = 1; // reset core
            i = 0;
            #101;

            fname_forw_in = $sformatf("%s/tool/test_vectors_ntt/tv_NTT%0s%0s_%s_n%0d_%0din.txt",  open_ntt_pkg::OPEN_NTT_PATH, dut.CORE.open_ntt.ntt_core.IS_MERGED ? "_Merged_" : "_", dut.CORE.open_ntt.ntt_core.IS_DIT || dut.CORE.open_ntt.ntt_core.NTT_TYPE == "fntt_dit_nr-intt_dit_rn" || (dut.CORE.open_ntt.ntt_core.NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") ? "DIT" : "DIF", dut.CORE.open_ntt.ntt_core.IS_INVERSE ? "RN" : "NR", 1<<dut.CORE.open_ntt.ntt_core.LOGN,modulus_num);
            fname_forw_out= $sformatf("%s/tool/test_vectors_ntt/tv_NTT%0s%0s_%s_n%0d_%0dout.txt", open_ntt_pkg::OPEN_NTT_PATH, dut.CORE.open_ntt.ntt_core.IS_MERGED ? "_Merged_" : "_", dut.CORE.open_ntt.ntt_core.IS_DIT || dut.CORE.open_ntt.ntt_core.NTT_TYPE == "fntt_dit_nr-intt_dit_rn" || (dut.CORE.open_ntt.ntt_core.NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") ? "DIT" : "DIF", dut.CORE.open_ntt.ntt_core.IS_INVERSE ? "RN" : "NR", 1<<dut.CORE.open_ntt.ntt_core.LOGN,modulus_num);
            ref_fd_in = $fopen(forward || dut.CORE.open_ntt.ntt_core.IS_INVERSE == 1 ? fname_forw_in : fname_forw_out, "r");
            ref_fd_out= $fopen(forward || dut.CORE.open_ntt.ntt_core.IS_INVERSE == 1 ? fname_forw_out : fname_forw_in, "r");
            if (ref_fd_in == 0 || ref_fd_out == 0) begin
              $display("Error opening File!");
              $finish();
            end
            #51;

            if(forward) begin // NR
              for (i=0; i < N; i += 1) begin
                l = i % (N/2/PE);
                b = (i / (N/2/PE)) & (PE-1);
                e = (i / (N/2/PE)) / PE;
                e = (b<<1) | e;
                assert(1==$fscanf(ref_fd_in, "%x\n", dummy));
                inout_buffer[l][e>>1][e&1] = dummy;
              end
            end else begin // RN
              for (i=0; i < N; i += 1) begin
                l = i & 1;
                b = (i >> 1) % (N/2/PE);
                e = (i >> 1) / (N/2/PE);
                e <<= 1;
                e = e+l;
                assert(1==$fscanf(ref_fd_in, "%x\n", dummy));
                inout_buffer[b][e>>1][e&1] = dummy;
              end
            end

            dma_bram_byte_wea = 8'hff;
            dma_bram_en = 1;
            for(i = 0; i < N; i=i+1) begin
              dma_bram_dina = inout_buffer[i % (N/2/PE)][(i / (N/2/PE)) >> 1][(i / (N/2/PE)) & 1];
              t = i<<3;
              dma_bram_abs_addr = t[$clog2(N/2/PE)+3-1:0] + (poly_select<<($clog2(N/2/PE)+3)) + ((t[31:$clog2(N/2/PE)+3]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3));
              #1;
              @(posedge clk);
              #1;
            end
            dma_bram_byte_wea = 8'd0;
            dma_bram_en = 0;
            #11;


            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            //// initialisation for memory optimized Tw gen
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
            if(~forward && open_ntt_pkg::MEMORY_OPTIMIZED && open_ntt_pkg::PE > 8 && open_ntt_pkg::NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") begin
              control_low_word = (1<<21) | (1<<20) | i;
              {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
              @(posedge clk); #1;
              i = i + 1;
              control_low_word = (1<<21) | (1<<20) | i;
              {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
              @(posedge clk); #1;
              i = i + 1;
            end
            if(~forward && open_ntt_pkg::MEMORY_OPTIMIZED && open_ntt_pkg::PE > 16 && open_ntt_pkg::NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") begin
              control_low_word = (1<<21) | (1<<20) | i;
              {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
              @(posedge clk); #1;
              i = i + 1;
              control_low_word = (1<<21) | (1<<20) | i;
              {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
              @(posedge clk); #1;
              i = i + 1;
            end
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<8); // reset high again
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            /////
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8) + 1;// ntt instruction
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'h1f;
            @(posedge clk); #1;
            i = i + 1;

            for(; i < 32; i += 1) begin
              control_low_word = (1<<21) | (1<<20) | i;
              {dina_ext_high_word, dina_ext_low_word} = 64'd0;
              @(posedge clk); #1;
            end

            control_low_word = 0;
            @(posedge clk); #1;
            @(posedge clk); #1;
            #101;


            {dina_ext_high_word, dina_ext_low_word} = q;
            dina2_ext_word = {rom_base_addr*modulus_num,forward,2'd0};
            dina2_ext_word[29:28] = poly_select[1:0];
            #1001;

            ////////////////////////////
            control_low_word = 0;
            control_high_word = 1;
            @(posedge clk); #1;
            control_high_word = 2;
            @(posedge clk); #1;
            
            @(posedge clk iff status[0] ==1'd1);
            #1;
            control_high_word = 1;
            @(posedge clk); #1;

            control_high_word = 0;
            @(posedge clk); #1;
            
            #100;

            if(~forward) begin // RN
              for (i=0; i < N; i += 1) begin
                l = i % (N/2/PE);
                b = (i / (N/2/PE)) & (PE-1);
                e = (i / (N/2/PE)) / PE;
                e = (b<<1) | e;
                assert(1==$fscanf(ref_fd_out, "%x\n", dummy));
                inout_buffer[l][e>>1][e&1] = dummy;
              end
            end else begin // NR
              for (i=0; i < N; i += 1) begin
                l = i & 1;
                b = (i >> 1) % (N/2/PE);
                e = (i >> 1) / (N/2/PE);
                e <<= 1;
                e = e+l;
                assert(1==$fscanf(ref_fd_out, "%x\n", dummy));
                inout_buffer[b][e>>1][e&1] = dummy;
              end
            end
            
            #101;

            for(i = 0; i < 4; i+=1) begin
              #1;
              @(posedge clk);
              #1;
              t = i<<3;
              dma_bram_abs_addr = t[$clog2(N/2/PE)+3-1:0] + (poly_select<<($clog2(N/2/PE)+3)) + ((t[31:$clog2(N/2/PE)+3]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3));
            end
            @(posedge clk);
            #1;
            for(; i < N+4; i+=1) begin
              expected = inout_buffer[(i-4)%(N/2/PE)][((i-4)/(N/2/PE))>>1][((i-4)/(N/2/PE))&1];
              if(!(expected === dma_bram_doutb[LOGQ-1:0]))begin
                error = 1;
                assert(0);
              end
              t = i<<3;
              dma_bram_abs_addr = t[$clog2(N/2/PE)+3-1:0] + (poly_select<<($clog2(N/2/PE)+3)) + ((t[31:$clog2(N/2/PE)+3]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3));
              #1;
              @(posedge clk);
              #1;
            end

            #1000;
          end
        end
      end
      

      if(!error)
        $display("NTT PASSED!\n");

      ////// PWM tests ///////
      for(opcode = 1; open_ntt_pkg::INSTANTIATE_MULT_ADD && error == 0 && opcode < 4; opcode += 1) begin
        for(modulus_num = 0; open_ntt_pkg::INSTANTIATE_MULT_ADD && error == 0 && modulus_num < open_ntt_pkg::TB_NUMQ; modulus_num += 1) begin
            control_low_word = 0;
            control_high_word = 1; // reset core
            i = 0;
            #101;

            for (i=0; i < N; i += 1) begin
              poly_arith_in_a[i] = {$urandom(),$urandom()} % q;
              poly_arith_in_b[i] = {$urandom(),$urandom()} % q;
              if(opcode == 1)begin
                tmp = (poly_arith_in_a[i] * poly_arith_in_b[i]) % q;
                tmp = (tmp * R_inv) % q;
              end else if(opcode == 2) begin
                tmp = (poly_arith_in_a[i]+poly_arith_in_b[i]) % q;
              end else begin
                tmp = poly_arith_in_a[i] < poly_arith_in_b[i] ? (poly_arith_in_a[i]+q-poly_arith_in_b[i]) % q : (poly_arith_in_a[i]-poly_arith_in_b[i]) % q;
              end
              poly_arith_out[i] = tmp;
            end
            
            poly_select = 0;
            dma_bram_byte_wea = 8'hff;
            dma_bram_en = 1;
            for(i = 0; i < N; i=i+1) begin
              dma_bram_dina = poly_arith_in_a[i];
              t = i<<3;
              dma_bram_abs_addr = t[$clog2(N/2/PE)+3-1:0] + (poly_select<<($clog2(N/2/PE)+3)) + ((t[31:$clog2(N/2/PE)+3]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3));
              #1;
              @(posedge clk);
              #1;
            end
            dma_bram_byte_wea = 8'd0;
            dma_bram_en = 0;
            #11;

            poly_select = 1;
            dma_bram_byte_wea = 8'hff;
            dma_bram_en = 1;
            for(i = 0; i < N; i=i+1) begin
              dma_bram_dina = poly_arith_in_b[i];
              t = i<<3;
              dma_bram_abs_addr = t[$clog2(N/2/PE)+3-1:0] + (poly_select<<($clog2(N/2/PE)+3)) + ((t[31:$clog2(N/2/PE)+3]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3));
              #1;
              @(posedge clk);
              #1;
            end
            dma_bram_byte_wea = 8'd0;
            dma_bram_en = 0;
            #11;


            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            //// initialisation for memory optimized Tw gen
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<8); // reset high again
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            /////
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8) + 1;// instruction
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'h1f;
            @(posedge clk); #1;
            i = i + 1;

            for(; i < 32; i += 1) begin
              control_low_word = (1<<21) | (1<<20) | i;
              {dina_ext_high_word, dina_ext_low_word} = 64'd0;
              @(posedge clk); #1;
            end

            control_low_word = 0;
            @(posedge clk); #1;
            @(posedge clk); #1;
            #101;


            {dina3_ext_high_word, dina3_ext_low_word} = R;
            {dina_ext_high_word, dina_ext_low_word} = q;
            dina2_ext_word = {rom_base_addr*modulus_num,forward,opcode[1:0]};
            dina2_ext_word[29:28] = 2'd0; // poly 0
            dina2_ext_word[31:30] = 2'd1; // poly 1
            #1001;

            ////////////////////////////
            control_low_word = 0;
            control_high_word = 1;
            @(posedge clk); #1;
            control_high_word = 2;
            @(posedge clk); #1;
            
            @(posedge clk iff status[0] ==1'd1);
            #1;
            control_high_word = 1;
            @(posedge clk); #1;

            control_high_word = 0;
            @(posedge clk); #1;
            
            #101;
            
            poly_select = 0;
            for(i = 0; i < 4; i+=1) begin
              #1;
              @(posedge clk);
              #1;
              t = i<<3;
              dma_bram_abs_addr = t[$clog2(N/2/PE)+3-1:0] + (poly_select<<($clog2(N/2/PE)+3)) + ((t[31:$clog2(N/2/PE)+3]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3));
            end
            @(posedge clk);
            #1;
            for(; i < N+4; i+=1) begin
              expected = poly_arith_out[i-4];
              if(!(expected === dma_bram_doutb[LOGQ-1:0]))begin
                error = 1;
                assert(0);
              end
              t = i<<3;
              dma_bram_abs_addr = t[$clog2(N/2/PE)+3-1:0] + (poly_select<<($clog2(N/2/PE)+3)) + ((t[31:$clog2(N/2/PE)+3]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3));
              #1;
              @(posedge clk);
              #1;
            end
          
            #1000;
        end        
      end 

    end else begin

      ////// FFT tests ///////
      for(integer forward_t = open_ntt_pkg::TB_base_inverse == 0 ? 1 : 0; error == 0 && forward_t < (open_ntt_pkg::TB_base_forward == 0 ? 1 : 2); forward_t += 1)begin
        for(poly_select = 0; error == 0 && poly_select < open_ntt_pkg::NUM_POLY_MEMS; poly_select +=1)begin
          forward = forward_t[0];
          control_low_word = 0;
          control_high_word = 1; // reset core
          i = 0;
          #101;

          if (dut.CORE.open_ntt.ntt_core.IS_UNIFIED && ~forward) begin
            fname_forw_in = $sformatf("%s/tool/test_vectors_fft/tv_FFT%0s%0s_%s_n%0d_in.txt",  open_ntt_pkg::OPEN_NTT_PATH, dut.CORE.open_ntt.ntt_core.IS_MERGED ? "_Merged_" : "_", dut.CORE.open_ntt.ntt_core.NTT_TYPE == "fntt_dit_nr-intt_dit_rn" ? "DIT" : "DIF", "RN", 1<<dut.CORE.open_ntt.ntt_core.LOGN);
            fname_forw_out= $sformatf("%s/tool/test_vectors_fft/tv_FFT%0s%0s_%s_n%0d_out.txt", open_ntt_pkg::OPEN_NTT_PATH, dut.CORE.open_ntt.ntt_core.IS_MERGED ? "_Merged_" : "_", dut.CORE.open_ntt.ntt_core.NTT_TYPE == "fntt_dit_nr-intt_dit_rn" ? "DIT" : "DIF", "RN", 1<<dut.CORE.open_ntt.ntt_core.LOGN);
            ref_fd_in = $fopen(fname_forw_in, "r");
            ref_fd_out= $fopen(fname_forw_out, "r");
          end else begin
            fname_forw_in = $sformatf("%s/tool/test_vectors_fft/tv_FFT%0s%0s_%s_n%0d_in.txt",  open_ntt_pkg::OPEN_NTT_PATH, dut.CORE.open_ntt.ntt_core.IS_MERGED ? "_Merged_" : "_", dut.CORE.open_ntt.ntt_core.IS_DIT || dut.CORE.open_ntt.ntt_core.NTT_TYPE == "fntt_dit_nr-intt_dit_rn" || (dut.CORE.open_ntt.ntt_core.NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") ? "DIT" : "DIF", dut.CORE.open_ntt.ntt_core.IS_INVERSE ? "RN" : "NR", 1<<dut.CORE.open_ntt.ntt_core.LOGN);
            fname_forw_out= $sformatf("%s/tool/test_vectors_fft/tv_FFT%0s%0s_%s_n%0d_out.txt", open_ntt_pkg::OPEN_NTT_PATH, dut.CORE.open_ntt.ntt_core.IS_MERGED ? "_Merged_" : "_", dut.CORE.open_ntt.ntt_core.IS_DIT || dut.CORE.open_ntt.ntt_core.NTT_TYPE == "fntt_dit_nr-intt_dit_rn" || (dut.CORE.open_ntt.ntt_core.NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") ? "DIT" : "DIF", dut.CORE.open_ntt.ntt_core.IS_INVERSE ? "RN" : "NR", 1<<dut.CORE.open_ntt.ntt_core.LOGN);
            ref_fd_in = $fopen(forward || dut.CORE.open_ntt.ntt_core.IS_INVERSE == 1 ? fname_forw_in : fname_forw_out, "r");
            ref_fd_out= $fopen(forward || dut.CORE.open_ntt.ntt_core.IS_INVERSE == 1 ? fname_forw_out : fname_forw_in, "r");
          end
          if (ref_fd_in == 0 || ref_fd_out == 0) begin
            $display("Error opening File!");
            $finish();
          end
          #51;

          if(forward) begin // NR
            for (i=0; i < N; i += 1) begin
              l = i % (N/2/PE);
              b = (i / (N/2/PE)) & (PE-1);
              e = (i / (N/2/PE)) / PE;
              e = (b<<1) | e;
              assert(2==$fscanf(ref_fd_in, "%x %x\n", dummy[127:64], dummy[63:0]));
              inout_buffer[l][e>>1][e&1] = dummy;
            end
          end else begin // RN
            for (i=0; i < N; i += 1) begin
              l = i & 1;
              b = (i >> 1) % (N/2/PE);
              e = (i >> 1) / (N/2/PE);
              e <<= 1;
              e = e+l;
              assert(2==$fscanf(ref_fd_in, "%x %x\n", dummy[127:64], dummy[63:0]));
              inout_buffer[b][e>>1][e&1] = dummy;
            end
          end

          dma_bram_byte_wea = 8'hff;
          dma_bram_en = 1;
          for(i = 0; i < N; i=i+1) begin
            dma_bram_dina = inout_buffer[i % (N/2/PE)][(i / (N/2/PE)) >> 1][(i / (N/2/PE)) & 1][127:64];
            t = (i<<1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
            dma_bram_dina = inout_buffer[i % (N/2/PE)][(i / (N/2/PE)) >> 1][(i / (N/2/PE)) & 1][63:0];
            t = ((i<<1)+1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
          end
          dma_bram_byte_wea = 8'd0;
          dma_bram_en = 0;
          #11;


          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          //// initialisation for memory optimized Tw gen
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
          @(posedge clk); #1;
          i = i + 1;
          if(~forward && open_ntt_pkg::MEMORY_OPTIMIZED && open_ntt_pkg::PE > 8 && open_ntt_pkg::NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") begin
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
          end
          if(~forward && open_ntt_pkg::MEMORY_OPTIMIZED && open_ntt_pkg::PE > 16 && open_ntt_pkg::NTT_TYPE == "mfntt_dit_nr-mintt_dif_rn") begin
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
            @(posedge clk); #1;
            i = i + 1;
          end
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<8); // reset high again
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          /////
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8) + 1;// fft instruction
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'h1f;
          @(posedge clk); #1;
          i = i + 1;

          for(; i < 32; i += 1) begin
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
          end

          control_low_word = 0;
          @(posedge clk); #1;
          @(posedge clk); #1;
          #101;


          {dina_ext_high_word, dina_ext_low_word} = q;
          dina2_ext_word = {rom_base_addr*modulus_num,forward,2'd0};
          dina2_ext_word[29:28] = poly_select[1:0];
          #1001;

          ////////////////////////////
          control_low_word = 0;
          control_high_word = 1;
          @(posedge clk); #1;
          control_high_word = 2;
          @(posedge clk); #1;
          
          @(posedge clk iff status[0] ==1'd1);
          #1;
          control_high_word = 1;
          @(posedge clk); #1;

          control_high_word = 0;
          @(posedge clk); #1;
          
          #100;

          if(~forward) begin // RN
            for (i=0; i < N; i += 1) begin
              l = i % (N/2/PE);
              b = (i / (N/2/PE)) & (PE-1);
              e = (i / (N/2/PE)) / PE;
              e = (b<<1) | e;
              assert(2==$fscanf(ref_fd_out, "%x %x\n", dummy[127:64], dummy[63:0]));
              inout_buffer[l][e>>1][e&1] = dummy;
            end
          end else begin // NR
            for (i=0; i < N; i += 1) begin
              l = i & 1;
              b = (i >> 1) % (N/2/PE);
              e = (i >> 1) / (N/2/PE);
              e <<= 1;
              e = e+l;
              assert(2==$fscanf(ref_fd_out, "%x %x\n", dummy[127:64], dummy[63:0]));
              inout_buffer[b][e>>1][e&1] = dummy;
            end
          end
          
          #101;

          for(i = 0; i < 2; i+=1) begin
            #1;
            @(posedge clk);
            #1;
            t = (i<<1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
            t = ((i<<1)+1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
          end
          @(posedge clk);
          #1;
          for(; i < N+2; i+=1) begin
            expected = inout_buffer[(i-2)%(N/2/PE)][((i-2)/(N/2/PE))>>1][((i-2)/(N/2/PE))&1];
            expected_float = expected[127:64];
            result_float = dma_bram_doutb[63:0];
            if((expected[126:64] == 63'd0 && dma_bram_doutb[62:0] != 63'd0) ||
               (expected[126:64] != 63'd0 && `abs((expected_float-result_float)/expected_float) > 1e-3))begin
              error = 1;
              assert(0);
            end
            t = (i<<1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;

            expected_float = expected[63:0];
            result_float = dma_bram_doutb[63:0];
            if((expected[126:64] == 63'd0 && dma_bram_doutb[62:0] != 63'd0) ||
               (expected[126:64] != 63'd0 && `abs((expected_float-result_float)/expected_float) > 1e-3))begin
              error = 1;
              assert(0);
            end
            t = ((i<<1)+1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
          end

          #1000;
        end
      end
      

      if(!error)
        $display("FFT PASSED!\n");

      ////// PWM tests ///////
      
      if(open_ntt_pkg::INSTANTIATE_MULT_ADD) begin
        fname_forw_out = $sformatf("%s/tool/test_vectors_fft/tv_FFT_mul_add_sub.txt", open_ntt_pkg::OPEN_NTT_PATH);
        ref_fd_out= $fopen(fname_forw_out, "r");
        for (i=0; i < N; i += 1) begin
          assert(2==$fscanf(ref_fd_out, "%x %x\n", poly_arith_in_a[i][127:64], poly_arith_in_a[i][63:0]));
        end
        for (i=0; i < N; i += 1) begin
          assert(2==$fscanf(ref_fd_out, "%x %x\n", poly_arith_in_b[i][127:64], poly_arith_in_b[i][63:0]));
        end
      end

      for(opcode = 1; open_ntt_pkg::INSTANTIATE_MULT_ADD && error == 0 && opcode < 4; opcode += 1) begin
          control_low_word = 0;
          control_high_word = 1; // reset core
          i = 0;
          #101;

          for (i=0; i < N; i += 1) begin
            assert(2==$fscanf(ref_fd_out, "%x %x\n", poly_arith_out[i][127:64], poly_arith_out[i][63:0]));
          end
          
          poly_select = 0;
          dma_bram_byte_wea = 8'hff;
          dma_bram_en = 1;
          for(i = 0; i < N; i=i+1) begin
            dma_bram_dina = poly_arith_in_a[i][127:64];
            t = (i<<1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
            dma_bram_dina = poly_arith_in_a[i][63:0];
            t = ((i<<1)+1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
          end
          dma_bram_byte_wea = 8'd0;
          dma_bram_en = 0;
          #11;

          poly_select = 1;
          dma_bram_byte_wea = 8'hff;
          dma_bram_en = 1;
          for(i = 0; i < N; i=i+1) begin
            dma_bram_dina = poly_arith_in_b[i][127:64];
            t = (i<<1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
            dma_bram_dina = poly_arith_in_b[i][63:0];
            t = ((i<<1)+1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
          end
          dma_bram_byte_wea = 8'd0;
          dma_bram_en = 0;
          #11;


          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          //// initialisation for memory optimized Tw gen
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8); // pull reset low
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<8); // reset high again
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          /////
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = (1<<7) + (1<<8) + 1;// instruction
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'd0;
          @(posedge clk); #1;
          i = i + 1;
          control_low_word = (1<<21) | (1<<20) | i;
          {dina_ext_high_word, dina_ext_low_word} = 64'h1f;
          @(posedge clk); #1;
          i = i + 1;

          for(; i < 32; i += 1) begin
            control_low_word = (1<<21) | (1<<20) | i;
            {dina_ext_high_word, dina_ext_low_word} = 64'd0;
            @(posedge clk); #1;
          end

          control_low_word = 0;
          @(posedge clk); #1;
          @(posedge clk); #1;
          #101;


          {dina3_ext_high_word, dina3_ext_low_word} = R;
          {dina_ext_high_word, dina_ext_low_word} = q;
          dina2_ext_word = {rom_base_addr*modulus_num,forward,opcode[1:0]};
          dina2_ext_word[29:28] = 2'd0; // poly 0
          dina2_ext_word[31:30] = 2'd1; // poly 1
          #1001;

          // Start instruction execution:
          control_low_word = 0;
          control_high_word = 1;
          @(posedge clk); #1;
          control_high_word = 2;
          @(posedge clk); #1;
          
          @(posedge clk iff status[0] ==1'd1);
          #1;
          control_high_word = 1;
          @(posedge clk); #1;

          control_high_word = 0;
          @(posedge clk); #1;
          
          #101;
          
          poly_select = 0;
          for(i = 0; i < 2; i+=1) begin
            #1;
            @(posedge clk);
            #1;
            t = (i<<1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
            t = ((i<<1)+1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
          end
          @(posedge clk);
          #1;
          for(; i < N+2; i+=1) begin
            expected = poly_arith_out[i-2];
            expected_float = expected[127:64];
            if(!(expected[127:64] === dma_bram_doutb))begin
              error = 1;
              assert(0);
            end
            t = (i<<1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;

            expected_float = expected[63:0];
            if(!(expected[63:0] === dma_bram_doutb))begin
              error = 1;
              assert(0);
            end
            t = ((i<<1)+1)<<3;
            dma_bram_abs_addr = t[$clog2(N/2/PE)+3:0] + (poly_select<<($clog2(N/2/PE)+3+1)) + ((t[31:$clog2(N/2/PE)+3+1]) << ($clog2(N/2/PE)+$clog2(open_ntt_pkg::NUM_POLY_MEMS)+3+1));
            #1;
            @(posedge clk);
            #1;
          end
        
          #1000;
      end        
    end 


    if (!error)
      $display("PASSED!\n");
    $finish();
  end

endmodule
