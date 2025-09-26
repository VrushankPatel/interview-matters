---
title: Multithreading & Concurrency in Java
aliases: [Java Multithreading, Concurrent Programming in Java]
tags: [#java,#concurrency]
created: 2025-09-26
updated: 2025-09-26
---

# Multithreading & Concurrency in Java

## Overview

Multithreading allows a program to execute multiple threads concurrently, improving performance and responsiveness. Concurrency in Java involves managing multiple threads, synchronization, and avoiding issues like race conditions and deadlocks.

## Detailed Explanation

### Threads in Java

- **Creating Threads**: Using Thread class or Runnable interface.
- **Thread Lifecycle**: New, Runnable, Blocked, Waiting, Timed Waiting, Terminated.

### Synchronization

- **Synchronized Methods/Blocks**: Ensure atomicity.
- **Volatile Keyword**: For visibility of changes across threads.
- **Locks**: ReentrantLock, ReadWriteLock.

### Concurrency Utilities

- **Executor Framework**: Thread pools for managing threads.
- **Concurrent Collections**: ConcurrentHashMap, etc.
- **Atomic Variables**: AtomicInteger for lock-free operations.

### Common Issues

- **Race Conditions**: When multiple threads access shared data.
- **Deadlocks**: Circular waiting for resources.
- **Starvation**: A thread unable to gain access to resources.

## Real-world Examples & Use Cases

- **Web Servers**: Handling multiple client requests concurrently.
- **Data Processing**: Parallel computation in big data applications.
- **GUI Applications**: Keeping UI responsive while performing background tasks.

## Code Examples

### Creating a Thread

```java
public class MyThread extends Thread {
    public void run() {
        System.out.println("Thread running");
    }
}

public class Main {
    public static void main(String[] args) {
        MyThread t = new MyThread();
        t.start();
    }
}
```

### Using Runnable

```java
public class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Runnable running");
    }
}

public class Main {
    public static void main(String[] args) {
        Thread t = new Thread(new MyRunnable());
        t.start();
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

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Baeldung: Java Concurrency](https://www.baeldung.com/java-concurrency)

## Github-README Links & Related Topics

- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Collections](../java-collections/README.md)
- [Concurrent Collections](../concurrent-collections/README.md)
