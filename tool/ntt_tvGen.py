from math import log2, ceil
from random import randint
from helper import *
from ntt import MFNTT_DIT_NR, FNTT_DIF_NR, FNTT_DIT_NR, MINTT_DIF_RN, INTT_DIF_RN, INTT_DIT_RN

TV_PATH_HW = "./TestVectorsNTT/" 
TV_PATH_SW = "../software/Testing/"

def gen_tv_NTT_NR(w,n,q,is_dif,is_merged,q_it=None):
  A = [randint(0,q-1) for _ in range(n)]
  pe = 1

  with open(TV_PATH_HW + "tv_NTT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"NR_n{n}_" + (str(q_it) if q_it is not None else "") + "in.txt", "w") as f:
     for a in A:
        f.write(hex(a)[2:] + "\n")

  if is_merged:
    psi_table          = [1]*n
    for i in range(1,n):
      psi_table[i]          = (psi_table[i-1]*w)%q
    res1_tmp = MFNTT_DIT_NR(A,psi_table,q)
  else:
    w_table = [1]*(n//2)
    for i in range(1,n//2):
        w_table[i] = (w_table[i-1]*w)%q
    w_table_pe = [[0]*(n//2//pe) for _ in range(pe)]
    for i in range(len(w_table)):
      w_table_pe[i // (n//2//pe)][i % (n//2//pe)] = w_table[i]

    if is_dif:
      res1_tmp = FNTT_DIF_NR(A,w_table,q)
    else:
      res1_tmp = FNTT_DIT_NR(A,w_table,q)

  with open(TV_PATH_HW + "tv_NTT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"NR_n{n}_" + (str(q_it) if q_it is not None else "") + "out.txt", "w") as f:
    for a in res1_tmp:
      f.write(hex(a)[2:] + "\n")

def gen_tv_NTT_RN(w,n,q,is_dif,is_merged,q_it=None):
  A = [randint(0,q-1) for _ in range(n)]
  pe = 1

  with open(TV_PATH_HW + "tv_NTT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"RN_n{n}_" + (str(q_it) if q_it is not None else "") + "in.txt", "w") as f:
     for a in A:
        f.write(hex(a)[2:] + "\n")

  if is_merged:
    psi_table          = [1]*n
    for i in range(1,n):
      psi_table[i]          = (psi_table[i-1]*w)%q
    res1_tmp = MINTT_DIF_RN(A,psi_table,q)
  else:
    w_table = [1]*(n//2)
    for i in range(1,n//2):
        w_table[i] = (w_table[i-1]*w)%q
    w_table_pe = [[0]*(n//2//pe) for _ in range(pe)]
    for i in range(len(w_table)):
      w_table_pe[i // (n//2//pe)][i % (n//2//pe)] = w_table[i]

    if is_dif:
      res1_tmp = INTT_DIF_RN(A,w_table,q)
    else:
      res1_tmp = INTT_DIT_RN(A,w_table,q)

  with open(TV_PATH_HW + "tv_NTT_" + ("Merged_" if is_merged else "") + ("DIF_" if is_dif else "DIT_") + f"RN_n{n}_" + (str(q_it) if q_it is not None else "") + "out.txt", "w") as f:
    for a in res1_tmp:
      f.write(hex(a)[2:] + "\n")

def gen_c_tv_PWM(n,q_arr,R_arr):
  with open(TV_PATH_SW + "tv.h", "a") as f:
    f.write("#define PWM_INSTANTIATED\n")
    f.write("uint64_t R_arr[] = {")
    for r in R_arr:
      f.write(hex(r)+", ")
    f.write("0};\n")
    for j,q in enumerate(q_arr):
      A = [randint(0,q-1) for _ in range(n)]
      B = [randint(0,q-1) for _ in range(n)]

      f.write("uint64_t polyArith_in_a_" + str(j) + "[] = {")
      for a in A:
          f.write(hex(a) + ",")
      f.write("0};\n")

      f.write("uint64_t polyArith_in_b_" + str(j) + "[] = {")
      for b in B:
          f.write(hex(b) + ",")
      f.write("0};\n")

      f.write("uint64_t polyMul_out_" + str(j) + "[] = {")
      for i in range(n):
        f.write(hex((A[i]*B[i]*modinv(R_arr[j],q)) % q) + ",")
      f.write("0};\n")

      f.write("uint64_t polyAdd_out_" + str(j) + "[] = {")
      for i in range(n):
        f.write(hex((A[i]+B[i]) % q) + ",")
      f.write("0};\n")
      f.write("uint64_t polySub_out_" + str(j) + "[] = {")
      for i in range(n):
        f.write(hex((A[i]-B[i]) % q) + ",")
      f.write("0};\n")

    f.write("uint64_t* polyArith_in_a[] = {")
    for i in range(len(q_arr)):
      f.write("polyArith_in_a_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polyArith_in_b[] = {")
    for i in range(len(q_arr)):
      f.write("polyArith_in_b_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polyMul_out[] = {")
    for i in range(len(q_arr)):
      f.write("polyMul_out_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polyAdd_out[] = {")
    for i in range(len(q_arr)):
      f.write("polyAdd_out_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* polySub_out[] = {")
    for i in range(len(q_arr)):
      f.write("polySub_out_" + str(i) + ", ")
    f.write("NULL};\n")

def gen_c_tv_NTT_NR(w_arr,n,pe,q_arr,is_dif,is_merged,base_forward,base_inverse,just_forward,num_poly,coeff_arith,R_arr):
  with open(TV_PATH_SW + "tv.h", "w") as f:
    f.write("#define N "+str(n)+"\n")
    f.write("#define NUM_POLY "+str(num_poly)+"\n")
    f.write("uint32_t PE = "+str(pe)+";\n")
    f.write("uint8_t do_forward = 1;\n")
    f.write("uint8_t do_inverse = "+str(0 if just_forward else 1)+";\n")
    f.write("uint32_t num_q = "+str(len(q_arr))+";\n")
    f.write("uint32_t base_forward = "+str(base_forward)+";\n")
    f.write("uint32_t base_inverse = "+str(base_inverse)+";\n")
    f.write("uint64_t q_arr[] = {")
    logq_max = -1
    for q in q_arr:
      f.write(hex(q)+", ")
      logq_max = max(ceil(log2(q)), logq_max)
    f.write("0};\n")
    f.write("uint32_t logq = "+str(logq_max)+";\n")


  for j,q in enumerate(q_arr):
    A = [randint(0,q-1) for _ in range(n)]
    w = w_arr[j]

    with open(TV_PATH_SW + "tv.h", "a") as f:
      f.write("uint64_t in_" + str(j) + "[] = {")
      for a in A:
          f.write(hex(a) + ",")
      f.write("0};\n")

    if is_merged:
      psi_table          = [1]*n
      for i in range(1,n):
        psi_table[i]          = (psi_table[i-1]*w)%q
      res1_tmp = MFNTT_DIT_NR(A,psi_table,q)
    else:
      w_table = [1]*(n//2)
      for i in range(1,n//2):
          w_table[i] = (w_table[i-1]*w)%q
      w_table_pe = [[0]*(n//2//pe) for _ in range(pe)]
      for i in range(len(w_table)):
        w_table_pe[i // (n//2//pe)][i % (n//2//pe)] = w_table[i]

      if is_dif:
        res1_tmp = FNTT_DIF_NR(A,w_table,q)
      else:
        res1_tmp = FNTT_DIT_NR(A,w_table,q)

    with open(TV_PATH_SW + "tv.h", "a") as f:
      f.write("uint64_t out_" + str(j) + "[] = {")
      for a in res1_tmp:
        f.write(hex(a) + ",")
      f.write("0};\n")

  with open(TV_PATH_SW + "tv.h", "a") as f:
    f.write("uint64_t* in[] = {")
    for i in range(len(q_arr)):
      f.write("in_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* out[] = {")
    for i in range(len(q_arr)):
      f.write("out_" + str(i) + ", ")
    f.write("NULL};\n")

  if coeff_arith :
    gen_c_tv_PWM(n,q_arr,R_arr)

def gen_c_tv_NTT_RN(w_arr,n,pe,q_arr,is_dif,is_merged,base_inverse,num_poly,coeff_arith,R_arr):
  with open(TV_PATH_SW + "tv.h", "w") as f:
    f.write("#define N "+str(n)+"\n")
    f.write("#define NUM_POLY "+str(num_poly)+"\n")
    f.write("uint32_t PE = "+str(pe)+";\n")
    f.write("uint8_t do_forward = 0;\n")
    f.write("uint8_t do_inverse = 1;\n")
    f.write("uint32_t num_q = "+str(len(q_arr))+";\n")
    f.write("uint32_t base_forward = 0;\n")
    f.write("uint32_t base_inverse = "+str(base_inverse)+";\n")
    f.write("uint64_t q_arr[] = {")
    logq_max = -1
    for q in q_arr:
      f.write(hex(q)+", ")
      logq_max = max(ceil(log2(q)), logq_max)
    f.write("0};\n")
    f.write("uint32_t logq = "+str(logq_max)+";\n")


  for j,q in enumerate(q_arr):
    A = [randint(0,q-1) for _ in range(n)]
    w = w_arr[j]

    with open(TV_PATH_SW + "tv.h", "a") as f:
      f.write("uint64_t out_" + str(j) + "[] = {")
      for a in A:
          f.write(hex(a) + ",")
      f.write("0};\n")

    if is_merged:
      psi_table          = [1]*n
      for i in range(1,n):
        psi_table[i]          = (psi_table[i-1]*w)%q
      res1_tmp = MINTT_DIF_RN(A,psi_table,q)
    else:
      w_table = [1]*(n//2)
      for i in range(1,n//2):
          w_table[i] = (w_table[i-1]*w)%q
      w_table_pe = [[0]*(n//2//pe) for _ in range(pe)]
      for i in range(len(w_table)):
        w_table_pe[i // (n//2//pe)][i % (n//2//pe)] = w_table[i]

      if is_dif:
        res1_tmp = INTT_DIF_RN(A,w_table,q)
      else:
        res1_tmp = INTT_DIT_RN(A,w_table,q)

    with open(TV_PATH_SW + "tv.h", "a") as f:
      f.write("uint64_t in_" + str(j) + "[] = {")
      for a in res1_tmp:
        f.write(hex(a) + ",")
      f.write("0};\n")

  with open(TV_PATH_SW + "tv.h", "a") as f:
    f.write("uint64_t* out[] = {")
    for i in range(len(q_arr)):
      f.write("out_" + str(i) + ", ")
    f.write("NULL};\n")
    f.write("uint64_t* in[] = {")
    for i in range(len(q_arr)):
      f.write("in_" + str(i) + ", ")
    f.write("NULL};\n")

  if coeff_arith :
    gen_c_tv_PWM(n,q_arr,R_arr)
