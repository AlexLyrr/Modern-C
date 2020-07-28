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
 * @brief      { Same as derivative() but fo complex }
 *
 * @param[in]  F        { parameter_description }
 * @param[in]  x     The complex number
 *
 * @return     { description_of_the_return_value }
 */
complex double cmplx_derivative(double complex x,
                                double F(double)) {
    return (CMPLX(derivative(creal(x), F), derivative(cimag(x), F)));
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

bool is_equal_cmplx_dbl(double complex a, double complex b) {
    if (is_equal_dbl(creal(a), creal(b)) &&
            is_equal_dbl(cimag(a), cimag(b)))
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

void test_derivative_cmplx() {
    double complex result = cmplx_derivative(CMPLX(1, 1), sqrt);
    if (!is_equal_cmplx_dbl(result, CMPLX(0.5, 0.5))) {
        fprintf(stderr, "%s\n",
                "Calculation of derivative(sqrt(1 + I)) failed");
        return;
    }
    printf("%s\n", "Derivative works okay");
}




int main() {
    test_derivative_cmplx();
}