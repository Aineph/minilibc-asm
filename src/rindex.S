;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 12/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the address of the position of the last occurence of a character in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The character to search in the string.
;;; @return rax: The address of the last occurence of the given character in the string.
	
global rindex

	;; Initializes the function.
rindex:
	push rbp
	mov rbp, rsp
	xor rax, rax
	push rdi

	;; Searches the character within the string.
_rindex_search:
	cmp byte [rdi], 0
	je _rindex_end
	cmp [rdi], sil
	je _rindex_assign

	;; Increments the index and searches again.
_rindex_continue:
	inc rdi
	jmp _rindex_search

	;; Stores the current position in the return value.
_rindex_assign:
	mov rax, rdi
	jmp _rindex_continue

	;; Ends the function.
_rindex_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
