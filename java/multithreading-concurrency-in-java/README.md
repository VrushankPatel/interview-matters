---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java, #concurrency]
created: 2025-09-26
updated: 2025-09-26
---

# Multithreading & Concurrency in Java

## Overview

Multithreading allows a program to perform multiple tasks concurrently. Java provides robust support for multithreading through its concurrency utilities, helping developers write efficient, scalable, and thread-safe applications.

## Detailed Explanation

### Threads

- **Process**: Instance of a program in execution
- **Thread**: Lightweight process within a process
- **Multithreading**: Multiple threads running concurrently

### Creating Threads

```java
// Extending Thread class
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

### Synchronization

Prevents race conditions by controlling access to shared resources.

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

### Concurrency Utilities

- **ExecutorService**: Manages thread pools
- **Concurrent Collections**: Thread-safe collections
- **Locks**: More flexible than synchronized
- **Atomic Variables**: Lock-free operations

### Common Issues

- **Race Conditions**: Unpredictable results from concurrent access
- **Deadlocks**: Threads waiting indefinitely for resources
- **Starvation**: Thread unable to gain access to resources

## Real-world Examples & Use Cases

- Web servers handling multiple client requests
- GUI applications with responsive user interfaces
- Parallel processing of large datasets
- Implementing producer-consumer patterns

## Code Examples

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

public class ConcurrencyExample {
    private static final AtomicInteger counter = new AtomicInteger(0);
    
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(10);
        
        for (int i = 0; i < 100; i++) {
            executor.submit(() -> {
                counter.incrementAndGet();
            });
        }
        
        executor.shutdown();
        while (!executor.isTerminated()) {
            // Wait for all tasks to complete
        }
        
        System.out.println("Final count: " + counter.get());
    }
}
```

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- "Java Concurrency in Practice" by Brian Goetz

## Github-README Links & Related Topics

- [Java Fundamentals](java-fundamentals)
- [Concurrent Collections](concurrent-collections)
