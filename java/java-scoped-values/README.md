---
title: Java Scoped Values
aliases: []
tags: [#java,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Java Scoped Values is a preview API introduced in JDK 21 (JEP 446) that enables sharing immutable data efficiently and safely between methods within a thread and across child threads. Scoped values provide a more robust alternative to thread-local variables, with better performance and clearer semantics.

## Detailed Explanation

Scoped values address the problems of thread-local variables:
- **Unconstrained Mutability**: Thread-local variables can be modified anywhere, leading to unpredictable data flow.
- **Unbounded Lifetime**: Values persist for the thread's lifetime, risking memory leaks.
- **Expensive Inheritance**: Copying values to child threads is costly.

A scoped value is bound within a dynamic scope using `ScopedValue.runWhere()`, making it accessible only to methods called within that scope. Bindings are immutable and have bounded lifetimes, improving safety and performance.

Key features:
- **Immutability**: Once bound, a scoped value cannot be changed.
- **Inheritance**: Child threads inherit scoped values efficiently without copying.
- **Type Safety**: Strongly typed with compile-time checks.

## Real-world Examples & Use Cases

- **Framework Context Sharing**: Web frameworks sharing authenticated user info or transaction IDs without method parameters.
- **Request-Scoped Data**: Storing request-specific data in server applications.
- **Nested Transactions**: Managing context in layered transaction systems.

## Code Examples

### Basic Usage

```java
final static ScopedValue<String> USER_ID = ScopedValue.newInstance();

void handleRequest(Request req) {
    String id = authenticate(req);
    ScopedValue.runWhere(USER_ID, id, () -> processRequest(req));
}

void processRequest(Request req) {
    String userId = USER_ID.get(); // Access the scoped value
    // ... process request
}
```

### Inheritance Across Threads

```java
ScopedValue.runWhere(USER_ID, "user123", () -> {
    try (var scope = new StructuredTaskScope<>()) {
        scope.fork(() -> {
            String id = USER_ID.get(); // Inherited from parent
            return processInChild(id);
        });
        scope.join();
    }
});
```

### Multiple Bindings

```java
ScopedValue.where(USER_ID, "user123")
           .where(TRANSACTION_ID, "tx456")
           .run(() -> {
               // Both values are bound here
               String user = USER_ID.get();
               String tx = TRANSACTION_ID.get();
           });
```

## References

- [JEP 481: Scoped Values (Third Preview)](https://openjdk.org/jeps/481)
- [JEP 446: Scoped Values (Second Preview)](https://openjdk.org/jeps/446)

## Github-README Links & Related Topics

- [Java Structured Concurrency](../java-structured-concurrency/README.md)
- [Multithreading and Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)