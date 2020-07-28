// The value printed is 1. The extern keyword (ln 12) signifies that
// the value of i has been set by either the same file or another
// file that linked with this one.
// In other words: The extern always designate an object of static
// storage duration that is expected to be defined at file scope

#include <stdio.h>

unsigned i = 1;

int main(void) {
    unsigned i = 2; /* A new object */
    if (i) {
        extern unsigned i; /* An existing object */
        printf("%u\n", i);
    } else {
        printf("%u\n", i);
    }
}