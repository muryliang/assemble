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

second:
	we use cld and std to set string copy direction (cld is positive)
		then we use lodsb or movsb  ..... some instructions to 
		do the copy , after copy, the si will incresed by 1 auto.
		si is for source and di is for  destination.
		 we can use $ to represent the current position(offset)
		  and if we wanna get a positon ,we can testfirst ,use
			objdump calculate how many bytes we skipped

third:
	we can use  %define  macro(para)   XXX to define macro in assembly
	   	in one line
	if multiline needed ,  %%macro para_nums
				XXXX
			       %%endmacro
	in the macro, labels must start with %% , 
		if you have one para,  use %1 can use it in any place
		if you have a lot ,use the label(start wit %%)
	pusha  push all general registers
	pushf  push flag register
	use %include you can include other files
	
	use  struc XXX
		para1 : resb X
		para2 : resb X
	     endstruc
	you can define a struct
	then  istruc XXX
	p:	at para1 db xxx
		at para2 db xxx
	      iend 
	to declare one , and  use [p + XXX.para1] to access the content


fourth:
	difference between AT&T and  nasm  assembly styles
	
	mov  source , destination
	mov   $immediate_num , %register
	movb(w) (%rax) , XXx   instead of mov word [] , XXX
		b 1   w 2  l 4   q 8   t 10   o 16	
	lcall  $section , $offset
	
	use comment: #  //  or /*  */

	
fifth:  something about gnu make

	 we use $() to represent variables in makefile or environments
	 if we want to echo something(not the line being excuted),
		we use @echo "XXX"   ,then  only XXX will be printed

	filter   $(filter  %.c %.s , $(XXX)) can search $(XXX) and find
			.c  .s files and return
	ifeq ( , ) can be used to judge if equal , and blank can be
		used
	$(shell XXX) can be used to exe a shell cmd

	use $(XX XXXX) can report errors
	VPATH to set the  default search directory

	$< first prerequisite
	$| all prerequisite
	$? all newer than target
	$@ the target

sixth
	if we want to use assembly file with c file; 
		just nasm -o XXX.o   XXx.asm
			gcc -o XX  YYY.c XXX.o  and it will work!

	we also can use __asm__( :  : ) this kind of inline assembly in C
		"g"(XX) means use this XX as an argument
		and in the inline mode we must put %%before register
			be caution that we use AT&T style

	if we call c func in an assembly file , 
		in ass file ,use extern func_name  , then call func_name
		use gcc and nasm to compile separatly
			then use ld to link them together	
	
seventh:
	floating pointers  single have 1 sign  8 exp 23 main(as after decimal) 
		and exp should minus 127 
			double have 1sing  11 exp  52main ( should minus 2^10 -1 )
