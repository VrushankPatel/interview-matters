---
title: Java Annotations Advanced
aliases: [Advanced Java Annotations, Custom Annotations]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Annotations Advanced

## Overview

Annotations in Java provide metadata about code. Advanced usage includes creating custom annotations for frameworks, validation, and code generation.

## Detailed Explanation

Annotations are defined with `@interface`. Key elements:

- **Retention**: SOURCE, CLASS, RUNTIME
- **Target**: Where the annotation can be applied
- **Elements**: Parameters in annotations

### Built-in Annotations

- `@Override`, `@Deprecated`, `@SuppressWarnings`

### Custom Annotations

Used in libraries like JPA, Spring.

## Real-world Examples & Use Cases

- JPA: `@Entity`, `@Id`
- Spring: `@Autowired`, `@RequestMapping`
- Validation: `@NotNull`
- Testing: `@Test`

## Code Examples

### Defining a Custom Annotation

```java
import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MyAnnotation {
    String value() default "";
    int priority() default 1;
}
```

### Using the Annotation

```java
public class Example {
    @MyAnnotation(value = "test", priority = 5)
    public void myMethod() {
        // method body
    }
}
```

### Processing Annotations

```java
import java.lang.reflect.*;

public class AnnotationProcessor {
    public static void process(Class<?> clazz) {
        for (Method method : clazz.getDeclaredMethods()) {
            if (method.isAnnotationPresent(MyAnnotation.class)) {
                MyAnnotation annotation = method.getAnnotation(MyAnnotation.class);
                System.out.println("Value: " + annotation.value());
            }
        }
    }
}
```

## Tools & Libraries

- Annotation Processors for code generation
- Frameworks: Hibernate Validator

## References

- [Oracle Annotations Tutorial](https://docs.oracle.com/javase/tutorial/java/annotations/)
- [JSR 269: Pluggable Annotation Processing](https://jcp.org/en/jsr/detail?id=269)

## Github-README Links & Related Topics

- [Java Reflection](../java-reflection/README.md)
- [Java Annotations](../java-annotations/README.md)