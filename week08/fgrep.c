#include <stdio.h>
#include <string.h>
#include <errno.h>
#define MAX_LINE_LEN 4096

void search_stream(FILE *stream, char stream_name[], char search_term[]) {
	char line[MAX_LINE_LEN];		
	int line_no = 1;

	while (fgets(line, MAX_LINE_LEN, stream) != NULL) {
		if (strstr(line, search_term) != NULL) {
			printf("%s: %d: %s", stream_name, line_no, line);
		}
		line_no++;
	}
}

int main(int argc, char *argv[]) {
	if (argc < 2) {
		fprintf(stderr, "Usage: %s search_term <filenames>\n", argv[0]);
		return 1;
	} else if (argc == 2) {
		// search stdin
		search_stream(stdin, "<stdin>", argv[1]);	
	} else {
		// search through files user entered
		for (int arg = 2; arg < argc; arg++) {
			// argv[arg] is the pathname of the file to search
			FILE *input = fopen(argv[arg], "r");
			if (input == NULL ) {
				// fopen failed :(((
				fprintf(stderr, "%s: %s: %s", argv[0], argv[arg], strerror(errno));
				return 1;
			}
			search_stream(input, argv[arg], argv[1]);
			fclose(input);
		}
	}
}
