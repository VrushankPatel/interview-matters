---
title: Concurrency Patterns in Java
aliases: [Java Concurrency Patterns]
tags: [#java,#concurrency]
created: 2025-09-26
updated: 2025-09-26
---

# Concurrency Patterns in Java

## Overview

Concurrency Patterns in Java provide reusable solutions for common problems in multithreaded programming, such as synchronization, communication, and resource sharing. They leverage Java's concurrency utilities like locks, semaphores, and executors.

## Detailed Explanation

### Producer-Consumer Pattern

Producers add items to a buffer, consumers remove them. Uses `BlockingQueue` for thread-safe operations.

### Reader-Writer Pattern

Allows multiple readers or one writer. Uses `ReadWriteLock` to optimize for read-heavy scenarios.

### Thread Pool Pattern

Manages a pool of worker threads. Uses `ExecutorService` to limit thread creation and improve performance.

### Future and Callable Pattern

Asynchronous computation with `Future` and `Callable`. Allows non-blocking operations.

### Atomic Operations

Using `AtomicInteger`, `AtomicReference` for lock-free updates.

### Immutability Pattern

Immutable objects are thread-safe by design.

## Real-world Examples & Use Cases

- **Web Servers**: Thread pools for handling HTTP requests.
- **Database Connections**: Connection pooling with semaphores.
- **Event Processing**: Producer-consumer for log processing.
- **Caching**: Read-write locks for cache updates.

## Code Examples

### Producer-Consumer with BlockingQueue

```java
import java.util.concurrent.*;

public class ProducerConsumer {
    private static final BlockingQueue<Integer> queue = new ArrayBlockingQueue<>(10);

    static class Producer implements Runnable {
        public void run() {
            try {
                for (int i = 0; i < 100; i++) {
                    queue.put(i);
                    System.out.println("Produced: " + i);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    static class Consumer implements Runnable {
        public void run() {
            try {
                while (true) {
                    int item = queue.take();
                    System.out.println("Consumed: " + item);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(2);
        executor.submit(new Producer());
        executor.submit(new Consumer());
        executor.shutdown();
    }
}
```

### Read-Write Lock

```java
import java.util.concurrent.locks.*;

public class ReadWriteExample {
    private final ReadWriteLock lock = new ReentrantReadWriteLock();
    private int value = 0;

    public int read() {
        lock.readLock().lock();
        try {
            return value;
        } finally {
            lock.readLock().unlock();
        }
    }

    public void write(int newValue) {
        lock.writeLock().lock();
        try {
            value = newValue;
        } finally {
            lock.writeLock().unlock();
        }
    }
}
```

### Thread Pool

```java
ExecutorService executor = Executors.newFixedThreadPool(5);
for (int i = 0; i < 10; i++) {
    executor.submit(() -> {
        System.out.println("Task executed by " + Thread.currentThread().getName());
    });
}
executor.shutdown();
```

### Atomic Operations

```java
AtomicInteger counter = new AtomicInteger(0);
int newValue = counter.incrementAndGet();
```

## Common Pitfalls & Edge Cases

- **Deadlocks**: Circular wait for locks.
- **Race Conditions**: Unprotected shared state.
- **Starvation**: Threads waiting indefinitely.
- **Context Switching Overhead**: Too many threads.

## Tools & Libraries

- **java.util.concurrent**: Core concurrency utilities.
- **Guava**: Additional concurrency tools.
- **JMH**: Benchmarking concurrent code.

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)
- [Baeldung: Concurrency Patterns](https://www.baeldung.com/java-concurrency-patterns)

## Github-README Links & Related Topics

- [Java Multithreading](../java-multithreading-and-concurrency/README.md)
- [Concurrent Collections](../concurrent-collections/README.md)
- [Java Executors](../java-executorservice/README.md)
