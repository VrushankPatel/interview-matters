---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java, #concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Multithreading & Concurrency in Java

## Overview

Multithreading and concurrency in Java enable programs to perform multiple tasks simultaneously, improving performance and responsiveness. This topic covers thread creation, synchronization, concurrent data structures, and best practices for writing thread-safe code.

## Detailed Explanation

### Threads and Processes

- **Process**: Independent program execution with its own memory space
- **Thread**: Lightweight subprocess within a process, sharing memory

### Thread Lifecycle

1. **New**: Thread created but not started
2. **Runnable**: Ready to run, waiting for CPU
3. **Running**: Currently executing
4. **Blocked**: Waiting for a resource (I/O, lock)
5. **Terminated**: Execution completed

### Thread Creation

#### Extending Thread Class

```java
class MyThread extends Thread {
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
class MyRunnable implements Runnable {
    @Override
    public void run() {
        System.out.println("Runnable running");
    }
}

Thread thread = new Thread(new MyRunnable());
thread.start();
```

### Synchronization

Synchronization prevents race conditions by ensuring only one thread accesses shared resources at a time.

#### Synchronized Methods

```java
class Counter {
    private int count = 0;
    
    public synchronized void increment() {
        count++;
    }
    
    public synchronized int getCount() {
        return count;
    }
}
```

#### Synchronized Blocks

```java
public void increment() {
    synchronized(this) {
        count++;
    }
}
```

### Locks

Java provides more flexible locking mechanisms through the `java.util.concurrent.locks` package.

```java
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class Counter {
    private int count = 0;
    private Lock lock = new ReentrantLock();
    
    public void increment() {
        lock.lock();
        try {
            count++;
        } finally {
            lock.unlock();
        }
    }
}
```

### Concurrent Collections

Thread-safe collections from `java.util.concurrent`:

- `ConcurrentHashMap`: Thread-safe HashMap
- `CopyOnWriteArrayList`: Thread-safe ArrayList for read-heavy operations
- `BlockingQueue`: Thread-safe queue with blocking operations

### Executors and Thread Pools

Managing threads manually can be complex. Executors provide a higher-level API.

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

ExecutorService executor = Executors.newFixedThreadPool(10);
executor.submit(() -> {
    System.out.println("Task executed by: " + Thread.currentThread().getName());
});
executor.shutdown();
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

class ProducerConsumer {
    private Queue<Integer> queue = new LinkedList<>();
    private int capacity = 5;
    
    public synchronized void produce(int value) throws InterruptedException {
        while (queue.size() == capacity) {
            wait();
        }
        queue.add(value);
        System.out.println("Produced: " + value);
        notify();
    }
    
    public synchronized int consume() throws InterruptedException {
        while (queue.isEmpty()) {
            wait();
        }
        int value = queue.poll();
        System.out.println("Consumed: " + value);
        notify();
        return value;
    }
}

class Producer implements Runnable {
    private ProducerConsumer pc;
    
    Producer(ProducerConsumer pc) {
        this.pc = pc;
    }
    
    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            try {
                pc.produce(i);
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

class Consumer implements Runnable {
    private ProducerConsumer pc;
    
    Consumer(ProducerConsumer pc) {
        this.pc = pc;
    }
    
    @Override
    public void run() {
        for (int i = 0; i < 10; i++) {
            try {
                pc.consume();
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

public class ProducerConsumerDemo {
    public static void main(String[] args) {
        ProducerConsumer pc = new ProducerConsumer();
        
        Thread producerThread = new Thread(new Producer(pc));
        Thread consumerThread = new Thread(new Consumer(pc));
        
        producerThread.start();
        consumerThread.start();
    }
}
```

### Atomic Variables

```java
import java.util.concurrent.atomic.AtomicInteger;

class AtomicCounter {
    private AtomicInteger count = new AtomicInteger(0);
    
    public void increment() {
        count.incrementAndGet();
    }
    
    public int getCount() {
        return count.get();
    }
}

public class AtomicDemo {
    public static void main(String[] args) throws InterruptedException {
        AtomicCounter counter = new AtomicCounter();
        
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
        
        System.out.println("Final count: " + counter.getCount()); // Should be 2000
    }
}
```

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)
- [Baeldung Java Concurrency](https://www.baeldung.com/java-concurrency)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Concurrent Collections](../concurrent-collections/README.md)
- [Java Virtual Threads](../java-virtual-threads/README.md)
