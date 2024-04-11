#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
	char *diary_path = ".diary";
	char *home_path = getenv("HOME");	
	if (home_path == NULL) {
		perror("home not found");
		return 1;
	}

	int path_len = strlen(diary_path) + strlen(home_path) + 2;
	char path[path_len];
	snprintf(path, path_len, "%s/%s", home_path, diary_path);

	FILE *stream = fopen(path, "r");
	if (stream == NULL) {
		perror(path);
		return 1;
	}
	
	int c;
	while ((c = fgetc(stream)) != EOF) {
		fputc(c, stdout);
	}

	fclose(stream);
}
