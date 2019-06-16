;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the number of characters while some specific characters are encountered in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The characters list to search in the string.
;;; @return rax: The number of characters encountered while finding some given characters in the string.

global strspn

	;; Initializes the function.
strspn:
	push rbp
	mov rbp, rsp
	xor rax, rax

	;; Searches the characters within the string.
_strspn_search:
	mov r10b, [rdi + rax]
	push rax
	cmp r10b, 0
	je _strspn_end
	xor rax, rax

	;; Checks every character within the second string.
_strspn_check:
	cmp byte [rsi + rax], 0
	je _strspn_end
	cmp [rsi + rax], r10b
	je _strspn_continue
	inc rax
	jmp _strspn_check

	;; Increments the index and searches again.
_strspn_continue:
	pop rax
	inc rax
	jmp _strspn_search

	;; Ends the function.
_strspn_end:
	pop rax
	mov rsp, rbp
	pop rbp
	ret
