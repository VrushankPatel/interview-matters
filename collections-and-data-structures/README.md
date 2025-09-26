---
title: Collections & Data Structures
aliases: [Collections in Java, Data Structures]
tags: [#java, #data-structures]
created: 2023-10-01
updated: 2025-09-26
---

# Collections & Data Structures

## Overview

Collections in Java are frameworks that provide architectures for storing and manipulating groups of objects. Data structures are the underlying implementations that enable efficient storage, retrieval, and manipulation of data. This topic covers the Java Collections Framework (JCF), common data structures, their implementations, and best practices.

## Detailed Explanation

The Java Collections Framework consists of interfaces, implementations, and algorithms. Key interfaces include List, Set, Queue, and Map. Implementations like ArrayList, LinkedList, HashSet, HashMap provide different performance characteristics.

### Key Components

- **Interfaces**: Define contracts for collections.
- **Implementations**: Concrete classes like ArrayList, HashMap.
- **Algorithms**: Static methods in Collections class for sorting, searching.

### Data Structures Covered

- Arrays
- Linked Lists
- Stacks
- Queues
- Trees
- Graphs
- Hash Tables

## Real-world Examples & Use Cases

- **E-commerce**: Using HashMap for product catalogs.
- **Social Networks**: Graphs for friend connections.
- **Task Scheduling**: PriorityQueue for job queues.
- **Caching**: LinkedHashMap for LRU cache.

## Code Examples

### ArrayList Example

```java
import java.util.ArrayList;
import java.util.List;

public class ArrayListExample {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("Apple");
        list.add("Banana");
        System.out.println(list.get(0)); // Apple
    }
}
```

### HashMap Example

```java
import java.util.HashMap;
import java.util.Map;

public class HashMapExample {
    public static void main(String[] args) {
        Map<String, Integer> map = new HashMap<>();
        map.put("Alice", 25);
        map.put("Bob", 30);
        System.out.println(map.get("Alice")); // 25
    }
}
```

### Custom Data Structure: Stack

```java
import java.util.Stack;

public class StackExample {
    public static void main(String[] args) {
        Stack<Integer> stack = new Stack<>();
        stack.push(1);
        stack.push(2);
        System.out.println(stack.pop()); // 2
    }
}
```

## References

- [Oracle Java Collections Tutorial](https://docs.oracle.com/javase/tutorial/collections/)
- [GeeksforGeeks Data Structures](https://www.geeksforgeeks.org/data-structures/)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

## Github-README Links & Related Topics

- [Java Fundamentals](java-fundamentals/)
- [Multithreading & Concurrency in Java](concurrency-and-parallelism/)
- [Algorithms](algorithms/)