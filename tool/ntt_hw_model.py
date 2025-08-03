###################################################################
# OpenNTT - 2024
# Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
# Contact: florian.krieger@iaik.tugraz.at
###################################################################

from math import log2, ceil
from helper import int_reverse
import queue

def clog2(x):
    return ceil(log2(x))

def discreteLog(x,q,omega):
    if discreteLog.discreteLog_current_omega == 0:
       discreteLog.discreteLog_current_omega = omega
    elif discreteLog.discreteLog_current_omega != omega:
      discreteLog.discreteLog_r = 0
      discreteLog.discreteLog_current_omega = omega
      discreteLog.discreteLogLookup = {}
    if discreteLog.discreteLog_r == 0:
       p = 1
       while True:
          if (omega**p) % q == 1:
             discreteLog_r = p
             break
          p <<= 1
          
    if x in discreteLog.discreteLogLookup:
        return discreteLog.discreteLogLookup[x]
    
    t = 1
    p = 0
    while True:
        if t == x:
            if p > discreteLog_r // 2:
               p = p-discreteLog_r
            discreteLog.discreteLogLookup[x] = p
            return p
        t = (t*omega) % q
        p += 1
discreteLog.discreteLog_r = 0
discreteLog.discreteLog_current_omega = 0
discreteLog.discreteLogLookup = {}

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


def TW_DIF_NR(omega,N,q,nr_pu,modmul_lat):
    if N//2//nr_pu <= modmul_lat:
        print("Warning: use stored twiddle factors for this configuration")
        return None
    if modmul_lat != 4 and modmul_lat != 8 and modmul_lat != 16 and modmul_lat != 32:
        print("Error: invalid modmul lat")
        return None
    if 2**clog2(nr_pu) != nr_pu:
        print("Error: invalid nr of processing elements")
        return None

    fifo = [queue.Queue(),queue.Queue()]

    ############# precomputed rom content ###############
    initial_fill, omega_c_0 = rom_content_DIF_NR(N,nr_pu,modmul_lat,omega,q)
    omega_i = [0]*nr_pu
    for i in range(1,nr_pu):
       omega_i[i] = initial_fill[i][0]
    #####################################################

    produced_tw = [[] for _ in range(nr_pu)]

    mulfact = 1 if modmul_lat == 4 else (2 if modmul_lat == 8 else (4 if modmul_lat == 16 else 8))

    for s in range(clog2(N)):
        fifo[(s+1)%2] = queue.Queue() # empty queue
        omega_i_next = [0]*nr_pu
        omega_c_next = 0        
        for i in range(N//2//nr_pu):
            for p in range(nr_pu):
                                
                stage_repeats = s > clog2(nr_pu)
                repeat = stage_repeats and s < clog2(N)-2 and (i>>clog2(modmul_lat)<<clog2(modmul_lat)) % ((N//2//nr_pu >> (s-clog2(nr_pu)))) == 0 and i != 0
                if i < modmul_lat and s == 0:
                  tw = initial_fill[0][i] if p == 0 else (initial_fill[0][i] * omega_i[p]) % q
                elif i < modmul_lat or repeat:
                    tw_tmp = fifo[s%2].queue[0]
                    if p == nr_pu-1 and s != clog2(N)-1:
                      r = fifo[s%2].get()
                      fifo[s%2].put(r) 
                    tw = tw_tmp if p == 0 else (tw_tmp * omega_i[p]) % q

                else:
                  tw = (produced_tw[p][-modmul_lat] * omega_c_0) % q

                if i == 0 and p % 2 == 0:
                   if p != 0:
                     omega_i_next[p//2] = tw
                   omega_i_next[p//2+nr_pu//2] = tw                   


                if s < clog2(nr_pu)-1 and nr_pu > 2:
                  i1 = i>>2  
                  if i1 < modmul_lat//2 and i % 2 == 0 and p == 0:
                    fifo[(s+1)%2].put(tw)

                elif s == clog2(nr_pu)-1 and nr_pu > 1:
                  i1 = i>>(1 if modmul_lat >= 16 else 2)
                  if i1 < modmul_lat//2 and i <= clog2(modmul_lat)*mulfact and i % 2 == 0 and p < 2:
                    fifo[(s+1)%2].put(tw)
                
                else:
                  i1 = (i>>1 if modmul_lat >= 16 else 0)
                  if i1 < modmul_lat and i & 2 == 0 and (i>>1) <= clog2(modmul_lat)*mulfact and p == 0:
                    fifo[(s+1)%2].put(tw)

                produced_tw[p].append(tw)
            
            indx = 0
            magic = 2*modmul_lat 
            assert magic <= N//2//nr_pu
            if magic == N//2//nr_pu:
              magic -= N//2//nr_pu
              indx = 1
              if nr_pu == 1 : indx = 0
            if i == magic:
              omega_c_next = produced_tw[indx][-1]
              

        omega_i = omega_i_next.copy()
        if s != clog2(nr_pu)-1:
          if s >= clog2(N)-clog2(modmul_lat)-1:
            omega_c_0 = 1
          else:      
            omega_c_0 = omega_c_next
        
    return produced_tw

def TW_DIF_RN(omega,N,q,nr_pu,modmul_lat):
    
    if N//2//nr_pu <= modmul_lat:
        print("Warning: use stored twiddle factors for this configuration")
        return None
    if modmul_lat != 4 and modmul_lat != 8 and modmul_lat != 16 and modmul_lat != 32:
        print("Error: invalid modmul lat")
        return None
    if 2**clog2(nr_pu) != nr_pu:
        print("Error: invalid nr of processing elements")
        return None

    fifo = [queue.Queue(),queue.Queue()]

    ############# precomputed rom content ###############
    initial_fill, omega_c_0 = rom_content_DIF_RN(N,nr_pu,modmul_lat,omega,q)
    omega_i = [0]*nr_pu
    for i in range(1,nr_pu):
       omega_i[i] = initial_fill[i][0]
    #####################################################

    produced_tw = [[] for _ in range(nr_pu)]

    for s in range(clog2(N)):
        assert s == 0 or len(fifo[s%2].queue) == modmul_lat or s == clog2(N)-1
        fifo[(s+1)%2] = queue.Queue() # empty queue
        omega_i_next = [0]*nr_pu
        omega_c_next = 0
        for i in range(N//2//nr_pu):
            for p in range(nr_pu):
                
                stage_repeats = s != 0
                if s >= clog2(N)-1-clog2(nr_pu):
                   repeat = True
                else:
                  repeat = stage_repeats and (i>>clog2(modmul_lat)<<clog2(modmul_lat)) % ((N//2//nr_pu >> (s))) == 0 and i != 0
                if i < modmul_lat and s == 0:
                  tw = initial_fill[0][i] if p == 0 else (initial_fill[0][i] * omega_i[p]) % q
                elif i < modmul_lat or repeat:
                  tw_tmp = fifo[s%2].queue[0]
                  if p == nr_pu-1 and s != clog2(N)-1:
                    r = fifo[s%2].get()
                    fifo[s%2].put(r) 
                  tw = tw_tmp if p == 0 else (tw_tmp * omega_i[p]) % q
                       
                else:
                  tw = (produced_tw[p][-modmul_lat] * omega_c_0) % q

                if i == 0 and p < nr_pu//2 and p != 0:
                  omega_i_next[p*2] = tw
                if (s < clog2(N)-1-clog2(nr_pu)-1 and i == 2 or s >= clog2(N)-1-clog2(nr_pu)-1 and i == 1) and p < nr_pu//2:
                  omega_i_next[p*2+1] = tw
                    
                
                i1 = i>>1  
                if p == 0:
                  if i1 < modmul_lat:
                    if (i1 % 2 == 0 and s < clog2(N)-2-clog2(nr_pu)) or (i % 2 == 0 and s >= clog2(N)-2-clog2(nr_pu)):
                      fifo[(s+1)%2].put(tw)

                produced_tw[p].append(tw)

            indx = 0
            magic = 2*modmul_lat 
            assert magic <= N//2//nr_pu
            if magic == N//2//nr_pu:
              magic -= N//2//nr_pu
              indx = 1
              if nr_pu == 1 : indx = 0
            if i == magic:
              omega_c_next = produced_tw[indx][-1]


        omega_c_0 = omega_c_next
        omega_i = omega_i_next.copy()
    
    assert len(initial_fill) == nr_pu and len(initial_fill[0]) == modmul_lat
    return produced_tw

def TW_DIT_NR(omega,N,q,nr_pu,modmul_lat):
    if N//2//nr_pu <= modmul_lat:
        print("Warning: use stored twiddle factors for this configuration")
        return None
    if modmul_lat != 4 and modmul_lat != 8 and modmul_lat != 16  and modmul_lat != 32:
        print("Error: invalid modmul lat")
        return None
    if 2**clog2(nr_pu) != nr_pu:
        print("Error: invalid nr of processing elements")
        return None

    fifo = [queue.Queue() for _ in range(nr_pu//2)]
    for p in range(nr_pu//2):
      for _ in range(modmul_lat):
        fifo[p].put(1)

    ############# precomputed rom content ###############
    initial_fill = rom_content_DIT_NR(N,nr_pu,modmul_lat,omega,q)
    omega_c_0 = initial_fill[0]
    initial_fill = initial_fill[1:]
    #####################################################

    produced_tw = [[] for _ in range(nr_pu)]

    cache_counter = 0
    omega_i_counter = 0
    next_omega_c = 0
    for s in range(clog2(N)):
      for i in range(N//2//nr_pu):
        for p in range(nr_pu):

          if nr_pu == 1:
            update_mult = i > 0 and i % (N//2 >> s) == 0
  
            if i < (N//2//nr_pu >> s):
              produced_tw[p] += [1]
            elif i < modmul_lat:
              if update_mult and s > clog2(N)-clog2(modmul_lat):
                cache_counter += 1
              produced_tw[p] += [initial_fill[cache_counter]]
            elif update_mult:
              produced_tw[p] += [(produced_tw[p][-modmul_lat] * omega_c_0) % q]             
            else:
              produced_tw[p] += [produced_tw[p][-1]]
          else:
            omega_i = initial_fill[omega_i_counter]
            update_mult = i > 0 and i % (N//2 >> s) == 0
            if i < modmul_lat:
              if p >= nr_pu//2 and s > 0:
                t = (produced_tw[p-nr_pu//2][-1] * omega_i) % q
              elif p < nr_pu//2:
                t = fifo[p].queue[0]
                fifo[p].get()
              else:
                 t = 1
              produced_tw[p] += [t]
            elif update_mult:
              produced_tw[p] += [(produced_tw[p][-modmul_lat] * omega_c_0) % q] 
            else:
              produced_tw[p] += [produced_tw[p][-1]]
            
            if i == 0 and p == 1:
              next_omega_c = produced_tw[p][-1]

        special_stage = clog2(N)-clog2(modmul_lat)
        if nr_pu > 1 and s < clog2(N)-1:
          if i < modmul_lat:
            b_sel = 0 if s-special_stage+1 < 0 or (i & (modmul_lat >> 1+s-special_stage+1)) == 0 else 1
            for p in range(nr_pu//2):
              p_tmp = p * 2
              t =  produced_tw[p_tmp + b_sel][-1]
              fifo[p].put(t)
          
      if nr_pu > 1 and s > 0:
        omega_i_counter += 1
      if s >= clog2(nr_pu) and s < clog2(N)-clog2(modmul_lat)-1:
        if nr_pu > 1:
          omega_c_0 = next_omega_c
        else:
          omega_c_0 = initial_fill[cache_counter]
          cache_counter += 1

    return produced_tw

def TW_DIT_RN(omega,N,q,nr_pu,modmul_lat):
    if N//2//nr_pu <= modmul_lat:
        print("Warning: use stored twiddle factors for this configuration")
        return None
    if modmul_lat != 4 and modmul_lat != 8 and modmul_lat != 16 and modmul_lat != 32:
        print("Error: invalid modmul lat")
        return None
    if 2**clog2(nr_pu) != nr_pu:
        print("Error: invalid nr of processing elements")
        return None

    omega_i = [1]*(nr_pu)
    fifo = queue.Queue()
    for _ in range(modmul_lat):
      fifo.put(1)

    ############# precomputed rom content ###############
    initial_fill = rom_content_DIT_RN(N,nr_pu,modmul_lat,omega,q)
    omega_c_0 = initial_fill[0]
    initial_fill = initial_fill[1:]
    #####################################################

    produced_tw = [[] for _ in range(nr_pu)]

    cache_counter = 0
    special_stage = clog2(N)-clog2(nr_pu)-clog2(modmul_lat)
    for s in range(clog2(N)):
      omega_i_next = [1]*nr_pu
      omega_c_next = 1

      added_fifo = 0;
      for i in range(N//2//nr_pu):
        for p in range(nr_pu):

          if nr_pu == 1:
            update_mult = i > 0 and i % (N//2 >> s) == 0
  
            if i < (N//2//nr_pu >> s):
              produced_tw[p] += [1]
            elif i < modmul_lat:
              if update_mult and s > clog2(N)-clog2(modmul_lat):
                cache_counter += 1
              produced_tw[p] += [initial_fill[cache_counter]]
            elif update_mult:
              produced_tw[p] += [(produced_tw[p][-modmul_lat] * omega_c_0) % q]             
            else:
              produced_tw[p] += [produced_tw[p][-1]]
          else:
            tmp = N//2//nr_pu >> s
            update_mult = i > 0 and (tmp == 0 or i % tmp == 0)
            if i < modmul_lat:
              t = fifo.queue[0]
              t = (t * omega_i[p]) % q
              if p == nr_pu-1:
                fifo.get()
              produced_tw[p] += [t]
            elif update_mult:
              produced_tw[p] += [(produced_tw[p][-modmul_lat] * omega_c_0) % q] 
            else:
              produced_tw[p] += [produced_tw[p][-1]]

        if nr_pu > 1:
          if i == modmul_lat//2:
             omega_c_next = produced_tw[0][-1]

          for p in range(1,nr_pu):
              if((p & 1) == 1):
                if ( i == N//2//nr_pu//2 ):
                  omega_i_next[p] = produced_tw[p//2][-1]
              else:
                if (i == 0):
                  omega_i_next[p] = produced_tw[p//2][-1]
             

        
        if nr_pu > 1 and s < clog2(N)-1 and added_fifo < modmul_lat:
            
            new_omega = initial_fill[cache_counter]
            if s < special_stage-1:
              t = produced_tw[0][-1]
              added_fifo += 1
              fifo.put(t)

            else:
              magic = modmul_lat>>(s-special_stage+2)
              if (magic != 0 and (i & magic) == 0) or (magic == 0):
                t = produced_tw[0][-1]
                added_fifo += 1
                fifo.put(t)
                  
              if (not (magic != 0 and (i & magic) == 0)) or (magic == 0):
                t1 = (new_omega * t) % q
                added_fifo += 1
                fifo.put(t1)
                
                if added_fifo == modmul_lat: 
                   cache_counter += 1
      
      if nr_pu > 1 and s >= clog2(N)-clog2(nr_pu)-1: # only for nr_pe > 1
        omega_i = omega_i_next.copy()

      if s < special_stage-1:
        omega_c_0 = initial_fill[cache_counter]
        cache_counter += 1
      elif nr_pu > 1 and s > clog2(N)-2-clog2(nr_pu):
        omega_c_0 = omega_c_next
           
    return produced_tw

def TW_Merged_DIF_RN(omega,N,q,nr_pu,modmul_lat):
    
    if N//2//nr_pu <= modmul_lat:
        print("Warning: use stored twiddle factors for this configuration")
        return None
    if modmul_lat != 4 and modmul_lat != 8 and modmul_lat != 16 and modmul_lat != 32:
        print("Error: invalid modmul lat")
        return None
    if 2**clog2(nr_pu) != nr_pu:
        print("Error: invalid nr of processing elements")
        return None

    fifo = [queue.Queue(),queue.Queue()]

    ############# precomputed rom content ###############
    initial_fill, omega_c_0 = rom_content_Merged_DIF_RN(N,nr_pu,modmul_lat,omega,q)
    omega_i = [0]*nr_pu
    for i in range(1,nr_pu):
       omega_i[i] = initial_fill[i][0]
    #####################################################

    produced_tw = [[] for _ in range(nr_pu)]
    pivot = 1
    cache_counter = modmul_lat
    for s in range(clog2(N)):
        assert s == 0 or len(fifo[s%2].queue) == modmul_lat or s == clog2(N)-1
        fifo[(s+1)%2] = queue.Queue()
        omega_i_next = [0]*nr_pu
        for i in range(N//2//nr_pu):
            for p in range(nr_pu):
                
                stage_repeats = s != 0
                if s >= clog2(N)-1-clog2(nr_pu):
                   repeat = True
                else:
                  repeat = stage_repeats and (i>>clog2(modmul_lat)<<clog2(modmul_lat)) % ((N//2//nr_pu >> (s))) == 0 and i != 0
                if i < modmul_lat and s == 0:
                  tw = initial_fill[0][i] if p == 0 else (initial_fill[0][i] * omega_i[p]) % q
                elif i < modmul_lat or repeat:
                  tw_tmp = fifo[s%2].queue[0]
                  if i == 0 and p == 0:
                     pivot = tw_tmp
                  if p == nr_pu-1 and s != clog2(N)-1:
                    r = fifo[s%2].get()
                    fifo[s%2].put(r) 
                  tw = (tw_tmp*pivot) % q if p == 0 else (tw_tmp * omega_i[p]) % q
                       
                else:
                  tw = (produced_tw[p][-modmul_lat] * omega_c_0) % q

                if i == 0 and p < nr_pu//2 and p != 0:
                  omega_i_next[p*2] = tw
                if (s < clog2(N)-1-clog2(nr_pu)-1 and i == 2 or s >= clog2(N)-1-clog2(nr_pu)-1 and i == 1) and p < nr_pu//2:
                  omega_i_next[p*2+1] = tw
                    
                
                i1 = i>>1  
                if p == 0:
                  if i1 < modmul_lat:
                    if (i1 % 2 == 0 and s < clog2(N)-2-clog2(nr_pu)) or (i % 2 == 0 and s >= clog2(N)-2-clog2(nr_pu)):
                      fifo[(s+1)%2].put(tw)

                produced_tw[p].append(tw)

        if s < clog2(N)-1-clog2(nr_pu):
          omega_c_0 = initial_fill[0][cache_counter]
          cache_counter += 1
        omega_i = omega_i_next.copy()
    
    return produced_tw

def TW_Merged_DIT_NR(omega,N,q,nr_pu,modmul_lat):
    if N//2//nr_pu <= modmul_lat:
        print("Warning: use stored twiddle factors for this configuration")
        return None
    if modmul_lat != 4 and modmul_lat != 8 and modmul_lat != 16 and modmul_lat != 32:
        print("Error: invalid modmul lat")
        return None
    if 2**clog2(nr_pu) != nr_pu:
        print("Error: invalid nr of processing elements")
        return None

    fifo = [queue.Queue() for _ in range(nr_pu//2)]
    for p in range(nr_pu//2):
      for _ in range(modmul_lat):
        fifo[p].put(1)

    ############# precomputed rom content ###############
    initial_fill = rom_content_Merged_DIT_NR(N,nr_pu,modmul_lat,omega,q)
    omega_c_0 = initial_fill[0]
    initial_fill = initial_fill[1:]
    omega_i = [1] * nr_pu
    #####################################################

    produced_tw = [[] for _ in range(nr_pu)]
    special_stage = clog2(N)-clog2(modmul_lat)

    cache_counter = 0
    next_omega_i = [0]*nr_pu
    next_omega_c = 0
    for s in range(clog2(N)):
      for i in range(N//2//nr_pu):
        for p in range(nr_pu):
            
          update_mult = i > 0 and i % (N//2 >> s) == 0
          if i < modmul_lat:
            if p == 0:
              t = initial_fill[cache_counter]
              sub = 1 if modmul_lat == 4 else 3 if modmul_lat == 8 else 7 if modmul_lat == 16 else 15
              if i == modmul_lat-1 or s-special_stage >= 0 and ((i-sub) % (modmul_lat//2 >> s-special_stage)) == 0:
                cache_counter += 1
            else:
              t = (produced_tw[0][-1] * omega_i[p]) % q
            produced_tw[p] += [t]
          elif update_mult:
            produced_tw[p] += [(produced_tw[p][-modmul_lat] * omega_c_0) % q] 
          else:
            produced_tw[p] += [produced_tw[p][-1]]

          if i == 0 and nr_pu > 1 and p % 2 == 0:
            next_omega_i[nr_pu//2 + p//2] = produced_tw[p][-1]

        if nr_pu > 1:
          next_omega_c = omega_i[1]
        else:
           if i == 0:
             next_omega_c = produced_tw[0][-1]
          
      if nr_pu > 1:
        omega_i_tmp = []
        for p in range(0,nr_pu,2):
          omega_i_tmp += [omega_i[p]]   
        omega_i_tmp += next_omega_i[nr_pu//2:]
        omega_i = omega_i_tmp
      if s >= clog2(nr_pu) and s < clog2(N)-clog2(modmul_lat)-1:
        omega_c_0 = next_omega_c


    return produced_tw
