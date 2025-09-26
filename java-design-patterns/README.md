---
title: Java Design Patterns
aliases: []
tags: [#java,#design-patterns]
created: 2025-09-26
updated: 2025-09-26
---

# Java Design Patterns

## Overview

Design patterns are proven solutions to recurring design problems in software development. In Java, the Gang of Four (GoF) design patterns provide a common vocabulary and best practices for object-oriented design. These patterns are categorized into three main types: Creational, Structural, and Behavioral. They help improve code reusability, maintainability, and scalability.

## Detailed Explanation

### Creational Patterns
These patterns deal with object creation mechanisms, trying to create objects in a manner suitable to the situation.

- **Singleton**: Ensures a class has only one instance and provides a global access point.
- **Factory Method**: Defines an interface for creating objects but lets subclasses decide which class to instantiate.
- **Abstract Factory**: Provides an interface for creating families of related or dependent objects without specifying their concrete classes.
- **Builder**: Separates the construction of a complex object from its representation, allowing the same construction process to create different representations.
- **Prototype**: Creates new objects by copying an existing object, known as the prototype.

### Structural Patterns
These patterns concern class and object composition, focusing on how classes and objects are composed to form larger structures.

- **Adapter**: Allows incompatible interfaces to work together by wrapping one interface around another.
- **Bridge**: Decouples an abstraction from its implementation so that the two can vary independently.
- **Composite**: Composes objects into tree structures to represent part-whole hierarchies, allowing clients to treat individual objects and compositions uniformly.
- **Decorator**: Attaches additional responsibilities to an object dynamically, providing a flexible alternative to subclassing.
- **Facade**: Provides a simplified interface to a complex subsystem.
- **Flyweight**: Uses sharing to support large numbers of fine-grained objects efficiently.
- **Proxy**: Provides a placeholder or surrogate for another object to control access to it.

### Behavioral Patterns
These patterns are concerned with algorithms and the assignment of responsibilities between objects.

- **Chain of Responsibility**: Passes requests along a chain of handlers, allowing multiple objects to handle the request.
- **Command**: Encapsulates a request as an object, allowing parameterization and queuing of requests.
- **Iterator**: Provides a way to access elements of an aggregate object sequentially without exposing its underlying representation.
- **Mediator**: Defines how a set of objects interact, promoting loose coupling by keeping objects from referring to each other explicitly.
- **Memento**: Captures and externalizes an object's internal state without violating encapsulation.
- **Observer**: Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified.
- **State**: Allows an object to alter its behavior when its internal state changes.
- **Strategy**: Defines a family of algorithms, encapsulates each one, and makes them interchangeable.
- **Template Method**: Defines the skeleton of an algorithm in a superclass but lets subclasses override specific steps.
- **Visitor**: Represents an operation to be performed on elements of an object structure, allowing new operations without changing the classes.

## Real-world Examples & Use Cases

- **Singleton**: Used for logging, database connections, or configuration managers where only one instance is needed.
- **Factory Method**: In GUI libraries to create platform-specific UI components.
- **Observer**: In event-driven systems like Java Swing for handling user interactions.
- **Decorator**: In Java I/O streams, where classes like BufferedInputStream decorate FileInputStream.
- **Strategy**: In sorting algorithms, allowing different sorting strategies to be swapped at runtime.

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
interface Product {
    void use();
}

class ConcreteProductA implements Product {
    public void use() { System.out.println("Using Product A"); }
}

class ConcreteProductB implements Product {
    public void use() { System.out.println("Using Product B"); }
}

abstract class Creator {
    abstract Product factoryMethod();

    void someOperation() {
        Product product = factoryMethod();
        product.use();
    }
}

class ConcreteCreatorA extends Creator {
    Product factoryMethod() { return new ConcreteProductA(); }
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

    void attach(Observer observer) {
        observers.add(observer);
    }

    void notifyObservers(String message) {
        for (Observer observer : observers) {
            observer.update(message);
        }
    }
}
```

## References

- [Design Patterns in Java - Refactoring.Guru](https://refactoring.guru/design-patterns/java)
- [Gang of Four Design Patterns - Wikipedia](https://en.wikipedia.org/wiki/Design_Patterns)

## Github-README Links & Related Topics

- [Java OOP Principles](../java-oop-principles/)
- [Java Fundamentals](../java-fundamentals/)
