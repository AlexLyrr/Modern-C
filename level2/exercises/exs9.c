#include <stdio.h>

void triple_swap(double* p0, double* p1, double* p2) {
    double tmp = *p0;
    *p0 = *p1;
    *p1 = *p2;
    *p2 = tmp;
}