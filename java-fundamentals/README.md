---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Fundamentals

## Overview

Java is a high-level, object-oriented programming language that emphasizes portability, robustness, and performance. Java fundamentals cover the core concepts including data types, control structures, object-oriented principles, and basic syntax that form the foundation of Java programming.

## Detailed Explanation

### Data Types

Java has two categories of data types:

#### Primitive Types

| Type | Size | Range | Default |
|------|------|-------|---------|
| byte | 8-bit | -128 to 127 | 0 |
| short | 16-bit | -32,768 to 32,767 | 0 |
| int | 32-bit | -2^31 to 2^31-1 | 0 |
| long | 64-bit | -2^63 to 2^63-1 | 0L |
| float | 32-bit | ~3.4e-038 to 3.4e+038 | 0.0f |
| double | 64-bit | ~1.7e-308 to 1.7e+308 | 0.0d |
| char | 16-bit | 0 to 65,535 | '\u0000' |
| boolean | 1-bit | true/false | false |

#### Reference Types

- Classes
- Interfaces
- Arrays
- Strings

### Control Structures

#### Conditional Statements

```java
if (condition) {
    // code
} else if (anotherCondition) {
    // code
} else {
    // code
}

switch (expression) {
    case value1:
        // code
        break;
    case value2:
        // code
        break;
    default:
        // code
}
```

#### Loops

```java
// For loop
for (int i = 0; i < 10; i++) {
    // code
}

// Enhanced for loop
for (String item : collection) {
    // code
}

// While loop
while (condition) {
    // code
}

// Do-while loop
do {
    // code
} while (condition);
```

### Classes and Objects

#### Class Definition

```java
public class ClassName {
    // Fields
    private int field1;
    private String field2;
    
    // Constructor
    public ClassName(int field1, String field2) {
        this.field1 = field1;
        this.field2 = field2;
    }
    
    // Methods
    public void method1() {
        // code
    }
    
    public int method2() {
        return field1;
    }
}
```

#### Object Creation

```java
ClassName obj = new ClassName(42, "Hello");
obj.method1();
int result = obj.method2();
```

### Object-Oriented Principles

#### Encapsulation

- Bundling data and methods
- Access control with modifiers

#### Inheritance

```java
public class Parent {
    protected void parentMethod() {
        // code
    }
}

public class Child extends Parent {
    @Override
    public void parentMethod() {
        super.parentMethod();
        // additional code
    }
}
```

#### Polymorphism

- Method overloading (compile-time)
- Method overriding (runtime)

#### Abstraction

- Abstract classes
- Interfaces

```java
public interface Drawable {
    void draw();
    default void erase() {
        // default implementation
    }
}

public abstract class Shape implements Drawable {
    protected String color;
    
    public Shape(String color) {
        this.color = color;
    }
    
    public abstract double area();
    
    @Override
    public void draw() {
        System.out.println("Drawing " + color + " shape");
    }
}
```

## Real-world Examples & Use Cases

1. **Web Applications**: Building REST APIs with Spring Boot
2. **Android Development**: Mobile app development
3. **Enterprise Software**: Large-scale business applications
4. **Big Data**: Processing frameworks like Hadoop
5. **Financial Systems**: High-reliability transaction systems
6. **IoT Devices**: Embedded systems programming
7. **Game Development**: Cross-platform game logic

## Code Examples

### Complete Class Example

```java
public class BankAccount {
    private String accountNumber;
    private double balance;
    private String ownerName;
    
    public BankAccount(String accountNumber, String ownerName) {
        this.accountNumber = accountNumber;
        this.ownerName = ownerName;
        this.balance = 0.0;
    }
    
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Deposited: $" + amount);
        }
    }
    
    public boolean withdraw(double amount) {
        if (amount > 0 && balance >= amount) {
            balance -= amount;
            System.out.println("Withdrawn: $" + amount);
            return true;
        }
        return false;
    }
    
    public double getBalance() {
        return balance;
    }
    
    public String getAccountInfo() {
        return "Account: " + accountNumber + ", Owner: " + ownerName + ", Balance: $" + balance;
    }
}
```

### Inheritance and Polymorphism Example

```java
// Base class
public class Vehicle {
    protected String brand;
    protected int year;
    
    public Vehicle(String brand, int year) {
        this.brand = brand;
        this.year = year;
    }
    
    public void start() {
        System.out.println("Starting " + brand + " vehicle");
    }
    
    public void stop() {
        System.out.println("Stopping " + brand + " vehicle");
    }
}

// Derived class
public class Car extends Vehicle {
    private int doors;
    
    public Car(String brand, int year, int doors) {
        super(brand, year);
        this.doors = doors;
    }
    
    @Override
    public void start() {
        System.out.println("Starting " + brand + " car with " + doors + " doors");
    }
    
    public void honk() {
        System.out.println("Honk honk!");
    }
}

// Usage
public class Main {
    public static void main(String[] args) {
        Vehicle vehicle = new Car("Toyota", 2020, 4);
        vehicle.start(); // Polymorphic call
        vehicle.stop();
        
        Car car = new Car("Honda", 2021, 2);
        car.start();
        car.honk();
        car.stop();
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [Baeldung Java Fundamentals](https://www.baeldung.com/java-fundamentals)

## Github-README Links & Related Topics

- [oop-principles-in-java/README.md](../oop-principles-in-java/README.md)
- [jvm-internals-and-class-loading/README.md](../jvm-internals-and-class-loading/README.md)
- [collections-and-data-structures/README.md](../collections-and-data-structures/README.md)
- [java-stream-api-and-functional-programming/README.md](../java-stream-api-and-functional-programming/README.md)
