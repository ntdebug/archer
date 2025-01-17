#define STR0 ARG2
#define STR1 ARG3
#define STR2 ARG4
#define STR3 ARG5 
#define STR4 ARG6 

#define STR5 GPR9 
#define STR6 GPR10 
#define STR7 GPR11 
#define STR8 GPR12 
#define STR9 GPR13 
#define STR10 GPR14 


DEFINE DOUBLE SCALAR  1.0
DEFINE SINGLE SSCALAR  1.0
DEFINE INT ISCALAR  1
DEFINE INT OMM  0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
DEFINE INT IOMM  0,16,32,48,64,80,96,128,144,160,176,192,208,224,240,256
DEFINE INT TOMM  0,2,4,6,16,18,20,22,32,34,36,38,48,50,52,54

START LOCAL

FUNC daxpy_mem_avx512
{
vmovaps zmm7, [rip+SCALAR]



LOOP .loop 32 GPR6 {
vmulpd    zmm1, zmm7, [STR0 + GPR1*8]
vaddpd    zmm1, zmm1, [STR1 + GPR1*8]
vmulpd    zmm2, zmm7, [STR0 + GPR1*8+64]
vaddpd    zmm2, zmm2, [STR1 + GPR1*8+64]
vmovntps    [STR1 + GPR1*8], zmm1
vmovntps    [STR1 + GPR1*8+64], zmm2
vmulpd    zmm3, zmm7, [STR0 + GPR1*8+128]
vaddpd    zmm3, zmm3, [STR1 + GPR1*8+128]
vmulpd    zmm4, zmm7, [STR0 + GPR1*8+192]
vaddpd    zmm4, zmm4, [STR1 + GPR1*8+192]
vmovntps    [STR1 + GPR1*8+128], zmm3
vmovntps    [STR1 + GPR1*8+192], zmm4

}

}

STOP LOCAL

