---
title: Collections & Data Structures
aliases: [Java Collections, Data Structures in Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Collections and data structures are fundamental components in Java programming that provide efficient ways to store, organize, and manipulate data. The Java Collections Framework offers a unified architecture for representing and manipulating collections, allowing developers to work with groups of objects in a consistent and efficient manner.

# Detailed Explanation

## Java Collections Framework

The Java Collections Framework consists of:

- **Interfaces**: Define the abstract data types (List, Set, Queue, Map)
- **Implementations**: Concrete classes that implement the interfaces
- **Algorithms**: Static methods for performing operations on collections

### Core Interfaces

| Interface | Description | Common Implementations |
|-----------|-------------|------------------------|
| List | Ordered collection, allows duplicates | ArrayList, LinkedList, Vector |
| Set | Unordered collection, no duplicates | HashSet, TreeSet, LinkedHashSet |
| Queue | FIFO data structure | LinkedList, PriorityQueue |
| Map | Key-value pairs | HashMap, TreeMap, LinkedHashMap |

## Data Structure Characteristics

### Time Complexity Comparison

| Operation | ArrayList | LinkedList | HashSet | TreeSet | HashMap |
|-----------|-----------|------------|---------|---------|---------|
| Add | O(1) | O(1) | O(1) | O(log n) | O(1) |
| Remove | O(n) | O(1) | O(1) | O(log n) | O(1) |
| Get | O(1) | O(n) | O(1) | O(log n) | O(1) |
| Contains | O(n) | O(n) | O(1) | O(log n) | O(1) |

## Thread-Safe Collections

- **Vector**: Synchronized ArrayList
- **Hashtable**: Synchronized HashMap
- **Collections.synchronizedXXX()**: Wrapper methods
- **Concurrent Collections**: ConcurrentHashMap, CopyOnWriteArrayList

# Real-world Examples & Use Cases

## E-commerce Shopping Cart

```java
public class ShoppingCart {
    private List<Item> items = new ArrayList<>();
    
    public void addItem(Item item) {
        items.add(item);
    }
    
    public void removeItem(Item item) {
        items.remove(item);
    }
    
    public double getTotalPrice() {
        return items.stream().mapToDouble(Item::getPrice).sum();
    }
}
```

## User Session Management

```java
public class SessionManager {
    private Map<String, UserSession> sessions = new ConcurrentHashMap<>();
    
    public void createSession(String sessionId, UserSession session) {
        sessions.put(sessionId, session);
    }
    
    public UserSession getSession(String sessionId) {
        return sessions.get(sessionId);
    }
    
    public void invalidateSession(String sessionId) {
        sessions.remove(sessionId);
    }
}
```

## Task Queue System

```java
public class TaskQueue {
    private Queue<Task> queue = new LinkedList<>();
    
    public synchronized void addTask(Task task) {
        queue.offer(task);
        notify();
    }
    
    public synchronized Task getNextTask() throws InterruptedException {
        while (queue.isEmpty()) {
            wait();
        }
        return queue.poll();
    }
}
```

# Code Examples

## ArrayList vs LinkedList

```java
// ArrayList - good for random access
List<String> arrayList = new ArrayList<>();
arrayList.add("First");
arrayList.add("Second");
String element = arrayList.get(0); // O(1)

// LinkedList - good for frequent insertions/deletions
List<String> linkedList = new LinkedList<>();
linkedList.add("First");
linkedList.add("Second");
linkedList.add(1, "Middle"); // O(1) for LinkedList, O(n) for ArrayList
```

## HashSet for Unique Elements

```java
Set<String> uniqueNames = new HashSet<>();
uniqueNames.add("Alice");
uniqueNames.add("Bob");
uniqueNames.add("Alice"); // Duplicate, ignored
System.out.println(uniqueNames.size()); // 2
```

## TreeMap for Sorted Data

```java
Map<String, Integer> sortedMap = new TreeMap<>();
sortedMap.put("Charlie", 30);
sortedMap.put("Alice", 25);
sortedMap.put("Bob", 35);

// Keys are sorted: Alice, Bob, Charlie
for (Map.Entry<String, Integer> entry : sortedMap.entrySet()) {
    System.out.println(entry.getKey() + ": " + entry.getValue());
}
```

## ConcurrentHashMap for Thread Safety

```java
Map<String, String> cache = new ConcurrentHashMap<>();
cache.put("key1", "value1");

// Thread-safe operations
String value = cache.get("key1");
cache.putIfAbsent("key2", "value2");
```

# References

- [Oracle Java Collections Tutorial](https://docs.oracle.com/javase/tutorial/collections/)
- [Java Collections Framework Overview](https://www.baeldung.com/java-collections)

# Github-README Links & Related Topics

- [Java Collections Deep Dive](../java-collections-deep-dive)
- [Concurrent Collections](../concurrent-collections)
- [Data Structures Algorithms](../algorithms)