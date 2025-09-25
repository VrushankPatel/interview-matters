---
title: Concurrent Collections in Java
aliases: [Thread-safe Collections, Concurrent Data Structures]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Concurrent collections in Java provide thread-safe implementations of common data structures, allowing safe access and modification from multiple threads without external synchronization. They are part of the `java.util.concurrent` package and offer better performance than synchronized wrappers.

## Detailed Explanation

Unlike synchronized collections (e.g., `Collections.synchronizedList()`), concurrent collections use fine-grained locking or lock-free algorithms to minimize contention. Key classes include `ConcurrentHashMap`, `ConcurrentLinkedQueue`, `CopyOnWriteArrayList`, and `BlockingQueue` implementations.

Key features:
- **ConcurrentHashMap**: High-concurrency hash map with segment-based locking.
- **CopyOnWriteArrayList**: Thread-safe list for read-heavy scenarios.
- **ConcurrentLinkedQueue**: Lock-free queue for producer-consumer patterns.
- **BlockingQueue**: Queues that block on empty/full conditions.

## Real-world Examples & Use Cases

- **Caching**: Storing frequently accessed data in a thread-safe map.
- **Producer-Consumer**: Using queues for task distribution in thread pools.
- **Configuration Management**: Sharing immutable settings across threads.
- **Event Handling**: Collecting events from multiple sources.

## Code Examples

### ConcurrentHashMap

```java
ConcurrentHashMap<String, Integer> map = new ConcurrentHashMap<>();

// Thread-safe operations
map.put("key1", 1);
Integer value = map.get("key1");
map.computeIfAbsent("key2", k -> 2);

// Parallel processing
map.forEach(1, (key, val) -> System.out.println(key + ": " + val));
```

### CopyOnWriteArrayList

```java
CopyOnWriteArrayList<String> list = new CopyOnWriteArrayList<>();

// Safe for iteration during modification
list.add("item1");
list.add("item2");

for (String item : list) {
    if (item.equals("item1")) {
        list.add("item3"); // Creates a new copy
    }
}
```

### ConcurrentLinkedQueue

```java
ConcurrentLinkedQueue<String> queue = new ConcurrentLinkedQueue<>();

// Producer
queue.offer("task1");
queue.offer("task2");

// Consumer
String task = queue.poll(); // Non-blocking
```

### BlockingQueue Example

```java
BlockingQueue<String> queue = new ArrayBlockingQueue<>(10);

// Producer thread
queue.put("message"); // Blocks if full

// Consumer thread
String message = queue.take(); // Blocks if empty
```

## Common Pitfalls & Edge Cases

- Iterators may not reflect concurrent modifications.
- `CopyOnWriteArrayList` is expensive for frequent writes.
- Size operations are approximate in some implementations.
- Deadlocks possible if not careful with blocking operations.

## Tools & Libraries

- Java's `java.util.concurrent` package
- Third-party: Guava's concurrent collections

## References

- [Oracle Java Documentation: Concurrent Collections](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/concurrent/package-summary.html)
- [Concurrent Programming in Java](https://www.oracle.com/technetwork/java/javase/documentation/index-137868.html)

## Github-README Links & Related Topics

- [Multithreading & Concurrency in Java](java/java-memory-model-and-concurrency/README.md)
- [Concurrent Programming Patterns](concurrent-programming-patterns/README.md)