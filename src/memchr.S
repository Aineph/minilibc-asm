;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Returns the address of the position of the first occurrence of a byte in a given array.
;;; @param rdi: The array to process.
;;; @param rsi: The byte to search in the array.
;;; @param rdx: The length of the array.
;;; @return rax: The address of the first occurence of the given byte in the array.

global memchr

	;; Initializes the function.
memchr:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rcx, rcx
	push rdi

	;; Searches the byte within the array.
_memchr_search:
	cmp rcx, rdx
	je _memchr_end
	cmp [rdi], sil
	je _memchr_found
	inc rdi
	inc rcx
	jmp _memchr_search

	;; Stores the address of the character found.
_memchr_found:
	mov rax, rdi

	;; Ends the function.
_memchr_end:
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
