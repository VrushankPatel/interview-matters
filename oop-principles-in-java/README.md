---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java]
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code. Java is an object-oriented language that implements four main principles: Encapsulation, Inheritance, Polymorphism, and Abstraction.

## Detailed Explanation

### Encapsulation

Encapsulation is the bundling of data and methods that operate on that data within a single unit, typically a class. It restricts direct access to some of an object's components.

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

### Inheritance

Inheritance allows a class to inherit properties and methods from another class. The inheriting class is called the subclass, and the class being inherited from is the superclass.

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

### Polymorphism

Polymorphism allows objects of different classes to be treated as objects of a common superclass. It can be achieved through method overriding and method overloading.

**Method Overriding:**

```java
public class Animal {
    public void makeSound() {
        System.out.println("Some sound");
    }
}

public class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Woof!");
    }
}

public class Cat extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Meow!");
    }
}
```

**Method Overloading:**

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

### Abstraction

Abstraction is the process of hiding the implementation details and showing only the functionality to the user. It can be achieved using abstract classes and interfaces.

**Abstract Class:**

```java
public abstract class Shape {
    public abstract double area();
    
    public void display() {
        System.out.println("This is a shape");
    }
}

public class Circle extends Shape {
    private double radius;
    
    public Circle(double radius) {
        this.radius = radius;
    }
    
    @Override
    public double area() {
        return Math.PI * radius * radius;
    }
}
```

**Interface:**

```java
public interface Drawable {
    void draw();
}

public class Rectangle implements Drawable {
    @Override
    public void draw() {
        System.out.println("Drawing rectangle");
    }
}
```

## Real-world Examples & Use Cases

- Banking system: Account classes with encapsulation for security.
- Game development: Character classes inheriting from base classes with polymorphic behaviors.
- GUI frameworks: Abstract components with concrete implementations.
- Plugin systems: Interfaces for extensibility.

## Code Examples

**Complete OOP Example:**

```java
// Abstract class
abstract class Vehicle {
    protected String brand;
    
    public Vehicle(String brand) {
        this.brand = brand;
    }
    
    public abstract void start();
    
    public void stop() {
        System.out.println(brand + " stopped");
    }
}

// Interface
interface Electric {
    void charge();
}

// Concrete class implementing inheritance, polymorphism, and interface
class ElectricCar extends Vehicle implements Electric {
    public ElectricCar(String brand) {
        super(brand);
    }
    
    @Override
    public void start() {
        System.out.println(brand + " electric car started silently");
    }
    
    @Override
    public void charge() {
        System.out.println(brand + " is charging");
    }
}

public class Main {
    public static void main(String[] args) {
        ElectricCar tesla = new ElectricCar("Tesla");
        tesla.start();
        tesla.charge();
        tesla.stop();
    }
}
```

## References

- [Oracle Java Tutorials: Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [Java Inheritance](https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html)
- [Java Interfaces](https://docs.oracle.com/javase/tutorial/java/IandI/createinterface.html)

## Github-README Links & Related Topics

- [Java Fundamentals](./java-fundamentals/README.md)
- [Java Design Patterns](./java-design-patterns/README.md)
- [Java Reflection](./java-reflection/README.md)
