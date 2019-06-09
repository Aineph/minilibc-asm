[BITS 64]

section .text

global _memset

_memset:
	push rbp
	mov rbp, rsp
	mov rax, 0
_memset_fill:
	cmp rax, rdx
	jge _memset_end
	mov [rdi + rax], sil
	inc rax
	jmp _memset_fill
_memset_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
