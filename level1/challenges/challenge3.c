/**
* @version   $Id: challenge2.c 8015 2020-05-08 15:40:28 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define PI 3.14159265358979323846

void compute_N_decimal_places_of_Pi(int N) {
    char result[2 + N + 1]; // Account for the 3. and the \0
    snprintf(result, 2 + N + 1, "%.*f", N, PI);
    printf("%s\n", result);
}

int main(int argc, char* argv[]) {
    char* ptr;
    compute_N_decimal_places_of_Pi(strtod(argv[1], &ptr));
}