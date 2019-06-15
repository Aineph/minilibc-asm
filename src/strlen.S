;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 10/06/2019.
;;;

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
	xor rax, rax

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
