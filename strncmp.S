[BITS 64]

section .text

global _strncmp

;;; Compares a specific number of bytes from two given strings.
;;; @param rdi: The first string to compare.
;;; @param rsi: The second string to compare.
;;; @param rdx: The number of bytes to compare.
;;; @return rax: The difference between the first and the second string.

	;; Initializes the function.
_strncmp:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov r10b, 0
	mov r11b, 0

	;; Checks the content of the strings.
_strncmp_check:
	cmp rax, rdx
	jge _strncmp_end
	mov r10b, [rdi + rax]
	mov r11b, [rsi + rax]
	cmp r10b, r11b
	jne _strncmp_end
	cmp byte r10b, 0
	je _strncmp_end
	cmp byte r11b, 0
	je _strncmp_end
	inc rax
	jmp _strncmp_check

	;; Ends the function
_strncmp_end:
	sub r10b, r11b
	movsx rax, r10b
	mov rsp, rbp
	pop rbp
	ret
