###################################################################
# OpenNTT - 2024
# Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
# Contact: florian.krieger@iaik.tugraz.at
###################################################################

from cConnector import *
from random import randint
from helper import *
from fft import FFT_DIT_NR, FFT_DIT_RN, FFT_DIF_NR,FFT_DIF_RN
from fft_hw_model import TW_DIF_NR, TW_DIF_RN, TW_DIT_NR, TW_DIT_RN, TW_Merged_DIT_NR, TW_Merged_DIF_RN
from fft_hw_model import clog2

TV_PATH_HW_FFT = "./test_vectors_fft/"
TV_PATH_SW_FFT = "../software/Testing/"

def gen_tv_FFT_NR(w,n,pe,modmul_lat,is_dif,is_merged,q_it=None):
  A = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]

  with open(TV_PATH_HW_FFT + "tv_FFT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"NR_n{n}_" + (str(q_it) if q_it is not None else "") + "in.txt", "w") as f:
     for a in A:
        f.write(hex(getUint64FromDouble(a.real))[2:] + " " + hex(getUint64FromDouble(a.imag))[2:] + "\n")

  if is_merged:
     generated_tw = TW_Merged_DIT_NR(w,n,pe,modmul_lat)
  else:
    generated_tw = TW_DIF_NR(w,n,pe,modmul_lat) if is_dif else TW_DIT_NR(w,n,pe,modmul_lat)
  if generated_tw is None:
     return 0
  ntt_bram = [[0]*(n//2//pe) for _ in range(2*pe)]

  for i in range(n):
    l = i % (n//2//pe)
    b = (i // (n//2//pe)) & (pe-1)
    e = (i // (n//2//pe)) // pe
    ntt_bram[(b<<1) | e][l] = A[i]


  if is_merged:
    res1_tmp = FFT_DIT_NR(ntt_bram,w,generated_tw,None,pe,False,False)
  else:
    if is_dif:
      res1_tmp = FFT_DIF_NR(ntt_bram,w,generated_tw,None,pe,False,False)
    else:
      res1_tmp = FFT_DIT_NR(ntt_bram,w,generated_tw,None,pe,False,False)


  res1 = [0 for _ in range(n)]
  for i in range(n):
    l = i >> 1
    h = ((l >> clog2(n//2//pe))<<1) + (i & 1)
    l = l % (n//2//pe)
    res1[i] = res1_tmp[h][l]

  with open(TV_PATH_HW_FFT + "tv_FFT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"NR_n{n}_" + (str(q_it) if q_it is not None else "") + "out.txt", "w") as f:
    for a in res1:
        f.write(hex(getUint64FromDouble(a.real))[2:] + " " + hex(getUint64FromDouble(a.imag))[2:] + "\n")

def gen_tv_FFT_RN(w,n,pe,modmul_lat,is_dif,is_merged,q_it=None):
  A = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]

  with open(TV_PATH_HW_FFT + "tv_FFT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"RN_n{n}_" + (str(q_it) if q_it is not None else "") + "in.txt", "w") as f:
     for a in A:
        f.write(hex(getUint64FromDouble(a.real))[2:] + " " + hex(getUint64FromDouble(a.imag))[2:] + "\n")

  if is_merged:
    generated_tw = TW_Merged_DIF_RN(w,n,pe,modmul_lat)
  else:
    generated_tw = TW_DIF_RN(w,n,pe,modmul_lat) if is_dif else TW_DIT_RN(w,n,pe,modmul_lat)
  if generated_tw is None:
     return 0
  ntt_bram = [[0]*(n//2//pe) for _ in range(2*pe)]

  for i in range(n):
    l = i & 1
    h = (i >> 1) % (n//2//pe)
    m = (i >> 1) // (n//2//pe)
    m <<= 1
    ntt_bram[m+l][h] = A[i]

  if is_merged:
    res1_tmp = FFT_DIF_RN(ntt_bram,w,generated_tw,None,pe,False,False)
  else:
    if is_dif:
      res1_tmp = FFT_DIF_RN(ntt_bram,w,generated_tw,None,pe,False,False)
    else:
      res1_tmp = FFT_DIT_RN(ntt_bram,w,generated_tw,None,pe,False,False)

  res1 = [0 for _ in range(n)]
  for i in range(n):
    l = i % (n//2//pe)
    h = i // (n//2//pe)
    m = h // pe
    h = (h % pe) << 1
    res1[i] = res1_tmp[h+m][l]

  with open(TV_PATH_HW_FFT + "tv_FFT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"RN_n{n}_" + (str(q_it) if q_it is not None else "") + "out.txt", "w") as f:
    for a in res1:
      f.write(hex(getUint64FromDouble(a.real))[2:] + " " + hex(getUint64FromDouble(a.imag))[2:] + "\n")

def gen_tv_PWM_FFT(n):
  with open(TV_PATH_HW_FFT + "tv_FFT_mul_add_sub.txt", "w") as f:

    A = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]
    B = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]

    for a in A:
      f.write(hex(getUint64FromDouble(a.real))[2:] + " " + hex(getUint64FromDouble(a.imag))[2:] + "\n")

    for b in B:
      f.write(hex(getUint64FromDouble(b.real))[2:] + " " + hex(getUint64FromDouble(b.imag))[2:] + "\n")

    for i in range(n):
      c = complexMult_double_nosubnormal(A[i], B[i])
      f.write(hex(getUint64FromDouble(c.real))[2:] + " " + hex(getUint64FromDouble(c.imag))[2:] + "\n")

    for i in range(n):
      c_r = addNoSubnormal_D(A[i].real, B[i].real)
      c_i = addNoSubnormal_D(A[i].imag, B[i].imag)
      f.write(hex(getUint64FromDouble(c_r))[2:] + " " + hex(getUint64FromDouble(c_i))[2:] + "\n")
    
    for i in range(n):
      c_r = addNoSubnormal_D(A[i].real, -B[i].real)
      c_i = addNoSubnormal_D(A[i].imag, -B[i].imag)
      f.write(hex(getUint64FromDouble(c_r))[2:] + " " + hex(getUint64FromDouble(c_i))[2:] + "\n")

def gen_c_tv_PWM_FFT(n):
  with open(TV_PATH_SW_FFT + "tv.h", "a") as f:
    f.write("#define PWM_INSTANTIATED\n")
    f.write("uint64_t R_arr[] = {0};\n")

    A = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]
    B = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]

    j = 0

    f.write("uint64_t polyArith_in_a_" + str(j) + "[] = {")
    for a in A:
      f.write(hex(getUint64FromDouble(a.real)) + "," + hex(getUint64FromDouble(a.imag)) + ",")
    f.write("0};\n")

    f.write("uint64_t polyArith_in_b_" + str(j) + "[] = {")
    for b in B:
      f.write(hex(getUint64FromDouble(b.real)) + "," + hex(getUint64FromDouble(b.imag)) + ",")
    f.write("0};\n")

    f.write("uint64_t polyMul_out_" + str(j) + "[] = {")
    for i in range(n):
      c = complexMult_double_nosubnormal(A[i], B[i])
      f.write(hex(getUint64FromDouble(c.real)) + "," + hex(getUint64FromDouble(c.imag)) + ",")
    f.write("0};\n")

    f.write("uint64_t polyAdd_out_" + str(j) + "[] = {")
    for i in range(n):
      c_r = addNoSubnormal_D(A[i].real, B[i].real)
      c_i = addNoSubnormal_D(A[i].imag, B[i].imag)
      f.write(hex(getUint64FromDouble(c_r)) + "," + hex(getUint64FromDouble(c_i)) + ",")
    f.write("0};\n")
    f.write("uint64_t polySub_out_" + str(j) + "[] = {")
    for i in range(n):
      c_r = addNoSubnormal_D(A[i].real, -B[i].real)
      c_i = addNoSubnormal_D(A[i].imag, -B[i].imag)
      f.write(hex(getUint64FromDouble(c_r)) + "," + hex(getUint64FromDouble(c_i)) + ",")
    f.write("0};\n")

    f.write("uint64_t* polyArith_in_a[] = {")
    for i in range(1):
      f.write("polyArith_in_a_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polyArith_in_b[] = {")
    for i in range(1):
      f.write("polyArith_in_b_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polyMul_out[] = {")
    for i in range(1):
      f.write("polyMul_out_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polyAdd_out[] = {")
    for i in range(1):
      f.write("polyAdd_out_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polySub_out[] = {")
    for i in range(1):
      f.write("polySub_out_" + str(i) + ", ")
    f.write("NULL};\n")

def gen_c_tv_FFT_NR(w,n,pe,modmul_lat,is_dif,is_merged,base_forward,base_inverse,just_forward,num_poly,coeff_arith):
  with open(TV_PATH_SW_FFT + "tv.h", "w") as f:
    f.write("#define FFT\n")
    f.write("#define N "+str(n)+"\n")
    f.write("#define NUM_POLY "+str(num_poly)+"\n")
    f.write("uint32_t PE = "+str(pe)+";\n")
    f.write("uint8_t do_forward = 1;\n")
    f.write("uint8_t do_inverse = "+str(0 if just_forward else 1)+";\n")
    f.write("uint32_t num_q = 1;\n")
    f.write("uint32_t base_forward = "+str(base_forward)+";\n")
    f.write("uint32_t base_inverse = "+str(base_inverse)+";\n")
    f.write("uint64_t q_arr[] = {0};\n")
    f.write("uint32_t logq = 128;\n")


  j = 0
  A = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]

  with open(TV_PATH_SW_FFT + "tv.h", "a") as f:
    f.write("uint64_t in_fft_" + str(j) + "[] = {")
    for a in A:
      f.write(hex(getUint64FromDouble(a.real)) + "," + hex(getUint64FromDouble(a.imag)) + ",")
    f.write("0};\n")

  if is_merged:
     generated_tw = TW_Merged_DIT_NR(w,n,pe,modmul_lat)
  else:
    generated_tw = TW_DIF_NR(w,n,pe,modmul_lat) if is_dif else TW_DIT_NR(w,n,pe,modmul_lat)
  if generated_tw is None:
     return 0
  ntt_bram = [[0]*(n//2//pe) for _ in range(2*pe)]

  for i in range(n):
    l = i % (n//2//pe)
    b = (i // (n//2//pe)) & (pe-1)
    e = (i // (n//2//pe)) // pe
    ntt_bram[(b<<1) | e][l] = A[i]


  if is_merged:
    res1_tmp = FFT_DIT_NR(ntt_bram,w,generated_tw,None,pe,False,False)
  else:
    if is_dif:
      res1_tmp = FFT_DIF_NR(ntt_bram,w,generated_tw,None,pe,False,False)
    else:
      res1_tmp = FFT_DIT_NR(ntt_bram,w,generated_tw,None,pe,False,False)


  res1 = [0 for _ in range(n)]
  for i in range(n):
    l = i >> 1
    h = ((l >> clog2(n//2//pe))<<1) + (i & 1)
    l = l % (n//2//pe)
    res1[i] = res1_tmp[h][l]

  with open(TV_PATH_SW_FFT + "tv.h", "a") as f:
    f.write("uint64_t out_fft_" + str(j) + "[] = {")
    for a in res1:
      f.write(hex(getUint64FromDouble(a.real)) + "," + hex(getUint64FromDouble(a.imag)) + ",")
    f.write("0};\n")

  with open(TV_PATH_SW_FFT + "tv.h", "a") as f:
    f.write("uint64_t* in[] = {")
    for i in range(1):
      f.write("in_fft_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* out[] = {")
    for i in range(1):
      f.write("out_fft_" + str(i) + ", ")
    f.write("NULL};\n")

  if coeff_arith :
    gen_c_tv_PWM_FFT(n)

def gen_c_tv_FFT_RN(w,n,pe,modmul_lat,is_dif,is_merged,base_inverse,num_poly,coeff_arith,is_standalone=False):
  if is_standalone:
    with open(TV_PATH_SW_FFT + "tv.h", "w") as f:
      f.write("#define FFT\n")
      f.write("#define N "+str(n)+"\n")
      f.write("#define NUM_POLY "+str(num_poly)+"\n")
      f.write("uint32_t PE = "+str(pe)+";\n")
      f.write("uint8_t do_forward = 0;\n")
      f.write("uint8_t do_inverse = 1;\n")
      f.write("uint32_t num_q = 1;\n")
      f.write("uint32_t base_forward = 0;\n")
      f.write("uint32_t base_inverse = "+str(base_inverse)+";\n")
      f.write("uint64_t q_arr[] = {0};\n")
      f.write("uint32_t logq = 128;\n")
      f.write("uint64_t* in[] = {NULL};\n")
      f.write("uint64_t* out[] = {NULL};\n")


  j = 0
  A = [getRandomNormalizedComplex_D(randint(0,2**32-1)) for _ in range(n)]

  with open(TV_PATH_SW_FFT + "tv.h", "a") as f:
    f.write("uint64_t in_ifft_" + str(j) + "[] = {")
    for a in A:
      f.write(hex(getUint64FromDouble(a.real)) + "," + hex(getUint64FromDouble(a.imag)) + ",")
    f.write("0};\n")

  if is_merged:
    generated_tw = TW_Merged_DIF_RN(w,n,pe,modmul_lat)
  else:
    generated_tw = TW_DIF_RN(w,n,pe,modmul_lat) if is_dif else TW_DIT_RN(w,n,pe,modmul_lat)
  if generated_tw is None:
     return 0
  ntt_bram = [[0]*(n//2//pe) for _ in range(2*pe)]

  for i in range(n):
    l = i & 1
    h = (i >> 1) % (n//2//pe)
    m = (i >> 1) // (n//2//pe)
    m <<= 1
    ntt_bram[m+l][h] = A[i]

  if is_merged:
    res1_tmp = FFT_DIF_RN(ntt_bram,w,generated_tw,None,pe,False,False)
  else:
    if is_dif:
      res1_tmp = FFT_DIF_RN(ntt_bram,w,generated_tw,None,pe,False,False)
    else:
      res1_tmp = FFT_DIT_RN(ntt_bram,w,generated_tw,None,pe,False,False)

  res1 = [0 for _ in range(n)]
  for i in range(n):
    l = i % (n//2//pe)
    h = i // (n//2//pe)
    m = h // pe
    h = (h % pe) << 1
    res1[i] = res1_tmp[h+m][l]

  with open(TV_PATH_SW_FFT + "tv.h", "a") as f:
    f.write("uint64_t out_ifft_" + str(j) + "[] = {")
    for a in res1:
      f.write(hex(getUint64FromDouble(a.real)) + "," + hex(getUint64FromDouble(a.imag)) + ",")
    f.write("0};\n")

  with open(TV_PATH_SW_FFT + "tv.h", "a") as f:
    f.write("uint64_t* in_ifft[] = {")
    for i in range(1):
      f.write("in_ifft_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* out_ifft[] = {")
    for i in range(1):
      f.write("out_ifft_" + str(i) + ", ")
    f.write("NULL};\n")

  if coeff_arith and is_standalone:
    gen_c_tv_PWM_FFT(n)



