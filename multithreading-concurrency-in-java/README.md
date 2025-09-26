---
title: Multithreading & Concurrency in Java
aliases: [multithreading, concurrency]
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

### Threads
Threads are the basic units of execution in Java, allowing concurrent tasks. Each thread has its own call stack but shares memory with other threads in the same process.

- **Creating Threads**: Use the `Thread` class or implement `Runnable`. Threads can be started with `start()`, which calls `run()` asynchronously.
- **Thread States**: New, Runnable, Blocked, Waiting, Timed Waiting, Terminated.
- **Key Methods**:
  - `start()`: Begins execution.
  - `join()`: Waits for thread completion.
  - `sleep(long millis)`: Pauses execution.
  - `interrupt()`: Signals interruption.
- **Example**:
  ```java
  Thread thread = new Thread(() -> {
      System.out.println("Running in thread: " + Thread.currentThread().getName());
  });
  thread.start();
  ```

### Synchronization
Synchronization prevents thread interference and memory consistency errors by controlling access to shared resources.

- **Thread Interference**: Occurs when threads access shared data simultaneously, leading to unpredictable results.
- **Memory Consistency Errors**: Threads may see stale values due to caching; synchronization establishes happens-before relationships.
- **Synchronized Methods/Blocks**: Use `synchronized` keyword on methods or blocks. It uses intrinsic locks (monitor locks).
  - Example: `public synchronized void method() { ... }`
- **Atomic Access**: Operations like reading/writing primitives (except `long`/`double`) are atomic, but compound actions need synchronization.
- **Guarded Blocks**: Use `wait()`/`notify()` for condition-based synchronization.
- **Immutable Objects**: Thread-safe by design; avoid shared mutable state.

### Locks
Locks provide more flexible synchronization than intrinsic locks, via `java.util.concurrent.locks`.

- **ReentrantLock**: Basic lock; supports `lock()`, `unlock()`, `tryLock()`, `lockInterruptibly()`.
- **ReadWriteLock**: Allows multiple readers or one writer; implemented by `ReentrantReadWriteLock`.
- **Advantages over Synchronized**: Try-lock with timeout, interruptible locking, fairness policies.
- **Example (Read-Write Lock)**:
  ```java
  ReadWriteLock lock = new ReentrantReadWriteLock();
  lock.readLock().lock();
  try { /* read */ } finally { lock.readLock().unlock(); }
  ```
- **Deadlock Prevention**: Use `tryLock()` to avoid circular waits.

### Concurrent Collections
Thread-safe collections in `java.util.concurrent` avoid synchronization overhead.

- **ConcurrentHashMap**: High-concurrency hash map; retrievals don't block, updates are fine-grained. Supports bulk ops like `forEach`, `search`, `reduce`. No null keys/values.
  - Example: `ConcurrentHashMap<String, Integer> map = new ConcurrentHashMap<>(); map.putIfAbsent(key, value);`
- **BlockingQueue**: FIFO queue that blocks on full/empty. Implementations: `ArrayBlockingQueue` (bounded), `LinkedBlockingQueue` (optionally bounded), `PriorityBlockingQueue`.
  - Example: `BlockingQueue<String> queue = new ArrayBlockingQueue<>(10); queue.put("item"); String item = queue.take();`
- **ConcurrentLinkedQueue**: Non-blocking, unbounded queue using CAS; suitable for high-concurrency producer-consumer.
- **Other**: `ConcurrentSkipListMap` (navigable map), atomic variables like `AtomicInteger` for lock-free updates.

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
