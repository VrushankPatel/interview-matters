---
title: Java Structured Concurrency
aliases: []
tags: [#java,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Java Structured Concurrency is a preview API introduced in JDK 21 (JEP 462) that simplifies concurrent programming by treating groups of related tasks running in different threads as a single unit of work. It enhances error handling, cancellation, and observability in concurrent code, making it easier to manage and reason about multi-threaded applications.

## Detailed Explanation

Structured concurrency addresses the limitations of unstructured concurrency provided by `ExecutorService` and `Future`. In traditional approaches, tasks can be submitted and joined independently, leading to issues like thread leaks, cancellation delays, and poor observability.

Key concepts:
- **Structured Task Scope**: A lexical scope that confines the lifetimes of subtasks to a clear block, ensuring all threads are properly managed.
- **Shutdown Policies**: Policies like `ShutdownOnFailure` and `ShutdownOnSuccess` that automatically handle cancellation based on task outcomes.
- **Inheritance**: Scoped values and structured concurrency work together to inherit context across threads.

The API enforces structure at runtime, preventing misuse and ensuring that subtasks are properly nested within their parent tasks.

## Real-world Examples & Use Cases

- **Server Applications**: Handling incoming requests by dedicating virtual threads to tasks and using structured concurrency to coordinate subtasks like database queries and external API calls.
- **Data Processing Pipelines**: Breaking down complex data transformations into concurrent subtasks with automatic error propagation.
- **I/O Operations**: Managing multiple concurrent I/O operations (e.g., fetching data from multiple sources) as a single logical unit.

## Code Examples

### Basic Usage with ShutdownOnFailure

```java
Response handle() throws ExecutionException, InterruptedException {
    try (var scope = new StructuredTaskScope.ShutdownOnFailure()) {
        Supplier<String> user = scope.fork(() -> findUser());
        Supplier<Integer> order = scope.fork(() -> fetchOrder());

        scope.join()        // Join both subtasks
             .throwIfFailed(); // Propagate errors

        // Compose results
        return new Response(user.get(), order.get());
    }
}
```

### Fan-in Scenario

```java
void serve(ServerSocket serverSocket) throws IOException, InterruptedException {
    try (var scope = new StructuredTaskScope<Void>()) {
        try {
            while (true) {
                var socket = serverSocket.accept();
                scope.fork(() -> handle(socket));
            }
        } finally {
            scope.shutdown(); // Close all active connections
            scope.join();
        }
    }
}
```

### Custom Shutdown Policy

```java
class MyScope<T> extends StructuredTaskScope<T> {
    private final Queue<T> results = new ConcurrentLinkedQueue<>();

    @Override
    protected void handleComplete(Subtask<? extends T> subtask) {
        if (subtask.state() == Subtask.State.SUCCESS)
            results.add(subtask.get());
    }

    public Stream<T> results() {
        super.ensureOwnerAndJoined();
        return results.stream();
    }
}
```

## References

- [JEP 462: Structured Concurrency (Third Preview)](https://openjdk.org/jeps/462)
- [OpenJDK Loom Project](https://openjdk.org/projects/loom/)

## Github-README Links & Related Topics

- [Java Virtual Threads](../java-virtual-threads/README.md)
- [Multithreading and Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)
- [Java CompletableFuture](../java-completablefuture/README.md)