#include <stdio.h>

# include <inttypes.h>

typedef union doublePtrInspect doublePtrInspect ;
union doublePtrInspect {
    double* val;
    unsigned char bytes [ sizeof(double*)];
};

int main(int argc, char const* argv[]) {
    double num = 65.35;
    doublePtrInspect twofold = { .val = &num, };
    printf(" value  is 0x%p\n", twofold.val);
    for (size_t i = 0; i < sizeof twofold.bytes; ++i)
        printf(" byte [%zu]: 0x%.02hhX\n", i, twofold . bytes [i]);
    return 0;
}