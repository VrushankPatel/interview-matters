---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java, Java OOP]
tags: [#java,#oop]
created: 2025-09-25
updated: 2025-09-25
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code. Java implements OOP through four main principles: Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles help in creating modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation

Encapsulation is the bundling of data (attributes) and methods (functions) that operate on the data into a single unit called a class. It restricts direct access to some of an object's components, which is a means of preventing accidental interference and misuse.

- **Access Modifiers**: public, private, protected, default.
- **Getters and Setters**: Methods to access and modify private fields.

### Inheritance

Inheritance allows a class (subclass) to inherit properties and methods from another class (superclass). It promotes code reusability and establishes a relationship between classes.

- **Types**: Single, Multilevel, Hierarchical, Multiple (via interfaces).
- **Keywords**: extends, super.

### Polymorphism

Polymorphism means "many forms". It allows objects of different classes to be treated as objects of a common superclass. It can be achieved through method overloading and method overriding.

- **Compile-time Polymorphism**: Method overloading.
- **Runtime Polymorphism**: Method overriding.

### Abstraction

Abstraction is the process of hiding complex implementation details and showing only the essential features of an object. It helps in reducing complexity and increasing efficiency.

- **Abstract Classes**: Cannot be instantiated, can have abstract methods.
- **Interfaces**: Blueprint for classes, can have abstract methods and constants.

## Real-world Examples & Use Cases

- **Banking System**: Account classes with encapsulation for security, inheritance for different account types (Savings, Checking), polymorphism for interest calculation.
- **Vehicle Management**: Abstract Vehicle class with concrete implementations like Car, Bike; polymorphism for movement methods.
- **Employee Management**: Inheritance hierarchy from Employee to Manager, Developer; abstraction for common behaviors.

## Code Examples

### Encapsulation Example

```java
public class Person {
    private String name;
    private int age;
    
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
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
        System.out.println("Animal is eating");
    }
}

public class Dog extends Animal {
    public void bark() {
        System.out.println("Dog is barking");
    }
    
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.eat();  // Inherited method
        dog.bark(); // Own method
    }
}
```

### Polymorphism Example

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

public class Main {
    public static void main(String[] args) {
        Shape shape1 = new Circle();
        Shape shape2 = new Square();
        
        shape1.draw(); // Outputs: Drawing a circle
        shape2.draw(); // Outputs: Drawing a square
    }
}
```

### Abstraction Example

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
        System.out.println("Car started");
    }
}

public class Main {
    public static void main(String[] args) {
        Vehicle car = new Car();
        car.start();
        car.stop();
    }
}
```

## References

- [Oracle Java Tutorials: Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/)
- [GeeksforGeeks: OOPs in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)
- [Head First Java by Kathy Sierra and Bert Bates](https://www.amazon.com/Head-First-Java-Kathy-Sierra/dp/0596009208)

## Github-README Links & Related Topics

- [Java Fundamentals](./java-fundamentals)
- [Design Patterns in Java](./design-patterns-in-java)
- [JVM Internals & Class Loading](./jvm-internals-class-loading)