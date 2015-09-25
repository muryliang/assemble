section .data
	SYS_WRITE equ 1
	STD_IN equ 1
	SYS_EXIT equ 60
	EXIT_CODE equ 0

	NEW_LINE db 0xa
	WRONG_ARGC db "must be two command line argument", 0xa

section .text

	global _start:
_start:
	pop rcx
	cmp rcx , 3
	jne argcError

	add rsp , 8
	pop rsi
	;; skip the argc , and put first argumen
	;; into rsi  ,then call str_to_int to possess it
	call str_to_int

