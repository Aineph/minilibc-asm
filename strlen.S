[BITS 64]

section .text

global _strlen

;;; Computes the length of a given string.
;;; @param rdi: The string to process.
;;; @return rax: The length of the string.

	;; Initializes the function.
_strlen:
	push rbp
	mov rbp, rsp
	mov rax, 0

	;; Loops over the string. Stores the index in rax.
_strlen_loop:
	cmp byte [rdi + rax], 0
	je _strlen_end
	inc rax
	jmp _strlen_loop

	;; Ends the function.
_strlen_end:
	mov rsp, rbp
	pop rbp
	ret
