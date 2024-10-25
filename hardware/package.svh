// Configuration file for openNTT

`define _OPEN_NTT_

`define NTT_TYPE "mintt_dif_rn"
`define LOGN 11
`define LOGQ 60
`define PE 2
`define INSTANTIATE_MULT_ADD 1
`define Q_VALUE 0
`define WORD_SIZE 12
`define NUM_POLY_MEMS 2
`define ROM_ADDR_WIDTH 7

// max number of poly mems. You can change that, but need to adapt software interface
`define MAX_NUM_POLY_MEMS 4

`define TB_base_forward 0
`define TB_base_inverse 44
`define TB_NUMQ 2
`define TB_Q_ARR {60'h80014001, 60'h800000000004001}
`define TB_R_INV_ARR {60'h38062c06, 60'h38001fff8003c00} // introduced by montgomery
`define TB_R_ARR {60'h44005000, 60'h7ffffffffffbfff} // compensation for montgomery

// absolute paths to config files:
`define OPEN_NTT_PATH "/home/fkrieger/Documents/openNTT"
