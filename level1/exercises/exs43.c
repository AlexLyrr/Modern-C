/**
* @version   $Id: exs41.c 5779 2020-05-03 09:07:47 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

/*
    Write a function timespec_diff that computes the difference between two timespec values.

    Note: The difference is computed up to nanoseconds precision.
*/

#include <time.h>

double timespec_diff(struct timespec t1, struct timespec t2) {
    return difftime(t1.tv_sec, t2.tv_sec) + (double) (t1.tv_nsec - t2.tv_nsec) / 1.0E9;
}