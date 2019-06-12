[BITS 64]

section .text

;;; Computes the length of a given string.
;;; @param rdi: The string to process.
;;; @return rax: The length of the string.

global strlen

	;; Initializes the function.
strlen:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Loops over the string. Stores the index in rax.
_strlen_loop:
	cmp byte [rdi + rcx], 0
	je _strlen_end
	inc rcx
	jmp _strlen_loop

	;; Ends the function.
_strlen_end:
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret
