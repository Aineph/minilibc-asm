;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Copies a given number of bytes from a string to an other string.
;;; @param rdi: The string to fill.
;;; @param rsi: The source string.
;;; @param rdx: The number of bytes to fill.
;;; @return rax: The address of the filled string.

global strncpy

	;; Initializes the function.
strncpy:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

_strncpy_fill:
	cmp rcx, rdx
	jge _strncpy_end
	mov r10b, [rsi + rcx]
	mov [rdi + rcx], r10b
	cmp r10b, 0
	je _strncpy_fill_zeros
	inc rcx
	jmp _strncpy_fill

_strncpy_fill_zeros:
	cmp rcx, rdx
	jge _strncpy_end
	mov byte [rdi + rcx], 0
	inc rcx
	jmp _strncpy_fill_zeros

	;; Ends the function
_strncpy_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
