---
title: Reflection and Annotations
aliases: [Runtime Inspection, Custom Annotations, Metadata Programming]
tags: [#java, #reflection, #annotations]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Reflection allows runtime inspection and manipulation of classes, methods, and fields. Annotations provide metadata for compile-time and runtime processing. Fundamental for frameworks and dynamic behavior.

Canonical Interview Prompt: Implement a simple dependency injection using reflection and annotations.

# Detailed Explanation

## High-Level Design

Reflection uses Class, Method, Field classes to access JVM internals. Annotations are processed by annotation processors or at runtime.

```mermaid
graph TD
    A[Class.forName()] --> B[Class Object]
    B --> C[Get Methods/Fields]
    D[@CustomAnnotation] --> E[Annotation Processor]
    E --> F[Generated Code/Metadata]
```

## Key Components

- **Reflection**: Inspect classes, invoke methods, access fields dynamically.
- **Annotations**: @Retention, @Target for defining metadata.
- **Annotation Processing**: Compile-time code generation (e.g., Lombok).

## Capacity and Throughput Targets

- Reflection: Slower than direct calls; use sparingly for performance-critical code.
- Annotation Processing: Compile-time, negligible runtime impact.

## Tradeoffs

- **Performance**: Reflection bypasses optimizations; cache reflective objects.
- **Security**: Can access private members; use with caution.
- **Type Safety**: Lost at compile-time; runtime errors possible.

# Real-world Examples & Use Cases

- **ORM Frameworks**: Hibernate uses reflection for entity mapping.
- **DI Containers**: Spring injects dependencies via reflection.
- **Code Generation**: Lombok generates boilerplate from annotations.

# Code Examples

**Basic Reflection:**

```java
Class<?> clazz = Class.forName("com.example.MyClass");
Method method = clazz.getMethod("myMethod", String.class);
Object instance = clazz.newInstance();
method.invoke(instance, "arg");
```

**Custom Annotation:**

```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MyAnnotation {
    String value();
}

public class MyClass {
    @MyAnnotation("test")
    public void myMethod() {}
}
```

**Processing Annotations:**

```java
Method[] methods = clazz.getMethods();
for (Method method : methods) {
    if (method.isAnnotationPresent(MyAnnotation.class)) {
        MyAnnotation ann = method.getAnnotation(MyAnnotation.class);
        System.out.println(ann.value());
    }
}
```

# Data Models / Message Formats

**Annotation Definition:**

```java
@interface Config {
    String key();
    String defaultValue() default "";
}
```

**Reflective Access:**

Class -> Method/Field -> Invoke/Access

# Common Pitfalls & Edge Cases

- **Accessibility**: setAccessible(true) for private members.
- **Exceptions**: Handle IllegalAccessException, NoSuchMethodException.
- **Caching**: Cache Class/Method objects to improve performance.

# Tools & Libraries

- Java Reflection API
- Annotation Processing API
- Libraries: Reflections, Guava

# Github-README Links & Related Topics

[jvm-internals-and-classloading](../jvm-internals-and-classloading/README.md), [design-patterns](../design-patterns/README.md)

# References

- https://docs.oracle.com/javase/tutorial/reflect/
- https://docs.oracle.com/javase/8/docs/api/java/lang/reflect/package-summary.html
- https://www.baeldung.com/java-reflection