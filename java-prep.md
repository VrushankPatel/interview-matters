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
- [Most Frequently Asked (Challenging) Java Questions](#most-frequently-asked-challenging-java-questions)
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

---

## Most Frequently Asked (Challenging) Java Questions

These are the advanced questions that repeatedly show up for experienced backend roles.

### Concurrency and JMM

1. Why does double-checked locking require `volatile`?
2. Explain `happens-before` with a real bug you can get without it.
3. `synchronized` vs `ReentrantLock`: when is `ReentrantLock` actually worth it?
4. Why can `volatile int count++` still break under concurrency?
5. `ConcurrentHashMap` internals and why reads are scalable.
6. How do `CountDownLatch`, `CyclicBarrier`, and `Phaser` differ in lifecycle and use case?
7. How do you detect and debug deadlocks in production?
8. Work-stealing in `ForkJoinPool`: when does it help, and when does it hurt?
9. `CompletableFuture.thenApply` vs `thenCompose` in distributed call chains.
10. Virtual threads vs platform threads: where pinning/blocking still matters.

### Collections and Core Language Internals

11. `HashMap` collision handling and treeification thresholds.
12. Why mutating a key used in `HashMap` is dangerous.
13. `ArrayList` growth behavior and practical memory impact.
14. `Comparable` vs `Comparator` trade-offs in domain design.
15. Why `Optional` is discouraged in fields/entities but useful in APIs.
16. Type erasure in generics and real limitations it creates.
17. Covariance/contravariance with wildcards: `? extends` vs `? super`.
18. String pool behavior and when `intern()` is a bad idea.

### JVM, GC, and Performance

19. How G1 works (young/mixed collections) and which metrics show GC pressure.
20. ZGC/Shenandoah vs G1: latency and throughput trade-offs.
21. Diagnose high CPU with low throughput in a Java service: investigation order.
22. Explain memory leak vs high allocation rate vs retained heap growth.
23. ClassLoader leaks in long-running servers and how to prove one.
24. Safe microbenchmarking: why plain loop timing is misleading and when to use JMH.

### Design and Code Quality

25. Checked vs unchecked exceptions in service boundaries.
26. Immutability patterns for thread-safe domain models.
27. Designing retry-safe/idempotent Java service methods.
28. How to structure a Java module/package layout for large codebases.
29. Common stream API anti-patterns that hurt readability/perf.
30. Refactoring a legacy synchronized code path without introducing races.

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
