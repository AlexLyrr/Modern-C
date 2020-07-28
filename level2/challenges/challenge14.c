/**
* @version   $Id: challenge14.c 3540 2020-06-02 11:15:55 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#if __STDC_VERSION__ >= 199901L
#define _XOPEN_SOURCE 600
#else
#define _XOPEN_SOURCE 500
#endif /* __STDC_VERSION__ */


bool test_sort_function(int array[], size_t len) {
    for (size_t i = 0; i < len - 1; ++i) {
        if (array[i] > array[i + 1]) {
            printf("%s\n", "Sorting is wrong");
            return false;
        }
    }
    printf("%s\n", "Sorting is correct");
    return true;
}

// A utility function to swap two elements
void swap_generic(void* a, void* b, size_t size) {
    void* tmp = malloc(size * sizeof(char));
    memcpy(tmp, a, size);
    memcpy(a, b, size);
    memcpy(b, tmp, size);
    free(tmp);
}

int compare_int(void const* a, void const* b) {
    int const* A = a;
    int const* B = b;
    if (*A < *B) return -1;
    else if (*A > *B) return +1;
    else return 0;
}

typedef int compare_function(void const*, void const*);

int partition_generic(void* base , size_t size,
                      compare_function* compar, int low, int high) {
    char* pivot = (char*) base + high * size;
    int i = (low - 1);
    for (int j = low; j <= high - 1; j++) {
        if (compar((char*) base + j * size, pivot) == -1) {
            i++;
            swap_generic((char*) base + i * size, (char*) base + j * size,
                         size);
        }
    }
    swap_generic((char*) base + (i + 1) * size,
                 (char*) base + high * size,
                 size);
    return (i + 1);
}

void quick_sort_generic(void* base , size_t size,
                        compare_function* compar, int low, int high) {
    if (low < high) {
        int pi = partition_generic(base, size, compar, low, high);
        quick_sort_generic(base, size, compar, low, pi - 1);
        quick_sort_generic(base, size, compar, pi + 1, high);
    }
}

void random_initialization(int array[], size_t len) {
    for (size_t i = 0; i < len; ++i) {
        array[i] = rand();
    }
}

int main() {
    int array[] = {5, 8, 2, 4, 6, 1, 9, 0, 3, 7};
    size_t len = sizeof(array) / sizeof(array[0]);
    quick_sort_generic(array, sizeof(int), compare_int, 0,
                       len - 1);
    assert(test_sort_function(array, len));
    size_t const big_len = 100000;
    int big_array[big_len];
    random_initialization(big_array, big_len);
    struct timespec tStart;
    struct timespec tEnd;
    timespec_get(&tStart, TIME_UTC);
    quick_sort_generic(big_array, sizeof(int), compare_int, 0,
                       big_len - 1);
    timespec_get(&tEnd, TIME_UTC);
    printf("Time needed for quick sort: sec = %lu nsec = %lu\n",
           tEnd.tv_sec - tStart.tv_sec, tEnd.tv_nsec - tStart.tv_nsec);
}