---
title: Java 22 Features
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java 22 Features

## Overview

JDK 22, released on March 19, 2024, is a non-LTS release that introduces several new features and enhancements to the Java platform. Key highlights include improvements to the Foreign Function & Memory API, new preview features for pattern matching and structured concurrency, and performance enhancements for garbage collection.

## Detailed Explanation

### Region Pinning for G1 (JEP 423)

This feature reduces latency in G1 garbage collector by pinning regions during JNI calls, preventing unnecessary evacuation.

### Statements before super(...) (Preview) (JEP 447)

Allows statements before the super() call in constructors, enabling more flexible initialization.

### Foreign Function & Memory API (JEP 454)

Finalizes the API for calling native code and managing memory outside the JVM heap.

### Unnamed Variables & Patterns (JEP 456)

Introduces unnamed variables (_) for when variables are not needed, and unnamed patterns.

### Class-File API (Preview) (JEP 457)

Provides a standard API for parsing, generating, and transforming Java class files.

### Launch Multi-File Source-Code Programs (JEP 458)

Allows launching Java programs with multiple source files without compilation.

### String Templates (Second Preview) (JEP 459)

Enhances string interpolation with templates.

### Vector API (Seventh Incubator) (JEP 460)

API for vector computations.

### Stream Gatherers (Preview) (JEP 461)

Adds custom intermediate operations for streams.

### Structured Concurrency (Second Preview) (JEP 462)

Simplifies concurrent programming with structured concurrency.

### Implicitly Declared Classes and Instance Main Methods (Second Preview) (JEP 463)

Allows writing main methods without a class declaration.

### Scoped Values (Second Preview) (JEP 464)

Shares immutable data within and across threads.

## Real-world Examples & Use Cases

- **G1 Region Pinning**: Improves performance in applications with heavy JNI usage, like integrating with native libraries.
- **Statements before super()**: Useful in complex inheritance hierarchies where initialization logic is needed before calling super.
- **Foreign Function API**: Enables efficient interaction with native code, beneficial for high-performance computing or system-level programming.
- **Unnamed Variables**: Reduces boilerplate in code where variables are ignored, such as in pattern matching or loops.
- **String Templates**: Simplifies string formatting in logging and UI code.
- **Stream Gatherers**: Allows custom stream operations for data processing pipelines.
- **Structured Concurrency**: Improves reliability in concurrent applications by ensuring proper cleanup.
- **Implicitly Declared Classes**: Eases writing small scripts or educational code.

## Code Examples

### Statements before super(...) (Preview)

```java
public class Child extends Parent {
    public Child(int value) {
        if (value < 0) throw new IllegalArgumentException();
        super(value);  // super() after validation
    }
}
```

### Unnamed Variables & Patterns

```java
if (obj instanceof Point(var x, _)) {  // ignore y
    System.out.println("x: " + x);
}
```

### String Templates

```java
String name = "World";
String greeting = STR."Hello \{name}!";
```

### Stream Gatherers

```java
List<Integer> numbers = List.of(1, 2, 3, 4, 5);
List<Integer> windows = numbers.stream()
    .gather(Gatherers.windowSliding(2))
    .toList();
```

### Implicitly Declared Classes

```java
void main() {
    System.out.println("Hello, Java!");
}
```

### Scoped Values

```java
ScopedValue<String> USER = ScopedValue.newInstance();
ScopedValue.runWhere(USER, "Alice", () -> {
    System.out.println("User: " + USER.get());
});
```

## References

- [JDK 22 Release Notes](https://openjdk.org/projects/jdk/22/)
- [JEP Index](https://openjdk.org/jeps/0)

## Github-README Links & Related Topics

- [Java 21 Features](java-21-features/)
- [Java Stream API and Functional Programming](java-stream-api-and-functional-programming/)
- [Java Structured Concurrency](java-structured-concurrency/)
- [Java Vector API](java-vector-api/)
- [Java Scoped Values](java-scoped-values/)