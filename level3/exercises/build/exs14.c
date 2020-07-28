#include <complex.h>

#define fabs (X) \
_Generic ((X), \
	float : fabsf, \
	long double : fabsl, \
	complex double: cabs, \
	default : fabs )(X)