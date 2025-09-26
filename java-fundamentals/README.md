---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Java Fundamentals encompass the core concepts and syntax of the Java programming language, providing the foundation for building robust applications. This includes understanding data types, variables, operators, control structures, and basic object-oriented programming elements.

# Detailed Explanation

## Data Types and Variables

Java supports eight primitive data types: `byte`, `short`, `int`, `long`, `float`, `double`, `char`, and `boolean`. Variables must be declared with a type before use.

```java
int age = 25;
double salary = 50000.0;
boolean isActive = true;
```

Reference types include classes, interfaces, and arrays.

## Operators

- Arithmetic: `+`, `-`, `*`, `/`, `%`
- Relational: `==`, `!=`, `<`, `>`, `<=`, `>=`
- Logical: `&&`, `||`, `!`
- Assignment: `=`, `+=`, etc.

## Control Structures

### Conditional Statements

```java
if (condition) {
    // code
} else if (anotherCondition) {
    // code
} else {
    // code
}
```

### Loops

```java
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

while (condition) {
    // code
}
```

## Methods

Methods are defined within classes and can have parameters and return types.

```java
public int add(int a, int b) {
    return a + b;
}
```

# Real-world Examples & Use Cases

- Building a simple banking application to manage account balances using variables and arithmetic operators.
- Creating a temperature converter that uses conditional statements to handle different units.
- Developing a basic calculator with methods for different operations.

# Code Examples

### Hello World Program

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
        System.out.println("Addition: " + (a + b));
        System.out.println("Subtraction: " + (a - b));
    }
}
```

# References

- [Oracle Java Tutorials - Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [GeeksforGeeks - Java Fundamentals](https://www.geeksforgeeks.org/java/)

# Github-README Links & Related Topics

- [oop-principles-in-java](../oop-principles-in-java/README.md)
- [java-stream-api-and-functional-programming](../java-stream-api-and-functional-programming/README.md)
- [collections-and-data-structures](../collections-and-data-structures/README.md)
