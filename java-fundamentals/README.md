---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals encompass the core syntax, data types, operators, control structures, and basic object-oriented concepts that form the foundation of Java programming. Mastering these is crucial for developing robust Java applications.

## Detailed Explanation

### Data Types

Java supports primitive data types such as `int`, `long`, `float`, `double`, `char`, `boolean`, `byte`, and `short`. Reference data types include classes, interfaces, arrays, and enums.

### Variables and Operators

Variables are declared with a type: `int x = 10;`. Operators include arithmetic (`+`, `-`, `*`, `/`), relational (`==`, `!=`, `<`, `>`), logical (`&&`, `||`), and assignment (`=`).

### Control Structures

- Conditional: `if-else`, `switch`
- Loops: `for`, `while`, `do-while`

### Classes and Objects

A basic class: `public class MyClass { }`. Objects are instantiated using `new MyClass();`.

## Real-world Examples & Use Cases

- Developing console-based applications for data processing.
- Building simple utilities like calculators or file readers.

## Code Examples

```java
// Hello World program
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

```java
// Basic calculator
public class Calculator {
    public static void main(String[] args) {
        int a = 5, b = 3;
        System.out.println("Sum: " + (a + b));
        System.out.println("Difference: " + (a - b));
    }
}
```

## References

- [Oracle Java Tutorials - Getting Started](https://docs.oracle.com/javase/tutorial/getStarted/index.html)
- [Java Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java)
- [JVM Internals & Class Loading](../jvm-internals-class-loading)
- [Collections & Data Structures](../collections-and-data-structures)
