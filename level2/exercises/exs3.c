/*
 * Answer: The results of sum(5,2) * 7 is 19 since:
 * sum(5,2) * 7 = 5 + 2 * 7 = 5 + 14 = 19
*/

#include <stdio.h>

#define sum(a, b) a+b

int main(int argc, char const* argv[]) {
    printf("%d\n", sum(5, 2) * 7);
    return 0;
}

