#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

#define sumIt_v2(n, ...) sumIt_fun(n, (double[]) {__VA_ARGS__})

inline static double sumIt_fun(size_t n, double numbers[static 1]) {
    double ret = 0.0;
    for (size_t i = 0; i < n; ++i)
        ret += numbers[i];
    return ret;
}


/**
 ** @brief A small, useless function to show how variadic
 ** functions work
 **/
double sumIt(size_t n, ...) {
    double ret = 0.0;
    va_list va;
    va_start(va, n);
    for (size_t i = 0; i < n; ++i)
        ret += va_arg(va, double);
    va_end(va);
    return ret;
}

int main(int argc, char* argv[argc + 1]) {
    printf("%g\n", sumIt_v2(3, 1.5, 1.5, 2.2));
}
