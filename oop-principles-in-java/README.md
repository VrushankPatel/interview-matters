---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java]
tags: [#java, #oop]
created: 2025-09-25
updated: 2025-09-25
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) principles in Java form the foundation of designing modular, reusable, and maintainable code. The four main principles are Encapsulation, Inheritance, Polymorphism, and Abstraction.

## Detailed Explanation

### Encapsulation

Encapsulation is the bundling of data and methods that operate on that data within a single unit (class). It restricts direct access to some of an object's components.

- Achieved using access modifiers: private, protected, public.
- Getters and setters for controlled access.

### Inheritance

Inheritance allows a class (subclass) to inherit properties and methods from another class (superclass). It promotes code reusability.

- Use `extends` keyword.
- Supports single inheritance in Java.

### Polymorphism

Polymorphism means "many forms." It allows objects to be treated as instances of their parent class, enabling method overriding and overloading.

- **Method Overloading**: Same method name, different parameters.
- **Method Overriding**: Subclass provides specific implementation of a method in superclass.

### Abstraction

Abstraction hides complex implementation details and shows only essential features. Achieved through abstract classes and interfaces.

- Abstract classes: Can have abstract methods (no body) and concrete methods.
- Interfaces: All methods are abstract by default (until Java 8).

## Real-world Examples & Use Cases

- **Banking System**: Encapsulation for account details, inheritance for different account types (Savings, Checking), polymorphism for interest calculation.
- **Vehicle Management**: Abstraction for Vehicle class, inheritance for Car, Bike subclasses.
- **E-commerce**: Polymorphism for payment methods (Credit Card, PayPal).

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
        System.out.println("Barking...");
    }
}

// Usage
Dog dog = new Dog();
dog.eat();  // Inherited
dog.bark();
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
s1.draw();  // Drawing circle
s2.draw();  // Drawing square
```

### Abstraction Example

```java
abstract class Vehicle {
    abstract void start();
    void stop() {
        System.out.println("Vehicle stopped");
    }
}

public class Car extends Vehicle {
    @Override
    void start() {
        System.out.println("Car started");
    }
}
```

## References

- [Oracle: Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [GeeksforGeeks: OOPs in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)
- [Tutorialspoint: Java OOPs Concepts](https://www.tutorialspoint.com/java/java_oop.htm)

## Github-README Links & Related Topics

- [Java Fundamentals](java-fundamentals/)
- [JVM Internals & Class Loading](jvm-internals-class-loading/)
- [Design Patterns](design-patterns/)
