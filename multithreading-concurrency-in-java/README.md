---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java, #concurrency, #multithreading]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Multithreading and concurrency in Java allow programs to perform multiple tasks simultaneously, improving performance and responsiveness. This topic covers thread creation, synchronization, concurrent data structures, and best practices for writing thread-safe code. Understanding these concepts is crucial for developing scalable and efficient Java applications.

# Detailed Explanation

## Threads and Processes

- **Process**: An instance of a program in execution
- **Thread**: A lightweight subprocess within a process
- Threads share the same memory space but have their own stack

## Thread Lifecycle

1. **New**: Thread created but not started
2. **Runnable**: Thread ready to run, waiting for CPU time
3. **Running**: Thread currently executing
4. **Blocked**: Thread waiting for a resource or I/O
5. **Terminated**: Thread completed execution

## Creating Threads

### Extending Thread Class
```java
public class MyThread extends Thread {
    @Override
    public void run() {
        // Thread logic
    }
}
```

### Implementing Runnable Interface
```java
public class MyRunnable implements Runnable {
    @Override
    public void run() {
        // Thread logic
    }
}
```

## Synchronization

Synchronization ensures that only one thread can access a shared resource at a time.

### Synchronized Methods
```java
public synchronized void synchronizedMethod() {
    // Critical section
}
```

### Synchronized Blocks
```java
public void method() {
    synchronized(this) {
        // Critical section
    }
}
```

## Locks

Java provides more flexible locking mechanisms through the `java.util.concurrent.locks` package.

### ReentrantLock
```java
Lock lock = new ReentrantLock();
lock.lock();
try {
    // Critical section
} finally {
    lock.unlock();
}
```

## Concurrent Collections

Thread-safe collections from `java.util.concurrent`:

- **ConcurrentHashMap**: Thread-safe HashMap
- **CopyOnWriteArrayList**: Thread-safe ArrayList for read-heavy operations
- **BlockingQueue**: Queue that blocks when full/empty

## Thread Communication

### wait(), notify(), notifyAll()
```java
synchronized (object) {
    object.wait(); // Release lock and wait
    // ...
    object.notify(); // Wake up waiting threads
}
```

## Executor Framework

High-level concurrency API for managing thread pools.

```java
ExecutorService executor = Executors.newFixedThreadPool(10);
executor.submit(new Runnable() { /* task */ });
executor.shutdown();
```

# Real-world Examples & Use Cases

1. **Web Servers**: Handling multiple client requests concurrently
2. **Data Processing**: Parallel processing of large datasets
3. **GUI Applications**: Keeping UI responsive while performing background tasks
4. **Game Development**: Managing game loops, physics, and rendering in separate threads

# Code Examples

### Basic Thread Creation
```java
public class ThreadExample {
    public static void main(String[] args) {
        Thread thread1 = new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                System.out.println("Thread 1: " + i);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        
        Thread thread2 = new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                System.out.println("Thread 2: " + i);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        
        thread1.start();
        thread2.start();
    }
}
```

### Producer-Consumer Problem
```java
import java.util.LinkedList;
import java.util.Queue;

public class ProducerConsumer {
    private final Queue<Integer> queue = new LinkedList<>();
    private final int capacity = 5;
    
    public void produce() throws InterruptedException {
        int value = 0;
        while (true) {
            synchronized (this) {
                while (queue.size() == capacity) {
                    wait();
                }
                System.out.println("Produced: " + value);
                queue.add(value++);
                notify();
                Thread.sleep(1000);
            }
        }
    }
    
    public void consume() throws InterruptedException {
        while (true) {
            synchronized (this) {
                while (queue.isEmpty()) {
                    wait();
                }
                int val = queue.poll();
                System.out.println("Consumed: " + val);
                notify();
                Thread.sleep(1000);
            }
        }
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
            final int taskId = i;
            executor.submit(() -> {
                System.out.println("Task " + taskId + " executed by " + Thread.currentThread().getName());
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }
        
        executor.shutdown();
    }
}
```

### Atomic Variables
```java
import java.util.concurrent.atomic.AtomicInteger;

public class AtomicExample {
    private static AtomicInteger counter = new AtomicInteger(0);
    
    public static void main(String[] args) throws InterruptedException {
        Runnable task = () -> {
            for (int i = 0; i < 1000; i++) {
                counter.incrementAndGet();
            }
        };
        
        Thread t1 = new Thread(task);
        Thread t2 = new Thread(task);
        
        t1.start();
        t2.start();
        
        t1.join();
        t2.join();
        
        System.out.println("Final count: " + counter.get()); // Should be 2000
    }
}
```

# Common Pitfalls & Edge Cases

1. **Race Conditions**: Multiple threads accessing shared data without proper synchronization
2. **Deadlocks**: Threads waiting indefinitely for resources held by each other
3. **Starvation**: A thread unable to gain access to shared resources
4. **Memory Visibility**: Changes made by one thread not visible to others without proper synchronization

# References

- [Oracle Java Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/index.html)
- [Java Threading and Concurrency](https://docs.oracle.com/javase/8/docs/api/java/lang/Thread.html)
- [Concurrent Programming in Java](https://docs.oracle.com/javase/8/docs/technotes/guides/concurrency/index.html)
- [Executor Framework](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/Executor.html)

# Github-README Links & Related Topics

- [Java Fundamentals](java-fundamentals)
- [Java Memory Model and Concurrency](java-memory-model-and-concurrency)
- [Concurrent Collections](concurrent-collections)
- [Java Locks](java-locks)
