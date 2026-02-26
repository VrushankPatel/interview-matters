# Problem Solving Prep

A coding interview playbook for DSA rounds: patterns, approach, and high-yield problem sets.

## Table of Contents

- [Interview Execution Strategy](#interview-execution-strategy)
- [Complexity and Trade-offs](#complexity-and-trade-offs)
- [Core Patterns](#core-patterns)
- [Data Structures Focus](#data-structures-focus)
- [Algorithms Focus](#algorithms-focus)
- [High-Yield Practice Set](#high-yield-practice-set)
- [Coding Round Checklist](#coding-round-checklist)

## Interview Execution Strategy

1. Clarify constraints and edge cases.
2. Start with brute force and complexity.
3. Derive optimized approach with clear invariants.
4. Code cleanly with testable helper methods.
5. Dry run with sample and edge cases.
6. Discuss complexity and possible improvements.

## Complexity and Trade-offs

- Be explicit: time complexity, space complexity.
- State assumptions: input size, duplicates, sortedness, mutability.
- Mention trade-offs: readability vs micro-optimization.

## Core Patterns

### Arrays and Strings

- Two pointers
- Sliding window
- Prefix sums
- Hashing for frequency/lookup

### Linked List

- Fast/slow pointer
- In-place reversal
- Dummy node pattern

### Stack and Queue

- Monotonic stack for next greater/smaller problems
- Queue for BFS and level-order traversal

### Trees and BST

- DFS (pre/in/post)
- BFS level traversal
- Recursion with subtree return contracts

### Graphs

- BFS/DFS traversal
- Topological sort (DAG)
- Union-Find for connectivity
- Dijkstra for weighted shortest path

### Dynamic Programming

- Define state clearly.
- Build transition relation.
- Base cases first.
- Prefer bottom-up if recursion overhead is high.

### Backtracking

- Build partial answer, prune early.
- Use choose-explore-unchoose flow.
- Track visited state carefully.

### Greedy

- Use when local optimum leads to global optimum.
- Must justify correctness.

## Data Structures Focus

- Arrays, strings, hash map/set
- Stack, queue, deque
- Heap / priority queue
- Linked list
- Binary tree / BST
- Trie
- Graph adjacency list
- Disjoint set union

## Algorithms Focus

- Binary search and variants
- Sorting fundamentals
- DFS/BFS
- Recursion and divide-and-conquer
- Dynamic programming (1D/2D, knapsack-style)
- Shortest paths and MST basics

## High-Yield Practice Set

### Easy to Warm Up

- Two Sum
- Valid Parentheses
- Merge Two Sorted Lists
- Best Time to Buy and Sell Stock
- Binary Search

### Medium Core

- Longest Substring Without Repeating Characters
- 3Sum
- Group Anagrams
- Product of Array Except Self
- Number of Islands
- Kth Largest Element in Array
- Top K Frequent Elements
- Coin Change
- Longest Increasing Subsequence
- Course Schedule

### Hard / Senior-Bar

- Trapping Rain Water
- Median of Two Sorted Arrays
- Word Ladder
- Merge K Sorted Lists
- Serialize and Deserialize Binary Tree
- Minimum Window Substring

## Coding Round Checklist

- I can derive and code at least two approaches.
- I can explain correctness via invariants.
- I can optimize from O(n^2) to O(n log n)/O(n) when pattern exists.
- I can handle null/empty/single-element edge cases.
- I can write bug-resistant code without excessive retries.

## Related

- [Java Prep](./java-prep.md)
- [CS Fundamentals](./cs-fundamentals.md)
- [System Design Concepts](./system-design-concepts.md)
