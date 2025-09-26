---
title: OOP Principles in Java
aliases: [Object-Oriented Programming, Java OOP]
tags: [#java,#oop]
created: 2025-09-26
updated: 2025-09-26
---

# OOP Principles in Java

## Overview

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data and code. Java is fundamentally an object-oriented language that implements OOP principles to promote code reusability, modularity, and maintainability. The four main OOP principles are Encapsulation, Inheritance, Polymorphism, and Abstraction.

## Detailed Explanation

### Encapsulation

Encapsulation is the bundling of data and methods that operate on that data within a single unit (class). It restricts direct access to some of an object's components, which is a means of preventing accidental interference and misuse of the data.

**Key Concepts:**
- Private fields
- Public getter/setter methods
- Data hiding

### Inheritance

Inheritance is a mechanism where one class acquires the properties and behaviors of another class. It promotes code reusability and establishes a relationship between classes.

**Types of Inheritance in Java:**
- Single inheritance
- Multilevel inheritance
- Hierarchical inheritance
- Multiple inheritance (through interfaces)

### Polymorphism

Polymorphism allows objects of different classes to be treated as objects of a common superclass. It enables a single interface to represent different underlying forms (data types).

**Types:**
- Compile-time polymorphism (Method Overloading)
- Runtime polymorphism (Method Overriding)

### Abstraction

Abstraction is the process of hiding implementation details and showing only the functionality to the user. It focuses on what an object does rather than how it does it.

**Achieved through:**
- Abstract classes
- Interfaces

## Real-world Examples & Use Cases

1. **Banking System**: Account classes with encapsulation for balance, inheritance for different account types (Savings, Checking), polymorphism for interest calculation.

2. **Vehicle Management**: Base Vehicle class with inheritance for Car, Bike, Truck; abstraction for engine types.

3. **Employee Management**: Employee hierarchy with different roles, using inheritance and polymorphism for salary calculations.

4. **GUI Components**: Abstract Component class with concrete implementations like Button, TextField using polymorphism.

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

public class EncapsulationExample {
    public static void main(String[] args) {
        Person person = new Person("John", 25);
        System.out.println("Name: " + person.getName());
        System.out.println("Age: " + person.getAge());
        
        person.setAge(30);
        System.out.println("Updated Age: " + person.getAge());
    }
}
```

### Inheritance Example

```java
// Base class
public class Animal {
    protected String name;
    
    public Animal(String name) {
        this.name = name;
    }
    
    public void eat() {
        System.out.println(name + " is eating");
    }
    
    public void sleep() {
        System.out.println(name + " is sleeping");
    }
}

// Derived class
public class Dog extends Animal {
    public Dog(String name) {
        super(name);
    }
    
    public void bark() {
        System.out.println(name + " is barking");
    }
    
    @Override
    public void eat() {
        System.out.println(name + " is eating dog food");
    }
}

public class InheritanceExample {
    public static void main(String[] args) {
        Dog dog = new Dog("Buddy");
        dog.eat();    // Overridden method
        dog.sleep();  // Inherited method
        dog.bark();   // Dog-specific method
    }
}
```

### Polymorphism Example

```java
// Interface
interface Shape {
    double area();
    double perimeter();
}

// Circle class
class Circle implements Shape {
    private double radius;
    
    public Circle(double radius) {
        this.radius = radius;
    }
    
    @Override
    public double area() {
        return Math.PI * radius * radius;
    }
    
    @Override
    public double perimeter() {
        return 2 * Math.PI * radius;
    }
}

// Rectangle class
class Rectangle implements Shape {
    private double length;
    private double width;
    
    public Rectangle(double length, double width) {
        this.length = length;
        this.width = width;
    }
    
    @Override
    public double area() {
        return length * width;
    }
    
    @Override
    public double perimeter() {
        return 2 * (length + width);
    }
}

public class PolymorphismExample {
    public static void main(String[] args) {
        Shape circle = new Circle(5);
        Shape rectangle = new Rectangle(4, 6);
        
        System.out.println("Circle Area: " + circle.area());
        System.out.println("Circle Perimeter: " + circle.perimeter());
        
        System.out.println("Rectangle Area: " + rectangle.area());
        System.out.println("Rectangle Perimeter: " + rectangle.perimeter());
    }
}
```

### Abstraction Example

```java
// Abstract class
abstract class Vehicle {
    protected String brand;
    
    public Vehicle(String brand) {
        this.brand = brand;
    }
    
    abstract void start();
    abstract void stop();
    
    public void honk() {
        System.out.println("Honk! Honk!");
    }
}

// Concrete class
class Car extends Vehicle {
    public Car(String brand) {
        super(brand);
    }
    
    @Override
    void start() {
        System.out.println(brand + " car is starting");
    }
    
    @Override
    void stop() {
        System.out.println(brand + " car is stopping");
    }
}

public class AbstractionExample {
    public static void main(String[] args) {
        Vehicle car = new Car("Toyota");
        car.start();
        car.honk();
        car.stop();
    }
}
```

## References

- [Oracle OOP Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/)
- [GeeksforGeeks OOP in Java](https://www.geeksforgeeks.org/object-oriented-programming-oops-concept-in-java/)
- [Baeldung OOP Principles](https://www.baeldung.com/java-oop)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Inheritance in Java](../inheritance-in-java/README.md)
- [Polymorphism in Java](../polymorphism-in-java/README.md)
- [Encapsulation in Java](../encapsulation-in-java/README.md)
- [Abstraction in Java](../abstraction-in-java/README.md)
