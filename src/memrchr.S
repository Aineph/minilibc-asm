;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the address of the position of the last occurence of a byte in a given array.
;;; @param rdi: The array to process.
;;; @param rsi: The byte to search in the array.
;;; @param rdx: The length of the array.
;;; @return rax: The address of the last occurence of the given byte in the array.
	
global memrchr

	;; Initializes the function.
memrchr:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rcx, rcx
	push rdi

	;; Searches the byte within the array.
_memrchr_search:
	cmp rcx, rdx
	je _memrchr_end
	cmp [rdi], sil
	je _memrchr_assign

	;; Increments the index and searches again.
_memrchr_continue:
	inc rdi
	inc rcx
	jmp _memrchr_search

	;; Stores the current position in the return value.
_memrchr_assign:
	mov rax, rdi
	jmp _memrchr_continue

	;; Ends the function.
_memrchr_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
