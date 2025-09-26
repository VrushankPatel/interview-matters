---
title: Abstraction in Java
aliases: []
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# Abstraction in Java

## Overview
Abstraction is an OOP principle that focuses on hiding complex implementation details and showing only the essential features of an object. It allows developers to focus on what an object does rather than how it does it.

## Detailed Explanation
In Java, abstraction is implemented using:
- **Abstract Classes**: Classes that cannot be instantiated and may contain abstract methods (without implementation).
- **Interfaces**: Contracts that define methods that implementing classes must provide.

Abstract classes can have both abstract and concrete methods, while interfaces (since Java 8) can have default and static methods.

### Key Concepts
- **Abstract Methods**: Declared without implementation.
- **Concrete Methods**: Fully implemented methods.
- **Implementation Hiding**: Users interact with abstractions, not implementations.

## Real-world Examples & Use Cases
- **Vehicle**: An abstract `Vehicle` class with `startEngine()` abstract method, implemented by `Car`, `Bike`.
- **Database Connection**: An interface `Database` with methods like `connect()`, `query()`, implemented by `MySQLDatabase`, `PostgreSQLDatabase`.
- **Shape**: Abstract `Shape` with `area()` method, overridden in `Circle`, `Square`.

## Code Examples
```java
// Abstract Class
public abstract class Shape {
    protected String color;
    
    public Shape(String color) {
        this.color = color;
    }
    
    public abstract double area();
    
    public void displayColor() {
        System.out.println("Color: " + color);
    }
}

public class Circle extends Shape {
    private double radius;
    
    public Circle(String color, double radius) {
        super(color);
        this.radius = radius;
    }
    
    @Override
    public double area() {
        return Math.PI * radius * radius;
    }
}

// Interface
public interface Drawable {
    void draw();
}

public class Rectangle implements Drawable {
    @Override
    public void draw() {
        System.out.println("Drawing rectangle");
    }
}
```

## References
- [Oracle Java Documentation: Abstraction](https://docs.oracle.com/javase/tutorial/java/IandI/abstract.html)
- [GeeksforGeeks: Abstraction in Java](https://www.geeksforgeeks.org/abstraction-in-java-2/)

## Github-README Links & Related Topics
- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [Abstract Classes in Java](../abstract-classes-in-java/README.md)
- [Interfaces in Java](../interfaces-in-java/README.md)