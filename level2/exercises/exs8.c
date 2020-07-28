#include "rationals.h"

rat rat_get_normal(rat x) {
    size_t c = gcd(x.num, x.denom);
    x.num /= c;
    x.denom /= c;
    return x;
}


rat rat_get_prod(rat x, rat y) {
    x = rat_get_normal(x);
    y = rat_get_normal(y);
    rat ret = {
        .sign = (x.sign != y.sign),
        .num = x.num * y.num,
        .denom = x.denom * y.denom,
    };
    return rat_get_normal(ret);
}

