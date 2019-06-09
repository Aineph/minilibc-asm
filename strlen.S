[BITS 64]

section .text

global _strlen

_strlen:
	push rbp
	mov rbp, rsp
	mov rax, 0
_strlen_loop:
	cmp byte [rdi + rax], 0
	je _strlen_end
	inc rax
	jmp _strlen_loop
_strlen_end:
	mov rsp, rbp
	pop rbp
	ret
