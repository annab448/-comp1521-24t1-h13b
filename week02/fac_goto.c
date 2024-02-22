// Simple factorial calculator - without error checking

#include <stdio.h>

int main(void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);
	
	// init
	int fac = 1;
	int i = 1;

	// condition
fac_loop_cond:
	if (i > n) goto fac_loop_end;
	
	// body
	fac *= i;

	// step
	i++;
	goto fac_loop_cond;

fac_loop_end:
    printf("n! = %d\n", fac);
    return 0;
}
