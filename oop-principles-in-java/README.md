---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java, Java OOP]
tags: [#java,#oop]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) in Java revolves around four main principles: Encapsulation, Inheritance, Abstraction, and Polymorphism. These principles help in creating modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation

Encapsulation binds data and methods into a single unit (class) and restricts access to data using access modifiers like `private`, `protected`, `public`.

### Inheritance

Inheritance allows a class to inherit properties and methods from another class using the `extends` keyword. It promotes code reusability.

### Abstraction

Abstraction hides complex implementation details and shows only essential features. Achieved through abstract classes and interfaces.

### Polymorphism

Polymorphism allows objects to be treated as instances of their parent class. Includes method overloading and overriding.

## Real-world Examples & Use Cases

- Designing banking systems where accounts inherit from a base class
- GUI frameworks where components are abstracted
- Game development with polymorphic behaviors

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
        this.age = age;
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
        System.out.println("Barking...");
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
```

## References

- [Oracle - Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [GeeksforGeeks - OOPs in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

## Github-README Links & Related Topics

- [Java Fundamentals](./../java-fundamentals/README.md)
- [Inheritance in Java](./../inheritance-in-java/README.md)
- [Abstraction in Java](./../abstraction-in-java/README.md)
