---
title: OOP Principles in Java
aliases: ["Object-Oriented Programming in Java", "Java OOP"]
tags: ["#java", "#oop"]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) is a programming paradigm that uses objects and classes to structure software. Java is fundamentally an OOP language, implementing four core principles: Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles help in creating modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation

Encapsulation is the bundling of data and methods that operate on that data within a single unit (class). It restricts direct access to some of an object's components.

- **Access Modifiers**: public, private, protected, default
- **Getters and Setters**: Methods to access private fields

### Inheritance

Inheritance allows a class to inherit properties and methods from another class. It promotes code reusability.

- **extends** keyword for inheritance
- **super** keyword to call parent methods
- **Method Overriding**: Subclass provides specific implementation

### Polymorphism

Polymorphism means "many forms". It allows objects to be treated as instances of their parent class.

- **Compile-time (Overloading)**: Multiple methods with same name but different parameters
- **Runtime (Overriding)**: Subclass method overrides parent method

### Abstraction

Abstraction hides complex implementation details and shows only essential features.

- **Abstract Classes**: Cannot be instantiated, can have abstract methods
- **Interfaces**: Contract for classes, all methods are abstract (until Java 8)

## Real-world Examples & Use Cases

- **Banking System**: Account class with encapsulation for balance, inheritance for different account types
- **Game Development**: Polymorphism for different enemy types
- **GUI Frameworks**: Abstraction for UI components

## Code Examples

### Encapsulation Example

```java
public class Person {
    private String name;
    private int age;
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public int getAge() {
        return age;
    }
    
    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        }
    }
}
```

### Inheritance Example

```java
public class Animal {
    public void eat() {
        System.out.println("Eating...");
    }
}

public class Dog extends Animal {
    public void bark() {
        System.out.println("Woof!");
    }
    
    @Override
    public void eat() {
        System.out.println("Dog eating...");
    }
}
```

### Polymorphism Example

```java
public class Shape {
    public void draw() {
        System.out.println("Drawing shape");
    }
}

public class Circle extends Shape {
    @Override
    public void draw() {
        System.out.println("Drawing circle");
    }
}

public class Square extends Shape {
    @Override
    public void draw() {
        System.out.println("Drawing square");
    }
}

// Usage
Shape s1 = new Circle();
Shape s2 = new Square();
s1.draw(); // Drawing circle
s2.draw(); // Drawing square
```

### Abstraction Example

```java
public abstract class Vehicle {
    public abstract void start();
    
    public void stop() {
        System.out.println("Vehicle stopped");
    }
}

public class Car extends Vehicle {
    @Override
    public void start() {
        System.out.println("Car started");
    }
}
```

## References

- [Oracle Java Tutorials: Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [Java Inheritance](https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/)
- [Design Patterns](../design-patterns/)
- [Java Generics](../java-generics/)
