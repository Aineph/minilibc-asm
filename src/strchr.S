;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 10/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the address of the position of the first occurrence of a character in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The character to search in the string.
;;; @return rax: The address of the first occurence of the given character in the string.

global strchr

	;; Initializes the function.
strchr:
	push rbp
	mov rbp, rsp
	xor rax, rax
	push rdi

	;; Searches the character within the string.
_strchr_search:
	cmp byte [rdi], 0
	je _strchr_end
	cmp [rdi], sil
	je _strchr_found
	inc rdi
	jmp _strchr_search

	;; Stores the address of the character found.
_strchr_found:
	mov rax, rdi

	;; Ends the function.
_strchr_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
