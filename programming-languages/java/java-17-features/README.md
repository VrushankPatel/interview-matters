---
title: Java 17 Features
aliases: [Java 17, JDK 17 Features]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Java 17 is a Long-Term Support (LTS) release of the Java platform, released in September 2021. It introduces several new language features, performance improvements, and enhancements to the Java ecosystem. Key features include sealed classes, pattern matching for instanceof, text blocks, records, and more. This release focuses on developer productivity, code readability, and preparing for future Java versions.

## Detailed Explanation

Java 17 builds upon the foundations laid in previous versions, introducing preview features that became standard in later releases. The major features include:

### Sealed Classes
Sealed classes allow you to restrict which classes can extend or implement them. This provides better control over inheritance hierarchies and enables the compiler to perform exhaustive checks.

### Pattern Matching for instanceof
This feature simplifies the common pattern of checking an object's type and casting it in one step, reducing boilerplate code.

### Text Blocks
Text blocks provide a way to write multi-line strings more conveniently, especially useful for HTML, SQL, or JSON literals.

### Records
Records are a new kind of class designed to be simple data carriers, automatically generating constructors, getters, equals, hashCode, and toString methods.

### Switch Expressions
Enhanced switch statements that can be used as expressions, with arrow syntax and exhaustive checking.

### Other Enhancements
- Foreign Function & Memory API (incubator)
- Vector API (incubator)
- Deprecation of the Applet API
- Improved performance and security updates

## Real-world Examples & Use Cases

### Sealed Classes in Domain Modeling
Sealed classes are particularly useful in domain-driven design for modeling finite sets of possibilities.

```java
public sealed class Shape permits Circle, Rectangle, Triangle {
    // common shape methods
}

public final class Circle extends Shape {
    private final double radius;
    // constructor and methods
}

public final class Rectangle extends Shape {
    private final double width, height;
    // constructor and methods
}

public final class Triangle extends Shape {
    private final double base, height;
    // constructor and methods
}
```

### Pattern Matching in Data Processing
Pattern matching simplifies data extraction from complex objects.

```java
public void processShape(Shape shape) {
    if (shape instanceof Circle c) {
        System.out.println("Circle with radius: " + c.radius());
    } else if (shape instanceof Rectangle r) {
        System.out.println("Rectangle with area: " + (r.width() * r.height()));
    } else if (shape instanceof Triangle t) {
        System.out.println("Triangle with area: " + (t.base() * t.height() / 2));
    }
}
```

### Text Blocks for SQL Queries
Text blocks make writing SQL queries in Java code much cleaner.

```java
String sql = """
    SELECT id, name, email
    FROM users
    WHERE status = 'ACTIVE'
    ORDER BY name
    """;
```

### Records for Data Transfer Objects
Records are ideal for DTOs and immutable data structures.

```java
public record UserDTO(String name, String email, LocalDate birthDate) {}

UserDTO user = new UserDTO("John Doe", "john@example.com", LocalDate.of(1990, 1, 1));
```

### Switch Expressions for State Machines
Switch expressions provide concise state transition logic.

```java
public enum Status { PENDING, APPROVED, REJECTED }

public Status nextStatus(Status current, boolean approved) {
    return switch (current) {
        case PENDING -> approved ? APPROVED : REJECTED;
        case APPROVED, REJECTED -> throw new IllegalStateException("Final state");
    };
}
```

## Code Examples

### Complete Example with Sealed Classes and Pattern Matching

```java
import java.util.List;

public class ShapeProcessor {
    public sealed interface Shape permits Circle, Rectangle {
    }

    public record Circle(double radius) implements Shape {
    }

    public record Rectangle(double width, double height) implements Shape {
    }

    public double calculateArea(Shape shape) {
        return switch (shape) {
            case Circle c -> Math.PI * c.radius() * c.radius();
            case Rectangle r -> r.width() * r.height();
        };
    }

    public static void main(String[] args) {
        ShapeProcessor processor = new ShapeProcessor();
        List<Shape> shapes = List.of(
            new Circle(5.0),
            new Rectangle(4.0, 6.0)
        );

        shapes.forEach(shape -> 
            System.out.println("Area: " + processor.calculateArea(shape))
        );
    }
}
```

### Text Block Example

```java
public class TextBlockExample {
    public static void main(String[] args) {
        String json = """
            {
                "name": "John Doe",
                "age": 30,
                "city": "New York"
            }
            """;
        
        System.out.println(json);
    }
}
```

## References

- [Oracle Java 17 Documentation](https://docs.oracle.com/en/java/javase/17/)
- [OpenJDK JDK 17 Release Notes](https://openjdk.org/projects/jdk/17/)
- [JEP 409: Sealed Classes](https://openjdk.org/jeps/409)
- [JEP 406: Pattern Matching for instanceof](https://openjdk.org/jeps/406)
- [JEP 378: Text Blocks](https://openjdk.org/jeps/378)
- [JEP 395: Records](https://openjdk.org/jeps/395)
- [JEP 361: Switch Expressions](https://openjdk.org/jeps/361)

## Github-README Links & Related Topics

- [Java Sealed Classes](java-sealed-classes/)
- [Java Pattern Matching](java-pattern-matching/)
- [Java Text Blocks](java-text-blocks/)
- [Java Records](java-records/)
- [Java Switch Expressions](java-switch-expressions/)
- [Java 21 Features](java-21-features/)