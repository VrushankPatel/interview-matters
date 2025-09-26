---
title: Concurrent Programming Patterns
aliases: [Concurrency Patterns, Java Concurrency Patterns]
tags: [#java,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Concurrent programming patterns are reusable solutions to common synchronization and communication problems in multi-threaded applications. In Java, these patterns leverage threads, locks, and concurrent utilities to ensure thread safety, avoid race conditions, and optimize performance.

# Detailed Explanation

Common patterns include:

- **Producer-Consumer**: Producers add items to a shared buffer, consumers remove them. Uses `BlockingQueue` for synchronization.
- **Reader-Writer**: Multiple readers can access data simultaneously, but writers have exclusive access. Implemented with `ReadWriteLock`.
- **Worker Thread Pool**: A pool of threads processes tasks from a queue, managed by `ExecutorService`.
- **Barrier**: Threads wait at a synchronization point until all reach it, using `CyclicBarrier`.
- **Future and Callable**: Asynchronous computation with results, via `Future` and `ExecutorService`.

These patterns prevent issues like deadlocks and starvation.

# Real-world Examples & Use Cases

- **Web Servers**: Producer-Consumer for handling HTTP requests in a thread pool.
- **Database Connections**: Worker Thread Pool for managing connection pools.
- **File Processing**: Reader-Writer for concurrent reads with occasional writes.
- **Scientific Simulations**: Barrier for synchronizing parallel computations.

# Code Examples

## Producer-Consumer with BlockingQueue

```java
import java.util.concurrent.*;

public class ProducerConsumer {
    private static final int CAPACITY = 10;
    private final BlockingQueue<Integer> queue = new ArrayBlockingQueue<>(CAPACITY);

    public void produce() throws InterruptedException {
        int value = 0;
        while (true) {
            queue.put(value);
            System.out.println("Produced: " + value);
            value++;
            Thread.sleep(1000);
        }
    }

    public void consume() throws InterruptedException {
        while (true) {
            int value = queue.take();
            System.out.println("Consumed: " + value);
            Thread.sleep(2000);
        }
    }
}
```

## Reader-Writer Lock

```java
import java.util.concurrent.locks.*;

public class ReadWriteExample {
    private final ReadWriteLock lock = new ReentrantReadWriteLock();
    private int data = 0;

    public void read() {
        lock.readLock().lock();
        try {
            System.out.println("Reading: " + data);
        } finally {
            lock.readLock().unlock();
        }
    }

    public void write(int value) {
        lock.writeLock().lock();
        try {
            data = value;
            System.out.println("Writing: " + value);
        } finally {
            lock.writeLock().unlock();
        }
    }
}
```

# References

- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)
- [Oracle Java Tutorials: Concurrency](https://docs.oracle.com/javase/tutorial/essential/concurrency/)

# Github-README Links & Related Topics

- [Multithreading & Concurrency in Java](../java/multithreading-and-concurrency-in-java/README.md)
- [Concurrent Collections](../java/concurrent-collections/README.md)
- [Threads Executors Futures](../java/threads-executors-futures/README.md)