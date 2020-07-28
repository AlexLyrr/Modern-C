/*
Use an iteration statement to transform fib2rec into a nonrecursive
function fib2iter.

Measure times for fib2(n) calls with the same values as fib .
 */

#include <stdlib.h>
#include <stdio.h>

void fib2rec(size_t n, size_t buf [2]) {
    if (n > 2) {
        size_t res = buf[0] + buf[1];
        buf[1] = buf[0];
        buf[0] = res;
        fib2rec(n - 1, buf);
    }
}

void fib2iter(size_t n, size_t buf [2]) {
    for (size_t i = n; i > 2; --i) {
        size_t res = buf [0] + buf [1];
        buf[1] = buf[0];
        buf[0] = res;
    }
}

size_t fib2(size_t n) {
    size_t res[2] = { 1, 1, };
    fib2iter(n, res);
    return res[0];
}

int main(int argc, char* argv[]) {
    char* ptr = NULL;
    size_t result = fib2(strtoul(argv[1], &ptr, 10));
    printf("Result = %lu\n", result);
}