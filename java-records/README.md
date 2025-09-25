---
title: Java Records
aliases: [Immutable Data Classes, Record Classes]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Java Records, introduced in Java 14 as a preview and stable in Java 16, provide a concise way to create immutable data classes. They automatically generate boilerplate code for constructors, getters, equals, hashCode, and toString, promoting data-centric programming.

## Detailed Explanation

### Record Declaration

Records are declared with `record` keyword, specifying components.

```java
public record Person(String name, int age) {}
```

This generates:
- Private final fields for components.
- Public constructor.
- Public getters (e.g., `name()`, `age()`).
- `equals()`, `hashCode()`, `toString()`.

### Components

Components are the record's data fields.

- **Types**: Any type, including generics.
- **Validation**: Constructor can validate components.
- **Defaults**: No default values; use compact constructor.

### Compact Constructor

Override default constructor for validation or normalization.

```java
public record Person(String name, int age) {
    public Person {
        if (age < 0) throw new IllegalArgumentException("Age cannot be negative");
        name = name.trim(); // Normalize
    }
}
```

### Additional Methods

Records can have custom methods, but cannot have instance fields beyond components.

### Inheritance

Records implicitly extend `java.lang.Record` and cannot extend other classes. They can implement interfaces.

### Serialization

Records implement `Serializable` by default if components are serializable.

## Real-world Examples & Use Cases

| Use Case | Example | Description |
|----------|---------|-------------|
| DTOs | `record UserDTO(String id, String email)` | Data transfer objects. |
| Tuples | `record Pair<A, B>(A first, B second)` | Generic pairs. |
| Configuration | `record Config(String host, int port)` | Immutable config holders. |
| Events | `record OrderPlaced(String orderId, LocalDateTime time)` | Event sourcing. |
| API Responses | `record ApiResponse<T>(T data, String status)` | Typed responses. |

Records simplify code in data-heavy applications like REST APIs and data processing pipelines.

## Code Examples

### Basic Record

```java
public record Point(int x, int y) {}

public class RecordExample {
    public static void main(String[] args) {
        Point p = new Point(1, 2);
        System.out.println(p); // Point[x=1, y=2]
        System.out.println(p.x()); // 1
        System.out.println(p.equals(new Point(1, 2))); // true
    }
}
```

### Record with Methods

```java
public record Rectangle(int width, int height) {
    public int area() {
        return width * height;
    }

    public Rectangle scale(int factor) {
        return new Rectangle(width * factor, height * factor);
    }
}

public class RectangleExample {
    public static void main(String[] args) {
        Rectangle rect = new Rectangle(10, 20);
        System.out.println("Area: " + rect.area()); // 200
        Rectangle scaled = rect.scale(2);
        System.out.println(scaled); // Rectangle[width=20, height=40]
    }
}
```

### Compact Constructor

```java
public record Email(String address) {
    public Email {
        if (!address.contains("@")) {
            throw new IllegalArgumentException("Invalid email");
        }
        address = address.toLowerCase();
    }
}

public class EmailExample {
    public static void main(String[] args) {
        Email email = new Email("USER@EXAMPLE.COM");
        System.out.println(email.address()); // user@example.com
    }
}
```

### Generic Record

```java
public record Container<T>(T value) {}

public class GenericExample {
    public static void main(String[] args) {
        Container<String> stringContainer = new Container<>("Hello");
        Container<Integer> intContainer = new Container<>(42);

        System.out.println(stringContainer.value()); // Hello
        System.out.println(intContainer.value()); // 42
    }
}
```

### Record Implementing Interface

```java
interface Identifiable {
    String id();
}

public record User(String id, String name) implements Identifiable {}

public class InterfaceExample {
    public static void main(String[] args) {
        User user = new User("123", "Alice");
        System.out.println("ID: " + user.id()); // 123
    }
}
```

## Common Pitfalls & Edge Cases

- **Mutability**: Records are shallowly immutable; mutable components can be changed.
- **Inheritance**: Cannot extend records or have subclasses.
- **Annotations**: Annotations on components affect generated methods.
- **Serialization**: Ensure components are serializable.
- **Performance**: Records may have overhead for simple data; use primitives where possible.

## Tools & Libraries

- **Jackson**: JSON serialization for records.
- **Lombok**: Alternative for mutable/immutable classes.
- **MapStruct**: Mapping between records and entities.
- **Spring Boot**: Record support in data binding.

## Github-README Links & Related Topics

- [Java Language Basics](java/java-language-basics/README.md)
- [OOP Design and Principles](java/oop-design-and-principles/README.md)
- [Serialization and Deserialization](java/serialization-and-deserialization/README.md)
- [Advanced Java Concepts](java/advanced-java-concepts/README.md)

## References

- [Oracle Records Tutorial](https://docs.oracle.com/javase/tutorial/java/classes/recordclasses.html)
- [Java Language Specification: Records](https://docs.oracle.com/javase/specs/jls/se21/html/jls-8.html#jls-8.10)
- [JEP 395: Records](https://openjdk.org/jeps/395)
- [Records vs Classes](https://www.baeldung.com/java-record-vs-class)</content>
</xai:function_call ><xai:function_call name="edit">
<parameter name="filePath">README.md