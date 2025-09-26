---
title: Java 21 Features
aliases: [Java 21, JDK 21]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java 21 Features

## Overview

Java 21 is the latest Long-Term Support (LTS) release of the Java platform, providing a stable foundation for enterprise applications. It introduces several new language features, performance improvements, and API enhancements that make Java more expressive and efficient.

## Detailed Explanation

Java 21 includes finalized features from previous versions and new additions:

- **Virtual Threads**: Lightweight threads for high-concurrency applications.
- **Record Patterns**: Enhanced pattern matching for records.
- **Pattern Matching for switch**: More expressive switch statements.
- **Sealed Classes**: Restrict class hierarchies.
- **String Templates**: Preview feature for string interpolation.
- **Sequenced Collections**: New interfaces for ordered collections.
- **Foreign Function & Memory API**: Improved native interop.
- **Vector API**: SIMD operations for performance.

## Real-world Examples & Use Cases

- Virtual threads for web servers handling thousands of concurrent requests.
- Record patterns for data processing in financial applications.
- Sealed classes for modeling domain entities in e-commerce platforms.

## Code Examples

### Virtual Threads

```java
import java.util.concurrent.Executors;

public class VirtualThreadExample {
    public static void main(String[] args) {
        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            for (int i = 0; i < 1000; i++) {
                executor.submit(() -> System.out.println(Thread.currentThread()));
            }
        }
    }
}
```

### Record Patterns

```java
record Point(int x, int y) {}

public class PatternExample {
    public static void print(Object obj) {
        if (obj instanceof Point(var x, var y)) {
            System.out.println("Point at (" + x + ", " + y + ")");
        }
    }
}
```

### Sealed Classes

```java
sealed class Vehicle permits Car, Truck {}

final class Car extends Vehicle {}

final class Truck extends Vehicle {}
```

## References

- [JDK 21 Release Notes](https://www.oracle.com/java/technologies/javase/21-relnotes.html)
- [OpenJDK Project](https://openjdk.org/projects/jdk/21/)

## Github-README Links & Related Topics

- [Java Virtual Threads](./java-virtual-threads/README.md)
- [Java Records](./java-records/README.md)
- [Java Sealed Classes](./java-sealed-classes/README.md)
