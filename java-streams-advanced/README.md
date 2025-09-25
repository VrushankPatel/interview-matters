---
title: Advanced Java Streams
aliases: [Java Streams Advanced, Stream Collectors]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Advanced Java Streams operations and collectors enable complex data processing pipelines. Streams provide functional-style operations on collections, supporting parallel execution, lazy evaluation, and composable transformations.

## Detailed Explanation

Streams consist of intermediate operations (filter, map, sorted) and terminal operations (collect, forEach, reduce). Collectors accumulate stream elements into collections or other data structures. Advanced features include custom collectors, parallel streams, and short-circuiting operations.

Key concepts:
- **Collectors**: Predefined and custom accumulation strategies
- **Parallel Streams**: Automatic parallelization with `.parallelStream()`
- **Spliterators**: Custom stream sources
- **Short-circuiting**: Operations like `findFirst()`, `anyMatch()`

## Real-world Examples & Use Cases

- **Data Aggregation**: Grouping and summarizing large datasets.
- **Filtering and Transformation**: Processing user data or logs.
- **Parallel Processing**: Utilizing multi-core systems for computation.
- **Custom Collectors**: Building domain-specific accumulations.

## Code Examples

### Grouping and Partitioning

```java
List<Person> people = // ...

Map<String, List<Person>> byCity = people.stream()
    .collect(Collectors.groupingBy(Person::getCity));

Map<Boolean, List<Person>> adults = people.stream()
    .collect(Collectors.partitioningBy(p -> p.getAge() >= 18));
```

### Advanced Collectors

```java
// Multi-level grouping
Map<String, Map<Integer, List<Person>>> byCityAndAge = people.stream()
    .collect(Collectors.groupingBy(Person::getCity,
             Collectors.groupingBy(Person::getAge)));

// Summarizing
DoubleSummaryStatistics stats = people.stream()
    .collect(Collectors.summarizingDouble(Person::getSalary));

// Joining
String names = people.stream()
    .map(Person::getName)
    .collect(Collectors.joining(", "));
```

### Custom Collector

```java
Collector<Person, ?, Map<String, Person>> oldestByCity = Collector.of(
    HashMap::new,
    (map, person) -> map.merge(person.getCity(), person, 
        (p1, p2) -> p1.getAge() > p2.getAge() ? p1 : p2),
    (m1, m2) -> {
        m2.forEach((city, person) -> m1.merge(city, person, 
            (p1, p2) -> p1.getAge() > p2.getAge() ? p1 : p2));
        return m1;
    }
);
```

### Parallel Streams

```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

int sum = numbers.parallelStream()
    .filter(n -> n % 2 == 0)
    .mapToInt(Integer::intValue)
    .sum();
```

### Stream Reduction

```java
Optional<Person> oldest = people.stream()
    .reduce((p1, p2) -> p1.getAge() > p2.getAge() ? p1 : p2);
```

## Common Pitfalls & Edge Cases

- Parallel streams may not improve performance for small datasets.
- Side effects in lambdas can cause issues in parallel execution.
- Infinite streams require short-circuiting operations.
- Collectors are not thread-safe; use in single-threaded context.

## Tools & Libraries

- Java 8+ Streams API
- Third-party: StreamEx, ProtonPack for additional operations

## References

- [Oracle Java Documentation: Streams](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/package-summary.html)
- [Java 8 Stream API Tutorial](https://winterbe.com/posts/2014/07/31/java8-stream-tutorial-examples/)

## Github-README Links & Related Topics

- [Java Stream API & Functional Programming](../streams-functional-java/README.md)
- [Collections Framework](../collections-framework/README.md)