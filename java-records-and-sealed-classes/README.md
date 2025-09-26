---
title: Java Records and Sealed Classes
aliases: [Records and Sealed Classes in Java]
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Java Records and Sealed Classes, introduced in Java 14 and 17 respectively, represent significant enhancements to the Java type system. Records provide a compact way to declare classes that are transparent holders for shallowly immutable data, while sealed classes allow restricting which classes can extend or implement them, enabling more robust pattern matching and exhaustive type checking.

Together, these features enable writing more expressive, type-safe, and maintainable code, particularly in domain modeling and data processing scenarios.

## Detailed Explanation

### Java Records

Records are a special kind of class declaration that automatically generates boilerplate code for data classes:

```java
public record Person(String name, int age) {}
```

This single line generates:
- Private final fields for `name` and `age`
- Public accessor methods (`name()`, `age()`)
- `equals()`, `hashCode()`, and `toString()` methods
- A canonical constructor

### Sealed Classes

Sealed classes restrict which classes can extend them:

```java
public sealed class Shape permits Circle, Rectangle, Triangle {
    // Common shape functionality
}

public final class Circle extends Shape {
    private final double radius;
    // ...
}

public final class Rectangle extends Shape {
    private final double width, height;
    // ...
}

public final class Triangle extends Shape {
    private final double base, height;
    // ...
}
```

### Pattern Matching Integration

Sealed classes work seamlessly with pattern matching in switch expressions:

```java
public double calculateArea(Shape shape) {
    return switch (shape) {
        case Circle c -> Math.PI * c.radius() * c.radius();
        case Rectangle r -> r.width() * r.height();
        case Triangle t -> 0.5 * t.base() * t.height();
    };
}
```

## Real-world Examples & Use Cases

### Domain Modeling

Records excel in representing domain entities:

```java
public record User(
    UUID id,
    String username,
    String email,
    LocalDateTime createdAt,
    UserStatus status
) {}

public sealed interface UserStatus permits Active, Inactive, Suspended {}

public record Active() implements UserStatus {}
public record Inactive(LocalDateTime deactivatedAt) implements UserStatus {}
public record Suspended(String reason, LocalDateTime suspendedUntil) implements UserStatus {}
```

### API Response Modeling

```java
public sealed interface ApiResponse<T> permits Success, Error {}

public record Success<T>(T data) implements ApiResponse<T> {}
public record Error(String message, int code) implements ApiResponse<Object> {}

public class ApiClient {
    public ApiResponse<User> getUser(String id) {
        try {
            var user = fetchUserFromDatabase(id);
            return new Success<>(user);
        } catch (Exception e) {
            return new Error("User not found", 404);
        }
    }
}
```

### Event Sourcing

```java
public sealed interface DomainEvent permits UserCreated, UserUpdated, UserDeleted {}

public record UserCreated(UUID userId, String username, String email) implements DomainEvent {}
public record UserUpdated(UUID userId, Map<String, Object> changes) implements DomainEvent {}
public record UserDeleted(UUID userId, LocalDateTime deletedAt) implements DomainEvent {}

public class EventProcessor {
    public void processEvent(DomainEvent event) {
        switch (event) {
            case UserCreated e -> createUser(e.userId(), e.username(), e.email());
            case UserUpdated e -> updateUser(e.userId(), e.changes());
            case UserDeleted e -> deleteUser(e.userId(), e.deletedAt());
        }
    }
}
```

## Code Examples

### Basic Record Usage

```java
// Simple record
public record Point(int x, int y) {}

// Record with custom methods
public record Rectangle(int width, int height) {
    public int area() {
        return width * height;
    }
    
    public boolean isSquare() {
        return width == height;
    }
}

// Record with validation
public record Email(String value) {
    public Email {
        if (!value.contains("@")) {
            throw new IllegalArgumentException("Invalid email");
        }
    }
}
```

### Sealed Classes with Records

```java
public sealed interface Result<T, E> permits Ok, Err {}

public record Ok<T, E>(T value) implements Result<T, E> {}
public record Err<T, E>(E error) implements Result<T, E> {}

public class DatabaseService {
    public Result<User, String> findUser(String id) {
        try {
            var user = // database query
            return new Ok<>(user);
        } catch (Exception e) {
            return new Err<>("User not found: " + id);
        }
    }
}
```

### Pattern Matching with Sealed Classes

```java
public sealed interface Expression permits Constant, BinaryOp {}

public record Constant(double value) implements Expression {}
public record BinaryOp(Expression left, String op, Expression right) implements Expression {}

public double evaluate(Expression expr) {
    return switch (expr) {
        case Constant c -> c.value();
        case BinaryOp(var left, "+", var right) -> evaluate(left) + evaluate(right);
        case BinaryOp(var left, "-", var right) -> evaluate(left) - evaluate(right);
        case BinaryOp(var left, "*", var right) -> evaluate(left) * evaluate(right);
        case BinaryOp(var left, "/", var right) -> evaluate(left) / evaluate(right);
    };
}
```

### Inheritance with Sealed Classes

```java
public sealed class Vehicle permits Car, Truck, Motorcycle {}

public final class Car extends Vehicle {
    private final String model;
    private final int seats;
    
    public Car(String model, int seats) {
        this.model = model;
        this.seats = seats;
    }
}

public sealed class Truck extends Vehicle permits PickupTruck, SemiTruck {}

public final class PickupTruck extends Truck {
    // Implementation
}

public final class SemiTruck extends Truck {
    // Implementation
}

public final class Motorcycle extends Vehicle {
    // Implementation
}
```

## Common Pitfalls & Edge Cases

### Record Limitations

Records cannot extend other classes (except other records implicitly):

```java
// Invalid
public record MyRecord() extends SomeClass {}

// Valid alternative
public class MyClass extends SomeClass {
    private final String value;
    
    public MyClass(String value) {
        super();
        this.value = value;
    }
    
    public String value() { return value; }
}
```

### Sealed Class Permits Clause

All permitted subclasses must be accessible and in the same module/package:

```java
// Valid
public sealed class Parent permits Child1, Child2 {}

// Invalid - Child3 not in permits
public final class Child3 extends Parent {}
```

### Pattern Matching Exhaustiveness

The compiler enforces exhaustive pattern matching for sealed types:

```java
public void processShape(Shape shape) {
    switch (shape) {
        case Circle c -> System.out.println("Circle");
        case Rectangle r -> System.out.println("Rectangle");
        // Compiler error: Triangle not handled
    }
}
```

## Tools & Libraries

### IDE Support

- **IntelliJ IDEA**: Excellent support for records and sealed classes with code generation
- **Eclipse**: Full support since 2021-09 release
- **VS Code**: Java extensions provide syntax highlighting and refactoring

### Libraries Leveraging Records

- **Jackson**: Native support for records in JSON serialization
- **JDBI**: Records as result mappers
- **Spring Data**: Records in repository projections

### Build Tools

- **Maven Compiler Plugin**: Configure preview features
  ```xml
  <plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <configuration>
      <source>17</source>
      <target>17</target>
      <compilerArgs>
        <arg>--enable-preview</arg>
      </compilerArgs>
    </configuration>
  </plugin>
  ```

## References

- [JEP 395: Records](https://openjdk.org/jeps/395)
- [JEP 409: Sealed Classes](https://openjdk.org/jeps/409)
- [Pattern Matching for Java](https://openjdk.org/jeps/406)
- [Java Records Tutorial](https://docs.oracle.com/en/java/javase/17/language/records.html)

## Github-README Links & Related Topics

- [java-records](java-records/README.md)
- [java-sealed-classes](java-sealed-classes/README.md)
- [java-pattern-matching](java-pattern-matching/README.md)
- [oop-principles-in-java](oop-principles-in-java/README.md)
