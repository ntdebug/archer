.intel_syntax noprefix
.data
.align 64
SCALAR:
.double 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0
.align 64
SSCALAR:
.single 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0
.align 64
ISCALAR:
.int 1, 1
.align 16
OMM:
.int 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
.align 16
IOMM:
.int 0,16,32,48,64,80,96,128,144,160,176,192,208,224,240,256
.align 16
TOMM:
.int 0,2,4,6,16,18,20,22,32,34,36,38,48,50,52,54
.text
.global daxpy_sp_mem_avx_fma
.type daxpy_sp_mem_avx_fma, @function
daxpy_sp_mem_avx_fma :
push rbp
mov rbp, rsp
push rbx
push r12
push r13
push r14
push r15
vmovaps ymm7, [rip+SCALAR]
xor   rax, rax
.align 16
1:
vmovaps ymm1, [rsi + rax*4]
vmovaps ymm2, [rsi + rax*4+32]
vmovaps ymm3, [rsi + rax*4+64]
vmovaps ymm4, [rsi + rax*4+96]
vfmadd213ps ymm1, ymm7, [rdx + rax*4]
vfmadd213ps ymm2, ymm7, [rdx + rax*4+32]
vfmadd213ps ymm3, ymm7, [rdx + rax*4+64]
vfmadd213ps ymm4, ymm7, [rdx + rax*4+96]
vmovntps [rdx + rax*4], ymm1
vmovntps [rdx + rax*4+32], ymm2
vmovntps [rdx + rax*4+64], ymm3
vmovntps [rdx + rax*4+96], ymm4
add rax, 32
cmp rax, rdi
jl 1b

pop r15
pop r14
pop r13
pop r12
pop rbx
mov  rsp, rbp
pop rbp
ret
.size daxpy_sp_mem_avx_fma, .-daxpy_sp_mem_avx_fma


