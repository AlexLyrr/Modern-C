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
 * @brief      { Same as derivative() but for complex numbers}
 *
 * @param[in]  complex  The complex
 * @param[in]  F        { parameter_description }
 * @param[in]  x     The complex number
 *
 * @return     { description_of_the_return_value }
 */
complex double derivative_cmplx(double complex x,
                                double complex F(double complex)) {
    double const dx = 1E-4;
    return CMPLX(
               ((F(creal(x) + dx) - F(creal(x))) / dx) ,
               ((F(cimag(x) + dx) - F(cimag(x))) / dx)
           );
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

static inline double first_grade_polynomial(double x) {
    return x + 1;
}

static inline double second_grade_polynomial(double x) {
    return x * x - 5 * x + 2;
}

static inline double complex second_grade_complex_roots(
    double complex x) {
    return x * x + 1;
}

/**
 * @brief      Find the real zeros of function using Newton's method
 *
 * @param[in]  x     Initial guess
 * @param[in]  F     Function used
 *
 * @return     Returns a zero of function F based on initial guess
 */
double newton_roots_dbl(double x, double F(double)) {
    double xPrev = x;
    double der = derivative(xPrev, F);
    if (!der) {
        fprintf(stderr, "%s\n", "Derivative is equal to 0\n");
        return 0;
    }
    x = xPrev - F(xPrev) / der;
    if (is_equal_dbl(x, xPrev)) {
        return x;
    }
    return newton_roots_dbl(x, F);
}

/**
 * @brief      Find the complex zeros of function using Newton's method
 *
 * @param[in]  x  Initial guess
 * @param[in]  F  Function used
 *
 * @return     Returns a complex zero of function F based on initial guess
 */
double complex newton_roots_cmplx_dbl(double complex x,
                                      double complex F(double complex)) {
    double complex xPrev = x;
    double complex der = derivative_cmplx(xPrev, F);
    if (!der) {
        fprintf(stderr, "%s\n", "Derivative is equal to 0\n");
        return 0;
    }
    x = xPrev - F(xPrev) / der;
    if (is_equal_cmplx_dbl(x, xPrev)) {
        return x;
    }
    return newton_roots_cmplx_dbl(x, F);
}

int main() {
    // Root of the first grade polynomial
    printf("%g\n", newton_roots_dbl(0, first_grade_polynomial));
    // Roots of the second grade polynomial
    printf("%g\n", newton_roots_dbl(7, second_grade_polynomial));
    printf("%g\n", newton_roots_dbl(0, second_grade_polynomial));
    double complex result = newton_roots_cmplx_dbl(-1 + 0 * I,
                            second_grade_complex_roots);
    // Root of the second grade plynomial = -I
    printf("%g + i%g\n", creal(result), cimag(result));
}