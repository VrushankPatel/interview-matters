---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the essential building blocks of the Java programming language, including syntax, data types, control structures, and basic object-oriented concepts. These form the foundation for writing Java applications.

## Detailed Explanation

### Data Types and Variables

Java has eight primitive data types: `byte`, `short`, `int`, `long`, `float`, `double`, `char`, `boolean`. Variables must be declared with a type.

Reference types include classes, interfaces, and arrays.

### Operators

- Arithmetic: `+`, `-`, `*`, `/`, `%`
- Relational: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Logical: `&&`, `||`, `!`
- Assignment: `=`, `+=`, `-=`, etc.

### Control Structures

- Conditional statements: `if-else`, `switch`
- Loops: `for`, `while`, `do-while`

### Classes and Objects

A class is a blueprint for objects. Objects are instances of classes. Methods define behaviors.

## Real-world Examples & Use Cases

- Building console-based applications
- Simple data processing tools
- Educational software for learning programming

## Code Examples

### Hello World Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Basic Calculator

```java
public class Calculator {
    public static void main(String[] args) {
        int a = 10;
        int b = 5;
        System.out.println("Sum: " + (a + b));
        System.out.println("Difference: " + (a - b));
    }
}
```

### Loop Example

```java
public class LoopExample {
    public static void main(String[] args) {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}
```

## References

- [Oracle Java Tutorials - Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [GeeksforGeeks - Java Fundamentals](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](./../oop-principles-in-java/README.md)
- [Collections & Data Structures](./../collections-and-data-structures/README.md)
- [Java Data Types](./../java-data-types/README.md)
