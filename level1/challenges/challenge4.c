#include <stdio.h>
#include <limits.h>
#include <stdint.h>

/**
 * @brief      Initializes the parent.
 *
 * @param      parent  The parent
 * @param[in]  len     The parent length
 */
void initialize_parent(size_t parent[static 1], size_t len) {
    for (size_t i = 0; i < len; ++i) {
        parent[i] = SIZE_MAX;
    }
    return;
}

/**
 * @brief      Searches for the root.
 *
 * @param      parent  The parent
 * @param[in]  e       The element
 *
 * @return     { Return the root of element }
 */
size_t find(size_t parent[static 1], size_t e) {
    while (parent[e] != SIZE_MAX) {
        e = parent[e];
    }
    return e;
}

/**
 * @brief      Changes all parent entries on a path to the root (including) to a
 *             specific value
 *
 * @param      parent  The parent
 * @param[in]  len     The length
 * @param[in]  root    The root
 * @param[in]  value   The value
 */
void find_replace(size_t parent[static 1], size_t len,
                  size_t root, size_t value) {
    if (value >= len) {
        fprintf(stderr, "Value cannot be bigger than size of parent\n");
        return;
    }
    for (size_t i = 0; i < len; ++i) {
        if (parent[i] == root || i == root) {
            parent[i] = value;
        }
    }
    return;
}

/**
 * @brief      Changes all parent entries to the root that has been found
 *
 * @param      parent  The parent
 * @param[in]  len     The length
 * @param[in]  e       { element }
 */
void find_compress(size_t parent[static 1], size_t len,
                   size_t e) {
    size_t root = find(parent, e);
    for (size_t i = 0; i < len; ++i) {
        if (parent[i] != SIZE_MAX &&
                find(parent, i) == root) {
            parent[i] = root;
        }
    }
    return;
}

/**
 * @brief      Combines the trees of element @e1 and @e2
 *
 * @param      parent  The parent
 * @param[in]  len     The length
 * @param[in]  e1      The e 1
 * @param[in]  e2      The e 2
 */
void unify(size_t parent[static 1], size_t len, size_t e1,
           size_t e2) {
    find_compress(parent, len, e1);
    find_replace(parent, len, find(parent, e1), e2);
}

/**
 * @brief      Prints the parent array.
 *
 * @param      parent  The parent
 * @param[in]  len     The length
 */
void print_parent(size_t parent[static 1], size_t len) {
    for (size_t i = 0; i < len; ++i) {
        printf("%5lu --> %5lu\n", i, parent[i]);
    }
}

int main() {
    size_t parent[10] = {0};
    size_t len = sizeof(parent) / sizeof(parent[0]);
    initialize_parent(parent, len);
    unify(parent, len, 4, 3);
    unify(parent, len, 5, 3);
    unify(parent, len, 7, 6);
    unify(parent, len, 8, 6);
    unify(parent, len, 5, 8);
    print_parent(parent, len);
}