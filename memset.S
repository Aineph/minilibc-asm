[BITS 64]

section .text

;;; Sets a given number of bytes in an array to a given value.
;;; @param rdi: The array to fill.
;;; @param rsi: The value to store in the array.
;;; @param rdx: The number of bytes to fill.
;;; @return rax: The address of the filled array.

global memset

	;; Initializes the function.
memset:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Fills the array with the given value.
_memset_fill:
	cmp rcx, rdx
	jge _memset_end
	mov [rdi + rcx], sil
	inc rcx
	jmp _memset_fill

	;; Ends the function.
_memset_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
