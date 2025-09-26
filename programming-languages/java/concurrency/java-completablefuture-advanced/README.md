---
title: Java CompletableFuture Advanced
aliases: [CompletableFuture Advanced, Async Programming]
tags: [#java,#concurrency,#async]
created: 2025-09-25
updated: 2025-09-25
---

# Java CompletableFuture Advanced

## Overview

`CompletableFuture` in Java provides advanced asynchronous programming capabilities, allowing chaining of operations, exception handling, and composition of multiple futures without blocking threads.

## Detailed Explanation

Building on basic `CompletableFuture`, advanced features include:

- **Chaining Operations**: `thenApply()`, `thenAccept()`, `thenRun()` for transforming results.
- **Composition**: `thenCompose()` for flat-mapping futures, `thenCombine()` for combining two futures.
- **Exception Handling**: `exceptionally()`, `handle()`, `whenComplete()`.
- **Multiple Futures**: `allOf()`, `anyOf()` for waiting on multiple completable futures.
- **Async Variants**: Methods like `thenApplyAsync()` to run on different threads.

## Real-world Examples & Use Cases

- **Microservices Orchestration**: Chaining API calls where one depends on another's result.
- **Data Aggregation**: Combining results from multiple database queries or external services.
- **Error Recovery**: Handling failures in async pipelines with fallbacks.

## Code Examples

### Chaining Operations

```java
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> "Hello")
    .thenApply(s -> s + " World")
    .thenApply(String::toUpperCase);

System.out.println(future.get()); // HELLO WORLD
```

### Exception Handling

```java
CompletableFuture<Integer> future = CompletableFuture.supplyAsync(() -> {
    if (Math.random() > 0.5) throw new RuntimeException("Error");
    return 42;
}).exceptionally(ex -> {
    System.err.println("Handled: " + ex.getMessage());
    return 0; // Default value
});
```

### Combining Futures

```java
CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> 10);
CompletableFuture<Integer> f2 = CompletableFuture.supplyAsync(() -> 20);

CompletableFuture<Integer> combined = f1.thenCombine(f2, Integer::sum);
System.out.println(combined.get()); // 30
```

### All Of

```java
CompletableFuture<Void> all = CompletableFuture.allOf(f1, f2);
all.get(); // Wait for both to complete
```

## References

- [Oracle CompletableFuture](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/CompletableFuture.html)
- [Baeldung CompletableFuture Guide](https://www.baeldung.com/java-completablefuture)

## Github-README Links & Related Topics

- [Java CompletableFuture](../java-completablefuture/README.md)
- [Java Future and Callable](../java-future-and-callable/README.md)
- [Java Reactive Streams](../java-reactive-streams/README.md)