#include <stdio.h>
#include <unistd.h>
 #include <sys/stat.h>
#include <sys/types.h>
#include <stdlib.h>

void chmod_if_needed(char *path) {
	// check if public write

	struct stat s;
	if (stat(path, &s) != 0) {
		perror(path);
		exit(1);
	}
	mode_t mode = s.st_mode;
	if (mode & S_IWOTH) {
	// publically writeable file
		printf("fixing %s... ", path);
		mode = mode & (~S_IWOTH);
		if (chmod(path, mode) != 0) {
			perror(path);
			exit(1);
		}
		printf("done!\n");
	} else {
		printf("%s not publically writeable\n", path);
	}
}

int main(int argc, char *argv[]) {
	
	for (int i = 1; i < argc; i++) {
		chmod_if_needed(argv[i]);
	}

}
