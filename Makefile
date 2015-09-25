all: gistfile2

gistfile2: gistfile2.o
	ld -o gistfile2 gistfile2.o

gistfile2.o: gistfile2.asm
	nasm -g -f elf64 gistfile2.asm -o gistfile2.o

clean:
	rm -rf  gistfile2.o gistfile2
