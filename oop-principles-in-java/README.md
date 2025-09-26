---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java]
tags: [#java,#oop]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Object-Oriented Programming (OOP) principles in Java form the foundation of designing modular, maintainable, and scalable software. The four main principles are Encapsulation, Inheritance, Polymorphism, and Abstraction.

# Detailed Explanation

OOP is a programming paradigm that uses objects and classes to structure code. In Java, everything is an object (except primitives).

## Encapsulation

Bundling data and methods that operate on that data within a single unit (class), and restricting access to internal state.

## Inheritance

Creating new classes from existing ones, inheriting properties and behaviors.

## Polymorphism

The ability of objects to take on multiple forms, allowing methods to behave differently based on the object calling them.

## Abstraction

Hiding complex implementation details and showing only essential features.

# Real-world Examples & Use Cases

- Modeling real-world entities in applications (e.g., User, Product classes)
- Building frameworks and libraries
- Designing game characters with shared behaviors
- Implementing plugin architectures

# Code Examples

## Encapsulation

```java
public class BankAccount {
    private double balance;
    
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }
    
    public double getBalance() {
        return balance;
    }
}
```

## Inheritance

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
}
```

## Polymorphism

```java
public class Shape {
    public void draw() {
        System.out.println("Drawing a shape");
    }
}

public class Circle extends Shape {
    @Override
    public void draw() {
        System.out.println("Drawing a circle");
    }
}

public class Square extends Shape {
    @Override
    public void draw() {
        System.out.println("Drawing a square");
    }
}

// Usage
Shape shape1 = new Circle();
Shape shape2 = new Square();
shape1.draw(); // Drawing a circle
shape2.draw(); // Drawing a square
```

## Abstraction

```java
abstract class Vehicle {
    abstract void start();
    
    public void stop() {
        System.out.println("Vehicle stopped");
    }
}

class Car extends Vehicle {
    @Override
    void start() {
        System.out.println("Car started with key");
    }
}
```

# References

- [Oracle OOP Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/)
- [GeeksforGeeks OOP in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

# Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/)
- [Inheritance in Java](../inheritance-in-java/)
- [Polymorphism in Java](../polymorphism-in-java/)
- [Encapsulation in Java](../encapsulation-in-java/)
