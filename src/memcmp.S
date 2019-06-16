;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 16/06/2019.
;;;

[BITS 64]

section .text

;;; Compares a specific number of bytes from two given arrays.
;;; @param rdi: The first array to compare.
;;; @param rsi: The second array to compare.
;;; @param rdx: The number of bytes to compare.
;;; @return rax: The difference between the first and the second array.

global memcmp

	;; Initializes the function.
memcmp:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rcx, rcx
	xor r10b, r10b
	xor r11b, r11b

	;; Checks the content of the arrays.
_memcmp_check:
	cmp rcx, rdx
	jge _memcmp_end
	mov r10b, [rdi + rcx]
	mov r11b, [rsi + rcx]
	cmp r10b, r11b
	jne _memcmp_different
	inc rcx
	jmp _memcmp_check

	;; Assigns a negative value to the return value.
_memcmp_negative:
	xor rax, rax
	sub rax, 1
	jmp _memcmp_end

	;; Assigns a positive value to the return value.
_memcmp_positive:
	xor rax, rax
	add rax, 1
	jmp _memcmp_end

	;; Manages if the given arrays are different.
_memcmp_different:
	sub r10b, r11b
	movsx rax, r10b
	cmp rax, 0
	jl _memcmp_negative
	jg _memcmp_positive

	;; Ends the function.
_memcmp_end:
	mov rsp, rbp
	pop rbp
	ret
