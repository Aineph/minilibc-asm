;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 12/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the address of the position of the first occurence of a string in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The string to search in the string.
;;; @return rax: The address of the first occurence of the given string in the string.

global strstr

	;; Initializes the function.
strstr:
	push rbp
	mov rbp, rsp
	xor rax, rax
	push rdi

	;; Searches the string within the string.
_strstr_search:
	cmp byte [rdi], 0
	je _strstr_end
	mov r10b, [rsi]
	cmp [rdi], r10b
	je _strstr_compare

	;; Increments the index and searches again.
_strstr_continue:
	inc rdi
	jmp _strstr_search

	;; Initializes the comparison loop variables.
_strstr_compare:
	xor rcx, rcx
	mov rax, rdi

	;; Compares the two strings.
_strstr_compare_loop:
	mov r10b, [rsi + rcx]
	cmp byte r10b, 0
	je _strstr_end
	cmp [rdi + rcx], r10b
	jne _strstr_not_found
	inc rcx
	jmp _strstr_compare_loop

	;; Stores the address NULL in rax.
_strstr_not_found:
	xor rax, rax
	jmp _strstr_continue

	;; Ends the function.
_strstr_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
