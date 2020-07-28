#include <stdio.h>
#include <stdlib.h>

#define CLOCK_TYPE 24

void clock_after_hours(unsigned currentClock, unsigned hoursAfter) {
    printf(
        "Clock is %u. After %u hours clock will be %u\n",
        currentClock,
        hoursAfter,
        (currentClock + hoursAfter) % CLOCK_TYPE
    );
}

int main () {
    unsigned clock = 0;

    clock_after_hours(10, 3);
    clock_after_hours(20, 8);

    return EXIT_SUCCESS;
}