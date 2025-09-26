---
title: Java 23 Features
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java 23 Features

## Overview

JDK 23, released on September 17, 2024, continues the pattern of incremental improvements with a focus on preview features stabilizing and new incubations. Notable additions include primitive types in patterns, module import declarations, and enhancements to garbage collection and concurrency APIs.

## Detailed Explanation

### Primitive Types in Patterns, instanceof, and switch (Preview) (JEP 455)

Allows primitive types in pattern matching constructs.

### Class-File API (Second Preview) (JEP 466)

Further refinements to the class-file API.

### Markdown Documentation Comments (JEP 467)

Supports Markdown in JavaDoc comments.

### Vector API (Eighth Incubator) (JEP 469)

Continued incubation of vector operations.

### Deprecate the Memory-Access Methods in sun.misc.Unsafe for Removal (JEP 471)

Prepares for removal of unsafe memory access.

### ZGC: Generational Mode by Default (JEP 474)

Makes ZGC generational by default for better performance.

### Module Import Declarations (Preview) (JEP 476)

Allows importing modules for unqualified access.

### Implicitly Declared Classes and Instance Main Methods (Third Preview) (JEP 477)

Further preview of implicit classes.

### Structured Concurrency (Third Preview) (JEP 480)

More refinements to structured concurrency.

### Scoped Values (Third Preview) (JEP 481)

Continued development of scoped values.

### Flexible Constructor Bodies (Second Preview) (JEP 482)

Allows more flexible constructor implementations.

## Real-world Examples & Use Cases

- **Primitive Types in Patterns**: Simplifies type checking and casting in switch expressions.
- **Markdown in JavaDoc**: Improves documentation readability and maintainability.
- **ZGC Generational**: Reduces pause times in large heap applications.
- **Module Imports**: Eases module system usage in large projects.
- **Flexible Constructors**: Supports advanced initialization patterns.

## Code Examples

### Primitive Types in Patterns

```java
switch (obj) {
    case Integer i -> "Integer: " + i;
    case Double d -> "Double: " + d;
    default -> "Other";
}
```

### Markdown Documentation Comments

```java
/**
 * This is a **bold** method.
 * - List item
 */
public void method() {}
```

### Module Import Declarations

```java
import module java.base;
```

### Flexible Constructor Bodies

```java
public class Example {
    private final int value;
    public Example(int x) {
        if (x > 0) {
            this.value = x;
        } else {
            this.value = 0;
        }
    }
}
```

## References

- [JDK 23 Release Notes](https://openjdk.org/projects/jdk/23/)
- [JEP Index](https://openjdk.org/jeps/0)

## Github-README Links & Related Topics

- [Java 22 Features](java-22-features/)
- [Java Module System](java-modules/)
- [Garbage Collection Algorithms](garbage-collection-algorithms/)