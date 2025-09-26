---
title: Java Synchronized Blocks
aliases: [Synchronization, Synchronized]
tags: [#java,#concurrency,#threading]
created: 2025-09-25
updated: 2025-09-25
---

# Java Synchronized Blocks

## Overview

Synchronized blocks in Java provide thread-safety by allowing only one thread to execute a block of code at a time, preventing race conditions.

## Detailed Explanation

- **Syntax**: `synchronized (lockObject) { ... }`
- **Intrinsic Locks**: Every object has an intrinsic lock; synchronized methods use `this`.
- **Reentrant**: A thread can acquire the same lock multiple times.
- **Visibility**: Ensures changes are visible to other threads.

## Real-world Examples & Use Cases

- **Shared Resources**: Protecting access to shared data structures like lists or maps.
- **Producer-Consumer**: Synchronizing queues in multi-threaded applications.
- **Banking**: Ensuring atomic transactions.

## Code Examples

### Synchronized Block

```java
public class Counter {
    private int count = 0;
    private final Object lock = new Object();

    public void increment() {
        synchronized (lock) {
            count++;
        }
    }

    public int getCount() {
        synchronized (lock) {
            return count;
        }
    }
}
```

### Synchronized Method

```java
public synchronized void increment() {
    count++;
}
```

### Static Synchronization

```java
public static synchronized void staticMethod() {
    // Class-level lock
}
```

## Common Pitfalls & Edge Cases

- **Deadlocks**: Avoid nested locks that can cause circular waits.
- **Performance**: Over-synchronization can reduce concurrency.
- **Null Lock**: Using null as lock throws NullPointerException.

## References

- [Oracle Synchronization](https://docs.oracle.com/javase/tutorial/essential/concurrency/sync.html)
- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)

## Github-README Links & Related Topics

- [Java ReentrantLock](../java-reentrantlock/README.md)
- [Multithreading and Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)
- [Java Volatile Keyword](../java-volatile-keyword/README.md)