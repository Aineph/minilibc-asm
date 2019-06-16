;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the address of the position of the last occurence of a character in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The character to search in the string.
;;; @return rax: The address of the last occurence of the given character in the string.
	
global strrchr

	;; Initializes the function.
strrchr:
	push rbp
	mov rbp, rsp
	xor rax, rax
	push rdi

	;; Searches the character within the string.
_strrchr_search:
	cmp [rdi], sil
	je _strrchr_assign

	;; Increments the index and searches again.
_strrchr_continue:
	cmp byte [rdi], 0
	je _strrchr_end
	inc rdi
	jmp _strrchr_search

	;; Stores the current position in the return value.
_strrchr_assign:
	mov rax, rdi
	jmp _strrchr_continue

	;; Ends the function.
_strrchr_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
