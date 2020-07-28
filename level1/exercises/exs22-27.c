// All bit-wise operations can be performed with add/sub operations
// and the use of & operator.

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

    unsigned char A = 15, B = 3;
    unsigned char C = A - (A & B);
    unsigned char V = UCHAR_MAX;
    unsigned char D = A ^ B;
    unsigned char D1 = (A - (A & B)) + (B - (A & B));
    unsigned char D2 = A + B - 2 * (A & B);
    unsigned char E = A | B;
    unsigned char E1 = A + B - (A & B);
    unsigned char F = ~B;
    unsigned char F1 = V - B;
    unsigned char G = -B;
    unsigned char G1 = ~B + 1;
    printf("A in binary = " BYTE_TO_BINARY_PATTERN "\n", BYTE_TO_BINARY(A) );
    printf("B in binary = " BYTE_TO_BINARY_PATTERN "\n", BYTE_TO_BINARY(B) );
    // Set A without elements of set B
    printf("A \\ B = " BYTE_TO_BINARY_PATTERN "\n", BYTE_TO_BINARY(C) );
    printf("V + 1 = " BYTE_TO_BINARY_PATTERN "\n", BYTE_TO_BINARY(V + 1) );
    printf("A ^ B = " BYTE_TO_BINARY_PATTERN "\n"
           "A + B - (A&B) = " BYTE_TO_BINARY_PATTERN "\n"
           "A + B - 2*(A&B) = " BYTE_TO_BINARY_PATTERN "\n",
           BYTE_TO_BINARY(D),
           BYTE_TO_BINARY(D1),
           BYTE_TO_BINARY(D2)
          );
    printf("A | B = " BYTE_TO_BINARY_PATTERN "\n"
           "A + B - (A & B) = " BYTE_TO_BINARY_PATTERN "\n",
           BYTE_TO_BINARY(E),
           BYTE_TO_BINARY(E1)
          );
    printf("A | B = " BYTE_TO_BINARY_PATTERN "\n"
           "A + B - (A & B) = " BYTE_TO_BINARY_PATTERN "\n",
           BYTE_TO_BINARY(E),
           BYTE_TO_BINARY(E1)
          );
    printf("~B = " BYTE_TO_BINARY_PATTERN "\n"
           "V - V = " BYTE_TO_BINARY_PATTERN "\n",
           BYTE_TO_BINARY(F),
           BYTE_TO_BINARY(F1)
          );
    printf("-B = " BYTE_TO_BINARY_PATTERN "\n"
           "~B + 1 = " BYTE_TO_BINARY_PATTERN "\n",
           BYTE_TO_BINARY(G),
           BYTE_TO_BINARY(G1)
          );





    return EXIT_SUCCESS;
}