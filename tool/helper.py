###################################################################
# OpenNTT - 2024
# Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
# Contact: florian.krieger@iaik.tugraz.at
###################################################################

# Modular inverse of an integer
def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('Modular inverse does not exist')
    else:
        return x % m

# Bit-Reverse integer
def int_reverse(a,loga):
    b = ('{:0'+str(loga)+'b}').format(a)
    return int(b[::-1],2)

# Div-by-2 integer
def int_divby2(a,q):
    b = (a >> 1) + (a & 0x1)*((q+1)//2)
    return b
    
# Bit-Reverse array
def arr_reverse(a,logn):
    b = [0]*len(a)
    for i in range(len(a)):
        i_rev = int_reverse(i,logn)
        b[i_rev] = a[i]
    return b

# Re-order array as [0,1,...,n-2,n-1] --> [0,n-1,...,2,1]
def arr_reorder(a):
    b = [a[0]] + list(reversed(a[1:]))
    return b

# Bit-reverse and Re-order array
def arr_reorder_2(a,n):
    b = arr_reverse(a,n)
    c = arr_reorder(b)
    return c

# Div-by-n array
def arr_divbyn(a,n,q):
    n_inv = modinv(n,q)
    b = [(i*n_inv)%q for i in a]
    return b

# Equality check for 2 arrays
def arr_eqcheck(a,b):
    eq = (sum([abs(p0-p1) for p0,p1 in zip(a,b)]) == 0)
    return eq

def ntt_mem_layout(btf_ops, pe, file_name, layout_type):
    if layout_type == 0:
        # consecutive BTF operations are distrubuted over different BRAMs
        ntt_mem_layout_v0(btf_ops, pe, file_name)
    else:
        # consecutive BTF operations are distrubuted over the same BRAM
        ntt_mem_layout_v1(btf_ops, pe, file_name)

# write mem layout
# consecutive BTF operations are distrubuted over different BRAMs
def ntt_mem_layout_v0(btf_ops, pe, file_name):
    # btf_ops: btf operations in order
    # pe: number of pes
    # file_name: file name

    stage = len(btf_ops)
    N = 2*len(btf_ops[0])

    file_name_mem = file_name + "_data.txt"
    file_name_tw  = file_name + "_tw.txt"

    MEM_TXT = open(file_name_mem,"w")
    TW_TXT  = open(file_name_tw,"w")

    BS = ""
    for i in range(stage):
        BS = BS+"***************************************************STAGE="+str(i)+"\n"
        BS = BS+"BRAM:"
        for y in range(pe):
            BS = BS+"\t|"+str(2*y).ljust(5)+str(2*y+1).ljust(4)+"|"
        BS = BS+"\n"
        BS = BS+"     "
        for y in range(pe):
            BS = BS+"\t----------"
        BS = BS+"\n"

        for j in range((N//2)//pe):
            BS = BS + "AD"+str(j)+":"
            for k in range(pe):
                BS = BS+"\t|"+str(btf_ops[i][j*pe+k][0]).ljust(5)+str(btf_ops[i][j*pe+k][1]).ljust(4)+"|"
            BS = BS+"\n"
    
    MEM_TXT.write(BS)
    MEM_TXT.close()

    BS = ""
    for i in range(stage):
        BS = BS+"***************************************************STAGE="+str(i)+"\n"
        BS = BS+"BRAM:"
        for y in range(pe):
            BS = BS+"\t|"+str(y).ljust(4)+"|"
        BS = BS+"\n"
        BS = BS+"     "
        for y in range(pe):
            BS = BS+"\t----------"
        BS = BS+"\n"

        for j in range((N//2)//pe):
            BS = BS + "AD"+str(j)+":"
            for k in range(pe):
                BS = BS+"\t|"+str(btf_ops[i][j*pe+k][2]).ljust(4)+"|"
            BS = BS+"\n"
    
    TW_TXT.write(BS)
    TW_TXT.close()

# write mem layout
# consecutive BTF operations are distrubuted over the same BRAM
def ntt_mem_layout_v1(btf_ops, pe, file_name):
    # btf_ops: btf operations in order
    # pe: number of pes
    # file_name: file name

    stage = len(btf_ops)
    N = 2*len(btf_ops[0])

    file_name_mem = file_name + "_data.txt"
    file_name_tw  = file_name + "_tw.txt"

    MEM_TXT = open(file_name_mem,"w")
    TW_TXT  = open(file_name_tw,"w")

    BS = ""
    for i in range(stage):
        BS = BS+"***************************************************STAGE="+str(i)+"\n"
        BS = BS+"BRAM:"
        for y in range(pe):
            BS = BS+"\t|"+str(2*y).ljust(5)+str(2*y+1).ljust(4)+"|"
        BS = BS+"\n"
        BS = BS+"     "
        for y in range(pe):
            BS = BS+"\t----------"
        BS = BS+"\n"

        for j in range((N//2)//pe):
            BS = BS + "AD"+str(j)+":"
            for k in range(pe):
                BS = BS+"\t|"+str(btf_ops[i][j+k*((N//2)//pe)][0]).ljust(5)+str(btf_ops[i][j+k*((N//2)//pe)][1]).ljust(4)+"|"
            BS = BS+"\n"
    
    MEM_TXT.write(BS)
    MEM_TXT.close()

    BS = ""
    for i in range(stage):
        BS = BS+"***************************************************STAGE="+str(i)+"\n"
        BS = BS+"BRAM:"
        for y in range(pe):
            BS = BS+"\t|"+str(y).ljust(4)+"|"
        BS = BS+"\n"
        BS = BS+"     "
        for y in range(pe):
            BS = BS+"\t----------"
        BS = BS+"\n"

        for j in range((N//2)//pe):
            BS = BS + "AD"+str(j)+":"
            for k in range(pe):
                BS = BS+"\t|"+str(btf_ops[i][j+k*((N//2)//pe)][2]).ljust(4)+"|"
            BS = BS+"\n"
    
    TW_TXT.write(BS)
    TW_TXT.close()

# write debug to file
def ntt_debug(btf_ops_in,btf_ops_out,file_name):
    stage = len(btf_ops_in)
    N = 2*len(btf_ops_in[0])

    DEBUG_TXT = open(file_name,"w")

    BS = ""
    for i in range(stage):
        BS = BS+"***************************************************STAGE="+str(i)+"\n"
        for j in range(N//2):
            BS = BS + "A={}, B={} <-- A={}, B={}, W={}".format(btf_ops_out[i][j][0],btf_ops_out[i][j][1],btf_ops_in[i][j][0],btf_ops_in[i][j][1],btf_ops_in[i][j][2]) + "\n"

    DEBUG_TXT.write(BS)
    DEBUG_TXT.close()
