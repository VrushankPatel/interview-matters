---
title: Java Annotations and Reflection
aliases: [Java Reflection, Annotations in Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Annotations provide metadata about code elements, enabling frameworks and tools to process them. Reflection allows inspection and dynamic modification of classes, methods, and fields at runtime.

# Detailed Explanation

Annotations are defined with @interface and can have parameters. Retention policies: SOURCE, CLASS, RUNTIME.

Reflection API (java.lang.reflect) provides Class, Method, Field classes for introspection.

Key features:
- Loading classes dynamically.
- Invoking methods and accessing fields.
- Creating instances without constructors.

# Real-world Examples & Use Cases

- Dependency Injection: Spring @Autowired.
- ORM: Hibernate @Entity, @Column.
- Testing: JUnit @Test, @BeforeEach.
- Serialization: Jackson @JsonProperty.

# Code Examples

```java
// Custom annotation
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MyAnnotation {
    String value() default "";
}

// Using annotation
public class MyClass {
    @MyAnnotation(value = "test")
    public void myMethod() {}
}

// Reflection example
Class<?> clazz = Class.forName("com.example.MyClass");
Method[] methods = clazz.getMethods();
for (Method method : methods) {
    if (method.isAnnotationPresent(MyAnnotation.class)) {
        MyAnnotation annotation = method.getAnnotation(MyAnnotation.class);
        System.out.println(annotation.value());
    }
}
```

# References

- [Oracle: Annotations](https://docs.oracle.com/javase/tutorial/java/annotations/index.html)
- [Oracle: The Reflection API](https://docs.oracle.com/javase/tutorial/reflect/index.html)

# Github-README Links & Related Topics

- [Java Fundamentals](./java-fundamentals/README.md)
- [JVM Internals & Class Loading](./jvm-internals-and-class-loading/README.md)
- [Java Reflection](./java-reflection/README.md)

## Common Pitfalls & Edge Cases

- Performance overhead: Reflection is slower than direct calls.
- Security risks: Can access private members.
- Type erasure: Generic information lost at runtime.

## Tools & Libraries

- Java Reflection API
- Annotation Processing: Lombok, Dagger
- Frameworks: Spring, Hibernate
