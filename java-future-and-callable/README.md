---
title: Java Future and Callable
aliases: [Future, Callable]
tags: [#java,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Java Future and Callable

## Overview

In Java, the `Callable` interface and `Future` class are part of the concurrency framework, enabling asynchronous computation and retrieval of results from tasks executed in separate threads.

## Detailed Explanation

- **Callable<V>**: A functional interface with a single method `V call() throws Exception`. Unlike `Runnable`, it can return a value and throw checked exceptions.
- **Future<V>**: Represents the result of an asynchronous computation. Key methods include:
  - `boolean isDone()`: Checks if the task is completed.
  - `V get()`: Blocks and retrieves the result.
  - `V get(long timeout, TimeUnit unit)`: Retrieves with timeout.
  - `boolean cancel(boolean mayInterruptIfRunning)`: Attempts to cancel the task.

Tasks are typically submitted to an `ExecutorService` using `submit(Callable<T>)`, which returns a `Future<T>`.

## Real-world Examples & Use Cases

- **Parallel Data Processing**: Submitting multiple database queries or computations to a thread pool for faster execution.
- **Web Service Calls**: Making asynchronous HTTP requests and collecting results.
- **Background Tasks**: Running long-running operations like file I/O or image processing without blocking the main thread.

## Code Examples

### Basic Usage

```java
import java.util.concurrent.*;

public class FutureCallableExample {
    public static void main(String[] args) throws Exception {
        ExecutorService executor = Executors.newFixedThreadPool(2);
        
        Callable<Integer> task = () -> {
            Thread.sleep(1000); // Simulate work
            return 42;
        };
        
        Future<Integer> future = executor.submit(task);
        
        // Do other work...
        
        System.out.println("Result: " + future.get()); // Blocks until result
        executor.shutdown();
    }
}
```

### Handling Exceptions

```java
Callable<String> riskyTask = () -> {
    if (Math.random() > 0.5) {
        throw new RuntimeException("Task failed");
    }
    return "Success";
};

Future<String> future = executor.submit(riskyTask);
try {
    String result = future.get();
    System.out.println(result);
} catch (ExecutionException e) {
    System.err.println("Task threw exception: " + e.getCause());
}
```

## References

- [Oracle Callable Documentation](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/Callable.html)
- [Oracle Future Documentation](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/Future.html)
- [Java Concurrency in Practice - Chapter 6](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)

## Github-README Links & Related Topics

- [Java ExecutorService](../java-executorservice/README.md)
- [Java CompletableFuture](../java-completablefuture/README.md)
- [Multithreading and Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)