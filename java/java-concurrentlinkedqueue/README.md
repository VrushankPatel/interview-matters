---
title: Java ConcurrentLinkedQueue
aliases: [ConcurrentLinkedQueue in Java]
tags: [#java,#concurrency,#collections]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

ConcurrentLinkedQueue is an unbounded thread-safe queue based on linked nodes, implementing the Queue interface. It provides non-blocking, wait-free operations for adding and removing elements, making it suitable for high-concurrency scenarios where blocking is undesirable.

## Detailed Explanation

ConcurrentLinkedQueue uses a lock-free algorithm based on Compare-And-Swap (CAS) operations, allowing multiple threads to concurrently add and remove elements without synchronization overhead. It's a FIFO (First-In-First-Out) queue that can grow dynamically.

Key characteristics:
- **Non-blocking**: Operations don't block; they either succeed or fail immediately.
- **Thread-safe**: Safe for concurrent access by multiple threads.
- **Unbounded**: No capacity limit; can grow as needed.
- **Weakly consistent iterators**: Iterators may not reflect concurrent modifications.

### Data Model

```
Head -> Node1 -> Node2 -> ... -> Tail
```

Each node contains the element and references to next node.

## Real-world Examples & Use Cases

1. **Task Scheduling**: Queuing tasks for worker threads in thread pools.
2. **Event Processing**: Handling events in high-throughput systems.
3. **Message Passing**: Inter-thread communication without blocking.
4. **Work Stealing**: Implementing work-stealing algorithms in parallel computing.

## Code Examples

### Basic Usage

```java
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

public class ConcurrentLinkedQueueExample {
    public static void main(String[] args) {
        Queue<String> queue = new ConcurrentLinkedQueue<>();
        
        // Adding elements
        queue.offer("Task 1");
        queue.offer("Task 2");
        queue.add("Task 3");
        
        // Removing elements
        String task = queue.poll(); // Non-blocking remove
        System.out.println("Processed: " + task);
        
        // Peeking
        String next = queue.peek();
        System.out.println("Next task: " + next);
        
        // Size (expensive operation)
        System.out.println("Queue size: " + queue.size());
    }
}
```

### Producer-Consumer Pattern

```java
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ProducerConsumerExample {
    private static final Queue<Integer> queue = new ConcurrentLinkedQueue<>();
    
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(4);
        
        // Producer
        executor.submit(() -> {
            for (int i = 0; i < 10; i++) {
                queue.offer(i);
                System.out.println("Produced: " + i);
            }
        });
        
        // Consumers
        for (int i = 0; i < 3; i++) {
            executor.submit(() -> {
                while (true) {
                    Integer item = queue.poll();
                    if (item != null) {
                        System.out.println("Consumed: " + item);
                    }
                    // In real code, add termination condition
                }
            });
        }
        
        executor.shutdown();
    }
}
```

### Weakly Consistent Iteration

```java
import java.util.Iterator;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

public class IterationExample {
    public static void main(String[] args) {
        Queue<String> queue = new ConcurrentLinkedQueue<>();
        queue.add("A");
        queue.add("B");
        queue.add("C");
        
        Iterator<String> iterator = queue.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
            // Concurrent modifications may or may not be visible
            queue.add("D"); // This might not appear in current iteration
        }
    }
}
```

## Common Pitfalls & Edge Cases

- **Size() Performance**: `size()` traverses the entire queue, O(n) time complexity.
- **Null Elements**: Does not allow null elements; `offer(null)` throws NullPointerException.
- **Iterator Consistency**: Iterators are weakly consistent; concurrent modifications may not be reflected.
- **Memory Usage**: Unbounded growth can lead to OutOfMemoryError if not managed.

## Tools & Libraries

- **JDK**: Built-in `java.util.concurrent.ConcurrentLinkedQueue`
- **Alternatives**: `LinkedBlockingQueue` for bounded blocking queues

## References

- [Oracle Java Documentation: ConcurrentLinkedQueue](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ConcurrentLinkedQueue.html)
- [Java Concurrency in Practice - Chapter 5](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)

## Github-README Links & Related Topics

- [Java BlockingQueue](./java-blockingqueue/README.md)
- [Collections & Data Structures](./collections-and-data-structures/README.md)
- [Multithreading & Concurrency in Java](./multithreading-and-concurrency-in-java/README.md)