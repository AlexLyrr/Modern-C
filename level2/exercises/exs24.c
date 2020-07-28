#include <stdio.h>

# include <inttypes.h>

typedef union doublePtrInspect doublePtrInspect ;
union doublePtrInspect {
    double* val;
    unsigned char bytes [ sizeof(double*)];
};

int main(int argc, char const* argv[]) {
    double num[] = {65.35, 12.345};
    doublePtrInspect doublePtr1 = { .val = &num[0], };
    doublePtrInspect doublePtr2 = { .val = &num[1], };
    printf(" value  is 0x%p\n", doublePtr1.val);
    for (size_t i = 0; i < sizeof doublePtr1.bytes; ++i)
        printf(" byte [%zu]: 0x%.02hhX\n", i, doublePtr1.bytes [i]);
    printf(" value  is 0x%p\n", doublePtr2.val);
    for (size_t i = 0; i < sizeof doublePtr2.bytes; ++i)
        printf(" byte [%zu]: 0x%.02hhX\n", i, doublePtr2.bytes [i]);
    return 0;
}