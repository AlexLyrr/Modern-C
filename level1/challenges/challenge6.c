/**
* @version   $Id: challenge2.c 8015 2020-05-08 15:40:28 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <math.h> // Includes complex numbers
#include <float.h>
#include <stdbool.h>
#include <complex.h>

double vec_to_vec_mul(double const vec1[static 1], size_t len1,
                      double const vec2[static 1], size_t len2) {
    if (len1 != len2) {
        fprintf(stderr,
                "Error: Size of vector 1 must be equal to size of vector 2\n");
        return 0;
    }
    double vecRes[len1];
    for (size_t i = 0; i < len1; ++i) {
        vecRes[i] = vec1[i] * vec2[i];
    }
}

int main() {
    double const vec1[] = {5.6, 3, 5, 15.4, 12, 16};
    double const vec2[] = {8, 3, 1, 66, 34, 1};
    size_t len1 = sizeof(vec1) / sizeof(vec1[0]);
    size_t len2 = sizeof(vec2) / sizeof(vec2[0]);
    vec_to_vec_mul(vec1, len1, vec2, len2);
}