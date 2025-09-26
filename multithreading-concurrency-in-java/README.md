---
title: Multithreading & Concurrency in Java
aliases: [Java Threads, Concurrent Programming]
tags: [#java,#concurrency]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Multithreading and Concurrency in Java enable programs to perform multiple tasks simultaneously, improving performance and responsiveness. This topic covers thread creation, synchronization, and concurrent utilities.

# Detailed Explanation

Concurrency allows multiple threads to execute concurrently, sharing resources safely.

## Key Concepts

- **Threads**: Lightweight processes
- **Synchronization**: Preventing race conditions
- **Locks**: ReentrantLock, ReadWriteLock
- **Executors**: Managing thread pools
- **Concurrent Collections**: Thread-safe data structures

## Thread Lifecycle

New -> Runnable -> Running -> Blocked/Waiting -> Terminated

# Real-world Examples & Use Cases

- Web servers handling multiple requests
- GUI applications remaining responsive
- Parallel processing of large datasets
- Implementing producer-consumer patterns

# Code Examples

## Creating Threads

```java
// Extending Thread
public class MyThread extends Thread {
    @Override
    public void run() {
        System.out.println("Thread running");
    }
}

// Implementing Runnable
public class MyRunnable implements Runnable {
    @Override
    public void run() {
        System.out.println("Runnable running");
    }
}

// Usage
Thread t1 = new MyThread();
Thread t2 = new Thread(new MyRunnable());
t1.start();
t2.start();
```

## Synchronization

```java
public class Counter {
    private int count = 0;
    
    public synchronized void increment() {
        count++;
    }
    
    public int getCount() {
        return count;
    }
}
```

## Using ExecutorService

```java
ExecutorService executor = Executors.newFixedThreadPool(5);
for (int i = 0; i < 10; i++) {
    executor.submit(() -> {
        System.out.println("Task executed by " + Thread.currentThread().getName());
    });
}
executor.shutdown();
```

# References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Baeldung Java Concurrency](https://www.baeldung.com/java-concurrency)

# Github-README Links & Related Topics

- [Java Multithreading and Concurrency](../java-multithreading-and-concurrency/)
- [Concurrent Collections](../concurrent-collections/)
- [Java Executors](../java-executorservice/)
