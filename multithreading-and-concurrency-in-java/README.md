---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java,#concurrency,#multithreading]
created: 2025-09-26
updated: 2025-09-26
---

# Multithreading & Concurrency in Java

## Overview

Multithreading and concurrency are fundamental concepts in Java for building responsive and efficient applications. Multithreading allows multiple threads to execute concurrently within a single process, while concurrency deals with managing multiple tasks that may or may not run simultaneously. Java provides robust support for multithreading through its Thread class, Runnable interface, and various synchronization mechanisms. Understanding these concepts is crucial for developing scalable, high-performance applications.

## Detailed Explanation

### Threads vs Processes
- **Process**: Independent execution unit with its own memory space
- **Thread**: Lightweight execution unit within a process, sharing memory

### Concurrency vs Parallelism
- **Concurrency**: Dealing with multiple tasks (can be interleaved)
- **Parallelism**: Multiple tasks executing simultaneously (requires multiple cores)

### Thread Lifecycle
1. **New**: Thread created but not started
2. **Runnable**: Ready to run, waiting for CPU time
3. **Running**: Currently executing
4. **Blocked**: Waiting for a resource (I/O, lock)
5. **Terminated**: Execution completed

### Synchronization
Synchronization ensures thread-safe access to shared resources.

#### Methods:
- **synchronized keyword**: Locks on object/method level
- **Locks**: More flexible locking with java.util.concurrent.locks
- **Atomic variables**: Lock-free thread-safe operations
- **Volatile keyword**: Ensures visibility of changes across threads

### Thread Communication
- **wait(), notify(), notifyAll()**: Object-level communication
- **Condition**: More flexible with Lock interfaces
- **BlockingQueues**: Thread-safe queues for producer-consumer patterns

### Concurrent Collections
Thread-safe alternatives to standard collections:
- ConcurrentHashMap
- CopyOnWriteArrayList
- BlockingQueue implementations

## Real-world Examples & Use Cases

1. **Web Servers**: Handling multiple client requests concurrently
2. **Database Connection Pools**: Managing shared database connections
3. **GUI Applications**: Keeping UI responsive while performing background tasks
4. **Data Processing Pipelines**: Parallel processing of large datasets
5. **Game Development**: Managing game loops, physics, and rendering in separate threads

## Code Examples

### Creating Threads
```java
// Method 1: Extending Thread class
public class MyThread extends Thread {
    @Override
    public void run() {
        System.out.println("Thread running: " + Thread.currentThread().getName());
    }
    
    public static void main(String[] args) {
        MyThread thread = new MyThread();
        thread.start(); // Don't call run() directly
    }
}

// Method 2: Implementing Runnable interface (preferred)
public class MyRunnable implements Runnable {
    @Override
    public void run() {
        System.out.println("Runnable running: " + Thread.currentThread().getName());
    }
    
    public static void main(String[] args) {
        Thread thread = new Thread(new MyRunnable());
        thread.start();
    }
}
```

### Synchronization Example
```java
public class Counter {
    private int count = 0;
    
    // Synchronized method
    public synchronized void increment() {
        count++;
    }
    
    // Synchronized block
    public void incrementWithBlock() {
        synchronized (this) {
            count++;
        }
    }
    
    public int getCount() {
        return count;
    }
}

public class SynchronizationExample {
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
        
        System.out.println("Final count: " + counter.getCount()); // Should be 2000
    }
}
```

### Producer-Consumer Pattern
```java
import java.util.LinkedList;
import java.util.Queue;

public class ProducerConsumer {
    private static final int CAPACITY = 5;
    private final Queue<Integer> queue = new LinkedList<>();
    
    public void produce() throws InterruptedException {
        int value = 0;
        while (true) {
            synchronized (this) {
                while (queue.size() == CAPACITY) {
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
    
    public static void main(String[] args) {
        ProducerConsumer pc = new ProducerConsumer();
        
        Thread producer = new Thread(() -> {
            try {
                pc.produce();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        Thread consumer = new Thread(() -> {
            try {
                pc.consume();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        producer.start();
        consumer.start();
    }
}
```

### Using Concurrent Collections
```java
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class ConcurrentCollectionsExample {
    public static void main(String[] args) throws InterruptedException {
        // Thread-safe HashMap
        ConcurrentHashMap<String, Integer> map = new ConcurrentHashMap<>();
        
        // Thread-safe List
        CopyOnWriteArrayList<String> list = new CopyOnWriteArrayList<>();
        
        // Blocking Queue for producer-consumer
        BlockingQueue<String> queue = new LinkedBlockingQueue<>(10);
        
        Runnable producer = () -> {
            try {
                for (int i = 0; i < 5; i++) {
                    String item = "Item " + i;
                    queue.put(item);
                    System.out.println("Produced: " + item);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        };
        
        Runnable consumer = () -> {
            try {
                for (int i = 0; i < 5; i++) {
                    String item = queue.take();
                    System.out.println("Consumed: " + item);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        };
        
        new Thread(producer).start();
        new Thread(consumer).start();
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
        
        System.out.println("Final counter: " + counter.get()); // Should be 2000
    }
}
```

## Common Pitfalls & Edge Cases

1. **Race Conditions**: Multiple threads accessing shared data without proper synchronization
2. **Deadlocks**: Threads waiting for each other to release locks
3. **Starvation**: A thread unable to gain access to shared resources
4. **Memory Visibility**: Changes made by one thread not visible to others without volatile/synchronization
5. **Thread Leaks**: Threads not properly terminated, preventing JVM shutdown

## Tools & Libraries

- **Executor Framework**: Thread pools for managing threads
- **Fork/Join Framework**: For parallel processing
- **CompletableFuture**: For asynchronous programming
- **Concurrent Utilities**: Semaphores, Barriers, etc.
- **Monitoring Tools**: Thread dumps, jstack, VisualVM

## References

- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)
- [Baeldung Concurrency](https://www.baeldung.com/java-concurrency)
- [GeeksforGeeks Multithreading](https://www.geeksforgeeks.org/multithreading-in-java/)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Java Volatile Keyword](../java-volatile-keyword/README.md)
- [Java Synchronized Blocks](../java-synchronized-blocks/README.md)
- [Java ThreadLocal](../java-threadlocal/README.md)
- [Java Atomic Variables](../java-atomic-variables/README.md)
