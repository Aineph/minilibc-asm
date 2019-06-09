[BITS 64]

section .text

global _strchr

_strchr:
	push rbp
	mov rbp, rsp
	push rdi
_strchr_search:
	cmp byte [rdi], 0
	je _strchr_not_found
	cmp [rdi], sil
	je _strchr_found
	inc rdi
	jmp _strchr_search
_strchr_found:
	mov rax, rdi
	jmp _end_strchr
_strchr_not_found:
	mov rax, 0
	jmp _end_strchr
_end_strchr:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
