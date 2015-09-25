build : 
	gcc -c print.c -o print.o
	nasm -f elf64 p.asm -o p.o
	ld  -lc print.o p.o -o print
clean:
	rm -rf p.o print.o print
