[BITS 64]

section .text

global _memcpy

_memcpy:
	push rbp
	mov rbp, rsp
	mov rax, 0
_memcpy_fill:
	cmp rax, rdx
	jge _memcpy_end
	mov r10b, [rsi + rax]
	mov [rdi + rax], r10b
	inc rax
	jmp _memcpy_fill
_memcpy_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
