// Merge sort implementation taken by https://en.wikipedia.org/wiki/Merge_sort
// Quick sort implementation taken by https://www.geeksforgeeks.org/quick-sort/

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#ifndef __STDC_NO_THREADS__
#include <threads.h>
#else
#error This needs C11 threads, aborting.
#endif

#include <stdlib.h>
#include <string.h>


#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

typedef struct sort_info sort_info;
struct sort_info {
    int* array;
    size_t const len;
};

//  Left run is A[iLeft :iRight-1].
// Right run is A[iRight:iEnd-1  ].
void bottom_merge_up(int A[], size_t iLeft, size_t iRight,
                     size_t iEnd, int B[]) {
    size_t i = iLeft, j = iRight;
    // While there are elements in the left or right runs...
    for (size_t k = iLeft; k < iEnd; k++) {
        // If left run head exists and is <= existing right run head.
        if (i < iRight && (j >= iEnd || A[i] <= A[j])) {
            B[k] = A[i];
            i = i + 1;
        } else {
            B[k] = A[j];
            j = j + 1;
        }
    }
}

void copy_array(int B[], int A[], size_t len) {
    for (size_t i = 0; i < len; i++)
        A[i] = B[i];
}

void merge_sort(int array [static 1], size_t len) {
    int workArray[len];
    // Each 1-element run in A is already "sorted".
    // Make successively longer sorted runs of length 2, 4, 8, 16... until whole array is sorted.
    for (size_t width = 1; width < len; width = 2 * width) {
        // Array A is full of runs of length width.
        for (size_t i = 0; i < len; i = i + 2 * width) {
            // Merge two runs: A[i:i+width-1] and A[i+width:i+2*width-1] to B[]
            // or copy A[i:n-1] to B[] ( if(i+width >= n) )
            bottom_merge_up(array, i, MIN(i + width, len), MIN(i + 2 * width,
                            len),
                            workArray);
        }
        // Now work array B is full of runs of length 2*width.
        // Copy array B to array A for next iteration.
        // A more efficient implementation would swap the roles of A and B.
        copy_array(workArray, array, len);
        // Now array A is full of runs of length 2*width.
    }
}

_Atomic(size_t) thrd_start_works = 0;

static
int merge_thread(void* SIv) {
    sort_info* SI = SIv;
    if (thrd_start_works++ == 0) {
        merge_sort(SI->array, SI->len / 2);
    } else {
        merge_sort(SI->array + SI->len / 2, SI->len - SI->len / 2);
    }
    return 5;
}

void merge_parallel_sort(int array [static 1], size_t len,
                         sort_info* SI) {
    thrd_t thrd[2];
    thrd_create(&thrd[0], merge_thread, SI);
    thrd_create(&thrd[1], merge_thread, SI);
    /* Waits for the other threads */
    thrd_join(thrd[0], 0);
    thrd_join(thrd[1], 0);
    merge_sort(array, len / 2);
    merge_sort(array + len / 2, len - len / 2);
    int workArray[len];
    // Each 1-element run in A is already "sorted".
    // Make successively longer sorted runs of length 2, 4, 8, 16... until whole array is sorted.
    size_t width = len / 2;
    // Array A is full of runs of length width.
    for (size_t i = 0; i < len; i = i + 2 * width) {
        // Merge two runs: A[i:i+width-1] and A[i+width:i+2*width-1] to B[]
        // or copy A[i:n-1] to B[] ( if(i+width >= n) )
        bottom_merge_up(array, i, MIN(i + width, len), MIN(i + 2 * width,
                        len),
                        workArray);
    }
    // Now work array B is full of runs of length 2*width.
    // Copy array B to array A for next iteration.
    // A more efficient implementation would swap the roles of A and B.
    copy_array(workArray, array, len);
    // Now array A is full of runs of length 2*width.
}

// A utility function to swap two elements
void swap(int* a, int* b) {
    int t = *a;
    *a = *b;
    *b = t;
}

/* This function takes last element as pivot, places
   the pivot element at its correct position in sorted
    array, and places all smaller (smaller than pivot)
   to left of pivot and all greater elements to right
   of pivot */
int partition(int arr[], int low, int high) {
    int pivot = arr[high];    // pivot
    int i = (low - 1);  // Index of smaller element
    for (int j = low; j <= high - 1; j++) {
        // If current element is smaller than the pivot
        if (arr[j] < pivot) {
            i++;    // increment index of smaller element
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

/* The main function that implements QuickSort
 arr[] --> Array to be sorted,
  low  --> Starting index,
  high  --> Ending index */
void quick_sort(int arr[], int low, int high) {
    if (low < high) {
        /* pi is partitioning index, arr[p] is now
           at right place */
        int pi = partition(arr, low, high);
        // Separately sort elements before
        // partition and after partition
        quick_sort(arr, low, pi - 1);
        quick_sort(arr, pi + 1, high);
    }
}

bool test_sort_function(int array[], size_t len) {
    for (size_t i = 0; i < len - 1; ++i) {
        // fprintf(stderr, "%d\n", array[i]);
        if (array[i] > array[i + 1]) {
            fprintf(stderr, "%s\n", "Sorting failed\n");
            return false;
        }
    }
    fprintf(stderr, "%s\n", "Sorting succeeded\n");
    return true;
}

void random_initialization(int array[], size_t len) {
    for (size_t i = 0; i < len; ++i) {
        array[i] = rand();
    }
}




int main() {
    // int array[] = {5, 8, 2, 4, 6, 1, 9, 0, 3, 7};
    // size_t len = sizeof(array) / sizeof(array[0]);
    size_t const big_len = 10000;
    int big_array[big_len];
    random_initialization(big_array, big_len);
    struct timespec tStart;
    struct timespec tEnd;
    timespec_get(&tStart, TIME_UTC);
    merge_sort(big_array, big_len);
    timespec_get(&tEnd, TIME_UTC);
    printf("Time needed for simple merge sort: sec = %lu nsec = %lu\n",
           tEnd.tv_sec - tStart.tv_sec, tEnd.tv_nsec - tStart.tv_nsec);
    random_initialization(big_array, big_len);
    sort_info SIv = {.array = big_array, .len = big_len};
    timespec_get(&tStart, TIME_UTC);
    merge_parallel_sort(big_array, big_len, &SIv);
    timespec_get(&tEnd, TIME_UTC);
    printf("Time needed for parallel merge sort: sec = %lu nsec = %lu\n",
           tEnd.tv_sec - tStart.tv_sec, tEnd.tv_nsec - tStart.tv_nsec);
    // merge_sort(array, len);
    // quick_sort(array, 0, len - 1);
    // merge_parallel_sort(big_array, big_len, &SIv);
    assert(test_sort_function(big_array, big_len));
}