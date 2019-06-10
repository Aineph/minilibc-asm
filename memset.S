[BITS 64]

section .text

global _memset

;;; Sets a given number of bytes in an array to a given value.
;;; @param rdi: The array to fill.
;;; @param rsi: The value to store in the array.
;;; @param rdx: The number of bytes to fill.
;;; @return rax: The address of the filled array.

	;; Initializes the function.
_memset:
	push rbp
	mov rbp, rsp
	mov rax, 0

	;; Fills the array with the given value.
_memset_fill:
	cmp rax, rdx
	jge _memset_end
	mov [rdi + rax], sil
	inc rax
	jmp _memset_fill

	;; Ends the function.
_memset_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
