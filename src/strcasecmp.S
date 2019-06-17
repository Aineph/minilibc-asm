;;;
;;; Created by Nicolas Fez for minilibc-asm.
;;; Started on 10/06/2019.
;;;

[BITS 64]

section .text

;;; Compares the content of two given strings without case sensitivity.
;;; @param rdi: The first string to compare.
;;; @param rsi: The second string to compare.
;;; @return rax: The difference between the first and the second string.

global strcasecmp

	;; Initializes the function.
strcasecmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Checks the content of the strings.
_strcasecmp_check:
	mov r10b, [rdi + rcx]
	cmp r10b, 65
	jl _strcasecmp_skip_first
	cmp r10b, 90
	jg _strcasecmp_skip_first
	add r10b, 32

	;; Continues the check without modifying the character of the first string.
_strcasecmp_skip_first:
	mov r11b, [rsi + rcx]
	cmp r11b, 65
	jl _strcasecmp_skip_second
	cmp r11b, 90
	jg _strcasecmp_skip_second
	add r11b, 32

	;; Continues the check without modifying the character of the second string.
_strcasecmp_skip_second:
	cmp r10b, r11b
	jne _strcasecmp_end
	cmp r10b, 0
	je _strcasecmp_end
	inc rcx
	jmp _strcasecmp_check

	;; Increments the index and checks again.
_strcasecmp_continue:
	inc rcx
	jmp _strcasecmp_check

	;; Ends the function.
_strcasecmp_end:
	sub r10b, r11b
	movsx rax, r10b
	mov rsp, rbp
	pop rbp
	ret
