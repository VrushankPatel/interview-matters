---
title: Java Annotations and Reflection
aliases: [Java Annotations, Java Reflection API]
tags: [#java,#annotations,#reflection]
created: 2025-09-26
updated: 2025-09-26
---

# Java Annotations and Reflection

## Overview

Java Annotations provide metadata about code, while Reflection allows inspection and manipulation of classes, methods, and fields at runtime. Together, they enable powerful metaprogramming capabilities in Java.

## Detailed Explanation

Annotations are markers that can be applied to classes, methods, fields, etc., to provide additional information. Reflection is the API that allows programs to inspect and modify the runtime behavior of applications.

### Annotations

- **Built-in Annotations**: `@Override`, `@Deprecated`, `@SuppressWarnings`
- **Custom Annotations**: Defined using `@interface`
- **Retention Policies**: `SOURCE`, `CLASS`, `RUNTIME`

### Reflection

- **Class Inspection**: Getting class information, constructors, methods, fields
- **Dynamic Invocation**: Calling methods or setting fields at runtime
- **Performance Considerations**: Reflection can be slow due to security checks

## Real-world Examples & Use Cases

1. **Frameworks**: Spring uses annotations for dependency injection and aspect-oriented programming.
2. **Testing**: JUnit uses annotations like `@Test` to identify test methods.
3. **Serialization**: Custom serializers use reflection to access private fields.

## Code Examples

### Custom Annotation

```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MyAnnotation {
    String value() default "";
    int priority() default 1;
}
```

### Using Reflection

```java
public class ReflectionExample {
    public static void main(String[] args) throws Exception {
        Class<?> clazz = Class.forName("java.util.ArrayList");
        Method method = clazz.getMethod("add", Object.class);
        Object list = clazz.getDeclaredConstructor().newInstance();
        method.invoke(list, "Hello");
        System.out.println(list);
    }
}
```

### Annotation Processing

```java
@MyAnnotation(value = "example", priority = 5)
public void annotatedMethod() {
    // method body
}

// Processing
Method method = MyClass.class.getMethod("annotatedMethod");
MyAnnotation annotation = method.getAnnotation(MyAnnotation.class);
System.out.println("Value: " + annotation.value());
```

## Common Pitfalls & Edge Cases

- **Security Restrictions**: Reflection may be limited in sandboxed environments.
- **Performance Overhead**: Avoid reflection in performance-critical code.
- **Type Safety**: Reflection bypasses compile-time type checking.

## References

- [Oracle Java Tutorials: Annotations](https://docs.oracle.com/javase/tutorial/java/annotations/)
- [Oracle Java Tutorials: Reflection](https://docs.oracle.com/javase/tutorial/reflect/)
- [Baeldung: Java Reflection Guide](https://www.baeldung.com/java-reflection)

## Github-README Links & Related Topics

- [java-annotations](https://github.com/topics/java-annotations)
- [java-reflection](https://github.com/topics/java-reflection)
- Related: [Java Design Patterns](../java-design-patterns/README.md)
