---
title: Java Annotations and Reflection
aliases: []
tags: ["#java"]
created: 2025-09-26
updated: 2025-09-26
---

# Java Annotations and Reflection

## Overview

Java Annotations and Reflection are powerful metaprogramming features that allow inspection and modification of code at runtime. Annotations provide metadata about code elements, while reflection enables dynamic access to classes, methods, and fields, forming the basis for many frameworks and libraries.

## Detailed Explanation

### Annotations

- **Built-in Annotations**: @Override, @Deprecated, @SuppressWarnings, etc.
- **Custom Annotations**: User-defined annotations with retention policies and targets.
- **Retention Policies**: SOURCE, CLASS, RUNTIME - determine when annotations are available.
- **Targets**: Specify where annotations can be applied (classes, methods, fields, etc.).

### Reflection API

- **Class Loading**: Dynamically loading classes at runtime.
- **Introspection**: Examining class structure, methods, fields, and constructors.
- **Dynamic Invocation**: Calling methods and accessing fields at runtime.
- **Performance Considerations**: Reflection can be slower; use judiciously.

### Key Classes

- **Class**: Represents classes and interfaces in a running Java application.
- **Method, Field, Constructor**: Represent executable members of a class.
- **Annotation**: Interface for all annotation types.

## Real-world Examples & Use Cases

- **Dependency Injection**: Frameworks like Spring use reflection to inject dependencies.
- **ORM Tools**: Hibernate uses annotations and reflection for object-relational mapping.
- **Testing Frameworks**: JUnit uses annotations to mark test methods.
- **Serialization**: Custom serializers use reflection to access object fields.
- **Code Generation**: Tools like Lombok use annotations to generate boilerplate code.

## Code Examples

### Custom Annotation Definition

```java
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MyAnnotation {
    String value() default "";
    int priority() default 1;
}
```

### Using Custom Annotation

```java
public class AnnotatedClass {
    @MyAnnotation(value = "important", priority = 5)
    public void importantMethod() {
        System.out.println("This is an important method");
    }

    @MyAnnotation
    public void regularMethod() {
        System.out.println("This is a regular method");
    }
}
```

### Reflection: Inspecting and Invoking Methods

```java
import java.lang.reflect.Method;
import java.lang.annotation.Annotation;

public class ReflectionExample {
    public static void main(String[] args) {
        try {
            Class<?> clazz = AnnotatedClass.class;
            Method[] methods = clazz.getDeclaredMethods();

            for (Method method : methods) {
                if (method.isAnnotationPresent(MyAnnotation.class)) {
                    MyAnnotation annotation = method.getAnnotation(MyAnnotation.class);
                    System.out.println("Method: " + method.getName());
                    System.out.println("Annotation Value: " + annotation.value());
                    System.out.println("Priority: " + annotation.priority());
                    
                    // Invoke the method
                    Object instance = clazz.getDeclaredConstructor().newInstance();
                    method.invoke(instance);
                    System.out.println("---");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

### Reflection: Accessing Private Fields

```java
import java.lang.reflect.Field;

public class PrivateFieldAccess {
    private String secret = "This is private";

    public static void main(String[] args) {
        try {
            PrivateFieldAccess obj = new PrivateFieldAccess();
            Class<?> clazz = obj.getClass();
            Field field = clazz.getDeclaredField("secret");
            field.setAccessible(true); // Bypass access checks
            
            String value = (String) field.get(obj);
            System.out.println("Secret value: " + value);
            
            // Modify the field
            field.set(obj, "Modified secret");
            System.out.println("New secret value: " + obj.secret);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

## References

- [Oracle Java Annotations Tutorial](https://docs.oracle.com/javase/tutorial/java/annotations/)
- [Java Reflection API](https://docs.oracle.com/javase/8/docs/technotes/guides/reflection/)
- [Annotations and Reflection in Java - Baeldung](https://www.baeldung.com/java-annotations-reflection)

## Github-README Links & Related Topics

- [Java Generics](java-generics/README.md)
- [Java Design Patterns](java-design-patterns/README.md)
- [Spring Framework](spring-framework/README.md)