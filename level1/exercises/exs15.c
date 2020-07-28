/*
Show that the expressions -1U, -1UL, and -1ULL have the
maximum values and type as the three nonpromoted unsigned
types, respectively. This happens because the unsigned
number wrap around.
*/

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main () {

    printf("%u, %lu, %llu \n", -1U, -1UL, -1ULL);
    return EXIT_SUCCESS;
}