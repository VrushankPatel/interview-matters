---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java]
tags: [#java,#oop]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code. Java is an OOP language that supports four main principles: Encapsulation, Inheritance, Polymorphism, and Abstraction.

## Detailed Explanation

### Encapsulation

Encapsulation is the mechanism of wrapping the data (variables) and code acting on the data (methods) together as a single unit.

```java
public class Student {
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

### Inheritance

Inheritance is a mechanism where one class acquires the property of another class.

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

### Polymorphism

Polymorphism allows one interface to be used for a general class of actions.

Method Overloading:

```java
public class Calculator {
    public int add(int a, int b) {
        return a + b;
    }

    public double add(double a, double b) {
        return a + b;
    }
}
```

Method Overriding:

```java
public class Animal {
    public void sound() {
        System.out.println("Animal sound");
    }
}

public class Dog extends Animal {
    @Override
    public void sound() {
        System.out.println("Bark");
    }
}
```

### Abstraction

Abstraction is a process of hiding the implementation details and showing only functionality to the user.

Using abstract classes:

```java
public abstract class Shape {
    abstract void draw();
}

public class Circle extends Shape {
    void draw() {
        System.out.println("Drawing Circle");
    }
}
```

Using interfaces:

```java
public interface Drawable {
    void draw();
}

public class Rectangle implements Drawable {
    public void draw() {
        System.out.println("Drawing Rectangle");
    }
}
```

## Real-world Examples & Use Cases

- Banking system: Account classes with inheritance for different account types.

- Game development: Character classes with polymorphism for different behaviors.

- GUI frameworks: Abstract components with concrete implementations.

## Code Examples

### Complete OOP Example

```java
// Abstraction
abstract class Vehicle {
    abstract void start();
    abstract void stop();
}

// Inheritance and Polymorphism
class Car extends Vehicle {
    @Override
    void start() {
        System.out.println("Car started");
    }

    @Override
    void stop() {
        System.out.println("Car stopped");
    }
}

class Bike extends Vehicle {
    @Override
    void start() {
        System.out.println("Bike started");
    }

    @Override
    void stop() {
        System.out.println("Bike stopped");
    }
}

// Encapsulation
class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
}

public class Main {
    public static void main(String[] args) {
        Vehicle car = new Car();
        car.start();
        car.stop();

        Person p = new Person("John", 25);
        System.out.println(p.getName() + " is " + p.getAge() + " years old");
    }
}
```

## References

- [Oracle OOP Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/)

- [GeeksforGeeks OOP](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)

- [Design Patterns in Java](../design-patterns-in-java/README.md)
