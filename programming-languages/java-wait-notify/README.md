---
title: Java Wait Notify
aliases: [Wait, Notify, Thread Communication]
tags: [#java,#concurrency,#threading]
created: 2025-09-25
updated: 2025-09-25
---

# Java Wait Notify

## Overview

`wait()`, `notify()`, and `notifyAll()` methods in Java enable inter-thread communication, allowing threads to wait for conditions and signal each other.

## Detailed Explanation

- **wait()**: Causes current thread to wait until notified; releases the lock.
- **notify()**: Wakes up one waiting thread.
- **notifyAll()**: Wakes up all waiting threads.
- Must be called within synchronized blocks.
- Used for producer-consumer patterns, barriers, etc.

## Real-world Examples & Use Cases

- **Producer-Consumer Pattern**: Threads producing and consuming from a shared buffer.
- **Thread Barriers**: Waiting for multiple threads to reach a point.
- **Resource Pooling**: Managing limited resources.

## Code Examples

### Producer-Consumer

```java
class SharedBuffer {
    private final Queue<Integer> queue = new LinkedList<>();
    private final int capacity = 10;

    public synchronized void produce(int item) throws InterruptedException {
        while (queue.size() == capacity) {
            wait();
        }
        queue.add(item);
        notifyAll();
    }

    public synchronized int consume() throws InterruptedException {
        while (queue.isEmpty()) {
            wait();
        }
        int item = queue.poll();
        notifyAll();
        return item;
    }
}
```

### Simple Wait Notify

```java
Object lock = new Object();
synchronized (lock) {
    lock.wait(); // Wait for notification
}

// In another thread:
synchronized (lock) {
    lock.notify();
}
```

## Common Pitfalls & Edge Cases

- **Spurious Wakeups**: Always check condition in a loop.
- **Lost Signals**: Ensure notify is called after state change.
- **IllegalMonitorStateException**: Must hold lock.

## References

- [Oracle Wait and Notify](https://docs.oracle.com/javase/tutorial/essential/concurrency/guardmeth.html)
- [Baeldung Wait Notify](https://www.baeldung.com/java-wait-notify)

## Github-README Links & Related Topics

- [Java Synchronized Blocks](../java-synchronized-blocks/README.md)
- [Java Condition Interface](../java-condition-interface/README.md)
- [Multithreading and Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)