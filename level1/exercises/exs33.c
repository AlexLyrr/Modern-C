// Show that INT_MIN+INT_MAX is 1.

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main () {

    int A = INT_MIN;
    int B = INT_MAX;
    int result = A + B;
    printf("%d\n", result);

    return EXIT_SUCCESS;
}