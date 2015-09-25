section .data
	SYS_WRITE  equ 1
	STD_OUT  equ 1
	SYS_EXIT  equ 60
	EXIT_CODE equ 0

	NEW_LINE db 0xa
	INPUT db "hello world!"

section .bss
	OUTPUT resb 12
	
section .text
	global _start
_start:
	mov rsi , INPUT
	xor rcx , rcx
	cld
	mov rdi , $ + 15
	call calculateStrlength
	xor rax , rax
	xor rdi , rdi
	jmp reverseStr

calculateStrlength:
	;; check is it end of string
	cmp byte [rsi] , 0
	je exitFromRoutine
	;;load byte from func from addr rsi and inc rsi one byte to rax
	lodsb
	push rax
	inc rcx
	jmp calculateStrlength

exitFromRoutine:
	push rdi
	;; the $ represent the positon where it defines
	;; and the mov and call instructions 
	;; all take 15 bytes ,this can be seen is disassembled
	ret
reverseStr:
	cmp rcx , 0
	je printResult
	pop rax
	mov [OUTPUT + rdi] , rax
	;;doesn't matter if the high portion of the before one 
	;; is overwriten by  the low portion of the after one
	;; cause high portion doesn't mean anything
	dec rcx
	inc rdi
	jmp reverseStr

printResult:
	mov rdx , rdi
	mov rax , 1
	mov rdi , 1
	mov rsi , OUTPUT
	syscall
	jmp printNewLine
printNewLine:
	mov rax , SYS_WRITE
	mov rdi , STD_OUT
	mov rsi , NEW_LINE
	mov rdx , 1
	syscall
	jmp exit

exit:
	mov rax , SYS_EXIT
	mov rdi , EXIT_CODE
	syscall
		

