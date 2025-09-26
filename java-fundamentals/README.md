---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including syntax, data types, control structures, and object-oriented concepts. This topic is essential for understanding how to write, compile, and run Java programs.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

**Primitive Data Types:**

- byte: 8-bit signed integer (-128 to 127)
- short: 16-bit signed integer (-32,768 to 32,767)
- int: 32-bit signed integer (-2^31 to 2^31-1)
- long: 64-bit signed integer (-2^63 to 2^63-1)
- float: 32-bit IEEE 754 floating-point
- double: 64-bit IEEE 754 floating-point
- char: 16-bit Unicode character
- boolean: true or false

**Reference Data Types:**

- Classes
- Interfaces
- Arrays

### Variables and Constants

Variables are declared with a type and name:

```java
int age = 25;
String name = "John";
```

Constants use the `final` keyword:

```java
final double PI = 3.14159;
```

### Operators

- Arithmetic: +, -, *, /, %
- Relational: ==, !=, >, <, >=, <=
- Logical: &&, ||, !
- Assignment: =, +=, -=, etc.

### Control Structures

**If-else:**

```java
if (condition) {
    // code
} else {
    // code
}
```

**Switch:**

```java
switch (variable) {
    case value1:
        // code
        break;
    case value2:
        // code
        break;
    default:
        // code
}
```

**Loops:**

```java
for (int i = 0; i < 10; i++) {
    // code
}

while (condition) {
    // code
}

do {
    // code
} while (condition);
```

### Methods

Methods are defined with return type, name, parameters:

```java
public static int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects

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
    
    public void setName(String name) {
        this.name = name;
    }
}
```

## Real-world Examples & Use Cases

- Building console applications for data processing
- Creating utility classes for common operations
- Implementing basic algorithms like sorting and searching
- Developing simple calculators or converters

## Code Examples

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
import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter first number: ");
        double num1 = scanner.nextDouble();
        System.out.print("Enter operator (+, -, *, /): ");
        char operator = scanner.next().charAt(0);
        System.out.print("Enter second number: ");
        double num2 = scanner.nextDouble();
        
        double result;
        switch (operator) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            case '/':
                result = num1 / num2;
                break;
            default:
                System.out.println("Invalid operator");
                return;
        }
        System.out.println("Result: " + result);
    }
}
```

## Common Pitfalls & Edge Cases

- NullPointerException when accessing methods on null references
- Integer overflow with large numbers (use long for big values)
- Floating-point precision issues (use BigDecimal for financial calculations)
- String comparison with == instead of .equals()
- Forgetting to handle exceptions properly
- Mutable objects in collections causing unexpected behavior

## Tools & Libraries

- **JDK (Java Development Kit)**: Core Java platform
- **IntelliJ IDEA**: Popular IDE for Java development
- **Eclipse**: Open-source IDE
- **Maven/Gradle**: Build automation tools
- **JUnit**: Unit testing framework

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Collections & Data Structures](../collections-and-data-structures/README.md)
