#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main () {

    // This generates a warning: integer constant is so large
    // that is unsigned
    signed long long num = -9223372036854775808;
    // This does not generate warning because it fits in a signed long
    //  long
    signed long long num2 = -9223372036854775807;

    return EXIT_SUCCESS;
}