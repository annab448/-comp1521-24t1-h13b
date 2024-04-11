#include <stdio.h>

int main(int argc, char *argv[]) {
	FILE *stream = fopen(argv[1], "r");
	// erorr check here!! please

	int num;
	while (fscanf(stream, "%x\n", &num) != EOF) {
		int low_byte = num & 0xFF;

		if (low_byte & (1 << 7)) {
			// negative!!
			low_byte = low_byte | 0xFFFFFF00;
		}
		printf("%d\n", low_byte);
	}
}
