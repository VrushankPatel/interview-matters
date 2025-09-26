---
title: Matching Algorithms
aliases: [string matching, graph matching, pattern matching]
tags: [#algorithms,#data-structures,#computer-science]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Matching algorithms are computational methods used to find occurrences of a pattern within a larger text or to match elements in graphs, strings, or other data structures. They are fundamental in computer science, enabling efficient search, parsing, and data processing in applications ranging from text editors to bioinformatics.

## Detailed Explanation

### String Matching Algorithms

String matching involves finding all occurrences of a pattern string P within a text string T.

#### Naive Algorithm
The simplest approach checks every possible position in T for P.

```python
def naive_string_match(T, P):
    n = len(T)
    m = len(P)
    for i in range(n - m + 1):
        if T[i:i+m] == P:
            print(f"Pattern found at index {i}")
```

Time complexity: O((n-m+1)*m), worst case O(n*m).

#### Knuth-Morris-Pratt (KMP) Algorithm
Uses a prefix table to skip unnecessary comparisons.

```python
def compute_prefix_function(P):
    m = len(P)
    pi = [0] * m
    k = 0
    for i in range(1, m):
        while k > 0 and P[k] != P[i]:
            k = pi[k-1]
        if P[k] == P[i]:
            k += 1
        pi[i] = k
    return pi

def kmp_search(T, P):
    n, m = len(T), len(P)
    pi = compute_prefix_function(P)
    q = 0
    for i in range(n):
        while q > 0 and P[q] != T[i]:
            q = pi[q-1]
        if P[q] == T[i]:
            q += 1
        if q == m:
            print(f"Pattern found at index {i - m + 1}")
            q = pi[q-1]
```

Time complexity: O(n + m).

#### Boyer-Moore Algorithm
Uses bad character and good suffix heuristics for faster skipping.

### Graph Matching Algorithms

Graph matching finds subgraphs or mappings between graphs.

#### Maximum Matching in Bipartite Graphs
Hopcroft-Karp algorithm for efficient maximum matching.

```python
# Simplified implementation
def hopcroft_karp(graph):
    # Implementation details...
    pass
```

## Real-world Examples & Use Cases

- **Text Search**: grep, search engines use string matching.
- **DNA Sequencing**: Bioinformatics uses pattern matching for gene sequences.
- **Recommendation Systems**: Graph matching for user-item recommendations.
- **Compiler Design**: Lexical analysis uses string matching.

## Code Examples

### Python: Rabin-Karp Rolling Hash

```python
def rabin_karp(T, P, d=256, q=101):
    n, m = len(T), len(P)
    h = pow(d, m-1) % q
    p = 0
    t = 0
    for i in range(m):
        p = (d * p + ord(P[i])) % q
        t = (d * t + ord(T[i])) % q
    for i in range(n - m + 1):
        if p == t:
            if T[i:i+m] == P:
                print(f"Pattern found at {i}")
        if i < n - m:
            t = (d * (t - ord(T[i]) * h) + ord(T[i+m])) % q
```

### Java: Aho-Corasick for Multiple Patterns

```java
// Simplified Aho-Corasick implementation
public class AhoCorasick {
    // Implementation...
}
```

## Common Pitfalls & Edge Cases

- Handling case sensitivity.
- Unicode characters in strings.
- Overlapping patterns.
- Empty strings or patterns.

## Tools & Libraries

- Python: `re` module for regex.
- Java: Apache Commons Lang StringUtils.
- C++: std::string::find.

## References

- [Knuth-Morris-Pratt Algorithm - Wikipedia](https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm)
- [Boyer-Moore Algorithm - GeeksforGeeks](https://www.geeksforgeeks.org/boyer-moore-algorithm-for-pattern-searching/)
- Cormen, T. H., et al. "Introduction to Algorithms." MIT Press.

## Github-README Links & Related Topics

- [algorithms](../algorithms/README.md)
- [string-algorithms](../string-algorithms/README.md)
- [graph-algorithms](../graph-algorithms/README.md)