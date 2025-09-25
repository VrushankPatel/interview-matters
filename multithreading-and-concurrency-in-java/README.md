---
title: Multithreading & Concurrency in Java
aliases: []
tags: [#java,#concurrency,#multithreading]
created: 2025-09-25
updated: 2025-09-25
---

# Multithreading & Concurrency in Java

## Overview

Multithreading and concurrency in Java allow programs to perform multiple tasks simultaneously, improving performance and responsiveness. This topic covers thread creation, synchronization, communication, and common concurrency utilities in Java.

## Detailed Explanation

### Thread Basics

- **Thread:** A lightweight process, the smallest unit of processing.
- **Process:** A program in execution with its own memory space.
- **Concurrency vs Parallelism:** Concurrency is about dealing with multiple tasks, parallelism is about executing them simultaneously.

### Thread Lifecycle

1. **New:** Thread created but not started.
2. **Runnable:** Ready to run, waiting for CPU.
3. **Running:** Currently executing.
4. **Blocked/Waiting:** Waiting for resources or I/O.
5. **Terminated:** Execution completed.

### Creating Threads

#### Extending Thread Class

```java
public class MyThread extends Thread {
    @Override
    public void run() {
        System.out.println("Thread running");
    }
}

MyThread thread = new MyThread();
thread.start();
```

#### Implementing Runnable

```java
public class MyRunnable implements Runnable {
    @Override
    public void run() {
        System.out.println("Runnable running");
    }
}

Thread thread = new Thread(new MyRunnable());
thread.start();
```

### Synchronization

Synchronization ensures that only one thread can access a shared resource at a time.

- **synchronized keyword:** Locks the object or method.

```java
public synchronized void synchronizedMethod() {
    // Only one thread can execute this at a time
}
```

- **synchronized block:**

```java
synchronized (this) {
    // Critical section
}
```

### Volatile Keyword

Ensures visibility of changes to variables across threads.

```java
private volatile boolean flag = false;
```

### Atomic Variables

Classes like AtomicInteger provide thread-safe operations without locks.

```java
AtomicInteger counter = new AtomicInteger(0);
counter.incrementAndGet();
```

### Thread Communication

- **wait(), notify(), notifyAll():** For inter-thread communication.

```java
synchronized (obj) {
    obj.wait(); // Release lock and wait
    // ...
    obj.notify(); // Wake up waiting threads
}
```

### Concurrency Utilities

- **ExecutorService:** For managing thread pools.
- **Lock interface:** More flexible than synchronized.
- **Semaphore:** Controls access to resources.
- **CountDownLatch:** Allows threads to wait for each other.
- **CyclicBarrier:** Synchronizes threads at a barrier.

## Real-world Examples & Use Cases

- **Web Servers:** Handling multiple client requests concurrently.
- **Data Processing:** Parallel processing of large datasets.
- **GUI Applications:** Keeping UI responsive while performing background tasks.
- **Game Development:** Updating game state and rendering simultaneously.

## Code Examples

### Basic Thread Creation

```java
public class ThreadExample {
    public static void main(String[] args) {
        Thread thread1 = new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                System.out.println("Thread 1: " + i);
            }
        });
        
        Thread thread2 = new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                System.out.println("Thread 2: " + i);
            }
        });
        
        thread1.start();
        thread2.start();
    }
}
```

### Synchronization Example

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
        
        Thread t1 = new Thread(() -> {
            for (int i = 0; i < 1000; i++) {
                counter.increment();
            }
        });
        
        Thread t2 = new Thread(() -> {
            for (int i = 0; i < 1000; i++) {
                counter.increment();
            }
        });
        
        t1.start();
        t2.start();
        t1.join();
        t2.join();
        
        System.out.println("Final count: " + counter.getCount()); // Should be 2000
    }
}
```

### Using ExecutorService

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ExecutorExample {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(2);
        
        executor.submit(() -> System.out.println("Task 1"));
        executor.submit(() -> System.out.println("Task 2"));
        
        executor.shutdown();
    }
}
```

## Common Pitfalls & Edge Cases

- **Race Conditions:** When multiple threads access shared data without proper synchronization.
- **Deadlocks:** Threads waiting for each other indefinitely.
- **Starvation:** A thread unable to gain access to resources.
- **Memory Consistency Issues:** Changes not visible across threads without volatile or synchronization.

## Tools & Libraries

- **Thread Dump:** jstack for analyzing thread states.
- **VisualVM:** Monitor threads and detect deadlocks.
- **Java Concurrency Utilities:** java.util.concurrent package.

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Baeldung: Java Concurrency](https://www.baeldung.com/java-concurrency)
- [GeeksforGeeks: Multithreading in Java](https://www.geeksforgeeks.org/multithreading-in-java/)

## Github-README Links & Related Topics

- [Java Concurrent Collections](../java-concurrent-collections)
- [Java Locks and Synchronizers](../java-locks-and-synchronizers)
- [Java Atomic Variables](../java-atomic-variables)
