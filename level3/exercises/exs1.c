#include "exs1.h"

rat rat_get(long long, unsigned long long);
rat rat_get_normal(rat);
rat rat_get_extended(rat, size_t);
rat rat_get_prod(rat, rat);
rat rat_get_sum(rat x, rat y);

rat rat_get_sum2(rat x, rat y) {
    size_t c = gcd(x.denom, y.denom);
    size_t denom = (x.denom / c) * y.denom;
    size_t num;
    bool sign;
    size_t ab = x.num * (y.denom / c);
    size_t ba = y.num * (x.denom / c);
    if (x.sign == y.sign) {
        num = ab + ba;
        sign = x.sign;
    } else {
        if (ab < ba) {
            num = ba - ab;
            sign = y.sign;
        } else {
            num = ab - ba;
            sign = x.sign;
        }
    }
    rat ret = {
        .sign = sign,
        .num = num,
        .denom = denom,
    };
    return rat_get_normal(ret);
}

rat rat_get_prod2(rat x, rat y) {
    size_t tmp = y.denom;
    y.denom = x.denom;
    x.denom = tmp;
    x = rat_get_normal(x);
    y = rat_get_normal(y);
    rat ret = {
        .sign = (x.sign != y.sign),
        .num = x.num * y.num,
        .denom = x.denom * y.denom,
    };
    return ret;
}

void rat_destroy(rat*);

rat* rat_init(rat* rp,
              long long num,
              unsigned long long denom);

rat* rat_normalize(rat* rp);

rat* rat_extend(rat* rp, size_t f);

rat* rat_sumup(rat* rp, rat y) {
    size_t c = gcd(rp->denom, y.denom);
    size_t ax = y.denom / c;
    size_t bx = rp->denom / c;
    rat_extend(rp, ax);              /*@\label{rat_extend_x}*/
    y = rat_get_extended(y, bx);
    assert(rp->denom == y.denom);
    if (rp->sign == y.sign) {
        rp->num += y.num;
    } else if (rp->num > y.num) {
        rp->num -= y.num;
    } else {
        rp->num = y.num - rp->num;
        rp->sign = !rp->sign;
    }
    return rat_normalize(rp);       /*@\label{rat_normalize_x}*/
}

rat* rat_rma(rat* rp, rat x, rat y) {
    return rat_sumup(rp, rat_get_prod(x, y));
}

char const* rat_print(size_t len, char tmp[len], rat const* x);

#define RAT_PRINT_MAX 256

#define RAT_PRINT(X) rat_print(RAT_PRINT_MAX, (char[RAT_PRINT_MAX]){ 0 }, (rat[1]){ (X) })

int main(void) {
    rat third = rat_get(1, 3);
    rat forth = rat_get(-1, 4);
    printf("%s, prod is %s, 3x %s\n",
           RAT_PRINT(third),
           RAT_PRINT(rat_get_prod(third, third)),
           RAT_PRINT(rat_get_prod(third, rat_get_prod(third, third)))
          );
    printf("%s, prod is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_prod(forth, forth)),
           RAT_PRINT(rat_get_prod(forth, rat_get_prod(forth, forth)))
          );
    printf("%s, prod is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_prod(third, forth)),
           RAT_PRINT(rat_get_prod(forth, rat_get_prod(third, forth)))
          );
    printf("%s, prod is %s, 3x %s\n",
           RAT_PRINT(third),
           RAT_PRINT(rat_get_prod2(third, third)),
           RAT_PRINT(rat_get_prod2(third, rat_get_prod2(third, third)))
          );
    printf("%s, prod is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_prod2(forth, forth)),
           RAT_PRINT(rat_get_prod2(forth, rat_get_prod2(forth, forth)))
          );
    printf("%s, prod is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_prod2(third, forth)),
           RAT_PRINT(rat_get_prod2(forth, rat_get_prod2(third, forth)))
          );
    printf("%s, sum is %s, 3x %s\n",
           RAT_PRINT(third),
           RAT_PRINT(rat_get_sum(third, third)),
           RAT_PRINT(rat_get_sum(third, rat_get_sum(third, third)))
          );
    printf("%s, sum is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_sum(forth, forth)),
           RAT_PRINT(rat_get_sum(forth, rat_get_sum(forth, forth)))
          );
    printf("%s, sum is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_sum(third, forth)),
           RAT_PRINT(rat_get_sum(forth, rat_get_sum(third, forth)))
          );
    printf("%s, sum is %s, 3x %s\n",
           RAT_PRINT(third),
           RAT_PRINT(rat_get_sum2(third, third)),
           RAT_PRINT(rat_get_sum2(third, rat_get_sum2(third, third)))
          );
    printf("%s, sum is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_sum2(forth, forth)),
           RAT_PRINT(rat_get_sum2(forth, rat_get_sum2(forth, forth)))
          );
    printf("%s, sum is %s, 3x %s\n",
           RAT_PRINT(forth),
           RAT_PRINT(rat_get_sum2(third, forth)),
           RAT_PRINT(rat_get_sum2(forth, rat_get_sum2(third, forth)))
          );
}
