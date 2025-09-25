---
title: Matching Algorithms
aliases: [Matching, Assignment Problems, Graph Matching]
tags: [#algorithms, #graph-algorithms, #interviews]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Algorithms for matching entities: batch vs streaming. Complexity analysis for interviews.

# STAR Summary

**Situation:** Optimized ride-sharing matching.  
**Task:** Reduce wait times.  
**Action:** Implemented streaming matching with priority queues.  
**Result:** 40% reduction in wait times.

# Detailed Explanation

## Complexity Analysis

- **Batch Matching (Hungarian Algorithm)**: O(n^3) time for n x n cost matrix, suitable for small datasets.
- **Streaming Matching**: O(n log n) amortized per operation using priority queues, ideal for real-time systems.
- **Maximum Bipartite Matching**: O(n m) with Hopcroft-Karp for sparse graphs.

## Typical Interview Variants

- Assignment problem: Minimize cost for job assignments.
- Stable marriage: Preference-based matching.
- Online matching: Decisions with partial information.

## High-Level Design

```mermaid
flowchart TD
    A[Input Graph] --> B{Matching Type}
    B -->|Batch| C[Hungarian Solver]
    B -->|Streaming| D[Priority Queue Matcher]
    C --> E[Optimal Assignment]
    D --> F[Greedy Matches]
```

# Real-world Examples & Use Cases

- **Ride-Sharing (e.g., Uber, Lyft):** Match riders to drivers based on proximity, ETA, and pricing using streaming algorithms to minimize wait times.
- **Job Matching Platforms (e.g., LinkedIn, Indeed):** Use bipartite matching to pair candidates with job openings based on skills and preferences.
- **Online Advertising:** Match ads to user profiles in real-time auctions using greedy algorithms for efficiency.
- **Medical Residency Matching:** Stable marriage problem to assign residents to hospitals without cycles of dissatisfaction.

# Code Examples

**Hungarian Algorithm (simplified):**

```java
// Simplified for bipartite matching
public class Hungarian {
    public int[] match(int[][] cost) {
        // Implementation
        return new int[cost.length];
    }
}
```

**Streaming Matching:**

```java
class StreamingMatcher {
    private PriorityQueue<Request> riders = new PriorityQueue<>();
    private PriorityQueue<Driver> drivers = new PriorityQueue<>();

    public void match() {
        while (!riders.isEmpty() && !drivers.isEmpty()) {
            // greedy match
        }
    }
}
```

**Gale-Shapley Stable Marriage (simplified):**

```java
public class GaleShapley {
    public Map<String, String> match(Map<String, List<String>> menPrefs, Map<String, List<String>> womenPrefs) {
        // Implementation of Gale-Shapley algorithm
        return new HashMap<>();
    }
}
```

# Data Models / Message Formats

Graph with edges weighted by compatibility.

# Journey / Sequence

```mermaid
sequenceDiagram
    participant Rider
    participant Matcher
    participant Driver

    Rider->>Matcher: Request Ride
    Driver->>Matcher: Available
    Matcher->>Matcher: Compute Match
    Matcher->>Rider: Assigned Driver
    Matcher->>Driver: Assigned Rider
```

# Common Pitfalls & Edge Cases

- NP-hard for general cases  
- Approximation algorithms  
- Imbalanced graphs leading to suboptimal matches

# Common Interview Questions

1. **Assignment Problem**: Given cost matrix, find minimum cost assignment. Solution: Hungarian algorithm, O(n^3).
2. **Stable Marriage**: Match pairs with preferences, no blocking pairs. Solution: Gale-Shapley, O(n^2).
3. **Maximum Matching in Bipartite Graph**: Find largest set of edges without common vertices. Solution: DFS/BFS based, O(n m).

# Tools & Libraries

Java graphs libraries.

# Github-README Links & Related Topics

- [Graph Algorithms](algorithms/graph-algorithms/README.md)
- [Order Book Modeling](algorithms/order-book-modeling/README.md)

# References

- https://en.wikipedia.org/wiki/Matching_(graph_theory)
- https://en.wikipedia.org/wiki/Hungarian_algorithm