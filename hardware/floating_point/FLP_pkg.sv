/*
    OpenNTT - 2024
    Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
    Contact: florian.krieger@iaik.tugraz.at
*/

// IEEE 754 double precision:

package FLP_pkg;
  localparam SIGNIFICANT_BITS = 52;
  localparam EXPONENT_BITS    = 11;
  localparam OVERALL_BITS     = 64;
  localparam EXPONENT_BIAS    = 11'd1023;

  localparam COMPLEX_ONE_ENCODING = {64'h3FF0000000000000, 64'h0};

  localparam DELAY_COMPLEX_MULT = 13;
  localparam DELAY_FLP_ADDER    = 8;
  localparam FFT_BF_LAT         = DELAY_COMPLEX_MULT + DELAY_FLP_ADDER + 1;
endpackage