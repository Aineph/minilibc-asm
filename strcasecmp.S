[BITS 64]

section .text

global _strcasecmp

;;; Compares the content of two given strings without case sensitivity.
;;; @param rdi: The first string to compare.
;;; @param rsi: The second string to compare.
;;; @return rax: The difference between the first and the second string.

	;; Initializes the function.
_strcasecmp:
	push rbp
	mov rbp, rsp
	mov rax, 0

	;; Checks the content of the strings.
_strcasecmp_check:
	mov r10b, [rdi + rax]
	mov r11b, [rsi + rax]
	mov r12b, 0
	cmp r10b, r11b
	jne _strcasecmp_check_case

	;; Continues the treatment.
_strcasecmp_continue:
	cmp r10b, 0
	je _strcasecmp_end
	cmp r11b, 0
	je _strcasecmp_end
	inc rax
	jmp _strcasecmp_check

	;; Checks if the two characters have different cases.
_strcasecmp_check_case:
	mov r12b, r10b
	sub r12b, r11b
	cmp r12b, 32
	je _strcasecmp_check_lowercase
	cmp r12b, -32
	je _strcasecmp_check_uppercase
	jmp _strcasecmp_end

	;; Checks if the character is a lowercase character.
_strcasecmp_check_lowercase:
	cmp r10b, 97
	jl _strcasecmp_end
	cmp r10b, 122
	jg _strcasecmp_end
	mov r12b, 0
	jmp _strcasecmp_continue

	;; Checks if the character is an uppercase character.
_strcasecmp_check_uppercase:
	cmp r10b, 65
	jl _strcasecmp_end
	cmp r10b, 90
	jg _strcasecmp_end
	mov r12b, 0
	jmp _strcasecmp_continue

	;; Ends the function.
_strcasecmp_end:
	movsx rax, r12b
	mov rsp, rbp
	pop rbp
	ret
