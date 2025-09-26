---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java,#fundamentals]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including data types, variables, operators, control structures, classes, objects, and basic OOP concepts. These are essential for writing any Java program.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

Primitive types: byte, short, int, long, float, double, char, boolean.

Reference types: classes, interfaces, arrays, etc.

### Variables

Variables are containers for storing data values. They must be declared with a data type.

```java
int age = 25;
String name = "John";
```

### Operators

Arithmetic: +, -, *, /, %

Comparison: ==, !=, <, >, <=, >=

Logical: &&, ||, !

Assignment: =, +=, -=, etc.

### Control Structures

If-else:

```java
if (condition) {
    // code
} else {
    // code
}
```

Loops: for, while, do-while.

### Classes and Objects

A class is a blueprint for objects.

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
}
```

Object creation:

```java
Person p = new Person("Alice", 30);
```

## Real-world Examples & Use Cases

- Building a simple calculator application using variables and operators.

- Creating a user management system with classes and objects.

- Implementing a to-do list with control structures.

## Code Examples

### Hello World

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Simple Calculator

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

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)

- [Java Documentation](https://docs.oracle.com/en/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)

- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)

- [Java Collections](../java-collections/README.md)
