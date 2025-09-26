---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Java Fundamentals encompass the core concepts and syntax of the Java programming language. This includes basic syntax, data types, operators, control structures, and the foundation of object-oriented programming. Understanding these fundamentals is essential for building robust Java applications.

# Detailed Explanation

Java is a statically-typed, object-oriented programming language that emphasizes portability, security, and performance. Key components include:

## Variables and Data Types

Java supports primitive data types and reference types.

| Data Type | Size | Range |
|-----------|------|-------|
| byte | 1 byte | -128 to 127 |
| short | 2 bytes | -32,768 to 32,767 |
| int | 4 bytes | -2^31 to 2^31-1 |
| long | 8 bytes | -2^63 to 2^63-1 |
| float | 4 bytes | ~6-7 decimal digits |
| double | 8 bytes | ~15 decimal digits |
| char | 2 bytes | 0 to 65,535 |
| boolean | 1 byte | true/false |

## Operators

Java provides arithmetic, relational, logical, and assignment operators.

## Control Structures

- Conditional: if-else, switch
- Loops: for, while, do-while

## Methods

Functions defined within classes that perform operations.

# Real-world Examples & Use Cases

- Developing command-line tools
- Creating backend APIs
- Building desktop applications with Swing
- Android mobile app development

# Code Examples

## Basic Hello World

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

## Variables and Data Types

```java
public class DataTypesExample {
    public static void main(String[] args) {
        int age = 25;
        double salary = 50000.50;
        String name = "John Doe";
        boolean isEmployed = true;
        
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

# References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)

# Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/)
- [Java Data Types](../java-data-types/)
- [Java Operators](../java-operators/)
