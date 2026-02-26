# Java Prep

A practical Java interview guide focused on fundamentals, concurrency, JVM internals, and production-grade coding decisions.

## Table of Contents

- [Java Language Fundamentals](#java-language-fundamentals)
- [OOP and Design Principles](#oop-and-design-principles)
- [Collections and Data Structures in Java](#collections-and-data-structures-in-java)
- [Concurrency and Multithreading](#concurrency-and-multithreading)
- [JVM and Memory Management](#jvm-and-memory-management)
- [Modern Java Features (8 to 21+)](#modern-java-features-8-to-21)
- [Exception Handling and Resource Safety](#exception-handling-and-resource-safety)
- [I/O, Networking, and Serialization](#io-networking-and-serialization)
- [Testing in Java](#testing-in-java)
- [Performance and Profiling](#performance-and-profiling)
- [Java Security Basics](#java-security-basics)
- [Most Asked Java Interview Questions](#most-asked-java-interview-questions)
- [Revision Checklist](#revision-checklist)

## Java Language Fundamentals

### Data Types and Memory Basics

- Primitive types live on stack frames or object fields directly.
- Reference types store object references; objects are on heap.
- `String` is immutable; `StringBuilder` is mutable and faster for repeated appends.

### `equals()` and `hashCode()`

- Contract: equal objects must have same hash code.
- Needed for correct behavior in `HashMap`, `HashSet`.
- Always override both together.

### `final`, `finally`, `finalize`

- `final`: constant variable / non-overridable method / non-inheritable class.
- `finally`: cleanup block in exception handling.
- `finalize`: deprecated, avoid.

## OOP and Design Principles

### Core OOP

- Encapsulation: hide internal state; expose behavior.
- Abstraction: expose essential behavior via interfaces/abstract classes.
- Inheritance: reuse with caution; prefer composition where possible.
- Polymorphism: interface-based design for extensibility.

### SOLID in Java

- Single Responsibility: one reason to change.
- Open/Closed: extend without modifying core.
- Liskov Substitution: subtype should safely replace base type.
- Interface Segregation: smaller focused interfaces.
- Dependency Inversion: depend on abstractions, not implementations.

## Collections and Data Structures in Java

### Common Choices

- `ArrayList`: fast random access, slow middle insert/delete.
- `LinkedList`: rarely preferred in practice for interview production use.
- `HashMap`: O(1) average put/get.
- `TreeMap`: sorted keys, O(log n).
- `HashSet`: uniqueness with hashing.
- `PriorityQueue`: heap-backed min-heap by default.

### Interview-Level Internals

- `HashMap` collision handling: bucket list to tree conversion after threshold.
- Load factor and resizing trade-off: memory vs rehash overhead.
- `ConcurrentHashMap` for concurrent updates without full map lock.

## Concurrency and Multithreading

### Thread Basics

- Use `Runnable`/`Callable` over extending `Thread`.
- Prefer `ExecutorService` or thread pools for real applications.

### Synchronization Tools

- `synchronized`: intrinsic lock.
- `ReentrantLock`: explicit lock with advanced controls.
- `ReadWriteLock`: many readers, few writers.
- `Semaphore`, `CountDownLatch`, `CyclicBarrier`, `Phaser`: coordination primitives.

### `volatile` and Java Memory Model

- `volatile` ensures visibility, not atomicity for compound operations.
- `AtomicInteger`, `AtomicLong`, etc. for lock-free atomic updates.

### `CompletableFuture`

- Compose async tasks with `thenApply`, `thenCompose`, `allOf`.
- Always specify custom executor for heavy async chains.
- Handle errors with `exceptionally` / `handle`.

### Virtual Threads (Project Loom)

- Good for high-concurrency, IO-heavy workloads.
- Keep blocking semantics simple; scale via cheap fibers.
- Still design for backpressure and failure control.

## JVM and Memory Management

### JVM Memory Areas

- Heap: objects and arrays.
- Stack: thread-local call frames.
- Metaspace: class metadata.
- Native memory: direct buffers, JNI allocations.

### Garbage Collection

- Young/Old generation behavior matters for latency.
- Common collectors: G1 (general default), ZGC/Shenandoah (low-latency use cases).
- Analyze pause times, allocation rate, promotion pressure.

### Class Loading

- Parent delegation model.
- ClassLoader leaks are common in containers if static refs/classloader pinning occurs.

## Modern Java Features (8 to 21+)

- Java 8: lambda, streams, `Optional`, default methods.
- Java 9+: modules.
- Java 10: `var` local inference.
- Java 14+: records.
- Java 17+: sealed classes.
- Java 21: virtual threads, structured concurrency preview features ecosystem-wise.

Use features when they improve clarity, not to look modern for its own sake.

## Exception Handling and Resource Safety

- Prefer checked exceptions for recoverable, expected business failures.
- Unchecked exceptions for programmer errors and invariant breaks.
- Use `try-with-resources` for all closeable resources.
- Preserve root cause when wrapping exceptions.

## I/O, Networking, and Serialization

- `java.io` for stream primitives; `java.nio` for buffers/channels/selectors.
- `HttpClient` (Java 11+) for modern HTTP support.
- Serialization: avoid Java native serialization in modern systems when possible; prefer JSON/Avro/Proto.

## Testing in Java

### Unit Testing

- JUnit 5 for test framework.
- Mockito for isolation of dependencies.
- Avoid over-mocking pure value behavior.

### Integration Testing

- Test real DB/message broker via Testcontainers when possible.
- Keep integration tests deterministic and isolated.

### Interview Expectation

- Explain test strategy: unit, integration, contract, performance smoke.

## Performance and Profiling

- Measure before optimizing.
- Use JMH for microbenchmarks (avoid ad-hoc loops).
- Profile CPU/heap/allocations with async-profiler, JFR, VisualVM.
- Detect GC churn, lock contention, and hidden boxing.

## Java Security Basics

- Input validation and output encoding.
- Safe deserialization practices.
- Secret management via env/secret manager, never hardcode.
- Use modern crypto libraries and secure defaults.

## Most Asked Java Interview Questions

1. Difference between `HashMap` and `ConcurrentHashMap`?
2. How does `equals/hashCode` impact collections?
3. `synchronized` vs `ReentrantLock`?
4. `volatile` vs atomic classes?
5. How does GC work and how do you tune for latency?
6. `ArrayList` vs `LinkedList` trade-offs?
7. `CompletableFuture` vs `ExecutorService`?
8. Checked vs unchecked exceptions?
9. Java 8 stream pitfalls (stateful ops, side effects)?
10. Virtual threads: where to use and where not?

## Revision Checklist

- I can explain JMM visibility and happens-before.
- I can choose correct collection for read/write patterns.
- I can design thread-safe code without unnecessary global locks.
- I can explain GC symptoms from logs/metrics.
- I can write clean Java 8+ idiomatic code under interview pressure.

## Related

- [Spring Boot Prep](./spring-boot-prep.md)
- [Problem Solving Prep](./problem-solving-prep.md)
- [CS Fundamentals](./cs-fundamentals.md)
- [Kafka Prep](./kafka-prep.md)
