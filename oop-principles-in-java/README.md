---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java]
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Object-Oriented Programming (OOP) principles in Java revolve around four core concepts: Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles enable modular, reusable, and maintainable code.

# Detailed Explanation

OOP is a programming paradigm that uses objects and classes to structure software. In Java:

- **Encapsulation**: Bundling data and methods into classes, controlling access via modifiers (private, public).
- **Inheritance**: Creating new classes from existing ones, promoting code reuse.
- **Polymorphism**: Ability of objects to take multiple forms, achieved through method overriding and overloading.
- **Abstraction**: Hiding complex implementation details, focusing on essential features.

Java supports these through classes, interfaces, and abstract classes.

# Real-world Examples & Use Cases

- **Banking System**: Account classes with encapsulated balance and transaction methods.
- **Game Development**: Character classes inheriting from base entities with polymorphic behaviors.
- **E-commerce**: Product hierarchies using inheritance and abstraction for different item types.

Example: A vehicle rental system with base Vehicle class and derived Car and Bike classes.

# Code Examples

Encapsulation example:

```java
public class BankAccount {
    private double balance;
    
    public BankAccount(double initialBalance) {
        this.balance = initialBalance;
    }
    
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

Inheritance example:

```java
public class Animal {
    public void eat() {
        System.out.println("Animal eats");
    }
}

public class Dog extends Animal {
    public void bark() {
        System.out.println("Dog barks");
    }
}
```

Polymorphism example:

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
```

# References

- [Oracle OOP Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/)
- [GeeksforGeeks OOP in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

# Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/)
- [Design Patterns in Java](../design-patterns-in-java/)