/**
* @version   $Id: exs42.c 3311 2020-05-28 12:30:37 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>

int main(int argc, char const* argv[]) {
    double a[3];
    char line[256];
    /* Read and process an entire line with three double values . */
    if (scanf("%lg%[' ']%lg%[' ']%lg", &a[0], line, &a[1], line,
              &a[2]) < 5) {
        printf("Wrong input values!\n");
    }
    return 0;
}