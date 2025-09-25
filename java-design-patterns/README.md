---
title: Java Design Patterns
aliases: []
tags: [#java, #design-patterns]
created: 2025-09-25
updated: 2025-09-25
---

# Java Design Patterns

## Overview

Design patterns are proven solutions to common software design problems. In Java, they help create flexible, maintainable, and reusable code. Patterns are categorized into Creational, Structural, and Behavioral.

## Detailed Explanation

### Categories

- **Creational Patterns**: Deal with object creation mechanisms.
- **Structural Patterns**: Concern class and object composition.
- **Behavioral Patterns**: Focus on communication between objects.

### Common Patterns

| Pattern | Category | Purpose |
|---------|----------|---------|
| Singleton | Creational | Ensure single instance |
| Factory | Creational | Create objects without specifying class |
| Observer | Behavioral | Notify dependents of state changes |
| Decorator | Structural | Add responsibilities dynamically |

## Real-world Examples & Use Cases

- **Singleton**: Database connection pool, logging manager.
- **Factory**: GUI components, parsers for different file types.
- **Observer**: Event handling in GUI frameworks, model-view updates.
- **Decorator**: Adding features to streams, UI components with borders.

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

class Rectangle implements Shape {
    public void draw() { System.out.println("Drawing Rectangle"); }
}

class ShapeFactory {
    public Shape getShape(String shapeType) {
        if (shapeType.equalsIgnoreCase("CIRCLE")) {
            return new Circle();
        } else if (shapeType.equalsIgnoreCase("RECTANGLE")) {
            return new Rectangle();
        }
        return null;
    }
}
```

### Observer Pattern

```java
import java.util.ArrayList;
import java.util.List;

interface Observer {
    void update(String message);
}

class Subject {
    private List<Observer> observers = new ArrayList<>();

    public void attach(Observer observer) {
        observers.add(observer);
    }

    public void notifyAllObservers(String message) {
        for (Observer observer : observers) {
            observer.update(message);
        }
    }
}

class ConcreteObserver implements Observer {
    public void update(String message) {
        System.out.println("Received: " + message);
    }
}
```

## References

- [Gang of Four Design Patterns](https://en.wikipedia.org/wiki/Design_Patterns)
- [Oracle Java Design Patterns](https://www.oracle.com/java/technologies/design-patterns.html)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [OOP Principles in Java](../oop-principles-in-java/README.md)