---
title: Collections and Data Structures
aliases: [Java Collections, Data Structures]
tags: [#java, #data-structures]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

The Java Collections Framework provides a unified architecture for representing and manipulating collections of objects. It includes interfaces, implementations, and algorithms that allow developers to work with groups of objects efficiently. Understanding collections is fundamental to writing performant and maintainable Java code.

## Detailed Explanation

### Collection Hierarchy

The Collections Framework is built around a set of interfaces that define the functionality of different types of collections:

- **Collection** (root interface)
  - **List**: Ordered collection that allows duplicates
    - ArrayList: Resizable array implementation
    - LinkedList: Doubly-linked list implementation
    - Vector: Synchronized resizable array (legacy)
  - **Set**: Collection that does not allow duplicates
    - HashSet: Hash table implementation
    - LinkedHashSet: Hash table with insertion order
    - TreeSet: Red-black tree implementation
  - **Queue**: Collection for holding elements prior to processing
    - PriorityQueue: Priority heap implementation
    - LinkedList: Can be used as a queue

- **Map**: Object that maps keys to values
  - HashMap: Hash table implementation
  - LinkedHashMap: Hash table with insertion order
  - TreeMap: Red-black tree implementation
  - ConcurrentHashMap: Thread-safe hash table

### Key Concepts

- **Generics**: Type safety and reusability
- **Iterators**: Unified way to traverse collections
- **Comparable/Comparator**: Custom ordering
- **Fail-fast vs Fail-safe**: Iterator behavior during concurrent modification
- **Time Complexity**: Understanding performance characteristics

### Collection Types Comparison

| Collection | Ordering | Duplicates | Implementation | Best For |
|------------|----------|------------|----------------|----------|
| ArrayList | Insertion | Allowed | Array | Random access |
| LinkedList | Insertion | Allowed | Linked list | Insertions/Deletions |
| HashSet | No | No | Hash table | Fast lookup |
| TreeSet | Sorted | No | Red-black tree | Sorted unique elements |
| HashMap | No | Keys unique | Hash table | Key-value pairs |

## Real-world Examples & Use Cases

1. **User Management System**: Using ArrayList to store user objects, HashSet for unique usernames
2. **Caching Layer**: HashMap for in-memory key-value storage
3. **Task Scheduling**: PriorityQueue for tasks with different priorities
4. **Unique Item Processing**: TreeSet for sorted unique elements in e-commerce catalogs
5. **Thread-safe Operations**: ConcurrentHashMap in multi-threaded environments

## Code Examples

### ArrayList Usage
```java
import java.util.ArrayList;
import java.util.List;

public class ArrayListExample {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        names.add("Alice");
        names.add("Bob");
        names.add("Charlie");
        
        System.out.println("Names: " + names);
        System.out.println("First name: " + names.get(0));
        names.remove("Bob");
        System.out.println("After removal: " + names);
    }
}
```

### HashSet for Unique Elements
```java
import java.util.HashSet;
import java.util.Set;

public class HashSetExample {
    public static void main(String[] args) {
        Set<String> uniqueWords = new HashSet<>();
        uniqueWords.add("hello");
        uniqueWords.add("world");
        uniqueWords.add("hello"); // Duplicate, won't be added
        
        System.out.println("Unique words: " + uniqueWords);
        System.out.println("Contains 'hello': " + uniqueWords.contains("hello"));
    }
}
```

### HashMap for Key-Value Pairs
```java
import java.util.HashMap;
import java.util.Map;

public class HashMapExample {
    public static void main(String[] args) {
        Map<String, Integer> ageMap = new HashMap<>();
        ageMap.put("Alice", 25);
        ageMap.put("Bob", 30);
        ageMap.put("Charlie", 35);
        
        System.out.println("Alice's age: " + ageMap.get("Alice"));
        System.out.println("All entries: " + ageMap.entrySet());
        
        // Iterate over entries
        for (Map.Entry<String, Integer> entry : ageMap.entrySet()) {
            System.out.println(entry.getKey() + " is " + entry.getValue() + " years old");
        }
    }
}
```

### TreeSet for Sorted Unique Elements
```java
import java.util.TreeSet;
import java.util.Set;

public class TreeSetExample {
    public static void main(String[] args) {
        Set<Integer> sortedNumbers = new TreeSet<>();
        sortedNumbers.add(5);
        sortedNumbers.add(1);
        sortedNumbers.add(3);
        sortedNumbers.add(1); // Duplicate, won't be added
        
        System.out.println("Sorted numbers: " + sortedNumbers);
        System.out.println("First element: " + sortedNumbers.first());
        System.out.println("Last element: " + sortedNumbers.last());
    }
}
```

### PriorityQueue for Priority-based Processing
```java
import java.util.PriorityQueue;
import java.util.Queue;

public class PriorityQueueExample {
    public static void main(String[] args) {
        Queue<Task> taskQueue = new PriorityQueue<>((t1, t2) -> t1.priority - t2.priority);
        
        taskQueue.add(new Task("Low priority", 3));
        taskQueue.add(new Task("High priority", 1));
        taskQueue.add(new Task("Medium priority", 2));
        
        while (!taskQueue.isEmpty()) {
            Task task = taskQueue.poll();
            System.out.println("Processing: " + task.description + " (priority: " + task.priority + ")");
        }
    }
    
    static class Task {
        String description;
        int priority;
        
        Task(String description, int priority) {
            this.description = description;
            this.priority = priority;
        }
    }
}
```

## References

- [Oracle Java Collections Tutorial](https://docs.oracle.com/javase/tutorial/collections/index.html)
- [Java Collections Framework Overview](https://docs.oracle.com/javase/8/docs/technotes/guides/collections/overview.html)
- [Effective Java: Chapter 4 - Classes and Interfaces](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)
- [Java Generics and Collections](https://www.amazon.com/Java-Generics-Collections-Maurice-Naftalin/dp/0596527756)

## Github-README Links & Related Topics

- [Java Fundamentals](./java-fundamentals/README.md)
- [OOP Principles in Java](./oop-principles-in-java/README.md)
- [Java Generics](./java-generics/README.md)
- [Multithreading & Concurrency in Java](./multithreading-and-concurrency-in-java/README.md)
- [Java Stream API & Functional Programming](./java-stream-api-and-functional-programming/README.md)