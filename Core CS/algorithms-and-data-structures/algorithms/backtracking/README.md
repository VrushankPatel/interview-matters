---
title: Backtracking
aliases: [backtracking-algorithm, combinatorial-search]
tags: [#algorithms, #interviews]
created: 2025-09-25
updated: 2025-09-25
---

## Overview
Backtracking is a systematic way to iterate through all possible configurations in a search space, pruning branches that cannot lead to a valid solution. It builds candidates incrementally and abandons a candidate ("backtracks") as soon as it determines that the candidate cannot possibly be extended to a valid solution. This technique is essential for solving constraint satisfaction problems, puzzles, and optimization problems where brute force is infeasible.

In interviews, backtracking problems often involve permutations, combinations, or path finding with constraints. Time complexity is typically exponential (O(k^N) where k is branching factor), but pruning reduces it significantly in practice.

## STAR Summary
**Situation:** Interviewed for a software engineering role at a FAANG company, faced with a problem to generate all valid parentheses combinations for n pairs.  
**Task:** Implement a function that returns all combinations without duplicates, handling up to n=8 efficiently.  
**Action:** Used backtracking to build strings incrementally, adding '(' or ')' only if valid, and backtracking on invalid states.  
**Result:** Produced correct output in O(2^N) time with pruning, passing all test cases and demonstrating understanding of recursion and state management.

## Detailed Explanation
Backtracking works by:
1. **Choosing:** Select a candidate from available options.
2. **Exploring:** Recurse to build the solution.
3. **Unchoosing:** If invalid, backtrack and try next candidate.

Key concepts:
- **State Space Tree:** Represents all possible solutions.
- **Pruning:** Early termination for invalid partial solutions.
- **Backtracking vs. Brute Force:** Brute force explores all, backtracking prunes.

For N-Queens, place queens column by column, check no attacks, backtrack if conflict.

Complexity: Worst-case exponential, but often polynomial with good heuristics.

## Real-world Examples & Use Cases
- **Puzzle Solving:** Sudoku, crossword generation.
- **Combinatorial Problems:** Generating subsets, permutations with constraints.
- **Path Finding:** Maze solving with obstacles.
- **Compiler Design:** Parsing expressions.
- **AI:** Game tree search (e.g., chess with alpha-beta pruning).

## Code Examples
### N-Queens Problem in Java
```java
import java.util.*;

public class NQueens {
    private List<List<String>> solutions;
    private int n;

    public NQueens(int n) {
        this.n = n;
        solutions = new ArrayList<>();
    }

    public List<List<String>> solveNQueens() {
        char[][] board = new char[n][n];
        for (char[] row : board) Arrays.fill(row, '.');
        backtrack(board, 0);
        return solutions;
    }

    private void backtrack(char[][] board, int row) {
        if (row == n) {
            solutions.add(construct(board));
            return;
        }
        for (int col = 0; col < n; col++) {
            if (isValid(board, row, col)) {
                board[row][col] = 'Q';
                backtrack(board, row + 1);
                board[row][col] = '.'; // backtrack
            }
        }
    }

    private boolean isValid(char[][] board, int row, int col) {
        for (int i = 0; i < row; i++) {
            if (board[i][col] == 'Q') return false;
            if (col - (row - i) >= 0 && board[i][col - (row - i)] == 'Q') return false;
            if (col + (row - i) < n && board[i][col + (row - i)] == 'Q') return false;
        }
        return true;
    }

    private List<String> construct(char[][] board) {
        List<String> res = new ArrayList<>();
        for (char[] row : board) res.add(new String(row));
        return res;
    }

    public static void main(String[] args) {
        NQueens q = new NQueens(4);
        List<List<String>> sols = q.solveNQueens();
        for (List<String> sol : sols) {
            for (String s : sol) System.out.println(s);
            System.out.println();
        }
    }
}
```

Compile and run: `javac NQueens.java && java NQueens`

### Generate Parentheses
```java
import java.util.*;

public class GenerateParentheses {
    public List<String> generateParenthesis(int n) {
        List<String> result = new ArrayList<>();
        backtrack(result, "", 0, 0, n);
        return result;
    }

    private void backtrack(List<String> result, String current, int open, int close, int max) {
        if (current.length() == max * 2) {
            result.add(current);
            return;
        }
        if (open < max) backtrack(result, current + "(", open + 1, close, max);
        if (close < open) backtrack(result, current + ")", open, close + 1, max);
    }

    public static void main(String[] args) {
        GenerateParentheses gp = new GenerateParentheses();
        System.out.println(gp.generateParenthesis(3));
    }
}
```

## Data Models / Message Formats
| Field | Type | Description |
|-------|------|-------------|
| board | char[][] | 2D array for N-Queens board |
| solutions | List<List<String>> | List of valid board configurations |
| current | String | Current partial solution string |
| open/close | int | Counters for parentheses balance |

## Journey / Sequence
```mermaid
sequenceDiagram
    participant Solver
    participant State
    Solver->>State: Start with empty board/choice
    State-->>Solver: Valid candidates
    Solver->>State: Choose candidate, recurse
    State-->>Solver: If solution, record; else backtrack
    Solver->>State: Try next candidate
    State-->>Solver: Repeat until exhausted
```

## Common Pitfalls & Edge Cases
- **Recursion Depth:** Stack overflow for large N; use iterative with stack.
- **Duplicates:** Ensure unique solutions; use sets if needed.
- **Pruning:** Always check constraints early to avoid unnecessary exploration.
- **Edge Cases:** N=0 (empty), N=1 (trivial), invalid inputs.

## Tools & Libraries
- Java: Built-in recursion; no libraries needed.
- For large problems: Use memoization if overlapping subproblems (though rare in pure backtracking).
- Testing: JUnit for correctness.

## Github-README Links & Related Topics
Related: [divide-and-conquer](../../divide-and-conquer/), [dynamic-programming-and-greedy](../dynamic-programming-and-greedy/), [graphs-trees-heaps-and-tries](../graphs-trees-heaps-and-tries/)

## References
- https://en.wikipedia.org/wiki/Backtracking
- "Introduction to Algorithms" by Cormen et al., Chapter on Backtracking
- LeetCode: https://leetcode.com/tag/backtracking/
- GeeksforGeeks: https://www.geeksforgeeks.org/backtracking-algorithm/

### Practice Problems
1. **N-Queens II** (LeetCode 52): Count solutions for N queens. Time: O(N!), Space: O(N). Variant: Print all solutions.
2. **Sudoku Solver** (LeetCode 37): Fill 9x9 grid with 1-9, no repeats in rows/cols/boxes. Time: O(9^81) worst, but pruned to feasible.
3. **Combination Sum** (LeetCode 39): Find combinations summing to target, allow reuse. Time: O(2^N), Space: O(N). Variant: No reuse (LeetCode 40).

### Common Interview Questions
- Explain backtracking with N-Queens.
- Difference between backtracking and DFS?
- How to optimize backtracking for permutations?