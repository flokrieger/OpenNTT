/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/
`timescale 1ns/1ps

/*
	1-inputs are divided into 26/24-bit and 17-bit chunks (simple tiling)
	2-multiplications are performed using DSPs
	3-partial products are added using CSA
	4-final output (c, s) will be added
*/

`default_nettype wire
module intmul #
(
    parameter LOG_A = 0,      
    parameter LOG_B = 0,      
    parameter INTMUL_LAT = 0, // should be at least 1 (valid only if INTMUL_TYPE="")
    parameter INTMUL_TYPE = "" // options: "", "fpga_auto", "fpga_lut", "fpga_dsp", "custom" (could be fpga IP, fpga-optimized, asic-optimized (i.e., Karatsuba) etc.)
)
(
	input clk,
	input [LOG_A-1:0] A,
	input [LOG_B-1:0] B,
	output [LOG_A+LOG_B-1:0] C
);

  if(INTMUL_TYPE != "" && INTMUL_TYPE != "custom" && INTMUL_LAT != 4)
    $error("Invalid INTMUL_LAT");

	generate
		if(INTMUL_TYPE == "custom") begin
			intmul_custom(clk,A,B,C); // CHANGE NAME\INTERFACE if YOU USE CUSTOM UNIT
		end
		else if(INTMUL_TYPE == "fpga_auto" || INTMUL_TYPE == "fpga_lut" || INTMUL_TYPE == "fpga_dsp") begin
			localparam A_W_SIZE = intmul_pkg::DSP_PORT_SIZE_A; // word size for A
			localparam B_W_SIZE = intmul_pkg::DSP_PORT_SIZE_B; // word size for B
			localparam A_SIZE = $rtoi($ceil((1.0*LOG_A)/(1.0*A_W_SIZE))); // number of chunks for A
			localparam B_SIZE = $rtoi($ceil((1.0*LOG_B)/(1.0*B_W_SIZE))); // number of chunks for B

			reg [A_W_SIZE-1:0] a_c [0:A_SIZE-1];
			reg [B_W_SIZE-1:0] b_c [0:B_SIZE-1];

			localparam dsp_t =  (INTMUL_TYPE == "fpga_dsp") ? "yes" : 
								(INTMUL_TYPE == "fpga_lut") ? "no"  : 
								(INTMUL_TYPE == "fpga_auto") ? "auto" : "";
			(* use_dsp = dsp_t *) reg  [A_W_SIZE+B_W_SIZE-1:0] p_product [0:A_SIZE*B_SIZE-1];
			wire [LOG_A+LOG_B-1:0] p_tree    [0:A_SIZE*B_SIZE-1];
			wire [LOG_A+LOG_B-1:0] p_tree_out[0:1];
			reg  [LOG_A+LOG_B-1:0] D;

			// Divide inputs into chunks
            for(genvar i=0; i<A_SIZE; i=i+1) begin
                always @(posedge clk) a_c[i] <= (A >> (A_W_SIZE*i));
            end
            for(genvar i=0; i<B_SIZE; i=i+1) begin
                always @(posedge clk) b_c[i] <= (B >> (B_W_SIZE*i));
            end
            
			// Perform partial multiplications
            for(genvar i=0; i<A_SIZE; i=i+1) begin
                for(genvar j=0; j<B_SIZE; j=j+1) begin
                    always @(posedge clk) begin
                        p_product[i*B_SIZE + j] <= a_c[i] * b_c[j];
                    end
                end
            end

			// CSA-tree reduction
            for(genvar i=0; i<A_SIZE; i=i+1) begin
                for(genvar j=0; j<B_SIZE; j=j+1) begin
                    assign p_tree[i*B_SIZE + j] = (p_product[i*B_SIZE + j] << (i*A_W_SIZE+j*B_W_SIZE));
                end
            end

			csa_tree_6to3 #(LOG_A+LOG_B,A_SIZE*B_SIZE,LOG_A+LOG_B) cs0(p_tree,p_tree_out);

			// Final addition
            if(LOG_A <= A_W_SIZE && LOG_B <= B_W_SIZE) begin
                assign C = p_product[0];
            end
            else begin
                localparam SPLIT_WIDTH_L = (LOG_A + LOG_B) / 2;
                localparam SPLIT_WIDTH_H = LOG_A + LOG_B - SPLIT_WIDTH_L;
                logic [SPLIT_WIDTH_L:0] low_add;
                logic [SPLIT_WIDTH_H-1:0] high [0:1];
                always @(posedge clk) begin
                    low_add <= p_tree_out[0][SPLIT_WIDTH_L-1:0]+p_tree_out[1][SPLIT_WIDTH_L-1:0];
                    high[0] <= p_tree_out[0][LOG_A+LOG_B-1:SPLIT_WIDTH_L];
                    high[1] <= p_tree_out[1][LOG_A+LOG_B-1:SPLIT_WIDTH_L];

                    D <= ((high[0] + high[1]) << SPLIT_WIDTH_L) + low_add;
                end
                assign C = D;
            end
		end
		else begin
			// If nothing specified, it will use a simple simulation model
			wire[LOG_A+LOG_B-1:0] m_out;
			reg [LOG_A+LOG_B-1:0] m [INTMUL_LAT-1:0];       
			
			assign m_out = A*B;

			integer i;
			always @(posedge clk) begin
				m[0] <= m_out;
				for (i = 0; i < (INTMUL_LAT-1); i = i+1) begin
					m[i+1] <= m[i];
				end
			end

			assign C = m[INTMUL_LAT-1];
		end
	endgenerate

endmodule
