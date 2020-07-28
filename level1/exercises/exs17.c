/*
	Under the assumption that the maximum value for unsigned int
	is 0xFFFFFFFF, prove that -0x80000000 == 0x80000000.
*/

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main () {

    printf("%x\n", -0x80000000);

    return EXIT_SUCCESS;
}