/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

`timescale 1ns/1ps

// Parametric carry save adder tree
// This module requires some parameters (that need to be calculated by its user)
// Parameters:
// - SIZE_I: bit-size of input
// - SIZE_O: bit-size of output (should be specificed by the user as ~ SIZE_I + log_2(DEPTH))
// - DEPTH: depth of adder tree

// P.S.: This module uses only 3to2 CSAs 

`default_nettype wire

module csa_tree_3to2
#
(
	parameter SIZE_I = 0,
	parameter DEPTH  = 0, 
	parameter SIZE_O = (SIZE_I + $rtoi($ceil($clog2(DEPTH)))) // has a default value
)
(
	input [SIZE_I-1:0] A [DEPTH-1:0],
	output[SIZE_O-1:0] B [1:0]
);

localparam CSA_NUM   = (DEPTH/3);
localparam NEW_DEPTH = (CSA_NUM*2) + (DEPTH % 3);

localparam NEW_SIZE_I= (SIZE_I == SIZE_O) ? SIZE_O : (SIZE_I+1);
localparam NEW_SIZE_O= SIZE_O;

wire [SIZE_O-1:0] tree_1 [DEPTH-1:0];
wire [NEW_SIZE_O-1:0] tree_2 [NEW_DEPTH-1:0];
wire [NEW_SIZE_I-1:0] tree_3 [NEW_DEPTH-1:0];

// first, assign inputs to tree
generate
	for(genvar n=0; n<DEPTH; n=n+1) begin: I_ASSIGN
        assign tree_1[n][SIZE_I-1:0] = A[n];
        if (SIZE_O > SIZE_I) begin
		    assign tree_1[n][SIZE_O-1:SIZE_I] = 0;
	    end
    end
endgenerate

// reduction
generate
	// reduce
	for(genvar k=0; k<CSA_NUM; k=k+1) begin: LAYER_LOOP
		csa_3to2 
		#(
			.K(SIZE_O),
			.N(3)
		) 
		csau
		(
			.x(tree_1[3*k+0]),
			.y(tree_1[3*k+1]),
			.z(tree_1[3*k+2]),
			.c(tree_2[2*k+0]),
			.s(tree_2[2*k+1])
		);
	end
	// move rest to next layer
	for(genvar m=3*CSA_NUM; m<DEPTH; m=m+1) begin: ASSIGN_LOOP
		assign tree_2[m-CSA_NUM] = tree_1[m];
	end
endgenerate

// generate next tree
generate
	for(genvar i=0; i<NEW_DEPTH; i=i+1) begin: TREE_LOOP
		assign tree_3[i] = tree_2[i][NEW_SIZE_I-1:0];
	end
endgenerate

// start reducing next layer
generate
    if (DEPTH == 0) begin
        assign B[0] = 0;
        assign B[1] = 0;
    end
    else if (DEPTH == 1) begin
        assign B[0] = A[0];
        assign B[1] = 0; 
    end
    else if (DEPTH == 2) begin
        assign B[0] = A[0];
        assign B[1] = A[1]; 
    end
	else if (NEW_DEPTH == 2) begin
		assign B[0] = tree_3[0];
		assign B[1] = tree_3[1];
	end
	else begin
		csa_tree_3to2 
		#(
			.SIZE_I(NEW_SIZE_I),
			.DEPTH(NEW_DEPTH),
			.SIZE_O(NEW_SIZE_O)
		) 
		csatu
		(
			.A(tree_3),
			.B(B)
		);
	end
endgenerate

endmodule
