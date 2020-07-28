#include "stdio.h"

unsigned count(void) {
    static unsigned counter = 0;
    ++counter;
    return counter;
}

inline unsigned square_unsigned(unsigned x) {   // Good
    return x * x;
}

# define square_macro(X) (X*X) // Bad : do not use this .

int main(int argc, char const* argv[]) {
    unsigned a = count(); // counter = 1
    unsigned b = square_macro(
                     count()); // b = count() * count() = 2 * 3 = 6, counter = 3
    unsigned c = count(); // counter = 4
    unsigned d = square_unsigned(
                     count()); // counter = 5, d = 5 * 5 = 25
    printf("a= %u\nb= %u\nc= %u\nd= %u\n", a, b, c, d);
    return 0;
}