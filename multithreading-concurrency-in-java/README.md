---
title: Multithreading & Concurrency in Java
aliases: [Java Concurrency, Threading in Java]
tags: [#java,#concurrency,#multithreading]
created: 2025-09-26
updated: 2025-09-26
---

# Multithreading & Concurrency in Java

## Overview
Multithreading and concurrency are fundamental concepts in Java for building responsive, scalable, and efficient applications. Java provides robust support for concurrent programming through its threading model, synchronization mechanisms, and high-level concurrency utilities. Understanding these concepts is crucial for developing applications that can perform multiple tasks simultaneously and handle shared resources safely.

## Detailed Explanation

### Thread Fundamentals
- **Process vs Thread:** A process is an executing program with its own memory space; a thread is a lightweight subprocess within a process
- **Thread Lifecycle:** NEW → RUNNABLE → RUNNING → BLOCKED/WAITING → TERMINATED
- **Thread Creation:** Extending Thread class or implementing Runnable interface

### Synchronization
- **Race Conditions:** When multiple threads access shared data simultaneously, leading to inconsistent results
- **Critical Section:** Code that accesses shared resources and must be executed atomically
- **Synchronization Mechanisms:**
  - `synchronized` keyword
  - `volatile` keyword
  - Atomic classes
  - Locks and conditions

### Concurrency Utilities (java.util.concurrent)
- **Executor Framework:** High-level API for managing thread execution
- **Concurrent Collections:** Thread-safe collections (ConcurrentHashMap, CopyOnWriteArrayList)
- **Synchronizers:** CountDownLatch, CyclicBarrier, Semaphore, Exchanger
- **Atomic Variables:** Classes like AtomicInteger, AtomicLong for lock-free operations

### Thread Safety
- **Immutable Objects:** Objects whose state cannot be changed after construction
- **Thread-Local Variables:** Variables that maintain separate copies for each thread
- **Locking Strategies:** Fine-grained vs coarse-grained locking

## Real-world Examples & Use Cases
1. **Web Servers:** Handling multiple client requests concurrently
2. **Database Connection Pools:** Managing shared database connections
3. **GUI Applications:** Keeping the UI responsive while performing background tasks
4. **Batch Processing:** Parallelizing large data processing tasks
5. **Real-time Systems:** Processing multiple streams of data simultaneously

## Code Examples

### Basic Thread Creation
```java
// Method 1: Extending Thread class
public class MyThread extends Thread {
    @Override
    public void run() {
        System.out.println("Thread " + Thread.currentThread().getName() + " is running");
    }
}

// Method 2: Implementing Runnable interface
public class MyRunnable implements Runnable {
    @Override
    public void run() {
        System.out.println("Runnable " + Thread.currentThread().getName() + " is running");
    }
}

// Usage
public class ThreadCreationDemo {
    public static void main(String[] args) {
        // Using Thread subclass
        MyThread thread1 = new MyThread();
        thread1.start();
        
        // Using Runnable
        Thread thread2 = new Thread(new MyRunnable());
        thread2.start();
        
        // Using lambda
        Thread thread3 = new Thread(() -> {
            System.out.println("Lambda thread " + Thread.currentThread().getName() + " is running");
        });
        thread3.start();
    }
}
```

### Synchronization Example
```java
public class SynchronizedCounter {
    private int count = 0;
    
    // Synchronized method
    public synchronized void increment() {
        count++;
    }
    
    // Synchronized block
    public void decrement() {
        synchronized (this) {
            count--;
        }
    }
    
    public int getCount() {
        return count;
    }
}

// Usage demonstrating race condition without synchronization
public class RaceConditionDemo {
    private static int sharedCounter = 0;
    
    public static void main(String[] args) throws InterruptedException {
        Runnable incrementTask = () -> {
            for (int i = 0; i < 1000; i++) {
                sharedCounter++; // Race condition!
            }
        };
        
        Thread thread1 = new Thread(incrementTask);
        Thread thread2 = new Thread(incrementTask);
        
        thread1.start();
        thread2.start();
        
        thread1.join();
        thread2.join();
        
        System.out.println("Expected: 2000, Actual: " + sharedCounter);
        // Output will likely be less than 2000 due to race condition
    }
}
```

### Producer-Consumer Problem
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
                
                int value = queue.poll();
                System.out.println("Consumed: " + value);
                notify();
                
                Thread.sleep(1000);
            }
        }
    }
    
    public static void main(String[] args) {
        ProducerConsumer pc = new ProducerConsumer();
        
        Thread producerThread = new Thread(() -> {
            try {
                pc.produce();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        Thread consumerThread = new Thread(() -> {
            try {
                pc.consume();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        producerThread.start();
        consumerThread.start();
    }
}
```

### Using Executor Framework
```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.Callable;

public class ExecutorDemo {
    
    public static void main(String[] args) {
        // Create a fixed thread pool
        ExecutorService executor = Executors.newFixedThreadPool(3);
        
        // Submit Runnable tasks
        for (int i = 0; i < 5; i++) {
            final int taskId = i;
            executor.submit(() -> {
                System.out.println("Task " + taskId + " executed by " + Thread.currentThread().getName());
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }
        
        // Submit Callable tasks
        Callable<Integer> callableTask = () -> {
            Thread.sleep(2000);
            return 42;
        };
        
        Future<Integer> future = executor.submit(callableTask);
        
        try {
            Integer result = future.get(); // Blocks until result is available
            System.out.println("Callable result: " + result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Shutdown the executor
        executor.shutdown();
        System.out.println("Executor shutdown");
    }
}
```

### Atomic Variables
```java
import java.util.concurrent.atomic.AtomicInteger;

public class AtomicDemo {
    private static AtomicInteger atomicCounter = new AtomicInteger(0);
    private static int regularCounter = 0;
    
    public static void main(String[] args) throws InterruptedException {
        Runnable atomicIncrement = () -> {
            for (int i = 0; i < 1000; i++) {
                atomicCounter.incrementAndGet();
            }
        };
        
        Runnable regularIncrement = () -> {
            for (int i = 0; i < 1000; i++) {
                regularCounter++; // Not thread-safe
            }
        };
        
        Thread[] atomicThreads = new Thread[10];
        Thread[] regularThreads = new Thread[10];
        
        // Test atomic counter
        for (int i = 0; i < 10; i++) {
            atomicThreads[i] = new Thread(atomicIncrement);
            atomicThreads[i].start();
        }
        
        for (Thread t : atomicThreads) {
            t.join();
        }
        
        System.out.println("Atomic counter: " + atomicCounter.get()); // Should be 10000
        
        // Test regular counter
        for (int i = 0; i < 10; i++) {
            regularThreads[i] = new Thread(regularIncrement);
            regularThreads[i].start();
        }
        
        for (Thread t : regularThreads) {
            t.join();
        }
        
        System.out.println("Regular counter: " + regularCounter); // May be less than 10000
    }
}
```

## Common Pitfalls & Edge Cases
1. **Deadlocks:** Circular waiting for resources
2. **Starvation:** A thread unable to gain access to shared resources
3. **Race Conditions:** Unpredictable results from unsynchronized access
4. **Memory Visibility:** Changes made by one thread not visible to others
5. **Thread Leaks:** Threads that don't terminate properly

## Tools & Libraries
- **Thread Dump Analysis:** jstack for analyzing thread states
- **VisualVM:** GUI tool for thread monitoring
- **JConsole:** JMX-based monitoring
- **Concurrent Libraries:** Guava, Apache Commons for additional utilities
- **Testing:** JUnit with concurrent test runners

## References
- [Oracle Concurrency Tutorial](https://docs.oracle.com/javase/tutorial/essential/concurrency/)
- [Java Concurrency in Practice](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)
- [Baeldung Java Concurrency](https://www.baeldung.com/java-concurrency)

## Github-README Links & Related Topics
- [Java Memory Model](../java-memory-model/)
- [Concurrent Collections](../concurrent-collections/)
- [Java Locks](../java-locks/)
