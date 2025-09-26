---
title: OOP Principles in Java
aliases: [Object Oriented Programming in Java, Java OOP]
tags: [#java,#oop,#principles]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) in Java revolves around four core principles: Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles enable modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation

Bundling data and methods into a class, restricting access via access modifiers.

```java
public class Person {
    private String name;
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
```

### Inheritance

Creating new classes from existing ones, promoting code reuse.

```java
class Animal {
    void eat() { System.out.println("Eating"); }
}

class Dog extends Animal {
    void bark() { System.out.println("Barking"); }
}
```

### Polymorphism

Ability to take multiple forms; method overriding and overloading.

```java
class Animal {
    void sound() { System.out.println("Sound"); }
}

class Dog extends Animal {
    void sound() { System.out.println("Bark"); }
}
```

### Abstraction

Hiding implementation details; using abstract classes and interfaces.

```java
abstract class Shape {
    abstract double area();
}

class Circle extends Shape {
    double radius;
    double area() { return Math.PI * radius * radius; }
}
```

## Real-world Examples & Use Cases

- **Banking System**: Account classes with encapsulation.
- **Game Development**: Character inheritance hierarchies.

## Code Examples

See above for each principle.

## Common Pitfalls & Edge Cases

- **Tight Coupling**: Overuse of inheritance.
- **Fragile Base Class**: Changes break subclasses.

## Tools & Libraries

- **Java Standard Library**: Built-in OOP support.

## References

- [OOP in Java](https://www.javatpoint.com/java-oop-concepts)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/)
- [Design Patterns in Java](../design-patterns-in-java/)
