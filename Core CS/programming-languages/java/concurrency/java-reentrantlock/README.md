---
title: Java ReentrantLock
aliases: [ReentrantLock, Java Lock]
tags: [#java,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Java ReentrantLock

## Overview

Java ReentrantLock is a synchronization primitive that allows a thread to acquire the same lock multiple times without deadlocking. It provides more flexibility than synchronized blocks.

## Detailed Explanation

ReentrantLock implements the Lock interface. It supports reentrancy, meaning a thread can lock it multiple times. Key methods: `lock()`, `unlock()`, `tryLock()`, `lockInterruptibly()`.

It can be fair or unfair (default unfair for better performance).

```mermaid
graph TD
    A[Thread calls lock()] --> B{Is lock free?}
    B -->|Yes| C[Acquire lock]
    B -->|No| D{Is current thread owner?}
    D -->|Yes| E[Increment hold count]
    D -->|No| F[Wait]
```

## Real-world Examples & Use Cases

- Complex synchronization scenarios requiring fairness.
- Avoiding deadlocks in recursive methods.
- Producer-consumer patterns.

## Code Examples

```java
import java.util.concurrent.locks.ReentrantLock;

public class ReentrantLockExample {
    private final ReentrantLock lock = new ReentrantLock();
    private int count = 0;

    public void increment() {
        lock.lock();
        try {
            count++;
        } finally {
            lock.unlock();
        }
    }

    public int getCount() {
        lock.lock();
        try {
            return count;
        } finally {
            lock.unlock();
        }
    }
}
```

## Common Pitfalls & Edge Cases

- Always unlock in finally block to prevent leaks.
- Avoid using with synchronized; can cause issues.

## References

- [Oracle JavaDoc: ReentrantLock](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/locks/ReentrantLock.html)
- [Java Concurrency in Practice - Chapter 13](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)

## Github-README Links & Related Topics

- [java-readwritelock](java-readwritelock/README.md)
- [java-volatile-keyword](java-volatile-keyword/README.md)
- [Multithreading & Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)