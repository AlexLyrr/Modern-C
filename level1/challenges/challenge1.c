// Merge sort implementation taken by https://en.wikipedia.org/wiki/Merge_sort
// Quick sort implementation taken by https://www.geeksforgeeks.org/quick-sort/

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

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
        if (array[i] > array[i + 1]) {
            return false;
        }
    }
    return true;
}



int main() {
    int array[] = {5, 8, 2, 4, 6, 1, 9, 0, 3, 7};
    size_t len = sizeof(array) / sizeof(array[0]);
    // merge_sort(array, len);
    quick_sort(array, 0, len - 1);
    assert(test_sort_function(array, len));
}