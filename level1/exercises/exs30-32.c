/*
Prove that for unsigned arithmetic, A + ~A is the maximum value.
Prove that for unsigned arithmetic, A + ~A is -1.
Prove that for unsigned arithmetic, A + (~A + 1) == 0.
 */
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main () {

    unsigned A = 567;
    printf("%u\n", A + ~A);
    printf("%d\n", A + ~A);
    printf("%u\n", A + (~A + 1));

    return EXIT_SUCCESS;
}