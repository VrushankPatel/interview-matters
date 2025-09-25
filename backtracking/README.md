---
title: N-Queens, Sudoku, combinatorial problem solving
aliases: [Backtracking Algorithm, Constraint Satisfaction]
tags: [#algorithms,#backtracking]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Backtracking is a general algorithm for finding solutions to combinatorial problems by trying partial solutions and abandoning invalid ones.

# Detailed Explanation

- **Algorithm**: Recursively build solution, check constraints, backtrack on failure.
- **Pruning**: Use heuristics to reduce search space.
- **Applications**: Puzzles, optimization, constraint satisfaction.

# Real-world Examples & Use Cases

- Solving Sudoku puzzles.
- Placing N queens on a chessboard.
- Generating permutations with constraints.

# Code Examples

```java
// N-Queens problem
public class NQueens {
    public static boolean solveNQueens(int[][] board, int col, int n) {
        if (col >= n) return true;
        for (int i = 0; i < n; i++) {
            if (isSafe(board, i, col, n)) {
                board[i][col] = 1;
                if (solveNQueens(board, col + 1, n)) return true;
                board[i][col] = 0; // backtrack
            }
        }
        return false;
    }
    
    private static boolean isSafe(int[][] board, int row, int col, int n) {
        // check row, column, diagonals
        // implementation omitted for brevity
        return true;
    }
}
```

# References

- [Backtracking on GeeksforGeeks](https://www.geeksforgeeks.org/backtracking-algorithms/)

# Github-README Links & Related Topics

- [Backtracking](algorithms/backtracking/README.md)
- [Graph Algorithms](algorithms/graph-algorithms/README.md)