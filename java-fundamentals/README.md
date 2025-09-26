---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core concepts and building blocks of the Java programming language. This includes basic syntax, data types, control structures, and object-oriented programming principles that form the foundation for developing Java applications.

## Detailed Explanation

### Basic Syntax and Structure

Java programs are organized into classes and methods. Every Java application must have a `main` method as the entry point.

### Data Types

Java has two categories of data types:

| Category | Types | Description |
|----------|-------|-------------|
| Primitive | byte, short, int, long, float, double, char, boolean | Basic data types stored directly in memory |
| Reference | String, Arrays, Objects | Reference to objects stored in heap memory |

### Variables and Constants

Variables store data values, while constants are immutable values declared with `final`.

### Control Structures

Java provides standard control structures:
- Conditional statements: `if-else`, `switch`
- Loops: `for`, `while`, `do-while`
- Branching: `break`, `continue`, `return`

### Object-Oriented Concepts

Java is fundamentally object-oriented with concepts like:
- Classes and Objects
- Inheritance
- Polymorphism
- Encapsulation
- Abstraction

## Real-world Examples & Use Cases

- **Web Applications**: Building server-side logic with Spring Framework
- **Mobile Apps**: Android development using Java APIs
- **Enterprise Software**: Large-scale business applications
- **Embedded Systems**: IoT devices and hardware control
- **Big Data Processing**: Hadoop and Spark frameworks

## Code Examples

### Basic Hello World Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Data Types and Variables

```java
public class DataTypesExample {
    public static void main(String[] args) {
        // Primitive data types
        int age = 25;
        double salary = 50000.50;
        char grade = 'A';
        boolean isEmployed = true;
        
        // Reference data type
        String name = "John Doe";
        
        // Constants
        final double PI = 3.14159;
        
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Salary: " + salary);
    }
}
```

### Control Structures

```java
public class ControlStructuresExample {
    public static void main(String[] args) {
        int number = 10;
        
        // If-else statement
        if (number > 0) {
            System.out.println("Positive number");
        } else if (number < 0) {
            System.out.println("Negative number");
        } else {
            System.out.println("Zero");
        }
        
        // For loop
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
        
        // Switch statement
        switch (number) {
            case 1:
                System.out.println("One");
                break;
            case 10:
                System.out.println("Ten");
                break;
            default:
                System.out.println("Other number");
        }
    }
}
```

### Simple Class Example

```java
public class Person {
    // Instance variables
    private String name;
    private int age;
    
    // Constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    // Method
    public void introduce() {
        System.out.println("Hi, I'm " + name + " and I'm " + age + " years old.");
    }
    
    // Main method
    public static void main(String[] args) {
        Person person = new Person("Alice", 30);
        person.introduce();
    }
}
```

## Common Pitfalls & Edge Cases

- **Null Pointer Exceptions**: Always check for null before using reference variables
- **Integer Overflow**: Be aware of maximum values for primitive types
- **String Immutability**: Remember that Strings cannot be modified after creation
- **Array Bounds**: Accessing array elements outside bounds throws exceptions
- **Type Casting**: Improper casting can lead to ClassCastException

## Tools & Libraries

- **JDK (Java Development Kit)**: Essential for compiling and running Java programs
- **IDE Options**: Eclipse, IntelliJ IDEA, NetBeans
- **Build Tools**: Maven, Gradle
- **Testing Frameworks**: JUnit, TestNG

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

## Github-README Links & Related Topics

- [OOP Principles in Java](./oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](./jvm-internals-and-class-loading/README.md)
- [Java Collections Deep Dive](../java-collections-deep-dive/README.md)
- [Java Exception Handling](../java-exception-handling/README.md)
