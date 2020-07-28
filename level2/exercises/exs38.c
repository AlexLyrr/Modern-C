/*
 * Compile this with gcc -S exs38.c
 * This will run the preprocessor (cpp) over exs38.c, perform the
 * initial compilation and then stop before the assembler is run.
 * This is the way to get assembler output in our platform.
 *
 * By default this will output a file exs38.s. The output file
 * can be still be set by using the -o option.
 *
 * Of course this only works if you have the original source.
 * An alternative if you only have the resultant object file
 * is to use objdump, by setting the --disassemble option (or
 * -d for the abbreviated form).
 *
 * objdump -S --disassemble exs38 > exs38.dump
 *
 * This option works best if debugging option is enabled for the
 * object file (-g at compilation time) and the file hasn't
 * been stripped.
 *
 * Running file exs38 will give you some indication as to the
 * level of detail that you will get by using objdump.
 *
 * Source: https://stackoverflow.com/questions/137038/how-do-you-get-assembler-output-from-c-c-source-in-gcc
 */


#include <stdio.h>

unsigned i = 1;

int main(void) {
    unsigned i = 2; /* A new object */
    if (i) {
        extern unsigned i; /* An existing object */
        printf("%u\n", i);
    } else {
        printf("%u\n", i);
    }
}