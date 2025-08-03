###################################################################
# OpenNTT - 2024
# Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
# Contact: florian.krieger@iaik.tugraz.at
###################################################################

from math import ceil
from fft_hw_model import myLog, clog2
from fft_hw_model import TW_DIF_NR, TW_DIF_RN, TW_Merged_DIF_RN, TW_DIT_NR, TW_DIT_RN, TW_Merged_DIT_NR


def rom_content_rout_DIF_NR(N,nr_pu,modmul_lat,omega):
  if N//4//nr_pu <= modmul_lat: return None
  twiddles = TW_DIF_NR(omega,N,nr_pu,4)
  initial_fill = [[] for _ in range(nr_pu)]

  for s in range(clog2(N)):
    nr_rep = N//2//nr_pu
    if s-clog2(nr_pu)-1 >= 0:
        nr_rep = nr_rep >> (s-clog2(nr_pu)-1)
    
    for p in range(nr_pu):
      if nr_rep > modmul_lat:
        if modmul_lat % 2 == 0:
          initial_fill[p] += [twiddles[0][N//nr_pu//2*s+modmul_lat]]
        else:
          initial_fill[p] += [twiddles[0][N//nr_pu//2*s+modmul_lat]]
          w0 = myLog(twiddles[0][N//nr_pu//2*s+1],omega)
          w1 = myLog(twiddles[0][N//nr_pu//2*s+1+modmul_lat],omega)
          if nr_rep != modmul_lat+1:  
            initial_fill[p] += [omega**(w1-w0) if w1 > w0 else omega**(-(w0-w1))]

      x = modmul_lat
      if nr_rep < modmul_lat:
         x = nr_rep
      for i in range(x):
        initial_fill[p] += [twiddles[p][N//nr_pu//2*s+i]]

  return initial_fill

def rom_content_rout_DIF_RN(N,nr_pu,modmul_lat,omega):
  if N//4//nr_pu <= modmul_lat: return None
  twiddles = TW_DIF_RN(omega,N,nr_pu,4)
  initial_fill = [[] for _ in range(nr_pu)]


  nr_rep = N//2//nr_pu
  for s in range(clog2(N)):    
    for p in range(nr_pu):
      if nr_rep > modmul_lat:
        if modmul_lat % 2 == 0:
          initial_fill[p] += [twiddles[0][N//nr_pu//2*s+modmul_lat]]
        else:
          initial_fill[p] += [twiddles[0][N//nr_pu//2*s+modmul_lat]]
          w0 = myLog(twiddles[0][N//nr_pu//2*s+1],omega)
          w1 = myLog(twiddles[0][N//nr_pu//2*s+1+modmul_lat],omega)
          if True or nr_rep != modmul_lat+1:  
            initial_fill[p] += [omega**(w1-w0) if w1 > w0 else omega**(-(w0-w1))]

      x = modmul_lat
      if nr_rep < modmul_lat:
         x = nr_rep
      for i in range(x):
        initial_fill[p] += [twiddles[p][N//nr_pu//2*s+i]]

    if nr_rep != 1:
        nr_rep = nr_rep >> 1

  return initial_fill

def rom_content_rout_DIT_NR(N,nr_pu,modmul_lat,omega):
  if N//4//nr_pu <= modmul_lat: return None
  twiddles = TW_DIT_NR(omega,N,nr_pu,4)
  initial_fill = [[] for _ in range(nr_pu)]

  nr_rep = N
  for s in range(clog2(N)):    
    nr_rep = nr_rep >> 1
    for p in range(nr_pu):
      if nr_rep < N//2//nr_pu:
        tmp = nr_rep if nr_rep > modmul_lat else ceil(modmul_lat/nr_rep)*nr_rep
        initial_fill[p] += [twiddles[0][N//nr_pu//2*s+ tmp]]
      if s > clog2(N)-1-clog2(modmul_lat):
        x = ceil(modmul_lat / (nr_rep))
      else:
        x = 1
      
      for i in range(x):
        initial_fill[p] += [twiddles[p][N//nr_pu//2*s+i*nr_rep]]

  return initial_fill

def rom_content_rout_DIT_RN(N,nr_pu,modmul_lat,omega):
  if N//4//nr_pu <= modmul_lat: return None
  twiddles = TW_DIT_RN(omega,N,nr_pu,4)
  initial_fill = [[] for _ in range(nr_pu)]

  nr_rep = N//nr_pu
  for s in range(clog2(N)):    
    nr_rep = nr_rep >> 1
    for p in range(nr_pu):
      if nr_rep < N//2//nr_pu:
        tmp = nr_rep if nr_rep > modmul_lat else ceil(modmul_lat/nr_rep)*nr_rep if nr_rep != 0 else modmul_lat
        initial_fill[p] += [twiddles[0][N//nr_pu//2*s+ tmp]]
      
      if s >= clog2(N)-clog2(nr_pu)-clog2(modmul_lat):
        x = ceil(modmul_lat / (nr_rep)) if nr_rep != 0 else modmul_lat
      else:
        x = 1
      for i in range(x):
        t = i*nr_rep if nr_rep != 0 else i
        initial_fill[p] += [twiddles[p][N//nr_pu//2*s+t]]

  return initial_fill

def rom_content_rout_Merged_DIF_RN(N,nr_pu,modmul_lat,omega):
  if N//4//nr_pu <= modmul_lat: return None
  twiddles = TW_Merged_DIF_RN(omega,N,nr_pu,4)
  initial_fill = [[] for _ in range(nr_pu)]


  nr_rep = N//2//nr_pu
  for s in range(clog2(N)):    
    for p in range(nr_pu):
      if nr_rep > modmul_lat:
        w0 = myLog(twiddles[0][N//nr_pu//2*s+modmul_lat], omega)
        w1 = myLog(twiddles[0][N//nr_pu//2*s], omega)
        initial_fill[p] += [omega**(w0-w1)]
        if modmul_lat % 2 != 0:
          w0 = myLog(twiddles[0][N//nr_pu//2*s+1],omega)
          w1 = myLog(twiddles[0][N//nr_pu//2*s+1+modmul_lat],omega)
          if True or nr_rep != modmul_lat+1:  
            initial_fill[p] += [omega**(w1-w0) if w1 > w0 else omega**(-(w0-w1))]

      x = modmul_lat
      if nr_rep < modmul_lat:
         x = nr_rep
      for i in range(x):
        initial_fill[p] += [twiddles[p][N//nr_pu//2*s+i]]

    if nr_rep != 1:
        nr_rep = nr_rep >> 1

  return initial_fill

def rom_content_rout_Merged_DIT_NR(N,nr_pu,modmul_lat,omega):
  if N//4//nr_pu <= modmul_lat: return None
  twiddles = TW_Merged_DIT_NR(omega,N,nr_pu,4)
  initial_fill = [[] for _ in range(nr_pu)]

  nr_rep = N
  for s in range(clog2(N)):    
    nr_rep = nr_rep >> 1
    for p in range(nr_pu):
      if nr_rep < N//2//nr_pu:
        tmp = nr_rep if nr_rep > modmul_lat else ceil(modmul_lat/nr_rep)*nr_rep
        w0 = myLog(twiddles[0][N//nr_pu//2*s], omega)
        w1 = myLog(twiddles[0][N//nr_pu//2*s+ tmp], omega)
        initial_fill[p] += [omega**(w1-w0)]

      if s > clog2(N)-1-clog2(modmul_lat):
        x = ceil(modmul_lat / (nr_rep))
      else:
        x = 1
      
      for i in range(x):
        initial_fill[p] += [twiddles[p][N//nr_pu//2*s+i*nr_rep]]

  return initial_fill
