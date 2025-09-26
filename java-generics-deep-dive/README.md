---
title: Java Generics Deep Dive
aliases: [Java Generics, Generics in Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Java Generics provide a way to create classes, interfaces, and methods that operate on types specified by the user at compile time. They enable type safety, eliminate the need for casting, and allow code reusability.

# Detailed Explanation

Generics were introduced in Java 5 to provide compile-time type checking and eliminate ClassCastException at runtime. They use type parameters, denoted by angle brackets <>, to define placeholders for types.

Key concepts:
- Type Parameters: E for elements, K for keys, V for values, T for types.
- Bounded Type Parameters: <T extends Number> restricts to subclasses.
- Wildcards: ? for unknown types, ? extends T for upper bound, ? super T for lower bound.
- Generic Methods: Methods with their own type parameters.
- Type Erasure: At runtime, generics are erased to raw types for backward compatibility.

# Real-world Examples & Use Cases

- Collections: List<String> ensures only strings are added.
- API Design: Generic repositories in Spring Data JPA.
- Utility Classes: Pair<T, U> for key-value pairs.

# Code Examples

```java
// Generic class
public class Box<T> {
    private T value;
    public void set(T value) { this.value = value; }
    public T get() { return value; }
}

// Bounded type
public class NumberBox<T extends Number> {
    private T number;
}

// Wildcard
public void printList(List<?> list) {
    for (Object elem : list) System.out.println(elem);
}

// Generic method
public static <T> T pick(T a, T b) { return a; }
```

# References

- [Oracle Java Tutorials: Generics](https://docs.oracle.com/javase/tutorial/java/generics/index.html)
- [Effective Java: Item 26-29 on Generics](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

# Github-README Links & Related Topics

- [Java Fundamentals](./java-fundamentals/README.md)
- [OOP Principles in Java](./oop-principles-in-java/README.md)
- [Java Collections Deep Dive](./java-collections-deep-dive/README.md)

## Common Pitfalls & Edge Cases

- Raw types: Using List instead of List<String> loses type safety.
- Type erasure: Cannot check generic types at runtime.
- Wildcard capture: Compiler errors with wildcards in methods.

## Tools & Libraries

- Java Compiler: javac for type checking.
- IDEs: IntelliJ IDEA, Eclipse for generics support.
