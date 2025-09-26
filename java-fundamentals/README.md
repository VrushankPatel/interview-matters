---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals encompass the core concepts and syntax of the Java programming language, providing the foundation for building robust applications. This includes data types, variables, operators, control structures, methods, and basic object-oriented programming principles.

## Detailed Explanation

### Data Types

Java supports two categories of data types:

- **Primitive Types**: int, long, float, double, char, boolean, byte, short.
- **Reference Types**: Classes, interfaces, arrays, and strings.

Primitive types are stored directly in memory, while reference types store references to objects.

### Variables and Constants

Variables are declared with a type and can be reassigned:

```java
int age = 25;
age = 26;
```

Constants are declared with `final` and cannot be changed:

```java
final int MAX_USERS = 100;
```

### Operators

- **Arithmetic**: +, -, *, /, %
- **Relational**: ==, !=, <, >, <=, >=
- **Logical**: &&, ||, !
- **Bitwise**: &, |, ^, ~, <<, >>
- **Assignment**: =, +=, -=, etc.

### Control Structures

- **Conditional**: if-else, switch
- **Loops**: for, while, do-while

Example:

```java
if (age > 18) {
    System.out.println("Adult");
} else {
    System.out.println("Minor");
}
```

### Methods

Methods are functions defined in classes:

```java
public int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects

A class is a blueprint for objects:

```java
public class Person {
    String name;
    int age;
    
    public void greet() {
        System.out.println("Hello, " + name);
    }
}
```

Objects are instances:

```java
Person p = new Person();
p.name = "John";
p.greet();
```

## Real-world Examples & Use Cases

- **Simple Applications**: Building console-based calculators or text processors.
- **Data Processing**: Handling user input and basic computations in web forms.
- **Educational Software**: Teaching programming concepts through interactive examples.

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

### Class with Methods

```java
public class MathUtils {
    public static int factorial(int n) {
        if (n == 0) return 1;
        return n * factorial(n - 1);
    }
    
    public static void main(String[] args) {
        System.out.println("Factorial of 5: " + factorial(5));
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading)
- [Collections & Data Structures](../collections-and-data-structures)
