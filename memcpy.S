[BITS 64]

section .text

global _memcpy

;;; Copies a given number of bytes from an array to an other array.
;;; @param rdi: The array to fill.
;;; @param rsi: The source array.
;;; @param rdx: The number of bytes to fill.
;;; @param rax: The address of the filled array.

	;; Initializes the function.
_memcpy:
	push rbp
	mov rbp, rsp
	mov rax, 0

	;; Fills the array with the values of the other.
_memcpy_fill:
	cmp rax, rdx
	jge _memcpy_end
	mov r10b, [rsi + rax]
	mov [rdi + rax], r10b
	inc rax
	jmp _memcpy_fill

	;; Ends the function.
_memcpy_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
