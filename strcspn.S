[BITS 64]

section .text

;;; Returns the number of characters encountered before a specific character in a given string.
;;; @param rdi: The string to process.
;;; @param rsi: The characters list to search in the string.
;;; @return rax: The number of characters encountered before finding a given character in the string.

global strcspn

	;; Initializes the function.
strcspn:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	xor rax, rax

	;; Searches the characters within the string.
_strcspn_search:
	mov r10b, [rdi + rcx]
	push rcx
	cmp r10b, 0
	je _strcspn_end
	xor rcx, rcx

	;; Checks every character within the second string.
_strcspn_check:
	cmp byte [rsi + rcx], 0
	je _strcspn_continue
	cmp [rsi + rcx], r10b
	je _strcspn_end
	inc rcx
	jmp _strcspn_check

	;; Increments the index and searches again.
_strcspn_continue:
	pop rcx
	inc rcx
	jmp _strcspn_search

	;; Ends the function.
_strcspn_end:
	pop rcx
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret
