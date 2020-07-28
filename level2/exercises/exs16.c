#include "rationals.h"

rat* rat_dotproduct(rat rp[ static 1], size_t n,
                    rat const A[n], rat const B[n]) {
    for (size_t i = 0; i < n; i++) {
        *rp = rat_get_sum(A[i], B[i]);
    }
    return rp;
}