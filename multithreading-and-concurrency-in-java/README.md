---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java,#concurrency,#multithreading]
created: 2025-09-26
updated: 2025-09-26
---

# Multithreading & Concurrency in Java

## Overview

Multithreading and concurrency allow Java programs to execute multiple threads simultaneously, improving performance and responsiveness. Java provides robust support for concurrent programming through its threading API, synchronization mechanisms, and concurrent utilities. Understanding these concepts is crucial for building scalable and efficient applications.

## Detailed Explanation

### Threads in Java

Threads are lightweight processes that share the same memory space.

**Creating Threads:**

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
Thread thread1 = new MyThread();
Thread thread2 = new Thread(new MyRunnable());
thread1.start();
thread2.start();
```

### Synchronization

Synchronization prevents race conditions by ensuring only one thread accesses shared resources at a time.

```java
public class Counter {
    private int count = 0;
    
    public synchronized void increment() {
        count++;
    }
    
    public synchronized int getCount() {
        return count;
    }
}
```

### Volatile Keyword

Ensures visibility of changes across threads.

```java
public class VolatileExample {
    private volatile boolean flag = false;
    
    public void setFlag(boolean flag) {
        this.flag = flag;
    }
    
    public boolean getFlag() {
        return flag;
    }
}
```

### Atomic Variables

Provide thread-safe operations without synchronization.

```java
import java.util.concurrent.atomic.AtomicInteger;

public class AtomicExample {
    private AtomicInteger counter = new AtomicInteger(0);
    
    public void increment() {
        counter.incrementAndGet();
    }
    
    public int getCounter() {
        return counter.get();
    }
}
```

### Concurrent Collections

Thread-safe collections from java.util.concurrent.

```java
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

ConcurrentHashMap<String, String> map = new ConcurrentHashMap<>();
CopyOnWriteArrayList<String> list = new CopyOnWriteArrayList<>();
```

### Executor Framework

High-level API for managing thread pools.

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

ExecutorService executor = Executors.newFixedThreadPool(10);
executor.submit(() -> {
    System.out.println("Task executed");
});
executor.shutdown();
```

### Locks and Conditions

More flexible synchronization than synchronized blocks.

```java
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

Lock lock = new ReentrantLock();

public void method() {
    lock.lock();
    try {
        // Critical section
    } finally {
        lock.unlock();
    }
}
```

## Real-world Examples & Use Cases

- **Web Servers**: Handling multiple client requests concurrently
- **Data Processing**: Parallel processing of large datasets
- **GUI Applications**: Keeping UI responsive while performing background tasks
- **Game Development**: Managing game loops, physics, and rendering in separate threads

## Code Examples

### Producer-Consumer Problem

```java
import java.util.LinkedList;
import java.util.Queue;

public class ProducerConsumer {
    private final Queue<Integer> queue = new LinkedList<>();
    private final int capacity = 10;
    
    public synchronized void produce(int item) throws InterruptedException {
        while (queue.size() == capacity) {
            wait();
        }
        queue.add(item);
        System.out.println("Produced: " + item);
        notifyAll();
    }
    
    public synchronized int consume() throws InterruptedException {
        while (queue.isEmpty()) {
            wait();
        }
        int item = queue.remove();
        System.out.println("Consumed: " + item);
        notifyAll();
        return item;
    }
}
```

### Thread-Safe Singleton

```java
public class Singleton {
    private static volatile Singleton instance;
    
    private Singleton() {}
    
    public static Singleton getInstance() {
        if (instance == null) {
            synchronized (Singleton.class) {
                if (instance == null) {
                    instance = new Singleton();
                }
            }
        }
        return instance;
    }
}
```

## Common Pitfalls & Edge Cases

- **Race Conditions**: Unprotected shared state modifications
- **Deadlocks**: Circular waiting for resources
- **Starvation**: Threads unable to acquire resources
- **Memory Visibility**: Changes not visible across threads without proper synchronization

## Tools & Libraries

- **Thread Dump Analysis**: jstack, VisualVM
- **Concurrent Utilities**: java.util.concurrent package
- **Testing**: JCStress for concurrency testing
- **Profiling**: JProfiler, YourKit

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)
- [JSR 166: Concurrency Utilities](https://jcp.org/en/jsr/detail?id=166)

## Github-README Links & Related Topics

- [Java Volatile Keyword](../java-volatile-keyword/README.md)
- [Java Synchronized Blocks](../java-synchronized-blocks/README.md)
- [Java ExecutorService](../java-executorservice/README.md)
