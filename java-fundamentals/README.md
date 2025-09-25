---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including syntax, data types, operators, control structures, and introductory object-oriented concepts. This topic is essential for beginners to understand how to write, compile, and run simple Java programs.

## Detailed Explanation

### Variables and Data Types

Variables are used to store data values. Java has two main categories of data types:

- **Primitive Types**: int, double, char, boolean, byte, short, long, float.
- **Reference Types**: Objects, arrays, strings.

| Primitive Type | Size | Range |
|----------------|------|-------|
| int | 4 bytes | -2,147,483,648 to 2,147,483,647 |
| double | 8 bytes | Approximately ±1.7e308 |
| char | 2 bytes | 0 to 65,535 (Unicode) |
| boolean | 1 bit | true or false |

### Operators

Java supports arithmetic, relational, logical, assignment, and bitwise operators.

- Arithmetic: +, -, *, /, %
- Relational: ==, !=, <, >, <=, >=
- Logical: &&, ||, !

### Control Structures

Control structures direct the flow of execution.

#### If-Else Statement

```java
if (condition) {
    // code
} else {
    // code
}
```

#### Loops

- For loop: `for (int i = 0; i < 10; i++) { }`
- While loop: `while (condition) { }`
- Do-While loop: `do { } while (condition);`

#### Switch Statement

```java
switch (expression) {
    case value1:
        // code
        break;
    default:
        // code
}
```

### Methods

Methods are blocks of code that perform specific tasks.

```java
public static int add(int a, int b) {
    return a + b;
}
```

## Real-world Examples & Use Cases

- **Simple Calculator**: Perform basic arithmetic operations.
- **Student Grade Calculator**: Calculate average grades from a list of scores.
- **Temperature Converter**: Convert between Celsius and Fahrenheit.

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
        System.out.println("Product: " + (a * b));
    }
}
```

### Temperature Converter

```java
public class TemperatureConverter {
    public static void main(String[] args) {
        double celsius = 25.0;
        double fahrenheit = (celsius * 9/5) + 32;
        System.out.println(celsius + "°C is " + fahrenheit + "°F");
    }
}
```

## References

- [Oracle Java Tutorials: Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [GeeksforGeeks: Java Fundamentals](https://www.geeksforgeeks.org/java/)
- [W3Schools Java Tutorial](https://www.w3schools.com/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](oop-principles-in-java/)
- [JVM Internals & Class Loading](jvm-internals-class-loading/)
- [Collections & Data Structures](collections-data-structures/)
