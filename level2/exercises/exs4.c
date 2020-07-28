/*
 * Answer: The results of max(i++, 5) is analyzed as follows
 * max(i++, 5) = i++ < b ? (b) : i++
 * if i + 1 < b then the result is b and i has been increased by 1
 * if i + 1 >= b then the result i + 1
 *
 * From Paragraph 5.16/1 of the C++ 11 Standard:
 *
 * Conditional expressions group right-to-left. The first expression is
 * contextually converted to bool (Clause 4). It is evaluated and if it
 * is true, the result of the conditional expression is the value of the
 * second expression, otherwise that of the third expression. Only one
 * of the second and third expressions is evaluated. Every value computation
 * and side effect associated with the first expression is sequenced before
 * every value computation and side effect associated with the second or third
 * expression.
*/

#include <stdio.h>

#define max(a, b) ((a) < (b) ? (b) : (a))

int main(int argc, char const* argv[]) {
    int i = 3;
    printf("%d\n", max(i++, 2));
    return 0;
}

