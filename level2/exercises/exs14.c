#include "rationals.h"

/**
@brief      Print @a x into @a tmp and return tmp.

@param[in]  len   The length
@param      tmp   The temporary char buffer
@param      x     rational number to be printed

@return     { The string to be printed or 0 if the x pointer is NULL }
*/
char const* rat_print(size_t len , char tmp[len], rat const* x) {
    if (x) {
        snprintf(tmp, len, "%c%zu/%zu\n", (x->sign) ? '-' : '+', x->num,
                 x->denom);
    } else {
        tmp[0] = 0;
    }
    return tmp;
}

