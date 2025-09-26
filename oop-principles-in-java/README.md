---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java, Java OOP]
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview
Object-Oriented Programming (OOP) principles in Java provide a structured approach to software development. The four main principles are Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles help in creating modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation
Encapsulation is the bundling of data and methods that operate on that data within a single unit (class). It restricts direct access to some of an object's components, which is a means of preventing accidental interference and misuse of the data.

### Inheritance
Inheritance allows a class to inherit properties and methods from another class. The inheriting class is called the subclass, and the class being inherited from is called the superclass. It promotes code reusability.

### Polymorphism
Polorphism allows objects of different classes to be treated as objects of a common superclass. It can be achieved through method overriding (runtime polymorphism) and method overloading (compile-time polymorphism).

### Abstraction
Abstraction is the process of hiding the implementation details and showing only the functionality to the user. It can be achieved using abstract classes and interfaces.

## Real-world Examples & Use Cases
- **Banking System**: Account classes with encapsulation for security
- **Vehicle Hierarchy**: Car, Bike inheriting from Vehicle
- **Payment Processing**: Different payment methods implementing a common interface
- **GUI Components**: Abstract button class with concrete implementations

## Code Examples

### Encapsulation
```java
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

public class Main {
    public static void main(String[] args) {
        BankAccount account = new BankAccount();
        account.deposit(1000);
        System.out.println("Balance: " + account.getBalance());
    }
}
```

### Inheritance
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

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.eat();  // Inherited method
        dog.bark(); // Own method
    }
}
```

### Polymorphism
```java
public class Animal {
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

public class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
}

public class Cat extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Cat meows");
    }
}

public class Main {
    public static void main(String[] args) {
        Animal animal1 = new Dog();
        Animal animal2 = new Cat();
        
        animal1.makeSound(); // Dog barks
        animal2.makeSound(); // Cat meows
    }
}
```

### Abstraction
```java
abstract class Shape {
    abstract double area();
}

class Circle extends Shape {
    private double radius;
    
    public Circle(double radius) {
        this.radius = radius;
    }
    
    @Override
    double area() {
        return Math.PI * radius * radius;
    }
}

class Rectangle extends Shape {
    private double length, width;
    
    public Rectangle(double length, double width) {
        this.length = length;
        this.width = width;
    }
    
    @Override
    double area() {
        return length * width;
    }
}

public class Main {
    public static void main(String[] args) {
        Shape circle = new Circle(5);
        Shape rectangle = new Rectangle(4, 6);
        
        System.out.println("Circle area: " + circle.area());
        System.out.println("Rectangle area: " + rectangle.area());
    }
}
```

## References
- [Oracle OOP Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/)
- "Head First Java" by Kathy Sierra and Bert Bates
- [GeeksforGeeks OOP in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

## Github-README Links & Related Topics
- [java-fundamentals](../java-fundamentals/)
- [inheritance-in-java](../inheritance-in-java/)
- [encapsulation-in-java](../encapsulation-in-java/)
