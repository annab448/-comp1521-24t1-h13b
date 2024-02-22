#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

if (x <= 100) goto x_small_big;
if (x >= 1000) goto x_small_big;

x_medium:
	printf("medium\n");
	goto end;

x_small_big:
	printf("small/big\n");

end:
	return 0;
}
