---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java, Java OOP]
tags: [#java,#oop]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code. Java is an object-oriented language that implements four main principles: Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles help in creating modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation

Encapsulation is the bundling of data and methods that operate on that data within a single unit (class). It restricts direct access to some of an object's components, which is a means of preventing accidental interference and misuse of the data.

**Key Concepts:**
- Private fields and public getter/setter methods
- Data hiding
- Access modifiers: private, protected, public, default

### Inheritance

Inheritance allows a class (subclass) to inherit properties and behaviors from another class (superclass). It promotes code reusability and establishes a relationship between classes.

**Key Concepts:**
- `extends` keyword
- Method overriding
- `super` keyword
- Single inheritance in Java (multiple inheritance through interfaces)

### Polymorphism

Polymorphism allows objects of different classes to be treated as objects of a common superclass. It enables one interface to be used for a general class of actions.

**Types:**
- Compile-time (method overloading)
- Runtime (method overriding)

### Abstraction

Abstraction is the process of hiding complex implementation details and showing only the essential features of an object. It helps in reducing complexity and increasing efficiency.

**Implementation:**
- Abstract classes
- Interfaces
- Abstract methods

## Real-world Examples & Use Cases

- **Banking System:** Using encapsulation to protect account balances, inheritance for different account types (savings, checking), polymorphism for interest calculations.
- **Vehicle Management:** Abstraction for different vehicle types, inheritance hierarchy (Car extends Vehicle), polymorphism for movement methods.
- **Employee Management System:** Encapsulation for employee data, inheritance for different employee types (Manager, Developer), abstraction for common behaviors.

## Code Examples

### Encapsulation Example
```java
public class BankAccount {
    private double balance;
    private String accountNumber;
    
    public BankAccount(String accountNumber, double initialBalance) {
        this.accountNumber = accountNumber;
        this.balance = initialBalance;
    }
    
    public double getBalance() {
        return balance;
    }
    
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }
    
    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
        }
    }
}
```

### Inheritance Example
```java
public class Animal {
    protected String name;
    
    public Animal(String name) {
        this.name = name;
    }
    
    public void eat() {
        System.out.println(name + " is eating");
    }
}

public class Dog extends Animal {
    public Dog(String name) {
        super(name);
    }
    
    @Override
    public void eat() {
        System.out.println(name + " is eating dog food");
    }
    
    public void bark() {
        System.out.println("Woof!");
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

// Usage
public class Main {
    public static void main(String[] args) {
        Shape shape1 = new Circle();
        Shape shape2 = new Square();
        
        shape1.draw(); // Drawing a circle
        shape2.draw(); // Drawing a square
    }
}
```

### Abstraction Example
```java
public abstract class Vehicle {
    protected String brand;
    
    public Vehicle(String brand) {
        this.brand = brand;
    }
    
    public abstract void start();
    public abstract void stop();
    
    public void honk() {
        System.out.println("Honk honk!");
    }
}

public class Car extends Vehicle {
    public Car(String brand) {
        super(brand);
    }
    
    @Override
    public void start() {
        System.out.println(brand + " car is starting");
    }
    
    @Override
    public void stop() {
        System.out.println(brand + " car is stopping");
    }
}
```

## References

- [Oracle Java Tutorials - Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [Encapsulation in Java](https://www.geeksforgeeks.org/encapsulation-in-java/)
- [Inheritance in Java](https://www.geeksforgeeks.org/inheritance-in-java/)
- [Polymorphism in Java](https://www.geeksforgeeks.org/polymorphism-in-java/)
- [Abstraction in Java](https://www.geeksforgeeks.org/abstraction-in-java/)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Design Patterns in Java](../design-patterns-in-java/README.md)
- [Inheritance in Java](../inheritance-in-java/README.md)
- [Encapsulation in Java](../encapsulation-in-java/README.md)
- [Polymorphism in Java](../polymorphism-in-java/README.md)
- [Abstraction in Java](../abstraction-in-java/README.md)
