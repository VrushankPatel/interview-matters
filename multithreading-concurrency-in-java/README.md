---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java, #concurrency, #multithreading]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Multithreading and concurrency in Java allow programs to perform multiple tasks simultaneously, improving performance and responsiveness. Java provides robust support for concurrent programming through threads, synchronization mechanisms, and concurrent utilities.

# Detailed Explanation

## Threads

Creating threads:
- Extending Thread class
- Implementing Runnable interface

```java
// Extending Thread
public class MyThread extends Thread {
    public void run() {
        System.out.println("Thread running");
    }
}

// Implementing Runnable
public class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Runnable running");
    }
}
```

## Synchronization

Preventing race conditions:
- synchronized methods/blocks
- volatile keyword
- Locks (ReentrantLock)

## Concurrent Collections

Thread-safe collections: ConcurrentHashMap, CopyOnWriteArrayList

## Executors and Thread Pools

Managing thread lifecycles with ExecutorService.

```java
ExecutorService executor = Executors.newFixedThreadPool(10);
executor.submit(() -> System.out.println("Task executed"));
executor.shutdown();
```

## Common Pitfalls & Edge Cases

- Deadlocks
- Race conditions
- Thread starvation
- Memory consistency issues

# Real-world Examples & Use Cases

- Web servers handling multiple client requests.
- GUI applications remaining responsive during long operations.
- Data processing pipelines with parallel computation.

# Code Examples

### Producer-Consumer Pattern

```java
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class ProducerConsumer {
    private static BlockingQueue<Integer> queue = new LinkedBlockingQueue<>();

    public static void main(String[] args) {
        Thread producer = new Thread(() -> {
            try {
                for (int i = 0; i < 10; i++) {
                    queue.put(i);
                    System.out.println("Produced: " + i);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        Thread consumer = new Thread(() -> {
            try {
                for (int i = 0; i < 10; i++) {
                    int item = queue.take();
                    System.out.println("Consumed: " + item);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        producer.start();
        consumer.start();
    }
}
```

# References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [GeeksforGeeks - Multithreading in Java](https://www.geeksforgeeks.org/multithreading-in-java/)

# Github-README Links & Related Topics

- [java-memory-model-and-concurrency](../java-memory-model-and-concurrency/README.md)
- [concurrent-programming-patterns](../concurrent-programming-patterns/README.md)
- [threads-executors-futures](../threads-executors-futures/README.md)
