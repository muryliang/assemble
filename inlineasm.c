#include <string.h>

int main(void){

	char *str = "hello world\n";
	int len = strlen(str);
	int ret = 0;

	__asm__( "movq $1 , %%rax\n\t"
		 "movq $1 , %%rdi\n\t"
		 "movq %1 , %%rsi\n\t"
		 "movq %2 , %%rdx\n\t"
		 "syscall"
		 : "=g"(ret)
		 : "g"(str), "g"(len));

	return 0;
}
