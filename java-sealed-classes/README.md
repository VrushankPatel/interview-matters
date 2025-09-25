---
title: Java Sealed Classes
aliases: [Sealed Classes]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Sealed classes in Java, introduced in Java 17, allow developers to restrict which classes can extend or implement a particular class or interface. This feature enhances encapsulation, enables exhaustive pattern matching, and provides better control over class hierarchies in domain modeling.

## Detailed Explanation

A sealed class is declared with the `sealed` modifier and includes a `permits` clause that lists the classes allowed to extend it. Permitted subclasses must be declared as `final`, `sealed`, or `non-sealed`. Sealed classes prevent unauthorized inheritance, ensuring that the hierarchy is closed and known at compile time.

Key points:
- Permitted classes must be in the same package or module as the sealed class.
- `final` subclasses cannot be extended further.
- `sealed` subclasses can permit their own subclasses.
- `non-sealed` subclasses allow further extension.

This is particularly useful for algebraic data types and exhaustive switches.

## Real-world Examples & Use Cases

- **Payment Processing**: Define a sealed `PaymentMethod` class with permitted subclasses like `CreditCard`, `DebitCard`, and `PayPal`, ensuring no other payment types can be added without explicit permission.
- **State Machines**: Model states in a workflow where only specific transitions are allowed.
- **API Responses**: Restrict response types in a REST API to prevent unexpected implementations.

## Code Examples

### Basic Sealed Class

```java
public sealed class Shape permits Circle, Rectangle {
    public abstract double area();
}

public final class Circle extends Shape {
    private double radius;
    
    public Circle(double radius) {
        this.radius = radius;
    }
    
    @Override
    public double area() {
        return Math.PI * radius * radius;
    }
}

public final class Rectangle extends Shape {
    private double width, height;
    
    public Rectangle(double width, double height) {
        this.width = width;
        this.height = height;
    }
    
    @Override
    public double area() {
        return width * height;
    }
}
```

### Exhaustive Pattern Matching

```java
public void printArea(Shape shape) {
    double area = switch (shape) {
        case Circle c -> c.area();
        case Rectangle r -> r.area();
    };
    System.out.println("Area: " + area);
}
```

### Sealed Interface

```java
public sealed interface Expr permits Constant, BinaryOp {
    double evaluate();
}

public record Constant(double value) implements Expr {
    @Override
    public double evaluate() {
        return value;
    }
}

public record BinaryOp(Expr left, Expr right, char op) implements Expr {
    @Override
    public double evaluate() {
        return switch (op) {
            case '+' -> left.evaluate() + right.evaluate();
            case '-' -> left.evaluate() - right.evaluate();
            default -> throw new IllegalArgumentException("Unknown operator");
        };
    }
}
```

## Common Pitfalls & Edge Cases

- Permitted classes must be accessible; private classes in the same file are allowed.
- Sealed classes cannot be used with anonymous classes or lambda expressions.
- Ensure all permitted classes are compiled together to avoid linkage errors.

## Common Pitfalls & Edge Cases

- Permitted classes must be accessible; private classes in the same file are allowed.
- Sealed classes cannot be used with anonymous classes or lambda expressions.
- Ensure all permitted classes are compiled together to avoid linkage errors.
- Inheritance restrictions can make refactoring challenging if the hierarchy needs to expand.

## Tools & Libraries

- **Jackson**: JSON serialization support for sealed classes.
- **Spring Boot**: Configuration and dependency injection with sealed classes.
- **MapStruct**: Mapping frameworks that can work with sealed hierarchies.

## References

- [Oracle Java Documentation: Sealed Classes](https://docs.oracle.com/en/java/javase/17/language/sealed-classes-and-interfaces.html)
- [JEP 409: Sealed Classes](https://openjdk.org/jeps/409)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [Java Language Basics](../java/java-language-basics/README.md)