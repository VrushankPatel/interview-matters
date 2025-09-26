---
title: Java CompletableFuture
aliases: [Java CompletableFuture, CompletableFuture]
tags: [#java, #concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Java CompletableFuture

## Overview

CompletableFuture, introduced in Java 8, represents a future result of an asynchronous computation. It provides a powerful way to compose, combine, and handle asynchronous operations, improving upon the limitations of Future.

## Detailed Explanation

Key features:

- Asynchronous execution with `supplyAsync()`, `runAsync()`.
- Chaining operations: `thenApply()`, `thenAccept()`, `thenRun()`.
- Combining futures: `thenCombine()`, `thenCompose()`.
- Handling exceptions: `exceptionally()`, `handle()`.
- Waiting for multiple: `allOf()`, `anyOf()`.

It uses ForkJoinPool by default for async tasks.

## Real-world Examples & Use Cases

- Fetching data from multiple APIs in parallel.
- Processing large datasets asynchronously.
- Implementing non-blocking web services.
- Coordinating multiple I/O operations.

## Code Examples

```java
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

// Simple async computation
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> {
    // Simulate long-running task
    try { Thread.sleep(1000); } catch (InterruptedException e) {}
    return "Hello";
});

// Chaining operations
CompletableFuture<String> result = future.thenApply(s -> s + " World");
System.out.println(result.join()); // Blocks and gets result

// Combining futures
CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> 10);
CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> 20);
CompletableFuture<Integer> sum = f1.thenCombine(f2, Integer::sum);
System.out.println(sum.join());

// Exception handling
CompletableFuture<String> failing = CompletableFuture.supplyAsync(() -> {
    throw new RuntimeException("Error");
}).exceptionally(ex -> "Recovered from " + ex.getMessage());
System.out.println(failing.join());

// Waiting for all
CompletableFuture<Void> all = CompletableFuture.allOf(f1, f2);
all.join(); // Wait for both to complete
```

## Common Pitfalls & Edge Cases

- Forgetting to handle exceptions can lead to silent failures.
- Using `get()` blocks the thread; prefer `join()` or callbacks.
- Be aware of thread pool exhaustion in high-load scenarios.

## Tools & Libraries

- Java's built-in CompletableFuture in java.util.concurrent.

## References

- [Oracle CompletableFuture Documentation](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/CompletableFuture.html)

## Github-README Links & Related Topics

- [Multithreading & Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)
- [Java ForkJoinPool](../java-forkjoinpool/README.md)