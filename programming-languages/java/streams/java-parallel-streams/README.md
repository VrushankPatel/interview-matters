---
title: Java Parallel Streams
aliases: [Parallel Streams, Stream Parallelism]
tags: [#java,#streams,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Java Parallel Streams

## Overview

Java Parallel Streams enable concurrent processing of stream operations, leveraging multiple CPU cores for improved performance on large datasets.

## Detailed Explanation

- Invoked with `stream.parallel()` or `parallelStream()` on collections.
- Uses ForkJoinPool by default.
- Operations are divided into subtasks and executed in parallel.
- Not always faster; overhead for small datasets or non-CPU intensive tasks.
- Thread-safety: Ensure operations are stateless and non-interfering.

## Real-world Examples & Use Cases

- **Data Processing**: Summing large arrays or filtering big lists.
- **Batch Operations**: Processing logs or transforming data in parallel.
- **Scientific Computing**: Matrix operations or simulations.

## Code Examples

### Basic Parallel Stream

```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
int sum = numbers.parallelStream()
    .mapToInt(Integer::intValue)
    .sum();
System.out.println("Sum: " + sum);
```

### Custom Thread Pool

```java
ForkJoinPool customPool = new ForkJoinPool(4);
int result = customPool.submit(() ->
    numbers.parallelStream().reduce(0, Integer::sum)
).get();
```

### Performance Comparison

```java
long start = System.nanoTime();
int sequential = numbers.stream().mapToInt(i -> i * i).sum();
long seqTime = System.nanoTime() - start;

start = System.nanoTime();
int parallel = numbers.parallelStream().mapToInt(i -> i * i).sum();
long parTime = System.nanoTime() - start;

System.out.println("Sequential: " + seqTime + " ns, Parallel: " + parTime + " ns");
```

## Common Pitfalls & Edge Cases

- **Shared State**: Avoid mutable shared variables; use thread-safe alternatives.
- **Order Dependency**: Parallel streams may not preserve order; use `forEachOrdered()` if needed.
- **Infinite Streams**: Not suitable for infinite streams.

## References

- [Oracle Parallel Streams](https://docs.oracle.com/javase/tutorial/collections/streams/parallelism.html)
- [Baeldung Parallel Streams](https://www.baeldung.com/java-parallel-streams)

## Github-README Links & Related Topics

- [Java Stream API and Functional Programming](../java-stream-api-and-functional-programming/README.md)
- [Java ForkJoinPool](../java-forkjoinpool/README.md)
- [Concurrency and Parallelism](../concurrency-parallelism/README.md)