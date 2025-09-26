---
title: Java Reflection Deep Dive
aliases: [Java Reflection API, Reflection in Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Reflection Deep Dive

## Overview

Java Reflection allows inspection and modification of classes, interfaces, fields, and methods at runtime, enabling dynamic behavior in applications.

## Detailed Explanation

The Reflection API is in `java.lang.reflect` package. Key classes:

- `Class`: Represents classes and interfaces
- `Method`: Represents methods
- `Field`: Represents fields
- `Constructor`: Represents constructors

### Obtaining Class Objects

- `Class.forName("com.example.MyClass")`
- `obj.getClass()`
- `MyClass.class`

### Common Operations

- Inspecting class members
- Creating instances dynamically
- Invoking methods
- Accessing private members (with setAccessible)

## Real-world Examples & Use Cases

- Frameworks like Spring for dependency injection
- Testing libraries like JUnit for annotations
- Serialization libraries
- ORM tools like Hibernate

## Code Examples

### Inspecting a Class

```java
import java.lang.reflect.*;

public class ReflectionExample {
    public static void main(String[] args) throws Exception {
        Class<?> clazz = Class.forName("java.util.ArrayList");

        System.out.println("Class name: " + clazz.getName());

        Method[] methods = clazz.getDeclaredMethods();
        for (Method method : methods) {
            System.out.println("Method: " + method.getName());
        }
    }
}
```

### Creating Instance Dynamically

```java
Class<?> clazz = String.class;
Constructor<?> constructor = clazz.getConstructor(String.class);
String instance = (String) constructor.newInstance("Hello");
```

### Invoking Private Method

```java
Method method = clazz.getDeclaredMethod("privateMethod");
method.setAccessible(true);
method.invoke(obj);
```

## Common Pitfalls & Edge Cases

- Performance overhead
- Security restrictions in modules
- Type erasure with generics

## References

- [Oracle Reflection Tutorial](https://docs.oracle.com/javase/tutorial/reflect/)
- [Java Reflection API Docs](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/reflect/package-summary.html)

## Github-README Links & Related Topics

- [Java Annotations](../java-annotations/README.md)
- [JVM Internals](../jvm-internals-and-class-loading/README.md)