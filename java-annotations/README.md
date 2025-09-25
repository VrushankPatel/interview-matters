---
title: Java Annotations
aliases: [Annotations in Java, Custom Metadata]
tags: [#java, #advanced-java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Annotations

## Overview

Java annotations are a form of metadata that provide additional information about code elements without affecting their execution. Custom annotations allow developers to define their own metadata for compile-time or runtime processing, enabling frameworks like Spring for dependency injection or Hibernate for ORM mapping. Introduced in Java 5, annotations enhance code readability and enable powerful tooling through annotation processors.

## Detailed Explanation

### Declaring Custom Annotations

Custom annotations are declared using the `@interface` keyword, resembling interface definitions but prefixed with `@`. They can include elements (methods) that specify metadata attributes.

```java
@interface MyAnnotation {
    String value();  // Required element
    int priority() default 1;  // Optional with default
    String[] tags() default {};  // Array element
}
```

### Annotation Elements

- **Types**: Elements can be primitives, Strings, Class, enums, annotations, or arrays thereof.
- **Defaults**: Optional elements use `default` keyword.
- **Special Element**: A single element named `value` can be used without naming in usage.

### Retention Policies

Defined via `@Retention`, controlling annotation lifecycle:

- `RetentionPolicy.SOURCE`: Discarded by compiler (e.g., `@Override`).
- `RetentionPolicy.CLASS`: Retained in class files but not runtime.
- `RetentionPolicy.RUNTIME`: Available at runtime via reflection.

### Target Elements

Specified with `@Target`, limiting where annotations can be applied:

- `ElementType.TYPE`: Classes, interfaces.
- `ElementType.METHOD`: Methods.
- `ElementType.FIELD`: Fields.
- And more: `CONSTRUCTOR`, `PARAMETER`, etc.

### Processing Annotations

Annotations are processed by annotation processors implementing `javax.annotation.processing.Processor`. For runtime, use reflection:

```java
if (clazz.isAnnotationPresent(MyAnnotation.class)) {
    MyAnnotation ann = clazz.getAnnotation(MyAnnotation.class);
    // Access elements
}
```

### Repeating Annotations

Since Java 8, use `@Repeatable` for multiple instances of the same annotation.

```java
@Repeatable(MyAnnotations.class)
@interface MyAnnotation { ... }
```

## Real-world Examples & Use Cases

| Use Case | Framework/Example | Description |
|----------|-------------------|-------------|
| Validation | Bean Validation (`@NotNull`) | Enforce constraints on data models. |
| Dependency Injection | Spring (`@Autowired`) | Wire components automatically. |
| ORM Mapping | Hibernate (`@Entity`, `@Column`) | Map classes to database tables. |
| Testing | JUnit (`@Test`) | Mark methods as test cases. |
| Configuration | Spring Boot (`@Configuration`) | Define beans and settings. |

Annotations enable declarative programming, reducing boilerplate code and improving maintainability in enterprise applications.

## Code Examples

### Basic Custom Annotation

```java
import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@interface Entity {
    String tableName();
}

@Entity(tableName = "users")
public class User {
    // Class implementation
}
```

### Annotation with Processing

```java
import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@interface Entity {
    String tableName();
}

public class AnnotationProcessor {
    public static void process(Object obj) throws Exception {
        Class<?> clazz = obj.getClass();
        if (clazz.isAnnotationPresent(Entity.class)) {
            Entity entity = clazz.getAnnotation(Entity.class);
            System.out.println("Table: " + entity.tableName());
        }
    }
}
```

### Repeating Annotations

```java
import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Repeatable(Permissions.class)
@interface Permission {
    String value();
}

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@interface Permissions {
    Permission[] value();
}

public class SecureService {
    @Permission("READ")
    @Permission("WRITE")
    public void accessData() {
        // Method implementation
    }
}
```

## Common Pitfalls & Edge Cases

- **Retention Mismatch**: Using `SOURCE` retention for runtime processing fails silently.
- **Target Restrictions**: Applying annotations to invalid elements causes compile errors.
- **Inheritance**: Annotations are not inherited by default; use `@Inherited` for class-level inheritance.
- **Reflection Overhead**: Runtime annotation access via reflection can impact performance in hot paths.
- **Version Compatibility**: Annotations added in later Java versions may not be available in older runtimes.

## Tools & Libraries

- **Annotation Processing Tool (APT)**: Built-in Java tool for compile-time processing.
- **Lombok**: Generates boilerplate code using annotations (e.g., `@Getter`, `@Builder`).
- **MapStruct**: Mapping library using annotations for DTO conversions.
- **Dagger**: Dependency injection framework relying on custom annotations.

## Github-README Links & Related Topics

- [Java Language Basics](../java-language-basics/README.md)
- [Reflection and Annotations](../reflection-and-annotations/README.md)
- [Design Patterns](../design-patterns/README.md)
- [JVM Internals and Classloading](../jvm-internals-and-classloading/README.md)
- [Testing and Mocking](../testing-and-mocking-junit-mockito/README.md)

## References

- [Oracle Java Annotations Tutorial](https://docs.oracle.com/javase/tutorial/java/annotations/)
- [Java Language Specification: Annotations](https://docs.oracle.com/javase/specs/jls/se21/html/jls-9.html)
- [Annotation Processing API](https://docs.oracle.com/javase/8/docs/api/javax/annotation/processing/package-summary.html)
- [Effective Java: Item 35 - Use annotations judiciously](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)