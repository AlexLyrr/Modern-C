#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>

enum { buf_max = 32, };

int main(int argc, char* argv[argc + 1]) {
    int ret = EXIT_FAILURE;
    char buffer[buf_max] = { 0 };
    bool showLineNumber = false;
    if (argc > 2 && !strcmp(argv[1], "-n")) {
        showLineNumber = true;
    }
    for (int i = 1 + showLineNumber; i < argc;
            ++i) {        // Processes args
        FILE* instream = fopen(argv[i], "r"); // as filenames
        if (instream) {
            if (showLineNumber) {
                fputs("1: ", stdout);
            }
            int lineCounter = 1;
            while (fgets(buffer, buf_max, instream)) {
                fputs(buffer, stdout);
                if (showLineNumber && strchr(buffer, '\n')) {
                    lineCounter++;
                    fprintf(stdout, "%d: ", lineCounter);
                }
            }
            fclose(instream);
            ret = EXIT_SUCCESS;
        } else {
            /* Provides some error diagnostic. */
            fprintf(stderr, "Could not open %s: ", argv[i]);
            perror(0);
            errno = 0;                       // Resets the error code
        }
        fputs("\n", stdout);
    }
    return ret;
}
