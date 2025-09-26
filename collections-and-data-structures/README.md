---
title: Collections & Data Structures
aliases: [Data Structures in Java, Java Collections Framework]
tags: [#java,#data-structures,#collections]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Collections and data structures are fundamental components in Java programming, providing efficient ways to store, manipulate, and retrieve data. The Java Collections Framework (JCF) offers a unified architecture for representing and manipulating collections, allowing developers to work with groups of objects as single units. Key data structures include arrays, lists, sets, maps, queues, and trees, each optimized for specific operations like insertion, deletion, and search. Understanding these structures is crucial for writing performant code, as choosing the right data structure can significantly impact time and space complexity.

# Detailed Explanation

The Java Collections Framework is built around interfaces, implementations, and algorithms. It provides reusable data structures and algorithms to manipulate them.

## Core Interfaces
- **Collection**: Root interface for all collections except maps. Subinterfaces include List, Set, and Queue.
- **List**: Ordered collection allowing duplicates (e.g., ArrayList, LinkedList).
- **Set**: Unordered collection with no duplicates (e.g., HashSet, TreeSet).
- **Queue**: FIFO structure for holding elements (e.g., LinkedList, PriorityQueue).
- **Map**: Key-value pairs (e.g., HashMap, TreeMap).

## Key Implementations
- **ArrayList**: Resizable array, fast random access (O(1)), slow insertions/deletions (O(n)).
- **LinkedList**: Doubly-linked list, fast insertions/deletions (O(1)), slow random access (O(n)).
- **HashSet**: Hash table for unique elements, average O(1) operations.
- **TreeSet**: Red-black tree for sorted unique elements, O(log n) operations.
- **HashMap**: Hash table for key-value pairs, average O(1) access.
- **TreeMap**: Red-black tree for sorted key-value pairs, O(log n) access.

## Time Complexities
| Operation | ArrayList | LinkedList | HashSet | TreeSet | HashMap | TreeMap |
|-----------|-----------|------------|---------|---------|---------|---------|
| Add       | O(1)      | O(1)       | O(1)    | O(log n)| O(1)    | O(log n)|
| Remove    | O(n)      | O(1)       | O(1)    | O(log n)| O(1)    | O(log n)|
| Search    | O(n)      | O(n)       | O(1)    | O(log n)| O(1)    | O(log n)|

## Synchronization
Most collections are unsynchronized; use Collections.synchronized*() for thread-safety or prefer concurrent collections like ConcurrentHashMap.

# Real-world Examples & Use Cases

- **Caching**: HashMap for in-memory caches in web applications to store user sessions or frequently accessed data.
- **Unique Data Handling**: HashSet for deduplicating items in a shopping cart or processing unique user IDs in analytics.
- **Ordered Processing**: LinkedList for implementing queues in task schedulers or breadth-first search algorithms.
- **Sorted Data**: TreeSet for maintaining sorted collections in priority queues or leaderboard systems.
- **Key-Value Storage**: HashMap in configuration management for storing properties or in graph representations for adjacency lists.

# Code Examples

```java
import java.util.*;

public class CollectionsExample {
    public static void main(String[] args) {
        // List example
        List<String> list = new ArrayList<>();
        list.add("Apple");
        list.add("Banana");
        System.out.println(list.get(0)); // Apple

        // Set example
        Set<String> set = new HashSet<>();
        set.add("Apple");
        set.add("Apple"); // Duplicate ignored
        System.out.println(set.size()); // 1

        // Map example
        Map<String, Integer> map = new HashMap<>();
        map.put("Apple", 1);
        map.put("Banana", 2);
        System.out.println(map.get("Apple")); // 1

        // Queue example
        Queue<String> queue = new LinkedList<>();
        queue.add("First");
        queue.add("Second");
        System.out.println(queue.poll()); // First
    }
}
```

# Common Pitfalls & Edge Cases

- **Concurrent Modification**: Avoid modifying collections during iteration; use Iterator.remove() or copy collections.
- **Null Values**: HashMap allows null keys/values, but TreeMap does not; handle nulls carefully.
- **Capacity and Load Factor**: ArrayList resizes at 50% capacity; pre-size for large collections to avoid frequent resizing.
- **Memory Leaks**: WeakHashMap for caches to allow garbage collection of keys.
- **Type Safety**: Use generics to prevent ClassCastException at runtime.

# Tools & Libraries

- **Java Collections Framework**: Built-in, no external dependencies.
- **Guava**: Google's library for advanced collections like Multimap and BiMap.
- **Apache Commons Collections**: Utilities for extended functionality.
- **Eclipse Collections**: High-performance collections for enterprise apps.

# References

- [Oracle Java Collections Tutorial](https://docs.oracle.com/javase/tutorial/collections/)
- [GeeksforGeeks Data Structures](https://www.geeksforgeeks.org/data-structures/)
- [Baeldung Java Collections](https://www.baeldung.com/java-collections)

# Github-README Links & Related Topics

- [Java Collections Deep Dive](../java-collections-deep-dive/)
- [Concurrent Collections](../concurrent-collections/)
- [Java Multithreading and Concurrency](../java-multithreading-and-concurrency/)
