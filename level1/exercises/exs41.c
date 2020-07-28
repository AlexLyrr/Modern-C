/**
* @version   $Id: exs41.c 5779 2020-05-03 09:07:47 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

/*
	Use memchr and memcmp to implement a bounds-checking version of strcmp.
*/

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <string.h>

#define MIN(x, y) (((x) < (y)) ? (x) : (y))

int main () {

    char const string1[] = "blablabla";
    char const string2[] = "heyheyheyho";
    // If both strings are 0-terminated use strcmp()
    if (memchr(string1, 0, sizeof(string1)) &&
            memchr(string2, 0, sizeof(string2))) {
        int cmpResult = strcmp(string1, string2);
        if (cmpResult < 0) {
            printf("%s\n", "String 1 is less than string 2");
        } else if (cmpResult == 0) {
            printf("%s\n", "Strings are equal");
        } else {
            printf("%s\n", "String 2 is less than string 1");
        }
    } else { // Use memcmp() otherwise
        size_t string1Size = sizeof(string1);
        size_t string2Size = sizeof(string2);
        size_t minSize = MIN(string1Size, string2Size);
        int cmpResult = memcmp(string1, string2, minSize);
        if (cmpResult < 0) {
            printf("%s\n", "String 1 is less than string 2");
        } else if (cmpResult == 0) {
            printf("%s\n", "Strings are equal");
        } else {
            printf("%s\n", "String 2 is less than string 1");
        }
    }
}