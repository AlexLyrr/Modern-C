/**
* @version   $Id: challenge2.c 8015 2020-05-08 15:40:28 UTC alyr $
* @author    Alex Lyrakis https://github.com/AlexLyrr
* @copyright Copyright (C) 2020 Alex Lyrakis
* @license   https://www.gnu.org/licenses/gpl-3.0.html GNU/GPLv3 only
*/

/*
 * The test case of our implementation is the one in:
 * https://www.youtube.com/watch?v=pVfj6mxhdMw
 */

#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>

size_t dim = 5;
typedef size_t node;

/**
 * @brief      Initialize the distance array
 *
 * @param      dist  The distance of all adjacent nodes. If two nodes are not
 *                   connected, their distance equals SIZE_MAX
 */
void initialization(size_t dist[static 1][dim]) {
    for (size_t i = 0; i < dim; ++i) {
        for (size_t j = 0; j < dim; ++j) {
            dist[i][j] = SIZE_MAX;
        }
    }
    dist[0][1] = 6;
    dist[0][3] = 1;
    dist[1][0] = 6;
    dist[1][2] = 5;
    dist[1][3] = 2;
    dist[1][4] = 2;
    dist[2][1] = 5;
    dist[2][4] = 5;
    dist[3][0] = 1;
    dist[3][1] = 2;
    dist[3][4] = 1;
    dist[4][1] = 2;
    dist[4][2] = 5;
    dist[4][3] = 1;
}

/**
 * @brief      Find the node with shortest distance from x that is still
 *             unvisited
 *
 * @param      shortest_dist  The shortest distance
 * @param      visited        The visited nodes
 *
 * @return     { Returns the id of next node to be visited }
 */
size_t find_minimum(size_t shortest_dist[static 1],
                    bool visited[static 1]) {
    size_t min = SIZE_MAX;
    size_t min_index = SIZE_MAX;
    for (int i = 0; i < dim; ++i) {
        if (shortest_dist[i] < min && visited[i] == false) {
            min = shortest_dist[i];
            min_index = i;
        }
    }
    return min_index;
}

/**
 * @brief      Updates the shortest distance from node x table
 *
 * @param      dist           The distance of all adjacent nodes
 * @param      shortest_dist  The shortest distance
 * @param[in]  v              { Visited node v }
 * @param      prev_vertex    The previous vertex
 */
void visit_node(size_t dist[static 1][dim],
                size_t shortest_dist[static 1],
                node v,
                size_t prev_vertex[static 1]) {
    for (size_t i = 0; i < dim; ++i) {
        if (dist[v][i] != SIZE_MAX) {
            if (dist[v][i] + shortest_dist[v] < shortest_dist[i]) {
                shortest_dist[i] = dist[v][i] + shortest_dist[v];
                prev_vertex[i] = v;
            }
        }
    }
}

/**
 * @brief      Initialize the shortest distance and visited nodes tables
 *
 * @param      dist           The distance of all adjacent nodes
 * @param      shortest_dist  The shortest distance from source node
 * @param[in]  x              The source node
 * @param      visited        The visited
 * @param      prev_vertex    The previous vertex
 */
void initialize_shortest_visited_arr(size_t dist[static 1][dim],
                                     size_t shortest_dist[static 1],
                                     node x, bool visited[static 1],
                                     size_t prev_vertex[static 1]) {
    for (size_t i = 0; i < dim; ++i) {
        shortest_dist[i] = (i != x) ? SIZE_MAX : 0;
        visited[i] = false;
        if (x != i && dist[x][i] != SIZE_MAX) {
            shortest_dist[i] = dist[x][i];
            prev_vertex[i] = x;
        }
    }
}

/**
 * @brief      Find shortest path of node x to node y
 *
 * @param      dist           The distance of all adjacent nodes
 * @param      shortest_dist  The shortest distance from source node
 * @param      prev_vertex    The previous vertex
 * @param[in]  x              source node
 * @param[in]  y              dest node
 */
void dijkstra_shortest_path(size_t dist[static 1][dim],
                            size_t shortest_dist[static 1],
                            size_t prev_vertex[static 1],
                            node x, node y) {
    bool visited[dim];
    size_t visitedCounter = 0;
    initialize_shortest_visited_arr(dist, shortest_dist, x, visited,
                                    prev_vertex);
    visited[x] = true;
    visitedCounter++;
    while (visitedCounter != dim) {
        size_t nextIndex = find_minimum(shortest_dist, visited);
        visit_node(dist, shortest_dist, nextIndex,
                   prev_vertex);
        visited[nextIndex] = true;
        visitedCounter++;
    }
}

int main() {
    size_t dist[dim][dim];
    initialization(dist);
    size_t shortest_dist[dim];
    size_t prev_vertex[dim];
    node x = 0;
    node y = 3;
    dijkstra_shortest_path(dist, shortest_dist, prev_vertex, x, y);
    for (size_t i = 0; i < dim; ++i) {
        printf("%lu\n", shortest_dist[i]);
    }
}