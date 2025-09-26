---
title: Multithreading & Concurrency in Java
aliases: [Java Multithreading, Concurrent Programming in Java]
tags: [#java, #concurrency]
created: 2025-09-26
updated: 2025-09-26
---

# Multithreading & Concurrency in Java

## Overview
Multithreading and concurrency in Java allow programs to perform multiple tasks simultaneously, improving performance and responsiveness. Java provides built-in support for threads, synchronization, and concurrent utilities.

## Detailed Explanation

### Thread Lifecycle
1. **New**: Thread created but not started
2. **Runnable**: Thread ready to run
3. **Running**: Thread executing
4. **Blocked/Waiting**: Thread waiting for resources or I/O
5. **Terminated**: Thread completed execution

### Key Concepts
- **Thread**: Lightweight process
- **Runnable**: Interface for thread execution
- **Synchronization**: Controlling access to shared resources
- **Locks**: More flexible synchronization than synchronized
- **Executors**: Managing thread pools
- **Concurrent Collections**: Thread-safe collections

## Real-world Examples & Use Cases
- **Web Servers**: Handling multiple client requests
- **GUI Applications**: Keeping UI responsive during long operations
- **Data Processing**: Parallel processing of large datasets
- **Game Development**: Separate threads for rendering, physics, AI

## Code Examples

### Creating Threads
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

public class ThreadExample {
    public static void main(String[] args) {
        MyThread thread = new MyThread();
        thread.start();
        
        Thread runnableThread = new Thread(new MyRunnable());
        runnableThread.start();
    }
}
```

### Synchronization
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

public class SyncExample {
    public static void main(String[] args) throws InterruptedException {
        Counter counter = new Counter();
        
        Runnable task = () -> {
            for (int i = 0; i < 1000; i++) {
                counter.increment();
            }
        };
        
        Thread t1 = new Thread(task);
        Thread t2 = new Thread(task);
        
        t1.start();
        t2.start();
        
        t1.join();
        t2.join();
        
        System.out.println("Count: " + counter.getCount());
    }
}
```

### Using ExecutorService
```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ExecutorExample {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(3);
        
        for (int i = 0; i < 5; i++) {
            executor.submit(() -> {
                System.out.println("Task executed by " + Thread.currentThread().getName());
            });
        }
        
        executor.shutdown();
    }
}
```

### Concurrent Collections
```java
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

public class ConcurrentCollectionsExample {
    public static void main(String[] args) {
        ConcurrentHashMap<String, Integer> map = new ConcurrentHashMap<>();
        ConcurrentLinkedQueue<String> queue = new ConcurrentLinkedQueue<>();
        
        // Thread-safe operations
        map.put("key", 1);
        queue.add("item");
    }
}
```

## Common Pitfalls & Edge Cases
- **Race Conditions**: Unpredictable results from unsynchronized access
- **Deadlocks**: Threads waiting indefinitely for each other
- **Starvation**: Thread unable to gain access to resources
- **Memory Consistency Errors**: Visibility issues without proper synchronization

## Tools & Libraries
- **java.util.concurrent**: Concurrent utilities package
- **Thread dumps**: For debugging thread issues
- **Profilers**: Identifying performance bottlenecks

## References
- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- "Java Concurrency in Practice" by Brian Goetz
- [JSR 166: Concurrency Utilities](https://jcp.org/en/jsr/detail?id=166)

## Github-README Links & Related Topics
- [java-multithreading-and-concurrency](../java-multithreading-and-concurrency/)
- [java-concurrenthashmap](../java-concurrenthashmap/)
- [java-executorservice](../java-executorservice/)
