/*
Print the results of the following expressions: 1.0E-13 + 1.0E-13 and
(1.0E-13 + (1.0E-13 + 1.0)) - 1.0.


Book: Modern C. Page: 63
<<
So basically, they lose all the nice algebraic properties we are used to when doing
pure math. The problems that arise from that are particularly pronounced if we operate
with values that have very different orders of magnitude.[Exs 36] For example, adding a very
small floating-point value x with an exponent that is less than 􀀀p to a value y > 1 just
returns y again. As a consequence, it is really difficult to assert without further investigation
whether two computations have the “same” result. Such investigations are often cuttingedge
research questions, so we cannot expect to be able to assert equality or not. We are
only able to tell that the results are “close.”
>>

 */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main () {


    printf("%g\n", 1.0E-13 + 1.0);
    printf("%g\n", (1.0E-13 + (1.0E-13 + 1.0)) - 1.0);

    return EXIT_SUCCESS;
}