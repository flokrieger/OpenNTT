/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

`timescale 1ns/1ps

// Parametric carry save adder
// Inputs (x,y,z): K-bit integers
// Outputs (c,s) : K-bit integers
//
//  Example:  x:  * * * * * * * * *
//            y:  * * * * * * * * *
//            z:  * * * * * * * * *
//            t:  * * * * * * * * *
//            w:  * * * * * * * * *
//            q:  * * * * * * * * *
//           -----------------------
//            s:  * * * * * * * * *
//            o:  * * * * * * * * 0
//            c:  * * * * * * * 0 0  

`default_nettype wire

module csa_6to3
#(
    parameter K = 0, // bit-size
	  parameter N = 0  // number of inputs (5 or 6)
)
(
    input  [K-1:0] x,y,z,t,w,q,
    output [K-1:0] c,o,s
);

generate
	if (N == 6) begin
		assign c[1:0] = 0;
		assign o[0] = 0;
		for(genvar i=0; i<K-2; i=i+1) begin: FA_LOOP
			assign {c[i+2],o[i+1],s[i]} = x[i] + y[i] + z[i] + t[i] + w[i] + q[i];
		end
		assign {o[K-1],s[K-2]} = (x[K-2] + y[K-2] + z[K-2] + t[K-2] + w[K-2] + q[K-2]);
		assign s[K-1] = (x[K-1] + y[K-1] + z[K-1] + t[K-1] + w[K-1] + q[K-1]);
	end
	else begin
		assign c[1:0] = 0;
		assign o[0] = 0;
		for(genvar i=0; i<K-2; i=i+1) begin: FA_LOOP
			assign {c[i+2],o[i+1],s[i]} = x[i] + y[i] + z[i] + t[i] + w[i];
		end
		assign {o[K-1],s[K-2]} = (x[K-2] + y[K-2] + z[K-2] + t[K-2] + w[K-2]);
		assign s[K-1] = (x[K-1] + y[K-1] + z[K-1] + t[K-1] + w[K-1]);
	end
endgenerate

endmodule
