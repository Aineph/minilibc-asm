;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 10/06/2019.
;;;

[BITS 64]

section .text

;;; Copies a given number of bytes from an array to an other array.
;;; If some elements in the two arrays have the same addresses, they are not overwritten.
;;; @param rdi: The array to fill.
;;; @param rsi: The source array.
;;; @param rdx: The number of bytes to fill.
;;; @return rax: The address of the filled array.

global memmove

	;; Initializes the function.
memmove:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	cmp rdi, rsi
	jle _memmove_ascending
	mov rcx, rdx

	;; Performs a descending copy.
_memmove_descending:
	dec rcx
	cmp rcx, 0
	jl _memmove_end
	mov r10b, [rsi + rcx]
	mov [rdi + rcx], r10b
	jmp _memmove_descending

	;; Performs an ascending copy.
_memmove_ascending:
	cmp rcx, rdx
	jge _memmove_end
	mov r10b, [rsi + rcx]
	mov [rdi + rcx], r10b
	inc rcx
	jmp _memmove_ascending

	;; Ends the function.
_memmove_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
