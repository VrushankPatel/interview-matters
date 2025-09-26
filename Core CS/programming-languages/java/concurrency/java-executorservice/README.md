---
title: Java ExecutorService
aliases: [ExecutorService in Java]
tags: [#java,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

ExecutorService is an interface in Java that provides methods to manage and execute asynchronous tasks. It decouples task submission from task execution, allowing applications to focus on defining tasks while the framework handles thread management, scheduling, and lifecycle.

## Detailed Explanation

ExecutorService extends the Executor interface with additional methods for task management. It supports executing Runnable and Callable tasks, retrieving results via Future objects, and graceful shutdown.

Key methods:
- `submit(Callable<T>)`: Submits a task and returns a Future.
- `execute(Runnable)`: Executes a task without return value.
- `invokeAll(Collection<Callable<T>>)`: Executes all tasks and returns Futures.
- `shutdown()`: Initiates shutdown, rejects new tasks.
- `shutdownNow()`: Attempts immediate shutdown, interrupts running tasks.

Common implementations:
- **ThreadPoolExecutor**: Configurable thread pool.
- **ScheduledThreadPoolExecutor**: For delayed/scheduled tasks.
- **ForkJoinPool**: For work-stealing algorithms.

### Journey / Sequence

1. **Creation**: Use Executors factory methods or ThreadPoolExecutor constructor.
2. **Task Submission**: Submit Runnable or Callable tasks.
3. **Result Retrieval**: Use Future objects to get results or check status.
4. **Shutdown**: Properly shutdown to release resources.

## Real-world Examples & Use Cases

1. **Web Server Request Handling**: Processing HTTP requests asynchronously.
2. **Batch Processing**: Running multiple jobs in parallel.
3. **Scheduled Tasks**: Periodic cleanup or monitoring tasks.
4. **Resource Management**: Limiting concurrent operations on shared resources.

## Code Examples

### Basic ExecutorService Usage

```java
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class ExecutorServiceExample {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(4);
        
        // Submit Runnable task
        executor.execute(() -> {
            System.out.println("Running task in thread: " + Thread.currentThread().getName());
        });
        
        // Submit Callable task
        Future<String> future = executor.submit(() -> {
            Thread.sleep(1000);
            return "Task completed";
        });
        
        try {
            String result = future.get(); // Blocking call
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        executor.shutdown();
    }
}
```

### Handling Multiple Tasks

```java
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class MultipleTasksExample {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newCachedThreadPool();
        
        List<Callable<Integer>> tasks = Arrays.asList(
            () -> { Thread.sleep(1000); return 1; },
            () -> { Thread.sleep(2000); return 2; },
            () -> { Thread.sleep(1500); return 3; }
        );
        
        try {
            List<Future<Integer>> futures = executor.invokeAll(tasks);
            for (Future<Integer> future : futures) {
                System.out.println("Result: " + future.get());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        executor.shutdown();
    }
}
```

### Custom ThreadPoolExecutor

```java
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class CustomExecutorExample {
    public static void main(String[] args) {
        ThreadPoolExecutor executor = new ThreadPoolExecutor(
            2, // core pool size
            4, // maximum pool size
            60, // keep alive time
            TimeUnit.SECONDS,
            new LinkedBlockingQueue<>(10) // work queue
        );
        
        // Submit tasks
        for (int i = 0; i < 10; i++) {
            final int taskId = i;
            executor.submit(() -> {
                System.out.println("Executing task " + taskId + " in " + Thread.currentThread().getName());
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }
        
        executor.shutdown();
        try {
            executor.awaitTermination(10, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
```

## Common Pitfalls & Edge Cases

- **Shutdown Handling**: Always shutdown executors to prevent resource leaks.
- **Exception Propagation**: Uncaught exceptions in tasks don't propagate; handle in Callable.
- **Thread Pool Sizing**: Incorrect sizing can lead to starvation or excessive context switching.
- **Blocking Operations**: Avoid long-running blocking tasks in fixed-size pools.

## Tools & Libraries

- **JDK**: Executors factory class, ThreadPoolExecutor
- **Monitoring**: Use ThreadPoolExecutor methods like getActiveCount(), getQueue().size()
- **Spring**: @Async annotation for declarative async execution

## References

- [Oracle Java Documentation: ExecutorService](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ExecutorService.html)
- [Java Concurrency in Practice - Chapter 6](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)

## Github-README Links & Related Topics

- [Java Future and Callable](./java-future-and-callable/README.md)
- [Java BlockingQueue](./java-blockingqueue/README.md)
- [Multithreading & Concurrency in Java](./multithreading-and-concurrency-in-java/README.md)