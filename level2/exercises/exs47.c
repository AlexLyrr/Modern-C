/**
* @version   $Id: exs47.c 2277 2020-05-28 13:01:00 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <limits.h>
#include <stdint.h>

int fseekmax(FILE* pFile, intmax_t offset, int origin) {
    while (offset > 0) {
        fseek(pFile , LONG_MAX, SEEK_CUR);
        offset -= LONG_MAX;
    }
    return 0;
}