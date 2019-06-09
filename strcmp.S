[BITS 64]

section .text

global _strcmp

_strcmp:
	push rbp
	mov rbp, rsp
	mov rax, 0
_strcmp_check:
	mov r10b, [rdi + rax]
	mov r11b, [rsi + rax]
	cmp r10b, r11b
	jne _strcmp_end
	cmp byte r10b, 0
	je _strcmp_end
	inc rax
_strcmp_end:
	sub r10b, r11b
	movsx rax, r10b
	mov rsp, rbp
	pop rbp
	ret
