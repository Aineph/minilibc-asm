[BITS 64]

section .text

;;; Returns the address of the position of the first occurence of a character of a list in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The characters list to search in the string.
;;; @return rax: The address of the first occurence of one of the given character in the string.

global strpbrk

	;; Initializes the function.
strpbrk:
	push rbp
	mov rbp, rsp
	xor rax, rax
	push rdi

	;; Searches the characters within the string.
_strpbrk_search:
	cmp byte [rdi], 0
	je _strpbrk_end
	xor rcx, rcx

	;; Checks every character within the second string.
_strpbrk_check:
	cmp byte [rsi + rcx], 0
	je _strpbrk_continue
	mov r10b, [rsi + rcx]
	cmp [rdi], r10b
	je _strpbrk_found
	inc rcx
	jmp _strpbrk_check

	;; Increments the index and searches again.
_strpbrk_continue:
	inc rdi
	jmp _strpbrk_search

	;; Stores the address of the character found.
_strpbrk_found:
	mov rax, rdi

	;; Ends the function.
_strpbrk_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
