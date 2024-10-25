from math import log2, ceil
from helper import int_reverse


def clog2(x):
    return ceil(log2(x))

def ROM_content_to_mem(twiddles,N,nr_pu,modmul_lat,dec_method,R_mont=None,q=None,path="../../hardware/twiddle_gen/twiddle_mem/"):
  nr_brams = len(twiddles)

  mr = "MontRed_" if R_mont is not None else ""
  for bram in range(nr_brams):
    with open(path + f"twiddle_mem_{dec_method}_n{N}_pe{nr_pu}_lat{modmul_lat}_{mr}{bram}.mem","w") as f:
      f.write("@0000\n")
      for i,e in enumerate(twiddles[bram]):
         if R_mont is not None:
            if hasattr(q, "__len__"): #multiprime
               q_i = q[i//(len(twiddles[bram])//len(q))]
            else:
               q_i = q
            e = (e*R_mont) % q_i
         f.write(hex(e)[2:]+"\n")


def rom_content_DIF_NR(N,nr_pu,modmul_lat,omega,q):
  initial_fill = [[0]*modmul_lat for _ in range(nr_pu)]

  for i in range(modmul_lat):
      for j in range(nr_pu):
          if nr_pu == 1:
            initial_fill[j][i] = omega**((i>>1) + (i & 1)*N//4) % q
          else:
            initial_fill[j][i] = omega**(i+j*(N//2//nr_pu)) % q
  
  omega_c_init = (omega**modmul_lat) % q if nr_pu > 1 else (omega**(modmul_lat//2)) % q
  return initial_fill, omega_c_init

def rom_content_DIF_RN(N,nr_pu,modmul_lat,omega,q):
  initial_fill = [[0]*modmul_lat for _ in range(nr_pu)]

  for i in range(modmul_lat):
      for j in range(nr_pu):
          if nr_pu == 1:
            initial_fill[j][i] = omega**((i>>1) + (i & 1)*N//4) % q
          else:
            j_br = int_reverse(j,clog2(nr_pu))
            initial_fill[j][i] = omega**((i>>1)*nr_pu+(i&1)*N//4+j_br) % q

  omega_c_init = (omega**(modmul_lat*nr_pu//2)) % q
  return initial_fill, omega_c_init

def rom_content_DIT_NR(N,nr_pu,modmul_lat,omega,q):
  initial_fill = []

  initial_fill += [1]
  for i in range(0,clog2(N)-1):
    initial_fill += [omega**((N//4 >> i)) % q]
    tmp = i-(clog2(N)-clog2(modmul_lat)-1)
    if tmp > 0 and nr_pu == 1:
      for j in range(1,(2<<(tmp))-1):
        x = (omega**((N//4 >> i) + ((N//4 >> (i)))*j)) % q
        initial_fill += [x]
    
    if modmul_lat == 4:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-1
    elif modmul_lat == 8:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-2
    elif modmul_lat == 16:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-3
    elif modmul_lat == 32:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-4

  return initial_fill

def rom_content_DIT_RN(N,nr_pu,modmul_lat,omega,q):
  initial_fill = []

  initial_fill += [1]
  for i in range(0,clog2(N)-1):
    initial_fill += [omega**((N//4 >> i)) % q]
    tmp = i-(clog2(N)-clog2(modmul_lat)-1)
    if tmp > 0 and nr_pu == 1:
      for j in range(1,(2<<(tmp))-1):
        x = (omega**((N//4 >> i) + ((N//4 >> (i)))*j)) % q
        initial_fill += [x]
    
  return initial_fill

def rom_content_Merged_DIF_RN(N,nr_pu,modmul_lat,omega,q):
  initial_fill = [[0]*modmul_lat for _ in range(nr_pu)]

  for i in range(modmul_lat):
      for j in range(nr_pu):
          if nr_pu == 1:
            initial_fill[j][i] = omega**((i>>1) + (i & 1)*N//4) % q
          else:
            j_br = int_reverse(j,clog2(nr_pu))
            initial_fill[j][i] = omega**((i>>1)*nr_pu+(i&1)*N//4+j_br) % q

          initial_fill[j][i] = initial_fill[j][i]**2 % q
          if j == 0:
            initial_fill[j][i] = (initial_fill[j][i] * omega) % q
  omega_c_init = (omega**(modmul_lat*nr_pu//2)) % q
  omega_c_init = omega_c_init**2 % q

  tmp = omega_c_init
  for _ in range(clog2(N)-1-clog2(nr_pu)):
     tmp = tmp**2 % q
     initial_fill[0] += [tmp]

  return initial_fill, omega_c_init

def rom_content_Merged_DIT_NR(N,nr_pu,modmul_lat,omega,q):
  initial_fill = [1, omega**(N//2) % q]

  for i in range(0,clog2(N)-1):
    initial_fill += [omega**((N//4 >> i)) % q]
    tmp = i-(clog2(N)-clog2(modmul_lat)-1)
    if tmp >= 0 and nr_pu == 1:
      for j in range(1,(2<<(tmp))):
        x = (omega**((N//4 >> i) + 2*((N//4 >> (i)))*j)) % q
        initial_fill += [x]
    
    if modmul_lat == 4:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-1
        magic_value = 2
    elif modmul_lat == 8:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-2
        magic_value = 4
    elif modmul_lat == 16:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-3
        magic_value = 8
    elif modmul_lat == 32:
        tmp = i-(clog2(N)-clog2(modmul_lat)-1)+clog2(modmul_lat)-4
        magic_value = 16
        
    if tmp > 0 and nr_pu != 1:
      for j in range(1,(2<<(tmp))-2):
        if j >= modmul_lat: break
        if modmul_lat == 8  and i == clog2(N)-clog2(modmul_lat)   and j >= modmul_lat//2: break
        if modmul_lat == 16 and i == clog2(N)-clog2(modmul_lat)   and j >= modmul_lat//4: break
        if modmul_lat == 16 and i == clog2(N)-clog2(modmul_lat)+1 and j >= modmul_lat//2: break
        if modmul_lat == 32 and i == clog2(N)-clog2(modmul_lat)   and j >= modmul_lat//8: break
        if modmul_lat == 32 and i == clog2(N)-clog2(modmul_lat)+1 and j >= modmul_lat//4: break
        if modmul_lat == 32 and i == clog2(N)-clog2(modmul_lat)+2 and j >= modmul_lat//2: break
        x = (omega**((N//4 >> i) + 2*((magic_value*nr_pu*j)>>(tmp-1)))) % q
        initial_fill += [x]

  return initial_fill
