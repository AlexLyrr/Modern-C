/**
* @version   $Id: challenge2.c 8015 2020-05-08 15:40:28 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <math.h>
#include <float.h>
#include <stdbool.h>

//
// @brief      Calculates the derivative of function F at value x . Higher
//             precision can be achieved by increasing dx
//
// @param[in]  x     { value }
// @param[in]  F     { function }
//
// @return     { Returns the derivative of function F at value x. }
//
double derivative(double x, double F(double)) {
    double const dx = 1E-4;
    return ((F(x + dx) - F(x)) / dx);
}

/**
 * @brief      Checks equality of double numbers. The desired precision is
 *             configurable.
 *
 * @param[in]  a     { number 1 }
 * @param[in]  b     { number 2 }
 *
 * @return     If numbers are equal, returns true. If not, returns false.
 */
bool is_equal_dbl(double a, double b) {
    double const precision = 1E-4;
    if (fabs(a - b) < precision)
        return true;
    return false;
}

void test_derivative() {
    double result = derivative(1, sqrt);
    if (!is_equal_dbl(result, 0.5)) {
        fprintf(stderr, "%s %g != 0.5 \n",
                "Calculation of derivative(sqrt(1)) failed: result = ", result);
        return;
    }
    printf("%s\n", "Derivative works okay");
}

int main() {
    test_derivative();
}