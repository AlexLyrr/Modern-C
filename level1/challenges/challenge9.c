#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    size_t i = 1;
    int widthF1 = 10, widthF2 = 30;
    printf("%-*s | %-*s\n", widthF1, "Number", widthF2,
           "Prime Factors");
    while (i != argc) {
        size_t n = strtoul(argv[i], NULL, 10);
        printf("%-*lu | ", widthF1, n);
        // If number < 2, then it has no prime factors
        if (n < 2) {
            i++;
            continue;
        }
        // Treat 2 as a special case
        if (n % 2 == 0) {
            printf("%-lu ", 2lu);
            while (n % 2 == 0) {
                n /= 2;
            }
        }
        // Continue normally for the rest. Note: factor is increased by 2, speeding up our algorithm.
        size_t factor = 3;
        while (n != 1) {
            if (n % factor == 0) {
                printf("%-lu ", factor);
                while (n % factor == 0) {
                    n /= factor;
                }
            }
            factor += 2;
        }
        printf("\n");
        i++;
    }
}