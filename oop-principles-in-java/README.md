---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java]
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) in Java revolves around four main principles: Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles help in creating modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation

Encapsulation involves bundling data and methods that operate on that data within a single unit (class). Access is controlled via access modifiers like `private`, `public`.

### Inheritance

Inheritance allows a class to inherit properties and methods from another class using `extends`. It promotes code reuse.

### Polymorphism

Polymorphism means "many forms." It allows methods to behave differently based on the object. Achieved via method overriding and overloading.

### Abstraction

Abstraction hides complex implementation details and shows only essential features. Implemented using abstract classes and interfaces.

## Real-world Examples & Use Cases

- Modeling real-world entities like employees in a payroll system.
- Designing game characters with shared behaviors.

## Code Examples

```java
// Encapsulation
public class Person {
    private String name;
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
```

```java
// Inheritance and Polymorphism
class Animal {
    void sound() { System.out.println("Animal sound"); }
}
class Dog extends Animal {
    void sound() { System.out.println("Bark"); }
}
public class Main {
    public static void main(String[] args) {
        Animal a = new Dog();
        a.sound(); // Outputs: Bark
    }
}
```

```java
// Abstraction
abstract class Shape {
    abstract double area();
}
class Circle extends Shape {
    double radius;
    Circle(double r) { radius = r; }
    double area() { return Math.PI * radius * radius; }
}
```

## References

- [Oracle OOP Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [GeeksforGeeks OOP in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals)
- [Design Patterns in Java](../design-patterns-in-java)
