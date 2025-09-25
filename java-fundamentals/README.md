---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Java Fundamentals cover the core concepts and building blocks of the Java programming language, including syntax, data types, control structures, and basic OOP principles. This topic is essential for understanding how Java applications are structured and executed.

# Detailed Explanation

Java is a high-level, object-oriented programming language developed by Sun Microsystems (now Oracle). It follows the "write once, run anywhere" principle through the Java Virtual Machine (JVM).

Key components include:

- **Data Types**: Primitive types (int, double, boolean) and reference types (objects, arrays).
- **Variables and Constants**: Declaration, initialization, and scope.
- **Operators**: Arithmetic, relational, logical, and assignment operators.
- **Control Structures**: if-else, loops (for, while, do-while), switch statements.
- **Methods**: Definition, parameters, return types, and method overloading.
- **Classes and Objects**: Basic OOP concepts like encapsulation, inheritance, polymorphism.
- **Packages and Imports**: Organizing code and using libraries.

# Real-world Examples & Use Cases

- Building console applications for data processing.
- Developing backend services for web applications.
- Creating utility classes for common operations in enterprise software.
- Implementing algorithms for data analysis in scientific computing.

# Code Examples

## Hello World Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

## Basic Data Types and Variables

```java
public class DataTypesExample {
    public static void main(String[] args) {
        // Primitive types
        int age = 25;
        double salary = 50000.50;
        boolean isEmployed = true;
        char grade = 'A';

        // Reference type
        String name = "John Doe";

        System.out.println("Name: " + name + ", Age: " + age);
    }
}
```

## Control Structures

```java
public class ControlStructures {
    public static void main(String[] args) {
        int number = 10;

        // If-else
        if (number > 0) {
            System.out.println("Positive number");
        } else {
            System.out.println("Non-positive number");
        }

        // For loop
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteration: " + i);
        }
    }
}
```

## Simple Class and Object

```java
public class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void displayInfo() {
        System.out.println("Name: " + name + ", Age: " + age);
    }

    public static void main(String[] args) {
        Person person = new Person("Alice", 30);
        person.displayInfo();
    }
}
```

# References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

# Github-README Links & Related Topics

- [OOP Principles in Java](oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](jvm-internals-and-class-loading/README.md)
- [Collections & Data Structures](collections-and-data-structures/README.md)
- [Java Stream API & Functional Programming](java-stream-api-and-functional-programming/README.md)