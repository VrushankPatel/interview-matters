---
title: Java Stream API & Functional Programming
aliases: [Java Streams, Functional Programming in Java]
tags: [#java, #functional]
created: 2023-10-01
updated: 2025-09-26
---

# Java Stream API & Functional Programming

## Overview

The Stream API enables functional-style operations on collections, supporting parallel processing and lazy evaluation. Functional programming in Java uses lambdas, method references, and functional interfaces.

## Detailed Explanation

### Stream Operations

- **Intermediate**: filter, map, sorted (lazy)

- **Terminal**: collect, forEach, reduce

### Functional Interfaces

- **Predicate**: boolean test(T t)

- **Function**: R apply(T t)

- **Consumer**: void accept(T t)

## Real-world Examples & Use Cases

- **Filtering data**: Stream.filter()

- **Transforming data**: Stream.map()

- **Aggregating data**: Stream.reduce()

## Code Examples

### Filter and Map
```java
List<String> list = Arrays.asList("a", "b", "c");
List<String> upper = list.stream()
    .filter(s -> s.length() > 1)
    .map(String::toUpperCase)
    .collect(Collectors.toList());
```

### Reduce
```java
int sum = list.stream()
    .mapToInt(String::length)
    .sum();
```

## References

- [Oracle Streams](https://docs.oracle.com/javase/tutorial/collections/streams/)

## Github-README Links & Related Topics

- [Java Stream API](java-stream-api/)
- [Functional Programming](functional-programming/)