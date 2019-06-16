;;;
;;; Created by Nicolas Fez for minilibc-asm
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Concatenates a given number of bytes of a string to an other string.
;;; @param rdi: The string to fill.
;;; @param rsi: The string to concatenate.
;;; @param rdx: The number of bytes to concatenate.
;;; @return rax: The address of the filled string.

global strncat

	;; Initializes the function.
strncat:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Goes to the end of the string to fill.
_strncat_loop:
	cmp byte [rdi + rcx], 0
	je _strncat_concat
	inc rcx
	jmp _strncat_loop

	;; Initialize the concatenation loop.
_strncat_concat:
	mov rax, rcx
	xor rcx, rcx

	;; Concatenates the second string to the first one.
_strncat_concat_loop:
	cmp rcx, rdx
	jge _strncat_end
	mov r10b, [rsi + rcx]
	cmp r10b, 0
	je _strncat_end
	mov [rdi + rax], r10b
	inc rax
	inc rcx
	jmp _strncat_concat_loop

	;; Ends the function.
_strncat_end:
	mov byte [rdi + rax], 0
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
