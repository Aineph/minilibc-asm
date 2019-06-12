[BITS 64]

section .text

;;; Compares the content of two given strings.
;;; @param rdi: The first string to compare.
;;; @param rsi: The second string to compare.
;;; @return rax: The difference between the first and the second string.

global strcmp

	;; Initializes the function.
strcmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

	;; Checks the content of the strings.
_strcmp_check:
	mov r10b, [rdi + rcx]
	mov r11b, [rsi + rcx]
	cmp byte r10b, 0
	je _strcmp_end
	cmp byte r11b, 0
	je _strcmp_end
	cmp r10b, r11b
	jne _strcmp_end
	inc rcx

	;; Ends the function.
_strcmp_end:
	sub r10b, r11b
	movsx rax, r10b
	mov rsp, rbp
	pop rbp
	ret
