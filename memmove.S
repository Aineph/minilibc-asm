[BITS 64]

section .text

global _memmove

;;; Copies a given number of bytes from an array to an other array.
;;; If some elements in the two arrays have the same addresses, they are not overwritten.
;;; @param rdi: The array to fill.
;;; @param rsi: The source array.
;;; @param rdx: The number of bytes to fill.
;;; @return rax: The address of the filled array.

	;; Initializes the function.
_memmove:
	push rbp
	mov rbp, rsp
	sub rsp, rdx
	mov rax, 0

	;; Saves the content of the source array on the space allocated on the stack.
_memmove_save:
	cmp rax, rdx
	jge _memmove_fill
	mov r10b, [rsi + rax]
	mov [rsp + rax], r10b
	inc rax
	jmp _memmove_save

	;; Fills the array with the values saved on the stack.
_memmove_fill:
	dec rax
	cmp rax, 0
	jl _memmove_end
	mov r10b, [rsp + rax]
	mov [rdi + rax], r10b
	jmp _memmove_fill

	;; Ends the function.
_memmove_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
