---
title: Java Annotations Deep Dive
aliases: [Annotations in Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Annotations in Java provide metadata about code elements without affecting execution. They are used for compiler instructions, code generation, and runtime processing.

# Detailed Explanation

Annotations start with `@` and can have elements with values. They can be applied to classes, methods, fields, etc. Custom annotations are defined using `@interface`.

Predefined annotations include `@Override`, `@Deprecated`, `@SuppressWarnings`.

Type annotations (Java 8+) apply to type uses for stronger checking.

Repeating annotations allow multiple of the same type.

# Real-world Examples & Use Cases

- Compiler warnings suppression
- Framework configurations (e.g., Spring, JPA)
- Code generation tools
- Runtime introspection

# Code Examples

```java
// Defining a custom annotation
@interface ClassPreamble {
    String author();
    String date();
    int currentRevision() default 1;
    String[] reviewers();
}

// Using the annotation
@ClassPreamble(
    author = "John Doe",
    date = "3/17/2002",
    currentRevision = 6,
    reviewers = {"Alice", "Bob"}
)
public class MyClass {
    @Override
    public String toString() {
        return "MyClass";
    }

    @SuppressWarnings("unchecked")
    public void myMethod() {
        // code
    }
}
```

# References

- [Oracle Java Tutorials: Annotations](https://docs.oracle.com/javase/tutorial/java/annotations/index.html)
- [Annotations Basics](https://docs.oracle.com/javase/tutorial/java/annotations/basics.html)
- [Declaring an Annotation Type](https://docs.oracle.com/javase/tutorial/java/annotations/declaring.html)

# Github-README Links & Related Topics

- [Reflection and Annotations](reflection-and-annotations/README.md)
- [Java Fundamentals](java-fundamentals/README.md)