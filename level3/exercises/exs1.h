#ifndef RATIONALS_H
#define RATIONALS_H 1
#include <stdbool.h>
#include "euclid.h"
#include <math.h>

typedef struct rat rat;

struct rat {
    bool sign;
    size_t num;
    size_t denom;
};

/* Functions that return a value of type rat. */
inline rat rat_get(long long num, unsigned long long denom) {
    rat ret = {
        .sign = (num < 0),
        .num = (num < 0) ? -num : num,
        .denom = denom,
    };
    return ret;
}

inline rat rat_get_normal(rat x) {
    size_t c = gcd(x.num, x.denom);
    x.num /= c;
    x.denom /= c;
    return x;
}

inline rat rat_get_extended(rat x, size_t f) {
    x.num *= f;
    x.denom *= f;
    return x;
}

rat rat_get_prod(rat x, rat y) {
    rat ret = {
        .sign = (x.sign != y.sign),
        .num = x.num * y.num,
        .denom = x.denom * y.denom,
    };
    return rat_get_normal(ret);
}

rat rat_get_sum(rat x, rat y) {
    size_t c = gcd(x.denom, y.denom);
    size_t ax = y.denom / c;
    size_t bx = x.denom / c;
    x = rat_get_extended(x,
                         ax);              /*@\label{rat_get_extended_x}*/
    y = rat_get_extended(y, bx);
    assert(x.denom == y.denom);
    if (x.sign == y.sign) {
        x.num += y.num;
    } else if (x.num > y.num) {
        x.num -= y.num;
    } else {
        x.num = y.num - x.num;
        x.sign = !x.sign;
    }
    return rat_get_normal(x);
}


/* Functions that operate on pointers to rat. */
inline void rat_destroy(rat* rp) {
    if (rp) *rp = (rat) { 0 };
}

inline rat* rat_init(rat* rp,
                     long long num,
                     unsigned long long denom) {
    if (rp) *rp = rat_get(num, denom);
    return rp;
}

inline rat* rat_normalize(rat* rp) {
    if (rp) *rp = rat_get_normal(*rp);
    return rp;
}

inline rat* rat_extend(rat* rp, size_t f) {
    if (rp) *rp = rat_get_extended(*rp, f);
    return rp;
}

rat* rat_sumup(rat* rp, rat y);
rat* rat_rma(rat* rp, rat x, rat y);

/* Functions that are implemented as exercises. */
/** @brief Print @a x into @a tmp and return tmp. **/
inline char const* rat_print(size_t len, char tmp[len],
                             rat const* x) {
    if (x) {
        snprintf(tmp, len, "%c%zu/%zu", (x->sign ? '-' : '+'), x->num,
                 x->denom);
    } else {
        tmp[0] = 0;
    }
    return tmp;
}

/** @brief Print @a x normalize and print. **/
char const* rat_normalize_print(size_t len, char tmp[len],
                                rat const* x);
rat* rat_dotproduct(rat rp[static 1], size_t n,
                    rat const A[n], rat const B[n]);

#endif
