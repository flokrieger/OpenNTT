// Configuration file for openNTT

package open_ntt_pkg;
  localparam NTT = 0;

  localparam NTT_TYPE = "intt_dif_rn";
  localparam LOGN = 10;
  localparam LOGQ = 128;
  localparam PE = 1;
  localparam INSTANTIATE_MULT_ADD = 1;
  localparam Q_VALUE = 1;
  localparam WORD_SIZE = 0;
  localparam MEMORY_OPTIMIZED = 1;
  localparam NUM_POLY_MEMS = 2;
  localparam ROM_ADDR_WIDTH = 5;

  // max number of poly mems. You can change that, but need to adapt software interface
  localparam MAX_NUM_POLY_MEMS = 4;

  localparam TB_base_forward = 0;
  localparam TB_base_inverse = 18;
  localparam TB_NUMQ = 1;

  typedef logic [0:TB_NUMQ-1][LOGQ-1:0] type_t;
  localparam type_t TB_Q_ARR = {0};
  localparam type_t TB_R_INV_ARR = {0};
  localparam type_t TB_R_ARR = {0};

  // absolute paths to config files:
  localparam OPEN_NTT_PATH = "/home/fkrieger/Documents/Projects/openNTT/OpenNTT_Github";
endpackage
