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
	mov r11b, [rsi + rcx]
	xor r12b, r12b
	cmp r10b, 0
	je _strcasecmp_end
	cmp r11b, 0
	je _strcasecmp_end
	cmp r10b, r11b
	jne _strcasecmp_check_case

	;; Increments the index and checks again.
_strcasecmp_continue:
	inc rcx
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
