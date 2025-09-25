---
title: Java Fundamentals
aliases: [Core Java, Java Basics]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Java Fundamentals covers the core syntax, data types, control structures, and basic concepts of the Java programming language. This forms the foundation for all Java development.

# Detailed Explanation

## Data Types

- **Primitive Types**: int, long, float, double, boolean, char, byte, short.
- **Reference Types**: Objects, arrays, strings.

## Control Structures

- **Conditional**: if-else, switch.
- **Loops**: for, while, do-while.
- **Branching**: break, continue, return.

## Classes and Objects

- **Class Declaration**: public class MyClass { }
- **Object Creation**: MyClass obj = new MyClass();
- **Methods**: Access modifiers, return types, parameters.

## Exception Handling

- **Try-Catch**: Handling runtime errors.
- **Throw**: Explicitly throwing exceptions.

# Real-world Examples & Use Cases

- **Calculator Application**: Using arithmetic operations and control structures.
- **Student Management System**: Classes and objects for data modeling.
- **File Reader**: Exception handling for I/O operations.

# Code Examples

## Hello World

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

## Data Types and Variables

```java
public class DataTypes {
    public static void main(String[] args) {
        int age = 25;
        double salary = 50000.50;
        boolean isEmployed = true;
        String name = "John Doe";

        System.out.println("Name: " + name + ", Age: " + age + ", Salary: " + salary + ", Employed: " + isEmployed);
    }
}
```

## Control Structures

```java
public class ControlStructures {
    public static void main(String[] args) {
        int number = 10;

        if (number > 0) {
            System.out.println("Positive number");
        } else if (number < 0) {
            System.out.println("Negative number");
        } else {
            System.out.println("Zero");
        }

        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}
```

## Classes and Objects

```java
public class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void display() {
        System.out.println("Name: " + name + ", Age: " + age);
    }

    public static void main(String[] args) {
        Person person = new Person("Alice", 30);
        person.display();
    }
}
```

# Common Pitfalls & Edge Cases

- Null pointer exceptions with reference types.
- Integer overflow with primitive types.
- Incorrect use of == vs equals() for strings.
- Forgetting to handle exceptions.

# Tools & Libraries

- **JDK (Java Development Kit)**: For compiling and running Java programs.
- **IDE**: Eclipse, IntelliJ IDEA for development.

# References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se8/html/index.html)

# Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals and Class Loading](../jvm-internals-and-class-loading/README.md)
- [Collections Framework](../collections-framework/README.md)