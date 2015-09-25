# assemble
today begin again :( 20150925

there 16 general purpose registers  rax bx cx dx si di sp bp r8-r15
	and func args can be stored into  di si dx cx r8 r9  this six
		we can use rax eax ax al or rsi esi si sil or r8 r8d r8w r8b		    a secion begin with secion .data or .text
		start place begin with global _start  then  _start:
		equ used to define a symbol as a expression
		db define strings  ,dw if define with 1234H this kind, 
			it will store 34first ,then 12,
		the rax used to store syscall number


