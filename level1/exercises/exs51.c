/*
Write a function my_strtod that implements the functionality of
 strtod for decimal floating-point constants.

 Note: Compile this one with: gcc exs51.c -lm
        This is required to link the math library.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <fenv.h>
#include <float.h>
#pragma STDC FENV_ACCESS ON

/**
 * @brief      { Converts char to digit }
 *
 * @param[in]  c     { Input character }
 *
 * @return     { Returns the char converted to digit. In case of failute returns
 *             -1 }
 */
char ctod(char c) {
    if (isdigit(c)) {
        return c - '0';
    }
    return -1;
}

/**
 * @brief      Implementation of strtod() function for floating points Supports
 *             only XX.PP format
 *
 * @param      string  The string to be converted into floating point
 * @param      endptr  The endptr
 *
 * @return     { On success, the function returns the converted floating point
 *             number as a value of type double. If no valid conversion could be
 *             performed, the function returns zero (0.0). If the correct value
 *             is out of the range of representable values for the type, a
 *             positive or negative HUGE_VAL is returned, and errno is set to
 *             ERANGE. }
 */
double my_strtod(char const* string, char** endptr) {
    // Check if we have a correct string
    if (!string) {
        return 0;
    }
    feclearexcept(FE_ALL_EXCEPT);
    int fpeRaised = 0;
    double result = 0;
    // Skip white spaces
    while (isspace(*string)) {
        string++;
    }
    // Calculate decimal part
    while (isdigit(*string)) {
        result = result * 10 + ctod(*string);
        fpeRaised = fetestexcept(FE_OVERFLOW);
        if (fpeRaised & FE_OVERFLOW) {
            return DBL_MAX;
        }
        string++;
    }
    // Skip .
    if (*string == '.') {
        string++;
    }
    // Calculate floating part
    double precision = 0.1;
    while (isdigit(*string)) {
        result += ctod(*string) * precision;
        fpeRaised = fetestexcept(FE_UNDERFLOW);
        if (fpeRaised & FE_UNDERFLOW) {
            return DBL_MAX;
        }
        precision *= 0.1;
        string++;
    }
    return result;
}

int main(int argc, char* argv[]) {
    char const* testString = "56.455";
    char* endptr = NULL;
    double result = my_strtod(testString, &endptr);
    printf("%g\n", result);
}