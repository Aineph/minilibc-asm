[BITS 64]

section .text

;;; Compares a specific number of bytes from two given strings.
;;; @param rdi: The first string to compare.
;;; @param rsi: The second string to compare.
;;; @param rdx: The number of bytes to compare.
;;; @return rax: The difference between the first and the second string.

global strncmp

	;; Initializes the function.
strncmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	xor r10b, r10b
	xor r11b, r11b

	;; Checks the content of the strings.
_strncmp_check:
	cmp rcx, rdx
	jge _strncmp_end
	mov r10b, [rdi + rcx]
	mov r11b, [rsi + rcx]
	cmp byte r10b, 0
	je _strncmp_end
	cmp byte r11b, 0
	je _strncmp_end
	cmp r10b, r11b
	jne _strncmp_end
	inc rcx
	jmp _strncmp_check

	;; Ends the function
_strncmp_end:
	sub r10b, r11b
	movsx rax, r10b
	mov rsp, rbp
	pop rbp
	ret
