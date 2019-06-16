;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Concatenates two strings.
;;; @param rdi: The string to fill.
;;; @param rsi: The string to concatenate.
;;; @return rax: The address of the filled string.

global strcat

	;; Initializes the function.
strcat:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Goes to the end of the string to fill.
_strcat_loop:
	cmp byte [rdi + rcx], 0
	je _strcat_concat
	inc rcx
	jmp _strcat_loop

	;; Initialize the concatenation loop.
_strcat_concat:
	mov rax, rcx
	xor rcx, rcx

	;; Concatenates the second string to the first one.
_strcat_concat_loop:
	mov r10b, [rsi + rcx]
	mov [rdi + rax], r10b
	cmp byte r10b, 0
	je _strcat_end
	inc rax
	inc rcx
	jmp _strcat_concat_loop

	;; Ends the function.
_strcat_end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
