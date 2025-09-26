---
title: OOP Principles in Java
aliases: [Object-Oriented Programming in Java, Java OOP]
tags: [#java,#oop]
created: 2025-09-25
updated: 2025-09-26
---

## Overview

Object-Oriented Programming (OOP) is a programming paradigm that uses objects and classes to structure software. Java is an object-oriented language that implements four main principles: Encapsulation, Inheritance, Polymorphism, and Abstraction. These principles help in creating modular, reusable, and maintainable code.

## Detailed Explanation

### Encapsulation

Encapsulation is the bundling of data (fields) and methods (functions) that operate on the data into a single unit called a class. It restricts direct access to some of an object's components, which is a means of preventing accidental interference and misuse.

- Achieved using access modifiers: private, protected, public.
- Getters and setters are used to access private fields.

### Inheritance

Inheritance allows a class (subclass) to inherit properties and methods from another class (superclass). It promotes code reusability and establishes a relationship between classes.

- Use the `extends` keyword.
- Subclasses can override methods of the superclass.

### Polymorphism

Polymorphism means "many forms" and allows objects to be treated as instances of their parent class. It enables a single interface to represent different underlying forms (data types).

- **Compile-time polymorphism:** Method overloading.
- **Runtime polymorphism:** Method overriding.

### Abstraction

Abstraction is the process of hiding complex implementation details and showing only the essential features of an object. It helps in reducing complexity and allows focusing on interactions at a higher level.

- Achieved using abstract classes and interfaces.
- Abstract classes can have abstract methods (without implementation) and concrete methods.
- Interfaces define a contract for classes to implement.

## Real-world Examples & Use Cases

- **Bank Account System:** Encapsulation for account balance, inheritance for different account types (Savings, Checking), polymorphism for interest calculation.
- **Vehicle Rental System:** Abstraction for different vehicle types, inheritance for car, bike, etc.
- **Employee Management:** Polymorphism for different employee roles with common methods like calculateSalary().

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
        System.out.println("Woof!");
    }
}

// Usage
Dog dog = new Dog();
dog.eat();  // Inherited method
dog.bark(); // Own method
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
Shape shape1 = new Circle();
Shape shape2 = new Square();
shape1.draw(); // Drawing a circle
shape2.draw(); // Drawing a square
```

### Abstraction Example

```java
abstract class Vehicle {
    abstract void start();
    
    public void stop() {
        System.out.println("Vehicle stopped");
    }
}

public class Car extends Vehicle {
    @Override
    void start() {
        System.out.println("Car started");
    }
}

// Usage
Vehicle car = new Car();
car.start();
car.stop();
```

## References

- [Oracle Java Tutorials: Object-Oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)
- [GeeksforGeeks: OOPs in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals)
- [Design Patterns in Java](../java-design-patterns)
- [Java Collections Deep Dive](../java-collections-deep-dive)
