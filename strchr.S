[BITS 64]

section .text

global _strchr

;;; Returns the address of the position of the first occurrence of a character in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The character to search in the string.
;;; @return rax: The address of the first occurence of the given character in the string.

	;; Initializes the function.
_strchr:
	push rbp
	mov rbp, rsp
	push rdi

	;; Searches the character over the string.	
_strchr_search:
	cmp byte [rdi], 0
	je _strchr_not_found
	cmp [rdi], sil
	je _strchr_found
	inc rdi
	jmp _strchr_search

	;; Stores the address of the character found in rax.
_strchr_found:
	mov rax, rdi
	jmp _end_strchr

	;; Stores the address of NULL in rax.
_strchr_not_found:
	mov rax, 0
	jmp _end_strchr

	;; Ends the function.
_end_strchr:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
