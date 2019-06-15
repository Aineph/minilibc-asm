;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 12/06/2019.
;;;

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
	xor rax, rax

	;; Searches the characters within the string.
_strcspn_search:
	mov r10b, [rdi + rax]
	push rax
	cmp r10b, 0
	je _strcspn_end
	xor rax, rax

	;; Checks every character within the second string.
_strcspn_check:
	cmp byte [rsi + rax], 0
	je _strcspn_continue
	cmp [rsi + rax], r10b
	je _strcspn_end
	inc rax
	jmp _strcspn_check

	;; Increments the index and searches again.
_strcspn_continue:
	pop rax
	inc rax
	jmp _strcspn_search

	;; Ends the function.
_strcspn_end:
	pop rax
	mov rsp, rbp
	pop rbp
	ret
