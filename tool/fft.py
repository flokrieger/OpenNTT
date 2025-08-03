###################################################################
# OpenNTT - 2024
# Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
# Contact: florian.krieger@iaik.tugraz.at
###################################################################

from helper import *
from cConnector import *
from math import log2, ceil

# Python code that resembles the hardware functionality of FFT

def clog2(x): return ceil(log2(x))

def FFT_DIF_NR(B,omega,generated_tw,stored_tw,pe,debug_mem,debug_all=False,do_dif=True):
    A = [None]*len(B)
    for i in range(len(B)):
       A[i] = B[i].copy()
    
    N = len(A)*len(A[0])

    m = 1
    v = N//2
    tw_counter = 0
    
    e1 = [0]*pe
    e0 = [0]*pe
    o0 = [0]*pe
    o1 = [0]*pe
    o2 = [0]*pe

    rd_addr1 = 0
    rd_addr2 = 0

    valid = 0
    valid1 = 0
    j_lsb0 = 0
    j_lsb1 = 0

    stage = 0
    while v>0:
        s = v if stage >= clog2(pe) else N//2//pe
        it = -1

        k_limit = 1 if stage < clog2(pe) else m>>clog2(pe)
        for k in range(k_limit):
            k_br = int_reverse(k,clog2(N)-clog2(pe))
            for j in range(s):
                j_lsb = j & 1

                base = j >> 1 if j_lsb == 0 else (j>>1) + (s>>1)
                
                addr = base+(k_br>>1) if stage >= clog2(pe) else j

                # Checking the access order
                it += 1
                s_diff = stage - clog2(pe)
                if s_diff < 0 : 
                   addr_check = it
                else:
                  l = clog2(N//2//pe)
                  lo_bits = l-s_diff
                  hi = it >> lo_bits
                  lo = it % 2**lo_bits
                  
                  lo = 0 if lo_bits == 0 else (lo >> 1) | ((lo & 1) << (lo_bits-1))
                  hi = int_reverse(hi, s_diff) if s_diff > 0 else 0
                  addr_check = lo | (hi << lo_bits)
                assert addr_check == addr
                
                for p in range(pe):
                  if generated_tw is not None:
                    TW = generated_tw[p][tw_counter]
                  else:
                     p_idx = p % (pe >> stage) if pe >> stage != 0 else 0
                     p_idx <<= stage
                     addr_idx = (addr << stage) % (N//2//pe)
                     p_idx += ((addr << stage) // (N//2//pe)) % pe
                     TW = stored_tw[p_idx][addr_idx]
                  
                  if do_dif:
                    a = A[p*2][addr]
                    b = A[p*2+1][addr]

                    e,o = (a,b) if debug_mem else GSButterfly_double_nosubnormal(a , b, TW)
                  else:
                    a = A[p*2][addr]
                    b = A[p*2+1][addr]

                    e,o = (a,b) if debug_mem else CTButterfly_double_nosubnormal(a , b , TW)

                  # store logic
                  if valid1 == 1:
                    last_stage = v == 1
                    if last_stage or stage < clog2(pe):
                      x = e0[p]
                      y = o1[p]
                    else:
                      x = e0[p] if j_lsb1 == 0 else o0[p]
                      y = e1[p] if j_lsb1 == 0 else o1[p]
                    
                    t = pe >> stage if stage < clog2(pe) else 1
                    if (p & (t>>1)) == 0:
                      op0_addr = p*2
                      op1_addr = p*2 + t
                    else:
                      op0_addr = p*2 - t + 1
                      op1_addr = p*2 + 1
                    
                    A[op0_addr][rd_addr1] = x
                    A[op1_addr][rd_addr1] = y

                  # shift register:
                  e0[p] = e1[p]
                  e1[p] = e
                  o0[p] = o1[p]
                  o1[p] = o2[p]
                  o2[p] = o
                
                tw_counter += 1

                rd_addr1 = rd_addr2
                rd_addr2 = addr

                j_lsb1 = j_lsb0
                j_lsb0 = j_lsb

                valid1 = valid
                valid = 1

        for p in range(pe):
          # store logic ( flush pipeline for correct print)
          last_stage = v == 1
          if last_stage or stage < clog2(pe):
            x = e0[p]
            y = o1[p]
          else:
            x = e0[p] if j_lsb1 == 0 else o0[p]
            y = e1[p] if j_lsb1 == 0 else o1[p]

          sh_cnt = stage if stage < clog2(pe) else clog2(pe)
          t = pe >> sh_cnt
          if (p & (t>>1)) == 0:
            op0_addr = p*2
            op1_addr = p*2 + t
          else:
            op0_addr = p*2 - t + 1
            op1_addr = p*2 + 1
          
          A[op0_addr][rd_addr1] = x
          A[op1_addr][rd_addr1] = y

          # shift register:
          e0[p] = e1[p]
          e1[p] = e
          o0[p] = o1[p]
          o1[p] = o2[p]
          o2[p] = o

        rd_addr1 = rd_addr2
        rd_addr2 = addr

        j_lsb1 = j_lsb0
        j_lsb0 = j_lsb

        valid1 = valid
        valid = 0
        
        for p in range(pe):
          last_stage = v == 1
          if last_stage or stage < clog2(pe):
            x = e0[p]
            y = o1[p]
          else:
            x = e0[p] if j_lsb1 == 0 else o0[p]
            y = e1[p] if j_lsb1 == 0 else o1[p]
          
          sh_cnt = stage if stage < clog2(pe) else clog2(pe)
          t = pe >> sh_cnt
          if (p & (t>>1)) == 0:
            op0_addr = p*2
            op1_addr = p*2 + t
          else:
            op0_addr = p*2 - t + 1
            op1_addr = p*2 + 1
          
          A[op0_addr][rd_addr1] = x
          A[op1_addr][rd_addr1] = y

          # shift register:
          e0[p] = e1[p]
          e1[p] = e
          o0[p] = o1[p]
          o1[p] = o2[p]
          o2[p] = o

        rd_addr1 = rd_addr2
        rd_addr2 = addr

        j_lsb1 = j_lsb0
        j_lsb0 = j_lsb

        valid1 = valid
        valid = 0
      
        m = 2*m
        v = v >> 1
        stage += 1

    return A

def FFT_DIF_RN(B,omega,generated_tw,stored_tw,pe,debug_mem,debug_all=False,do_dif = True):
    A = [None]*len(B)
    for i in range(len(B)):
       A[i] = B[i].copy()
    
    N = len(A)*len(A[0])

    m = 1
    v = N//2
    tw_counter = 0
    
    e1 = [0]*pe
    e0 = [0]*pe
    o0 = [0]*pe
    o1 = [0]*pe
    o2 = [0]*pe

    rd_addr1 = 0
    rd_addr2 = 0

    valid = 0
    valid1 = 0
    j_lsb0 = 0
    j_lsb1 = 0

    stage = 0
    while v>0:
        s = N//2//pe >> stage if stage < clog2(N)-clog2(pe) else 1
        it = -1

        for k in range(m if stage < clog2(N)-clog2(pe) else N//2//pe):
            for j in range(s):
                j_lsb = j & 1

                base = int_reverse(j >> 1, clog2(N//2//pe))
                base += k
                
                addr = base
                if j % 2 == 1:
                  addr += m

                # Checking the access order
                it += 1
                if stage >= clog2(N)-clog2(pe)-1 : 
                   addr_check = it
                else:
                  
                  h_bits = clog2(N//2//pe) - stage
                  it_r = int_reverse(it, clog2(N//2//pe))
                  hi = it_r >> stage
                  lo = it_r % 2**(stage)

                  lo = 0 if stage == 0 else int_reverse(lo, stage)
                  hi = ((hi << 1) % 2**h_bits) | (hi >> (h_bits-1))
                  addr_check = (hi << stage) | lo
                assert addr_check == addr
                
                for p in range(pe):
                  if generated_tw is not None:
                    TW = generated_tw[p][tw_counter]
                  else:
                    p_idx = p
                    addr_idx = (addr >> stage)
                    TW = stored_tw[p_idx][addr_idx]

                  if do_dif:
                    a = A[p*2][addr]
                    b = A[p*2+1][addr]
                    e,o = (a,b) if debug_mem else GSButterfly_double_nosubnormal(a , b , TW)
                  else:
                    a = A[p*2][addr]
                    b = A[p*2+1][addr]
                    e,o = (a,b) if debug_mem else CTButterfly_double_nosubnormal(a , b , TW)

                  # store logic
                  if valid1 == 1:
                    last_stage = v == 1
                    if stage >= clog2(N)-clog2(pe)-1:
                      x = e0[p]
                      y = o1[p]
                    else:
                      x = e0[p] if j_lsb1 == 0 else o0[p]
                      y = e1[p] if j_lsb1 == 0 else o1[p]
                    
                    sh_cnt = clog2(N) - 2 - stage
                    t = pe >> sh_cnt if stage >= clog2(N)-clog2(pe)-1 and not last_stage else 1
                    if (p & (t>>1)) == 0:
                      op0_addr = p*2
                      op1_addr = p*2 + t
                    else:
                      op0_addr = p*2 - t + 1
                      op1_addr = p*2 + 1
                    
                    A[op0_addr][rd_addr1] = x
                    A[op1_addr][rd_addr1] = y

                  e0[p] = e1[p]
                  e1[p] = e
                  o0[p] = o1[p]
                  o1[p] = o2[p]
                  o2[p] = o
                
                tw_counter += 1

                rd_addr1 = rd_addr2
                rd_addr2 = addr

                j_lsb1 = j_lsb0
                j_lsb0 = j_lsb

                valid1 = valid
                valid = 1

        for p in range(pe):
          # store logic ( flush pipeline for correct print)
          last_stage = v == 1
          if stage >= clog2(N)-clog2(pe)-1:
            x = e0[p]
            y = o1[p]
          else:
            x = e0[p] if j_lsb1 == 0 else o0[p]
            y = e1[p] if j_lsb1 == 0 else o1[p]
          
          sh_cnt = clog2(N) - 2 - stage
          t = pe >> sh_cnt if stage >= clog2(N)-clog2(pe)-1 and not last_stage else 1
          if (p & (t>>1)) == 0:
            op0_addr = p*2
            op1_addr = p*2 + t
          else:
            op0_addr = p*2 - t + 1
            op1_addr = p*2 + 1
          
          A[op0_addr][rd_addr1] = x
          A[op1_addr][rd_addr1] = y

          # shift register:
          e0[p] = e1[p]
          e1[p] = e
          o0[p] = o1[p]
          o1[p] = o2[p]
          o2[p] = o

        rd_addr0 = rd_addr1
        rd_addr1 = rd_addr2
        rd_addr2 = addr

        j_lsb1 = j_lsb0
        j_lsb0 = j_lsb

        valid1 = valid
        valid = 0
        
        for p in range(pe):
          last_stage = v == 1
          if last_stage or stage >= clog2(N)-clog2(pe)-1:
            x = e0[p]
            y = o1[p]
          else:
            x = e0[p] if j_lsb1 == 0 else o0[p]
            y = e1[p] if j_lsb1 == 0 else o1[p]
          
          sh_cnt = clog2(N) - 2 - stage
          t = pe >> sh_cnt if stage >= clog2(N)-clog2(pe)-1 and not last_stage else 1
          if (p & (t>>1)) == 0:
            op0_addr = p*2
            op1_addr = p*2 + t
          else:
            op0_addr = p*2 - t + 1
            op1_addr = p*2 + 1
          
          A[op0_addr][rd_addr1] = x
          A[op1_addr][rd_addr1] = y

          # shift register:
          e0[p] = e1[p]
          e1[p] = e
          o0[p] = o1[p]
          o1[p] = o2[p]
          o2[p] = o

        rd_addr1 = rd_addr2
        rd_addr2 = addr

        j_lsb1 = j_lsb0
        j_lsb0 = j_lsb

        valid1 = valid
        valid = 0
      
        m = 2*m
        v = v >> 1
        stage += 1

    return A

def FFT_DIT_NR(B,omega,generated_tw,stored_tw,pe,debug_mem,debug_all=False):
    # same except butterfly:
    return FFT_DIF_NR(B,omega,generated_tw,stored_tw,pe,debug_mem,debug_all,False)

def FFT_DIT_RN(B,omega,generated_tw,stored_tw,pe,debug_mem,debug_all=False):
  # same except butterfly:
  return FFT_DIF_RN(B,omega,generated_tw,stored_tw,pe,debug_mem,debug_all,False)

