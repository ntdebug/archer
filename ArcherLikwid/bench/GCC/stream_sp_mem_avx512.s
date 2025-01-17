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
.global stream_sp_mem_avx512
.type stream_sp_mem_avx512, @function
stream_sp_mem_avx512 :
push rbp
mov rbp, rsp
push rbx
push r12
push r13
push r14
push r15
vmovaps zmm1, [rip+SCALAR]
xor   rax, rax
.align 16
1:
vmovaps zmm2, [rdx + rax*4]
vmovaps zmm3, [rdx + rax*4+64]
vmovaps zmm4, [rdx + rax*4+128]
vmovaps zmm5, [rdx + rax*4+192]
vmulps zmm2, zmm2, zmm1
vaddps zmm2, zmm2, [rcx + rax*4]
vmulps zmm3, zmm3, zmm1
vaddps zmm3, zmm3, [rcx + rax*4+64]
vmulps zmm4, zmm4, zmm1
vaddps zmm4, zmm4, [rcx + rax*4+128]
vmulps zmm5, zmm5, zmm1
vaddps zmm5, zmm5, [rcx + rax*4+192]
vmovntps [rsi + rax*4], zmm2
vmovntps [rsi + rax*4+64], zmm3
vmovntps [rsi + rax*4+128], zmm4
vmovntps [rsi + rax*4+192], zmm5
add rax, 64
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
.size stream_sp_mem_avx512, .-stream_sp_mem_avx512


