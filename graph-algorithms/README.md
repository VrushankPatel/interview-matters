---
title: Graph Algorithms
aliases: [Graph Theory Algorithms, Graph Traversal]
tags: [#algorithms,#graphs]
created: 2025-09-25
updated: 2025-09-25
---

# Graph Algorithms

## Overview

Graph algorithms are computational methods for solving problems on graph data structures, which consist of nodes (vertices) and edges connecting them. They are fundamental in computer science, used for modeling relationships, networks, and paths. Common applications include social networks, routing, recommendation systems, and optimization problems.

## Detailed Explanation

### Graph Representations

- **Adjacency List**: Efficient for sparse graphs, O(V + E) space.
- **Adjacency Matrix**: Good for dense graphs, O(V^2) space.

### Types of Graphs

- Directed vs Undirected
- Weighted vs Unweighted
- Cyclic vs Acyclic (DAGs)

### Common Algorithms

1. **Traversal Algorithms**
   - Breadth-First Search (BFS): Level-order traversal, finds shortest path in unweighted graphs.
   - Depth-First Search (DFS): Explores as far as possible, used for topological sort, cycle detection.

2. **Shortest Path Algorithms**
   - Dijkstra's Algorithm: For non-negative weights.
   - Bellman-Ford: Handles negative weights.
   - Floyd-Warshall: All-pairs shortest paths.

3. **Minimum Spanning Tree**
   - Kruskal's Algorithm
   - Prim's Algorithm

4. **Other**
   - Topological Sort
   - Cycle Detection
   - Strongly Connected Components (Kosaraju, Tarjan)

## Real-world Examples & Use Cases

- **Social Networks**: Finding friends of friends, shortest connection path.
- **GPS Navigation**: Shortest route calculation.
- **Web Crawling**: Traversing web pages.
- **Recommendation Systems**: Collaborative filtering using graph structures.
- **Network Routing**: OSPF protocol uses Dijkstra.

## Code Examples

### BFS in Java

```java
import java.util.*;

public class BFS {
    public static void bfs(int start, List<List<Integer>> graph) {
        boolean[] visited = new boolean[graph.size()];
        Queue<Integer> queue = new LinkedList<>();
        queue.add(start);
        visited[start] = true;
        while (!queue.isEmpty()) {
            int node = queue.poll();
            System.out.print(node + " ");
            for (int neighbor : graph.get(node)) {
                if (!visited[neighbor]) {
                    visited[neighbor] = true;
                    queue.add(neighbor);
                }
            }
        }
    }

    public static void main(String[] args) {
        List<List<Integer>> graph = Arrays.asList(
            Arrays.asList(1, 2), // 0
            Arrays.asList(0, 3), // 1
            Arrays.asList(0, 3), // 2
            Arrays.asList(1, 2)  // 3
        );
        bfs(0, graph); // 0 1 2 3
    }
}
```

### DFS in Java

```java
import java.util.*;

public class DFS {
    public static void dfs(int node, List<List<Integer>> graph, boolean[] visited) {
        visited[node] = true;
        System.out.print(node + " ");
        for (int neighbor : graph.get(node)) {
            if (!visited[neighbor]) {
                dfs(neighbor, graph, visited);
            }
        }
    }

    public static void main(String[] args) {
        List<List<Integer>> graph = Arrays.asList(
            Arrays.asList(1, 2),
            Arrays.asList(0, 3),
            Arrays.asList(0, 3),
            Arrays.asList(1, 2)
        );
        boolean[] visited = new boolean[graph.size()];
        dfs(0, graph, visited); // 0 1 3 2
    }
}
```

### Dijkstra's Algorithm

```java
import java.util.*;

public class Dijkstra {
    public static int[] dijkstra(int start, List<List<int[]>> graph) {
        int n = graph.size();
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[start] = 0;
        PriorityQueue<int[]> pq = new PriorityQueue<>(Comparator.comparingInt(a -> a[1]));
        pq.add(new int[]{start, 0});
        while (!pq.isEmpty()) {
            int[] curr = pq.poll();
            int node = curr[0], cost = curr[1];
            if (cost > dist[node]) continue;
            for (int[] neighbor : graph.get(node)) {
                int next = neighbor[0], weight = neighbor[1];
                if (dist[node] + weight < dist[next]) {
                    dist[next] = dist[node] + weight;
                    pq.add(new int[]{next, dist[next]});
                }
            }
        }
        return dist;
    }

    public static void main(String[] args) {
        List<List<int[]>> graph = Arrays.asList(
            Arrays.asList(new int[]{1, 4}, new int[]{2, 1}), // 0
            Arrays.asList(new int[]{3, 1}), // 1
            Arrays.asList(new int[]{1, 2}, new int[]{3, 5}), // 2
            Arrays.asList() // 3
        );
        int[] dist = dijkstra(0, graph);
        System.out.println(Arrays.toString(dist)); // [0, 3, 1, 4]
    }
}
```

## Common Pitfalls & Edge Cases

- **Disconnected Graphs**: Ensure all components are visited.
- **Negative Weights**: Dijkstra fails; use Bellman-Ford.
- **Cycles**: Handle in shortest path to avoid infinite loops.
- **Large Graphs**: Optimize with heaps or approximations.

## Tools & Libraries

- **Java**: JGraphT library for graph algorithms.
- **Python**: NetworkX for graph operations.
- **Visualization**: Graphviz for drawing graphs.

## References

- [Graph Algorithms - GeeksforGeeks](https://www.geeksforgeeks.org/graph-data-structure-and-algorithms/)
- [Introduction to Algorithms - CLRS](https://mitpress.mit.edu/9780262033848/introduction-to-algorithms/)
- [Graph Theory - Wikipedia](https://en.wikipedia.org/wiki/Graph_theory)

## Github-README Links & Related Topics

- [Algorithms and Data Structures](../algorithms/algorithms-and-data-structures/)
- [Dynamic Programming](../dynamic-programming/)
- [Backtracking](../backtracking/)