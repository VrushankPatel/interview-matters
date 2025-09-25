---
title: Dynamic Programming
aliases: [DP, Dynamic Programming Algorithms]
tags: [#algorithms,#interview]
created: 2025-09-25
updated: 2025-09-25
---

# Dynamic Programming

## Overview

Dynamic Programming (DP) is an algorithmic technique for solving optimization problems by breaking them down into simpler subproblems and storing the results of subproblems to avoid redundant computations. It is particularly useful for problems with overlapping subproblems and optimal substructure properties.

## Detailed Explanation

### Key Concepts

- **Optimal Substructure**: The optimal solution to a problem can be constructed from optimal solutions of its subproblems.
- **Overlapping Subproblems**: Subproblems are solved multiple times; DP stores results to reuse them.
- **Memoization (Top-Down)**: Recursive approach with caching of results.
- **Tabulation (Bottom-Up)**: Iterative approach filling a table.

### Common DP Problems

1. **Fibonacci Sequence**: Classic example of overlapping subproblems.
2. **Knapsack Problem**: 0/1 and unbounded variants for resource allocation.
3. **Longest Common Subsequence**: String comparison problems.
4. **Matrix Chain Multiplication**: Optimal parenthesization.
5. **Shortest Path in DAG**: Using DP on graphs.

### Time and Space Complexity

DP solutions often have O(n) or O(n^2) time, depending on the problem, with space for the DP table.

## Real-world Examples & Use Cases

- **Resource Allocation**: Knapsack for budget optimization in advertising.
- **Sequence Alignment**: LCS in bioinformatics for DNA sequence comparison.
- **Path Finding**: Shortest paths with constraints in routing algorithms.
- **Text Editing**: Edit distance for spell checkers and diff tools.

## Code Examples

### Fibonacci with Memoization

```java
import java.util.HashMap;
import java.util.Map;

public class Fibonacci {
    private static Map<Integer, Long> memo = new HashMap<>();

    public static long fib(int n) {
        if (n <= 1) return n;
        if (memo.containsKey(n)) return memo.get(n);
        long result = fib(n - 1) + fib(n - 2);
        memo.put(n, result);
        return result;
    }

    public static void main(String[] args) {
        System.out.println(fib(10)); // 55
    }
}
```

### 0/1 Knapsack Problem

```java
public class Knapsack {
    public static int knapsack(int[] weights, int[] values, int capacity) {
        int n = weights.length;
        int[][] dp = new int[n + 1][capacity + 1];

        for (int i = 1; i <= n; i++) {
            for (int w = 1; w <= capacity; w++) {
                if (weights[i - 1] <= w) {
                    dp[i][w] = Math.max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1]);
                } else {
                    dp[i][w] = dp[i - 1][w];
                }
            }
        }
        return dp[n][capacity];
    }

    public static void main(String[] args) {
        int[] weights = {1, 2, 3};
        int[] values = {10, 15, 40};
        int capacity = 6;
        System.out.println(knapsack(weights, values, capacity)); // 65
    }
}
```

### Longest Common Subsequence

```java
public class LCS {
    public static int lcs(String s1, String s2) {
        int m = s1.length(), n = s2.length();
        int[][] dp = new int[m + 1][n + 1];

        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                if (s1.charAt(i - 1) == s2.charAt(j - 1)) {
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                } else {
                    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
                }
            }
        }
        return dp[m][n];
    }

    public static void main(String[] args) {
        System.out.println(lcs("AGGTAB", "GXTXAYB")); // 4
    }
}
```

## Data Models / Message Formats

### DP Table for Knapsack

| Item | Weight | Value | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
|------|--------|-------|---|---|---|---|---|---|---|
| 0    | 0      | 0     | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 1    | 1      | 10    | 0 | 10| 10| 10| 10| 10| 10|
| 2    | 2      | 15    | 0 | 10| 15| 25| 25| 25| 25|
| 3    | 3      | 40    | 0 | 10| 15| 40| 50| 55| 65|

## Common Pitfalls & Edge Cases

- **Index Errors**: Off-by-one in DP table initialization.
- **Memory Limits**: Large DP tables for high dimensions.
- **Negative Values**: Ensure non-negative weights/values unless specified.
- **Edge Cases**: Empty arrays, zero capacity, single element.

## Tools & Libraries

- **Java**: Arrays for DP tables, or libraries like Guava for caching.
- **Python**: NumPy for efficient array operations.
- **Visualization**: DP tables can be visualized with matplotlib.

## References

- [Introduction to Algorithms (CLRS) - Chapter 15](https://mitpress.mit.edu/9780262033848/introduction-to-algorithms/)
- [Dynamic Programming - GeeksforGeeks](https://www.geeksforgeeks.org/dynamic-programming/)
- [DP on LeetCode](https://leetcode.com/problemset/all/?search=dynamic)

## Github-README Links & Related Topics

- [Algorithms and Data Structures](./../algorithms/algorithms-and-data-structures)
- [Graph Algorithms](./../algorithms/graph-algorithms)
- [Backtracking](./../algorithms/backtracking)