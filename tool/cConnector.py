###################################################################
# OpenNTT - 2024
# Florian Krieger, Florian Hirner, Ahmet Can Mert, Sujoy Sinha Roy
# Contact: florian.krieger@iaik.tugraz.at
###################################################################

from ctypes import * 

so_file = "./pythonConnector.so"
CHandler = CDLL(so_file)
    

def complexMult_float_nosubnormal(a, b):
    res_real = c_double()
    res_imag = c_double()
    CHandler.PC_complexMult_float_nosubnormal(c_double(a.real), c_double(a.imag), c_double(b.real), c_double(b.imag), byref(res_real), byref(res_imag))    
    return res_real.value + res_imag.value*1j

def GSButterfly_float_nosubnormal(a, b, tw):
    x_real = c_double()
    x_imag = c_double()
    y_real = c_double()
    y_imag = c_double()
    CHandler.PC_GSButterfly_float_nosubnormal(c_double(a.real), c_double(a.imag), c_double(b.real), c_double(b.imag), c_double(tw.real), c_double(tw.imag), byref(x_real), byref(x_imag), byref(y_real), byref(y_imag))    
    return x_real.value + x_imag.value*1j, y_real.value + y_imag.value*1j

def CTButterfly_float_nosubnormal(a, b, tw):
    x_real = c_double()
    x_imag = c_double()
    y_real = c_double()
    y_imag = c_double()
    CHandler.PC_CTButterfly_float_nosubnormal(c_double(a.real), c_double(a.imag), c_double(b.real), c_double(b.imag), c_double(tw.real), c_double(tw.imag), byref(x_real), byref(x_imag), byref(y_real), byref(y_imag))    
    return x_real.value + x_imag.value*1j, y_real.value + y_imag.value*1j

def addNoSubnormal_F(a, b):
    return CHandler.PC_addNoSubnormal_F(c_double(a), c_double(b)).value

def multNoSubnormal_F(a, b):
    return CHandler.PC_multNoSubnormal_F(c_double(a), c_double(b)).value

def roundFloatToInt_F(a):
    sign = c_uint32()
    result_h = c_uint64()
    result_l = c_uint64()
    CHandler.PC_roundFloatToInt_F(c_double(a), byref(result_h), byref(result_l), byref(sign))
    tmp = (int(result_h.value) << 64) + int(result_l.value)
    return -tmp if sign else tmp 

def getRandomNormalizedFloat():
    return CHandler.PC_getRandomNormalizedFloat().value

def getDoubleFromUint64(x):
    res = c_double()
    CHandler.PC_getDoubleFromUint64(c_uint64(x), byref(res))
    return res.value

def getFloatFromUint32(x):
    res = c_double()
    CHandler.PC_getFloatFromUint32(c_uint32(x), byref(res))
    return res.value

def complexMult_double_nosubnormal(a, b):
    res_real = c_double()
    res_imag = c_double()
    CHandler.PC_complexMult_double_nosubnormal(c_double(a.real), c_double(a.imag), c_double(b.real), c_double(b.imag), byref(res_real), byref(res_imag))    
    return res_real.value + res_imag.value*1j

def GSButterfly_double_nosubnormal(a, b, tw):
    x_real = c_double()
    x_imag = c_double()
    y_real = c_double()
    y_imag = c_double()
    CHandler.PC_GSButterfly_double_nosubnormal(c_double(a.real), c_double(a.imag), c_double(b.real), c_double(b.imag), c_double(tw.real), c_double(tw.imag), byref(x_real), byref(x_imag), byref(y_real), byref(y_imag))    
    return x_real.value + x_imag.value*1j, y_real.value + y_imag.value*1j

def CTButterfly_double_nosubnormal(a, b, tw):
    x_real = c_double()
    x_imag = c_double()
    y_real = c_double()
    y_imag = c_double()
    CHandler.PC_CTButterfly_double_nosubnormal(c_double(a.real), c_double(a.imag), c_double(b.real), c_double(b.imag), c_double(tw.real), c_double(tw.imag), byref(x_real), byref(x_imag), byref(y_real), byref(y_imag))    
    return x_real.value + x_imag.value*1j, y_real.value + y_imag.value*1j

def addNoSubnormal_D(a, b):
    CHandler.PC_addNoSubnormal_D.restype = c_double
    return CHandler.PC_addNoSubnormal_D(c_double(a), c_double(b))

def multNoSubnormal_D(a, b):
    CHandler.PC_multNoSubnormal_D.restype = c_double
    return CHandler.PC_multNoSubnormal_D(c_double(a), c_double(b)).value

def getRandomNormalizedDouble(seed):
    CHandler.PC_getRandomNormalizedDouble.restype = c_double
    return CHandler.PC_getRandomNormalizedDouble(c_uint32(seed))

def getUint32FromFloat(x):
    res = c_uint32()
    CHandler.PC_getUint32FromFloat(c_float(x), byref(res))
    return res.value 

def getUint64FromDouble(x):
    res = c_uint64()
    CHandler.PC_getUint64FromDouble(c_double(x), byref(res))
    return res.value 

def getRandomNormalizedComplex_D(seed):
    real = getRandomNormalizedDouble(seed)
    imag = getRandomNormalizedDouble(0)
    return real + 1j*imag