---
title: Java Stream API & Functional Programming
aliases: [Java Streams, Functional Programming in Java]
tags: [#java, #functional-programming]
created: 2023-10-01
updated: 2025-09-26
---

# Java Stream API & Functional Programming

## Overview

The Java Stream API, introduced in Java 8, enables functional-style operations on collections and other data sources. It supports operations like filter, map, reduce, and allows for parallel processing. Functional programming in Java involves using lambda expressions, method references, and functional interfaces.

## Detailed Explanation

Streams represent sequences of elements supporting sequential and parallel aggregate operations. Key operations:

- **Intermediate**: filter, map, sorted (return Stream)
- **Terminal**: collect, forEach, reduce (return result)

Functional interfaces like Predicate, Function, Consumer are used with lambdas.

### Benefits

- Declarative code
- Parallel processing
- Lazy evaluation

## Real-world Examples & Use Cases

- **Data Processing**: Filtering large datasets.
- **E-commerce**: Calculating totals with reduce.
- **Analytics**: Mapping and collecting statistics.

## Code Examples

### Basic Stream Operations

```java
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class StreamExample {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
        List<String> filtered = names.stream()
            .filter(name -> name.startsWith("A"))
            .collect(Collectors.toList());
        System.out.println(filtered); // [Alice]
    }
}
```

### Parallel Stream

```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
int sum = numbers.parallelStream()
    .mapToInt(Integer::intValue)
    .sum();
System.out.println(sum); // 15
```

### Functional Interface Example

```java
@FunctionalInterface
interface Calculator {
    int operate(int a, int b);
}

public class FunctionalExample {
    public static void main(String[] args) {
        Calculator add = (a, b) -> a + b;
        System.out.println(add.operate(5, 3)); // 8
    }
}
```

## References

- [Oracle Stream API](https://docs.oracle.com/javase/8/docs/api/java/util/stream/package-summary.html)
- [Functional Programming in Java](https://www.baeldung.com/java-functional-programming)

## Github-README Links & Related Topics

- [Java Fundamentals](java-fundamentals/)
- [Collections & Data Structures](collections-and-data-structures/)