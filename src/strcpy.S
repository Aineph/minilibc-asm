;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Copies the content of a string to an other string.
;;; @param rdi: The string to fill.
;;; @param rsi: The source string.
;;; @return rax: The address of the filled string.

global strcpy
	
	;; Initializes the function.
strcpy:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Fills the string with the content of the other.
_strcpy_fill:
	mov r10b, [rsi + rcx]
	mov [rdi + rcx], r10b
	cmp r10b, 0
	je _strcpy_end
	inc rcx
	jmp _strcpy_fill

	;; Ends the function.
_strcpy_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
