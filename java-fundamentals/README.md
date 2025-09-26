---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including syntax, data types, control structures, and object-oriented concepts.

## Detailed Explanation

### Data Types

Java has primitive data types: int, long, float, double, boolean, char, byte, short.

Reference types: classes, interfaces, arrays.

### Variables and Constants

Variables declared with type, e.g., int x = 5;

Constants with final, e.g., final int MAX = 100;

### Operators

Arithmetic: +, -, *, /, %

Relational: ==, !=, <, >, <=, >=

Logical: &&, ||, !

### Control Structures

If-else, switch, loops: for, while, do-while.

## Real-world Examples & Use Cases

Used in enterprise applications, Android apps, web servers.

Example: Calculating average salary in a company.

## Code Examples

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

```java
int[] numbers = {1, 2, 3, 4, 5};
int sum = 0;
for (int num : numbers) {
    sum += num;
}
System.out.println("Sum: " + sum);
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/)
- [Collections & Data Structures](../collections-and-data-structures/)
