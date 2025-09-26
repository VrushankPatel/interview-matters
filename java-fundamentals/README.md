---
title: Java Fundamentals
aliases: [Java Basics, Java Core Concepts]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core concepts and building blocks of the Java programming language. This includes data types, variables, operators, control structures, and basic object-oriented programming principles. Understanding these fundamentals is essential for writing efficient and maintainable Java code.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

**Primitive Types:**
- `byte`: 8-bit signed integer (-128 to 127)
- `short`: 16-bit signed integer (-32,768 to 32,767)
- `int`: 32-bit signed integer (-2^31 to 2^31-1)
- `long`: 64-bit signed integer (-2^63 to 2^63-1)
- `float`: 32-bit floating-point
- `double`: 64-bit floating-point
- `char`: 16-bit Unicode character
- `boolean`: true or false

**Reference Types:** Classes, interfaces, arrays, and strings.

### Variables

Variables are containers for storing data values. They must be declared with a data type and can be initialized at declaration.

```java
int age = 25;
String name = "John Doe";
boolean isStudent = true;
```

### Operators

Java supports various operators:
- **Arithmetic:** +, -, *, /, %
- **Relational:** ==, !=, >, <, >=, <=
- **Logical:** &&, ||, !
- **Assignment:** =, +=, -=, etc.
- **Unary:** ++, --, +, -

### Control Structures

**Conditional Statements:**
```java
if (condition) {
    // code
} else if (anotherCondition) {
    // code
} else {
    // code
}
```

**Loops:**
- For loop: `for (int i = 0; i < 10; i++) { // code }`
- While loop: `while (condition) { // code }`
- Do-while loop: `do { // code } while (condition);`

**Switch Statement:**
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

### Methods

Methods are blocks of code that perform specific tasks. They are defined within classes.

```java
public int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects

A class is a blueprint for objects. An object is an instance of a class.

```java
public class Person {
    String name;
    int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void display() {
        System.out.println("Name: " + name + ", Age: " + age);
    }
}

// Usage
Person p = new Person("Alice", 30);
p.display();
```

## Real-world Examples & Use Cases

- **Simple Calculator:** Implementing basic arithmetic operations using variables and operators.
- **User Registration System:** Storing user data using classes and objects.
- **Inventory Management:** Using control structures to manage stock levels and generate reports.
- **Banking Application:** Handling transactions with methods and data validation.

## Code Examples

### Hello World Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Variables and Operators Example

```java
public class VariablesExample {
    public static void main(String[] args) {
        int a = 10;
        int b = 20;
        int sum = a + b;
        int product = a * b;
        boolean isEqual = (a == b);

        System.out.println("Sum: " + sum);
        System.out.println("Product: " + product);
        System.out.println("Are equal: " + isEqual);
    }
}
```

### Control Structures Example

```java
public class ControlExample {
    public static void main(String[] args) {
        int number = 10;

        // If-else
        if (number > 0) {
            System.out.println("Positive number");
        } else if (number < 0) {
            System.out.println("Negative number");
        } else {
            System.out.println("Zero");
        }

        // For loop
        System.out.println("Counting to 5:");
        for (int i = 1; i <= 5; i++) {
            System.out.println(i);
        }

        // Switch
        int day = 3;
        switch (day) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday");
                break;
            default:
                System.out.println("Other day");
        }
    }
}
```

### Class and Method Example

```java
public class Calculator {
    public int add(int a, int b) {
        return a + b;
    }

    public int subtract(int a, int b) {
        return a - b;
    }

    public static void main(String[] args) {
        Calculator calc = new Calculator();
        System.out.println("5 + 3 = " + calc.add(5, 3));
        System.out.println("5 - 3 = " + calc.subtract(5, 3));
    }
}
```

## References

- [Oracle Java Tutorials - Getting Started](https://docs.oracle.com/javase/tutorial/getStarted/index.html)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [GeeksforGeeks - Java Fundamentals](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](./oop-principles-in-java/)
- [JVM Internals & Class Loading](./jvm-internals-class-loading/)
- [Collections & Data Structures](./collections-data-structures/)
- [Java Stream API & Functional Programming](./java-stream-api-functional-programming/)
