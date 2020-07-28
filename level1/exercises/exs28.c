// Show that the bits that are “lost” in an operation x>>n
// correspond to the remainder x % (1ULL << n).

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  (byte & 0x80 ? '1' : '0'), \
  (byte & 0x40 ? '1' : '0'), \
  (byte & 0x20 ? '1' : '0'), \
  (byte & 0x10 ? '1' : '0'), \
  (byte & 0x08 ? '1' : '0'), \
  (byte & 0x04 ? '1' : '0'), \
  (byte & 0x02 ? '1' : '0'), \
  (byte & 0x01 ? '1' : '0')

int main () {

    unsigned char x = 233, n = 5;
    unsigned char result = x >> n;
    unsigned char lostBits = x % (1ULL << n);
    printf("x in binary = " BYTE_TO_BINARY_PATTERN "\n", BYTE_TO_BINARY(x) );
    printf("result of shift operation x >> n in binary = " BYTE_TO_BINARY_PATTERN "\n", BYTE_TO_BINARY(result) );
    printf("Lost bits in binary = " BYTE_TO_BINARY_PATTERN "\n", BYTE_TO_BINARY(lostBits) );

    return EXIT_SUCCESS;
}