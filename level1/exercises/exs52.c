// Write a preprocessor condition that tests whether int has two’s
// complement sign representation.

#include <assert.h>

static_assert(-1 == ~0, "not 2's complement");

int main() {
    return 0;
}