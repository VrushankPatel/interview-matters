---
title: OOP Principles in Java
aliases: [Object Oriented Programming in Java]
tags: [#java, #oop]
created: 2023-10-01
updated: 2025-09-26
---

# Overview

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code. Java is an OOP language that supports four main principles: Encapsulation, Inheritance, Polymorphism, Abstraction.

# Detailed Explanation

## Encapsulation

Wrapping data and methods into a single unit (class). Access modifiers: public, private, protected.

## Inheritance

A class can inherit properties and methods from another class using 'extends'.

## Polymorphism

Ability to take many forms. Method overloading and overriding.

## Abstraction

Hiding complex implementation details and showing only essential features. Achieved through abstract classes and interfaces.

# Real-world Examples & Use Cases

- Modeling real-world entities like Car, Person in code.
- Building reusable components in large applications.

# Code Examples

```java
// Encapsulation
public class Person {
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
```

```java
// Inheritance
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

# References

- [Oracle OOP Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)

# Github-README Links & Related Topics

- [java-fundamentals](../java-fundamentals/)
- [inheritance-in-java](../inheritance-in-java/)
- [encapsulation-in-java](../encapsulation-in-java/)
- [abstraction-in-java](../abstraction-in-java/)