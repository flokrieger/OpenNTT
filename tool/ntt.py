from math import log
from helper import *

# Merged NTT with pre-processing (optimized) (iterative)
# This is not NTT, this is pre-processing + NTT
# (see: https://eprint.iacr.org/2016/504.pdf)
# A: input polynomial (standard order)
# Psi: 2n-th root of unity
# q: modulus
# B: output polynomial (bit-reversed order)
def MFNTT_DIT_NR(A,Psi_table,q):
    N = len(A)
    B = [_ for _ in A]

    l = int(log(N,2))

    t = N
    m = 1
    while(m<N):
        t = int(t/2)
        for i in range(m):
            j1 = 2*i*t
            j2 = j1 + t - 1
            Psi_pow = int_reverse(m+i,l)
            #S = (Psi**Psi_pow) % q
            S = Psi_table[Psi_pow]
            for j in range(j1,j2+1):
                U = B[j]
                V = (B[j+t]*S) % q

                B[j]   = (U+V) % q
                B[j+t] = (U-V) % q

        m = 2*m

    return B

# Merged INTT with post-processing (optimized) (iterative)
# This is not NTT, this is pre-processing + NTT
# (see: https://eprint.iacr.org/2016/504.pdf)
# A: input polynomial (Bit-reversed order)
# Psi: 2n-th root of unity
# q: modulus
# B: output polynomial (standard order)
def MINTT_DIF_RN(A,Psi_table,q):
    N = len(A)
    B = [_ for _ in A]

    l = int(log(N,2))

    t = 1
    m = N
    while(m>1):
        j1 = 0
        h = int(m/2)
        for i in range(h):
            j2 = j1 + t - 1
            Psi_pow = int_reverse(h+i,l)
            #S = (Psi**Psi_pow) % q
            S = Psi_table[Psi_pow]
            for j in range(j1,j2+1):
                U = B[j]
                V = B[j+t]

                B[j]   = (U+V) % q
                B[j+t] = (U-V)*S % q

            j1 = j1 + 2*t
        t = 2*t
        m = int(m/2)

    # Final scaling
    N_inv = modinv(N, q)
    for i in range(N):
        B[i] = (B[i] * N_inv) % q

    return B

# From paper: NTTU: An Area-Efficient Low-Power NTT-Uncoupled Architecture for NTT-Based Multiplication
# Iterative Radix-2 Decimation-in-Time (DIT) (CT) NTT - NR
# A: input polynomial (standard order)
# W: twiddle factor
# q: modulus
# B: output polynomial (bit-reversed order)
def FNTT_DIT_NR(A,W_table,q):
    N = len(A)
    B = [_ for _ in A]

    for s in range(int(log(N,2)),0,-1):
        m = 2**s
        for k in range(int(N/m)):
            #TW = pow(W,int_reverse(k,int(log(N,2))-s)*int(m/2),q)
            TW_pow = int_reverse(k,int(log(N,2))-s)*int(m/2)
            TW = W_table[TW_pow]
            for j in range(int(m/2)):
                u = B[k*m+j]
                t = (TW*B[k*m+j+int(m/2)]) % q

                B[k*m+j]          = (u+t) % q
                B[k*m+j+int(m/2)] = (u-t) % q

    return B

# Iterative Radix-2 Decimation-in-Frequency (DIF) (GS) NTT - NR
# A: input polynomial (standard order)
# W: twiddle factor
# q: modulus
# B: output polynomial (bit-reversed order)
def FNTT_DIF_NR(A,W_table,q):
    N = len(A)
    B = [_ for _ in A]

    m = 1
    v = N

    while v>1:
        s = int(v/2)
        for k in range(m):
            jf = k * v
            jl = jf + s - 1
            jt = 0
            for j in range(jf,jl+1):
                #TW = pow(W,jt,q)
                TW = W_table[jt]

                temp = B[j]

                B[j  ] = (temp + B[j+s]) % q
                B[j+s] = (temp - B[j+s])*TW % q

                jt = jt + m
            
        m = 2*m
        v = s

    return B

# Iterative Radix-2 Decimation-in-Time (DIT) (CT) NTT - RN
# A: input polynomial (bit-reversed order)
# W: twiddle factor
# q: modulus
# B: output polynomial (standard order)
def INTT_DIT_RN(A,W_table,q):
    N = len(A)
    B = [_ for _ in A]

    v = N//2

    t = 1
    m = N
    while(m>1):
        j1 = 0
        h = int(m/2)
        for i in range(h):
            j2 = j1 + t - 1
            for j in range(j1,j2+1):
                W_pow = (v//h)*(j & (t-1))*(h)
                S = W_table[W_pow]

                U = B[j]
                V = B[j+t]

                temp = V*S % q

                B[j]   = (U+temp) % q
                B[j+t] = (U-temp) % q

            j1 = j1 + 2*t
        t = 2*t
        m = int(m/2)
        v = int(v/2)

    # Final scaling
    N_inv = modinv(N, q)
    for i in range(N):
        B[i] = (B[i] * N_inv) % q

    return B

# Iterative Radix-2 Decimation-in-Frequency (DIF) (GS) NTT - RN
# A: input polynomial (reversed order)
# W: twiddle factor
# q: modulus
# B: output polynomial (bit-standard order)
def INTT_DIF_RN(A,W_table,q):
    N = len(A)
    B = [_ for _ in A]

    l = int(log(N,2))

    t = 1
    m = N
    while(m>1):
        j1 = 0
        h = int(m/2)
        for i in range(h):
            j2 = j1 + t - 1
            W_pow = int_reverse(0+i,l-1)
            #S = (W**W_pow) % q
            S = W_table[W_pow]
            for j in range(j1,j2+1):
                U = B[j]
                V = B[j+t]

                B[j]   = (U+V) % q
                B[j+t] = (U-V)*S % q

            j1 = j1 + 2*t
        t = 2*t
        m = int(m/2)

    # Final scaling
    N_inv = modinv(N, q)
    for i in range(N):
        B[i] = (B[i] * N_inv) % q

    return B

