---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java]
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Object-Oriented Programming (OOP) principles in Java form the backbone of Java's design philosophy. The four main principles are Encapsulation, Inheritance, Polymorphism, and Abstraction, which help in creating modular, reusable, and maintainable code.

# Detailed Explanation

## Encapsulation

Encapsulation involves bundling data and methods that operate on that data within a single unit (class) and restricting access to some components.

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
}
```

## Inheritance

Inheritance allows a class to inherit properties and methods from another class, promoting code reuse.

```java
public class Animal {
    public void eat() {
        System.out.println("Eating");
    }
}

public class Dog extends Animal {
    public void bark() {
        System.out.println("Barking");
    }
}
```

## Polymorphism

Polymorphism allows objects to be treated as instances of their parent class, enabling method overriding and overloading.

```java
// Method Overriding
public class Cat extends Animal {
    @Override
    public void eat() {
        System.out.println("Cat eating");
    }
}

// Method Overloading
public class Calculator {
    public int add(int a, int b) {
        return a + b;
    }

    public double add(double a, double b) {
        return a + b;
    }
}
```

## Abstraction

Abstraction hides complex implementation details and shows only the necessary features.

```java
abstract class Shape {
    abstract double area();
}

public class Circle extends Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    double area() {
        return Math.PI * radius * radius;
    }
}
```

# Real-world Examples & Use Cases

- Banking system: Using encapsulation to protect account details, inheritance for different account types (Savings, Checking).
- Game development: Polymorphism for different character behaviors, abstraction for game entities.
- E-commerce: Inheritance for product categories, encapsulation for user data.

# Code Examples

### Complete OOP Example

```java
// Abstraction
abstract class Vehicle {
    abstract void start();
    abstract void stop();
}

// Inheritance and Polymorphism
public class Car extends Vehicle {
    @Override
    void start() {
        System.out.println("Car started");
    }

    @Override
    void stop() {
        System.out.println("Car stopped");
    }
}

// Encapsulation
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

# References

- [Oracle Java Tutorials - Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [GeeksforGeeks - OOPs in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

# Github-README Links & Related Topics

- [java-fundamentals](../java-fundamentals/README.md)
- [design-patterns](../design-patterns/README.md)
- [java-design-patterns](../java-design-patterns/README.md)
