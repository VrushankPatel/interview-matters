---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java,#concurrency,#multithreading]
created: 2025-09-26
updated: 2025-09-26
---

# Multithreading & Concurrency in Java

## Overview

Multithreading allows a program to perform multiple tasks concurrently. Java provides built-in support for multithreading through the Thread class and concurrency utilities in java.util.concurrent package.

## Detailed Explanation

### Threads

- Creating threads: Extend Thread or implement Runnable.

- Thread lifecycle: New, Runnable, Running, Blocked, Terminated.

### Synchronization

- synchronized keyword for mutual exclusion.

- volatile for visibility.

### Concurrency Utilities

- ExecutorService for thread pools.

- Locks: ReentrantLock, ReadWriteLock.

- Atomic variables: AtomicInteger, etc.

- Concurrent collections: ConcurrentHashMap, etc.

### Problems

- Race conditions

- Deadlocks

- Starvation

## Real-world Examples & Use Cases

- Web servers handling multiple requests.

- GUI applications with responsive UI.

- Parallel processing of large datasets.

## Code Examples

### Creating Threads

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

public class Main {
    public static void main(String[] args) {
        MyThread t1 = new MyThread();
        t1.start();

        Thread t2 = new Thread(new MyRunnable());
        t2.start();
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
```

### Using ExecutorService

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ExecutorExample {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(5);
        for (int i = 0; i < 10; i++) {
            Runnable worker = new WorkerThread("" + i);
            executor.execute(worker);
        }
        executor.shutdown();
    }
}

class WorkerThread implements Runnable {
    private String message;

    public WorkerThread(String s) {
        this.message = s;
    }

    public void run() {
        System.out.println(Thread.currentThread().getName() + " Start. Message = " + message);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName() + " End.");
    }
}
```

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)

- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)

## Github-README Links & Related Topics

- [Java ExecutorService](../java-executorservice/README.md)

- [Java Locks](../java-reentrantlock/README.md)
