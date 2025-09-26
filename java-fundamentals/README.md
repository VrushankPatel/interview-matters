---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including data types, variables, operators, control structures, methods, and classes. These concepts form the foundation for writing Java programs and are essential for understanding more advanced topics.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

| Primitive Type | Size | Range |
|----------------|------|-------|
| byte | 1 byte | -128 to 127 |
| short | 2 bytes | -32,768 to 32,767 |
| int | 4 bytes | -2^31 to 2^31-1 |
| long | 8 bytes | -2^63 to 2^63-1 |
| float | 4 bytes | ~6-7 decimal digits |
| double | 8 bytes | ~15 decimal digits |
| char | 2 bytes | 0 to 65,535 |
| boolean | 1 byte | true or false |

Reference types include classes, interfaces, arrays, etc.

### Variables

Variables are containers for storing data values.

```java
int age = 25;
String name = "John";
final double PI = 3.14159; // constant
```

### Operators

- Arithmetic: +, -, *, /, %
- Relational: ==, !=, >, <, >=, <=
- Logical: &&, ||, !
- Assignment: =, +=, -=, etc.

### Control Structures

#### If-Else

```java
if (condition) {
    // code
} else if (anotherCondition) {
    // code
} else {
    // code
}
```

#### Switch

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

#### Loops

```java
// For loop
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// While loop
while (condition) {
    // code
}

// Do-while
do {
    // code
} while (condition);
```

### Methods

Methods are blocks of code that perform specific tasks.

```java
public static int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects

```java
public class Car {
    String model;
    int year;
    
    public Car(String model, int year) {
        this.model = model;
        this.year = year;
    }
    
    public void display() {
        System.out.println(model + " " + year);
    }
}

// Usage
Car myCar = new Car("Toyota", 2020);
myCar.display();
```

## Real-world Examples & Use Cases

- **Calculator Application:** Using arithmetic operators and methods for calculations.
- **Student Grade System:** Using variables, arrays, and control structures to manage student data.
- **Simple Banking System:** Classes and objects to represent accounts with basic operations.

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
        
        double result = 0;
        switch (operator) {
            case '+': result = num1 + num2; break;
            case '-': result = num1 - num2; break;
            case '*': result = num1 * num2; break;
            case '/': result = num1 / num2; break;
            default: System.out.println("Invalid operator");
        }
        System.out.println("Result: " + result);
    }
}
```

## References

- [Oracle Java Tutorials: Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [GeeksforGeeks: Java Basics](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Collections Deep Dive](../java-collections-deep-dive/README.md)
