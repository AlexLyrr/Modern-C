/*
Show that a call fib(n) induces Fn leaf calls. (@leafCounter)
Measure the times for calls to fib(n) with n set to different values.
Use time exec to measure time.
time COMMAND [ ARGS ] -> Time to run the program COMMAND
 */

#include <stdlib.h>
#include <stdio.h>

size_t fib ( size_t n, int* leafCounter) {
    if (n < 3) {
        (*leafCounter)++;
        return 1;
    } else
        return fib(n - 1, leafCounter) + fib(n - 2, leafCounter);
}

int main(int argc, char* argv[]) {
    int leafCounter = 0;
    char* ptr = NULL;
    size_t result = fib(strtoul(argv[1], &ptr, 10), &leafCounter);
    printf("Fn = %d\n", leafCounter);
    printf("Result = %lu\n", result);
}