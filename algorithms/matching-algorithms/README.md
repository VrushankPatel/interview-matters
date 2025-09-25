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

Batch: Hungarian algorithm, O(n^3).  
Streaming: Greedy with heaps.

# Real-world Examples & Use Cases

Ride-sharing, job matching.

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

# Tools & Libraries

Java graphs libraries.

# Github-README Links & Related Topics

[[graph-algorithms]], [[order-book-modeling]]

# References

- https://en.wikipedia.org/wiki/Matching_(graph_theory)
- https://en.wikipedia.org/wiki/Hungarian_algorithm