;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 10/06/2019.
;;;

[BITS 64]

section .text

;;; Copies a given number of bytes from an array to an other array.
;;; @param rdi: The array to fill.
;;; @param rsi: The source array.
;;; @param rdx: The number of bytes to fill.
;;; @return rax: The address of the filled array.

global memcpy

	;; Initializes the function.
memcpy:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Fills the array with the content of the other.
_memcpy_fill:
	cmp rcx, rdx
	jge _memcpy_end
	mov r10b, [rsi + rcx]
	mov [rdi + rcx], r10b
	inc rcx
	jmp _memcpy_fill

	;; Ends the function.
_memcpy_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
