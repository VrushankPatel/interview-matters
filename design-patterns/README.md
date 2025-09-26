---
title: Design Patterns
aliases: [software design patterns, gang of four patterns]
tags: [#system-design,#design-patterns]
created: 2025-09-25
updated: 2025-09-26
---

## Overview
Design patterns are proven solutions to recurring design problems in software development. They provide a template for how to solve a problem in a way that is reusable, maintainable, and efficient. Introduced by the Gang of Four (GoF) in their book "Design Patterns: Elements of Reusable Object-Oriented Software", design patterns are categorized into three main types: Creational, Structural, and Behavioral.

## Detailed Explanation
### Creational Patterns
These patterns deal with object creation mechanisms, trying to create objects in a manner suitable to the situation.

- **Singleton**: Ensures a class has only one instance and provides a global point of access to it.
- **Factory Method**: Defines an interface for creating an object, but lets subclasses decide which class to instantiate.
- **Abstract Factory**: Provides an interface for creating families of related or dependent objects without specifying their concrete classes.
- **Builder**: Separates the construction of a complex object from its representation.
- **Prototype**: Creates new objects by copying an existing object.

### Structural Patterns
These patterns concern class and object composition, focusing on how classes and objects are composed to form larger structures.

- **Adapter**: Allows incompatible interfaces to work together.
- **Bridge**: Decouples an abstraction from its implementation.
- **Composite**: Composes objects into tree structures to represent part-whole hierarchies.
- **Decorator**: Adds additional responsibilities to an object dynamically.
- **Facade**: Provides a unified interface to a set of interfaces in a subsystem.
- **Flyweight**: Uses sharing to support large numbers of fine-grained objects efficiently.
- **Proxy**: Provides a placeholder or surrogate for another object to control access to it.

### Behavioral Patterns
These patterns are concerned with algorithms and the assignment of responsibilities between objects.

- **Chain of Responsibility**: Passes requests along a chain of handlers.
- **Command**: Encapsulates a request as an object.
- **Interpreter**: Defines a representation for a grammar and an interpreter.
- **Iterator**: Provides a way to access elements of an aggregate object sequentially.
- **Mediator**: Defines how a set of objects interact.
- **Memento**: Captures and externalizes an object's internal state.
- **Observer**: Defines a one-to-many dependency between objects.
- **State**: Allows an object to alter its behavior when its internal state changes.
- **Strategy**: Defines a family of algorithms, encapsulates each one, and makes them interchangeable.
- **Template Method**: Defines the skeleton of an algorithm in a method, deferring some steps to subclasses.
- **Visitor**: Represents an operation to be performed on elements of an object structure.

## Real-world Examples & Use Cases
- **Singleton**: Database connection pool, logging service.
- **Factory Method**: GUI components creation in different operating systems.
- **Observer**: Event handling in user interfaces, publish-subscribe systems.
- **Strategy**: Payment processing with different algorithms (credit card, PayPal).
- **Decorator**: Adding features to a base object, like adding toppings to a pizza.
- **Adapter**: Integrating legacy code with new systems.

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

### Factory Method Pattern
```java
interface Shape {
    void draw();
}

class Circle implements Shape {
    public void draw() {
        System.out.println("Drawing Circle");
    }
}

class Rectangle implements Shape {
    public void draw() {
        System.out.println("Drawing Rectangle");
    }
}

abstract class ShapeFactory {
    abstract Shape createShape();
}

class CircleFactory extends ShapeFactory {
    Shape createShape() {
        return new Circle();
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

class ConcreteObserver implements Observer {
    public void update(String message) {
        System.out.println("Received: " + message);
    }
}

class Subject {
    private List<Observer> observers = new ArrayList<>();
    
    public void addObserver(Observer observer) {
        observers.add(observer);
    }
    
    public void notifyObservers(String message) {
        for (Observer observer : observers) {
            observer.update(message);
        }
    }
}
```

## References
- "Design Patterns: Elements of Reusable Object-Oriented Software" by Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides
- https://refactoring.guru/design-patterns
- https://github.com/iluwatar/java-design-patterns

## Github-README Links & Related Topics
- [lld-hld-basics](../lld-hld-basics/)
- [java-design-patterns](../java-design-patterns/)
- [system-design-basics](../system-design-basics/)