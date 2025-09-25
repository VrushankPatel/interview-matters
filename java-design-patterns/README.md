---
title: Java Design Patterns
aliases: []
tags: [#java,#design-patterns]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Java Design Patterns are reusable solutions to common software design problems. They are categorized into Creational, Structural, and Behavioral patterns, helping developers write maintainable and scalable code.

## Detailed Explanation

### Creational Patterns
- **Singleton**: Ensures a class has only one instance.
- **Factory**: Creates objects without specifying exact classes.
- **Builder**: Constructs complex objects step-by-step.

### Structural Patterns
- **Adapter**: Allows incompatible interfaces to work together.
- **Decorator**: Adds behavior to objects dynamically.
- **Composite**: Treats individual and composite objects uniformly.

### Behavioral Patterns
- **Observer**: Notifies multiple objects of state changes.
- **Strategy**: Defines a family of algorithms.
- **Command**: Encapsulates requests as objects.

## Real-world Examples & Use Cases

- **Singleton**: Database connection pool.
- **Factory**: Creating different types of documents in an editor.
- **Observer**: Event handling in GUI frameworks like Swing.

## Code Examples

### Singleton Pattern

```java
public class Singleton {
    private static Singleton instance;
    
    private Singleton() {}
    
    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}
```

### Factory Pattern

```java
interface Shape {
    void draw();
}

class Circle implements Shape {
    public void draw() { System.out.println("Drawing Circle"); }
}

class ShapeFactory {
    public Shape getShape(String shapeType) {
        if ("CIRCLE".equals(shapeType)) {
            return new Circle();
        }
        return null;
    }
}
```

## References

- [Design Patterns: Elements of Reusable Object-Oriented Software](https://en.wikipedia.org/wiki/Design_Patterns)
- [Oracle Java Tutorials on Patterns](https://docs.oracle.com/javase/tutorial/java/concepts/)

## Github-README Links & Related Topics

- [design-patterns](../design-patterns/README.md)
- [java](../java/README.md)
- [oop-principles-in-java](../oop-principles-in-java/README.md)
