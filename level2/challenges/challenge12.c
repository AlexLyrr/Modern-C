/**
* @version   $Id: challenge12.c 2822 2020-05-29 07:30:34 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CAPACITY 128

typedef struct blob blob;
struct blob {
    char text[CAPACITY];
    struct blob* prev;
    struct blob* next;
};

static blob* create_blob() {
    blob* newBlob = malloc(sizeof(blob));
    if (!newBlob) {
        fprintf(stderr, "%s\n", "Malloc failed");
        return 0;
    }
    newBlob->prev = 0;
    newBlob->next = 0;
    memset(newBlob->text, 0, CAPACITY);
    return newBlob;
}

int insertAtHead(blob* list[static 1]) {
    blob* newBlob = create_blob();
    if (!newBlob) {
        fprintf(stderr, "%s\n", "Malloc failed");
        return 0;
    }
    if (!*list) {
        *list = newBlob;
        return 1;
    }
    (*list)->prev = newBlob;
    newBlob->next = *list;
    *list = newBlob;
    return 1;
}

int insertAtTail(blob* list[static 1]) {
    blob* newBlob = create_blob();
    if (!newBlob) {
        fprintf(stderr, "%s\n", "Malloc failed");
        return 0;
    }
    if (!*list) {
        *list = newBlob;
        return 1;
    }
    blob* lastElement = *list;
    while (lastElement->next) {
        lastElement = lastElement->next; // Find last Blob
    }
    lastElement->next = newBlob;
    newBlob->prev = lastElement;
    return 1;
}

int splitBlob(blob targetBlob[static 1], blob* list[static 1]) {
    // Check if blob is valid
    if (!targetBlob) {
        fprintf(stderr, "%s\n", "Wrong arguments");
        return 1;
    }
    // Create the two blobls and initialize
    blob* firstHalf = create_blob();
    blob* secondHalf = create_blob();
    if (!firstHalf || !secondHalf) {
        fprintf(stderr, "%s\n", "Wrong arguments");
        return 1;
    }
    firstHalf->next = secondHalf;
    firstHalf->prev = targetBlob->prev;
    secondHalf->prev = firstHalf;
    secondHalf->next = targetBlob->next;
    strncpy(firstHalf->text, targetBlob->text, CAPACITY / 2);
    firstHalf->text[CAPACITY / 2] = '\0';
    strncpy(secondHalf->text, targetBlob->text + CAPACITY / 2,
            CAPACITY / 2);
    secondHalf->text[CAPACITY / 2] = '\0';
    // Case 1: targetBlob = head
    if (*list == targetBlob) {
        *list = firstHalf;
        free(targetBlob);
        return 0;
    }
    // Case 2: targetBlob is in the middle or the tail
    blob* prevTarget = *list;
    while (prevTarget->next != targetBlob) {
        prevTarget = prevTarget->next;
    }
    prevTarget->next = firstHalf;
    free(targetBlob);
    return 0;
}

int joinBlobs(blob blob1[static 1], blob blob2[static 1],
              blob* list[static 1]) {
    if (!blob1 || !blob2 || blob1->next != blob2) {
        fprintf(stderr, "%s\n", "Wrong arguments");
        return 1;
    }
    blob* newBlob = create_blob();
    if (!newBlob) {
        fprintf(stderr, "%s\n", "Wrong arguments");
        return 1;
    }
    strncpy(newBlob->text, blob1->text, CAPACITY / 2);
    strncpy(&(newBlob->text[CAPACITY / 2]), blob2->text, CAPACITY / 2);
    newBlob->text[CAPACITY - 1] = '\0';
    blob* prevBlob1 = *list;
    while (prevBlob1->next != blob1) {
        prevBlob1 = prevBlob1->next;
    }
    newBlob->prev = prevBlob1;
    newBlob->next = blob2->next;
    prevBlob1->next = newBlob;
    blob2->prev = newBlob;
    free(blob1);
    blob1 = 0;
    free(blob2);
    blob2 = 0;
    return 0;
}

int printBlobs(blob const list[static 1]) {
    if (!list) {
        fprintf(stderr, "%s\n", "list is empty");
        return 1;
    }
    size_t blobCounter = 0;
    while (list) {
        // if ((list->next)->prev != list) {
        //     fprintf(stderr, "%s\n", "error with the linkage");
        //     exit(1);
        // }
        printf("#number = %zu: %s\n", ++blobCounter, list->text);
        list = list->next;
    }
    return 0;
}

int reversePrintBlobs(blob const list[static 1]) {
    if (!list) {
        fprintf(stderr, "%s\n", "list is empty");
        return 1;
    }
    const blob* tmp = list;
    size_t blobCounter = 1;
    while (tmp->next) {
        blobCounter++;
        tmp = tmp->next;
    }
    while (tmp && tmp != list) {
        if ((tmp->prev)->next != tmp) {
            fprintf(stderr, "%s\n", "error with the linkage");
            exit(1);
        }
        printf("#number = %zu: %s\n", blobCounter--, tmp->text);
        tmp = tmp->prev;
    }
    printf("#number = %zu: %s\n", blobCounter--, tmp->text);
    return 0;
}

int main() {
    FILE* pFile = fopen("example.txt", "r");
    if (!pFile) {
        perror("fopen failed\n");
        return EXIT_FAILURE ;
    }
    fseek(pFile, 0, SEEK_SET);
    blob* list = create_blob();
    blob* tmp = list;
    int blobCounter = 1;
    blob* testSplitBlob = 0;
    while (!feof(pFile)) {
        size_t noBytesRead = fread(tmp->text, sizeof(char), CAPACITY,
                                   pFile);
        if (noBytesRead != CAPACITY && !feof(pFile)) {
            fprintf(stderr, "%s\n", "File read failed");
            exit(EXIT_FAILURE);
        }
        // Append a null terminating character in the end
        tmp->text[noBytesRead - 1] = '\0';
        if (!feof(pFile) && insertAtTail(&list)) {
            blobCounter++;
            tmp = tmp->next;
        }
        if (blobCounter == 5) {
            testSplitBlob = tmp;
        }
    }
    printf("%s\n", "FIRST PRINT");
    printBlobs(list);
    printf("%s\n", "REVERSE PRINT");
    reversePrintBlobs(list);
    splitBlob(testSplitBlob, &list);
    printf("%s\n", "\n\n PRINT AFTER SPLIT");
    printBlobs(list);
    blobCounter = 1;
    tmp = list;
    blob* testJoinBlob = 0;
    while (tmp) {
        tmp = tmp->next;
        blobCounter++;
        if (blobCounter == 5) {
            testJoinBlob = tmp;
            break;
        }
    }
    joinBlobs(testJoinBlob, testJoinBlob->next, &list);
    printf("%s\n", "\n\n PRINT AFTER MERGE");
    printBlobs(list);
    fclose(pFile);
    return 0;
}