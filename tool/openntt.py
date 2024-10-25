
import argparse
from math import log2,ceil
from genparam import generate_params
from helper import modinv
from os import remove,mkdir
from shutil import rmtree
from random import seed
from time import time
from ntt_hw_model import rom_content_DIF_NR, rom_content_DIF_RN, rom_content_DIT_NR, rom_content_DIT_RN, rom_content_Merged_DIF_RN, rom_content_Merged_DIT_NR, ROM_content_to_mem
from ntt_tvGen import gen_tv_NTT_NR, gen_tv_NTT_RN, gen_c_tv_NTT_NR, gen_c_tv_NTT_RN


# Arguments

# -- c          : clear output products
# -- ntt_type   : type of ntt configuration 
# -- n          : size of polynomial
# -- q_fixed    : 0: q is variable, 1: q is fixed
# -- q_count    : the number of q supported
# -- q_list     : either list of fixed qs or list of log(q)
# -- tw_list    : optional - list of roots for fntt 
# -- tw_inv_list: optional - list of roots for intt
# -- io_band    : number of input/output coefficients (io_band/2 is the number of processing elements)
# -- mem_depth  : number of polynomials to store in memory unit
# -- coeff_arith: hardware supports coefficient-wise arithmetic when set

# -- ntt_type   : standalones -> fntt_dit_nr, fntt_dif_nr, intt_dit_rn, intt_dif_rn, mfntt_dit_nr, mintt_dif_rn 
#                 unifieds -> (fntt_dit_nr, intt_dit_rn), (mfntt_dit_nr, mintt_dif_rn)
# -- n/size     : any power of two >= 64
# -- q_fixed    : 0, 1
# -- q_count    : any value larger than 0
# -- q_list     : Either list of fixed qs (with at least 8 bit) or list of log(q) (with log(q) <= 64)
# -- tw_list    : Optional - list of roots for fntt
# -- tw_inv_list: Optional - list of roots for intt
# -- io_band    : any value power of two
# -- mem_depth  : any value larger than 0



def NTT_generateTwRom_MemoryOptimized(ntt_type,n,pe,mod_mult_lat,tw_list_forward,tw_list_inverse,q_arr,R_montred):  
  rom_forward = []
  rom_inverse = []
  
  arr_dif_nr = []
  arr_dif_rn = []
  twiddles_dit_nr = []
  twiddles_dit_rn = []
  arr_mdif_rn = []
  twiddles_mdit_nr = []
  for j,q in enumerate(q_arr):
    if ntt_type == "fntt_dif_nr":
      w = tw_list_forward[j]
      twiddles, omega_c_init = rom_content_DIF_NR(n,pe,mod_mult_lat,w,q)
      arr_dif_nr += [1, omega_c_init]
      for i in range(1,len(twiddles)):
        arr_dif_nr += [twiddles[i][0]]
      arr_dif_nr += twiddles[0]
    
    if ntt_type == "intt_dif_rn":
      w = tw_list_inverse[j]
      twiddles, omega_c_init = rom_content_DIF_RN(n,pe,mod_mult_lat,w,q)
      arr_dif_rn += [1, omega_c_init]
      for i in range(1,len(twiddles)):
        arr_dif_rn += [twiddles[i][0]]
      arr_dif_rn += twiddles[0]
    
    if ntt_type == "fntt_dit_nr" or ntt_type == "fntt_dit_nr-intt_dit_rn":
      w = tw_list_forward[j]
      twiddles_dit_nr += rom_content_DIT_NR(n,pe,mod_mult_lat,w,q)
    
    if ntt_type == "intt_dit_rn" or ntt_type == "fntt_dit_nr-intt_dit_rn":
      w = tw_list_inverse[j]
      twiddles_dit_rn += rom_content_DIT_RN(n,pe,mod_mult_lat,w,q)
    
    if ntt_type == "mintt_dif_rn" or ntt_type == "mfntt_dit_nr-mintt_dif_rn":
      psi = tw_list_inverse[j]
      twiddles, omega_c_init = rom_content_Merged_DIF_RN(n,pe,mod_mult_lat,psi,q)
      arr_mdif_rn += [1, omega_c_init]
      for i in range(1,len(twiddles)):
        arr_mdif_rn += [twiddles[i][0]]
      arr_mdif_rn += twiddles[0]
    
    if ntt_type == "mfntt_dit_nr" or ntt_type == "mfntt_dit_nr-mintt_dif_rn":
      psi = tw_list_forward[j]
      twiddles_mdit_nr += rom_content_Merged_DIT_NR(n,pe,mod_mult_lat,psi,q)

  rom_forward = arr_dif_nr + twiddles_dit_nr + twiddles_mdit_nr
  rom_inverse = arr_dif_rn + twiddles_dit_rn + arr_mdif_rn
  return rom_forward, rom_inverse

  
def openntt_generator_NTT(ntt_type, \
                          n, \
                          q_fixed, \
                          q_count, \
                          q_list, \
                          tw_list, \
                          tw_inv_list, \
                          io_band, \
                          mem_depth, \
                          coeff_arith):
  

  ntt_type = str(ntt_type).lower()
  merged = ntt_type.startswith("m")

  if mem_depth > MAX_NUM_POLYS: raise Exception("Too high mem_depth")
  if 2**ceil(log2(n)) != n: raise Exception("invalid n")
  if io_band < 2 or 2**ceil(log2(io_band)) != io_band: raise Exception("invalid io_band")
  if mem_depth < 1: raise Exception("invalid mem_depth")
  if q_count != len(q_list): raise Exception("q_list size mismatch")
  if q_fixed and q_count != 1: raise Exception("need to specify exactly one q if q is fixed")
  if len(tw_list) > 0 and len(tw_list) != len(q_list): raise Exception("Twiddle list must be either empty or as large as q_list")
  if len(tw_inv_list) > 0 and len(tw_list) != len(q_list): raise Exception("Twiddle list must be either empty or as large as q_list")
  if ntt_type == 'fntt_dit_nr-intt_dit_rn' or ntt_type == 'mfntt_dit_nr-mintt_dif_rn':
    if len(tw_list) != len(tw_inv_list): raise Exception("roots must be provided for both, forward and inverse transform")



  # set up primes q
  q_arr = []
  logq_max = 0
  word_size = ceil(log2(2*n))
  for q in q_list:
    if q <= 64: # logq provided
      _, q_generated, _,_,_,_, = generate_params(n,q,q_prev=q_arr)
      q_arr += [q_generated]
      logq_max = max(ceil(log2(q_generated)),logq_max)
    else: # q provided
      if merged and q % (2*n) != 1 or not merged and q % (n) != 1: raise Exception("Invalid prime")
      if q % (2*n) != 1: 
        word_size = ceil(log2(n))
      q_arr += [q]
      logq_max = max(ceil(log2(q)),logq_max)

  # set up twiddle factors / roots of unity
  if len(tw_list) > 0:
    tw_list_forward = tw_list
    tw_list_inverse = tw_inv_list
  else:
    tw_list_forward = []
    tw_list_inverse = []
    for i in range(q_count):
      seed(1234)
      _, _, psi,psiv,w,wv = generate_params(n,None,q=q_arr[i])
      tw_list_forward += [psi  if merged else w ]
      tw_list_inverse += [psiv if merged else wv]
  
  # prepare twiddle rom content:
  l_montred = ceil(1.0*logq_max/(1.0*word_size))
  mod_mult_lat = 4 + l_montred*2 + ((int((2*logq_max-47-1)/word_size)*(0+1)) if (logq_max-word_size <= 24) else (l_montred*(0+1))) + (0+1)

  mod_mult_lat = 2<<ceil(log2((mod_mult_lat))) if mod_mult_lat == 4 or mod_mult_lat == 8 or mod_mult_lat == 16 else 1<<ceil(log2((mod_mult_lat)))
  if mod_mult_lat not in [4,8,16,32]: raise Exception("Memory optimized version not applicable")

  rom_forward, rom_inverse = NTT_generateTwRom_MemoryOptimized(ntt_type,n,io_band//2,mod_mult_lat,tw_list_forward,tw_list_inverse,q_arr,2**(word_size*l_montred))
  if len(rom_forward) == 0:
    tw_rom_addr_width = ceil(log2(len(rom_inverse)))
  elif len(rom_inverse) == 0:
    tw_rom_addr_width = ceil(log2(len(rom_forward)))
  else:
    tw_rom_addr_width = max(ceil(log2(len(rom_forward))),ceil(log2(len(rom_inverse))))
  
  base_forward = len(rom_forward)//q_count
  base_inverse = len(rom_inverse)//q_count

  prefix = "Merged_" if merged else ""
  if len(rom_forward) != 0:
    dec_method = "DIT" if ntt_type in ["fntt_dit_nr", "mfntt_dit_nr","fntt_dit_nr-intt_dit_rn", "mfntt_dit_nr-mintt_dif_rn"] else "DIF"
    ROM_content_to_mem([rom_forward],n,io_band//2,mod_mult_lat,prefix+dec_method+"_NR",2**(word_size*l_montred),q_arr,path="./RomContent/")
  if len(rom_inverse) != 0:
    dec_method = "DIT" if ntt_type in ["intt_dit_rn", "fntt_dit_nr-intt_dit_rn"] else "DIF"
    ROM_content_to_mem([rom_inverse],n,io_band//2,mod_mult_lat,prefix+dec_method+"_RN",2**(word_size*l_montred),q_arr,path="./RomContent/")
  

  # write to config file:
  with open("../hardware/package.svh", "w") as p_file:
    p_file.write("// Configuration file for openNTT\n\n")
    p_file.write("`define _OPEN_NTT_\n\n")
    p_file.write('`define NTT_TYPE "' + ntt_type + '"\n')
    p_file.write('`define LOGN ' + str(int(log2(n))) + '\n')
    p_file.write('`define LOGQ ' + str(logq_max) + '\n')
    p_file.write('`define PE ' + str(io_band//2) + '\n')
    p_file.write('`define INSTANTIATE_MULT_ADD ' + str(coeff_arith) + '\n')
    p_file.write('`define Q_VALUE ' + str(q_arr[0] if q_fixed else 0) + '\n')
    p_file.write('`define WORD_SIZE ' + str(word_size) + '\n')
    p_file.write('`define NUM_POLY_MEMS ' + str(mem_depth) + '\n')
    p_file.write('`define ROM_ADDR_WIDTH ' + str(tw_rom_addr_width) + '\n')

    p_file.write('\n// max number of poly mems. You can change that, but need to adapt software interface\n')
    p_file.write('`define MAX_NUM_POLY_MEMS ' + str(MAX_NUM_POLYS) + '\n')

    p_file.write('\n`define TB_base_forward ' + str(base_forward) + '\n')
    p_file.write('`define TB_base_inverse ' + str(base_inverse) + '\n')
    p_file.write('`define TB_NUMQ ' + str(q_count) + '\n')
    p_file.write('`define TB_Q_ARR {')
    for q in q_arr[:-1]:
      p_file.write(str(logq_max)+"'h"+hex(q)[2:] + ", ")
    p_file.write(str(logq_max)+"'h"+hex(q_arr[-1])[2:] +'}\n')
    p_file.write('`define TB_R_INV_ARR {')
    R = 2**(word_size*l_montred)
    for q in q_arr[:-1]:
      p_file.write(str(logq_max)+"'h"+hex(modinv(R,q))[2:] + ", ")
    p_file.write(str(logq_max)+"'h"+hex(modinv(R,q_arr[-1]))[2:] +'} // introduced by montgomery\n')
    p_file.write('`define TB_R_ARR {')
    for q in q_arr[:-1]:
      p_file.write(str(logq_max)+"'h"+hex(R%q)[2:] + ", ")
    p_file.write(str(logq_max)+"'h"+hex(R%q_arr[-1])[2:] +'} // compensation for montgomery\n\n')

    p_file.write("// absolute paths to config files:\n")
    p_file.write('`define OPEN_NTT_PATH "' + __file__.removesuffix("/tool/openntt.py") + '"\n')


  # generate some test vectors:
  s = time()
  for i in range(q_count):
    seed(s)
    if ntt_type in ["fntt_dit_nr", "mfntt_dit_nr","fntt_dit_nr-intt_dit_rn", "mfntt_dit_nr-mintt_dif_rn"]:
      gen_tv_NTT_NR(tw_list_forward[i],n,q_arr[i],False,merged,q_it=i)
    if ntt_type in ["fntt_dif_nr"]:
      gen_tv_NTT_NR(tw_list_forward[i],n,q_arr[i],True,merged,q_it=i)
    if ntt_type in ["intt_dit_rn", "fntt_dit_nr-intt_dit_rn"]:
      gen_tv_NTT_RN(tw_list_inverse[i],n,q_arr[i],False,merged,q_it=i)
    if ntt_type in ["intt_dif_rn", "mintt_dif_rn", "mfntt_dit_nr-mintt_dif_rn"]:
      gen_tv_NTT_RN(tw_list_inverse[i],n,q_arr[i],True,merged,q_it=i)
  
  R = 2**(word_size*l_montred)
  seed(s)
  if ntt_type in ["fntt_dit_nr", "fntt_dif_nr", "mfntt_dit_nr", "fntt_dit_nr-intt_dit_rn", "mfntt_dit_nr-mintt_dif_rn"]:
    gen_c_tv_NTT_NR(tw_list_forward,n,io_band//2,q_arr,ntt_type == "fntt_dif_nr",merged,base_forward,base_inverse,ntt_type in ["fntt_dit_nr", "mfntt_dit_nr", "fntt_dif_nr"],mem_depth,coeff_arith!=0,[R%_ for _ in q_arr])
  else: # intt_dit_rn, intt_dif_rn, mintt_dif_rn
    gen_c_tv_NTT_RN(tw_list_inverse,n,io_band//2,q_arr,ntt_type != "intt_dit_rn",merged,base_inverse,mem_depth,coeff_arith!=0,[R%_ for _ in q_arr])



if __name__ == '__main__':
    MAX_NUM_POLYS = 4
    
    parser = argparse.ArgumentParser()
    parser.add_argument('--c'          , type=int , default=0            , help='Clear output products',                         choices=[0,1])
    parser.add_argument('--ntt_type'   ,            default="fntt_dit_nr", help='Type of ntt configuration',                     choices=['fntt_dit_nr', 'fntt_dif_nr', 'intt_dit_rn', 'intt_dif_rn', 'mfntt_dit_nr', 'mintt_dif_rn', 'fntt_dit_nr-intt_dit_rn', 'mfntt_dit_nr-mintt_dif_rn'])
    parser.add_argument('--n'          , type=int , default=256          , help="Size of polynomial",                            choices=[2**x for x in range(6,24)])
    parser.add_argument('--q_fixed'    , type=int , default=0            , help="0: q is variable, 1: q is fixed",               choices=[0,1])
    parser.add_argument('--q_count'    , type=int , default=1            , help="The number of q supported")
    parser.add_argument('--q_list'     , type=str , default="32"         , help="Either list of fixed qs (with at least 8 bit) or list of log(q) (with log(q) <= 64)")
    parser.add_argument('--tw_list'    , type=str , default=""           , help="Optional - list of roots for fntt")
    parser.add_argument('--tw_inv_list', type=str , default=""           , help="Optional - list of roots for intt")
    parser.add_argument('--io_band'    , type=int , default=2            , help="Number of input/output coefficients")
    parser.add_argument('--mem_depth'  , type=int , default=1            , help="Number of polynomials to store in memory unit")
    parser.add_argument('--coeff_arith', type=int , default=0            , help="Support coefficient-wise arithmetic",           choices=[0,1])

    args = parser.parse_args()

    q_list      = [int(_) for _ in args.q_list.split(",")]       if args.q_list != "" else []
    tw_list     = [int(_) for _ in args.tw_list.split(",")]      if args.tw_list != "" else []
    tw_inv_list = [int(_) for _ in args.tw_inv_list.split(",")]  if args.tw_inv_list != "" else []


    if args.c == 1:
      try: remove("../hardware/package.svh")
      except: pass
      try: rmtree("./TestVectorsNTT/")
      except: pass
      try: rmtree("./RomContent/")
      except: pass
    try: mkdir("./TestVectorsNTT/")
    except: pass
    try: mkdir("./RomContent/")
    except: pass

    print("ntt_type   :",args.ntt_type)
    print("n          :",args.n)
    print("q_fixed    :",args.q_fixed)
    print("q_count    :",args.q_count)
    print("q_list     :",q_list)
    print("tw_list    :",tw_list)
    print("tw_inv_list:",tw_inv_list)
    print("io_band    :",args.io_band)
    print("mem_depth  :",args.mem_depth)
    print("coeff_arith:",args.coeff_arith)
    
    openntt_generator_NTT(args.ntt_type, \
                          args.n, \
                          args.q_fixed, \
                          args.q_count, \
                          q_list, \
                          tw_list, \
                          tw_inv_list, \
                          args.io_band, \
                          args.mem_depth, \
                          args.coeff_arith)

