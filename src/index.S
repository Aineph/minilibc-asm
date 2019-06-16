;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the address of the position of the first occurrence of a character in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The character to search in the string.
;;; @return rax: The address of the first occurence of the given character in the string.

global index

	;; Initializes the function.
index:
	push rbp
	mov rbp, rsp
	xor rax, rax
	push rdi

	;; Searches the character within the string.
_index_search:
	cmp [rdi], sil
	je _index_found
	cmp byte [rdi], 0
	je _index_end
	inc rdi
	jmp _index_search

	;; Stores the address of the character found.
_index_found:
	mov rax, rdi

	;; Ends the function.
_index_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
