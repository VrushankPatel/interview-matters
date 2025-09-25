---
title: Java Fundamentals
aliases: [Java Basics, Core Java Concepts]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Fundamentals

## Overview

Java Fundamentals encompass the core elements of the Java programming language, including basic syntax, data types, control structures, and introductory object-oriented programming concepts. These form the foundation for building robust Java applications.

## Detailed Explanation

### Data Types and Variables

Java supports primitive data types such as `int`, `long`, `float`, `double`, `char`, `boolean`, `byte`, and `short`. Reference types include classes, interfaces, and arrays.

Variables are declared with a type: `int age = 25;`

Constants use the `final` keyword: `final double PI = 3.14159;`

### Operators

- Arithmetic: +, -, *, /, %
- Relational: ==, !=, <, >, <=, >=
- Logical: &&, ||, !
- Bitwise: &, |, ^, ~, <<, >>
- Assignment: =, +=, -=, etc.

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

Methods are defined within classes:

```java
public int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects

Basic class structure:

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

- **Simple Calculator:** Implementing basic arithmetic operations.
- **User Management System:** Storing and retrieving user information.
- **Inventory Tracking:** Managing product data in a retail application.

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
        Calculator calc = new Calculator();
        System.out.println(calc.add(5, 3)); // Output: 8
        System.out.println(calc.multiply(5, 3)); // Output: 15
    }
    
    public int add(int a, int b) {
        return a + b;
    }
    
    public int multiply(int a, int b) {
        return a * b;
    }
}
```

### Person Class with Methods

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
    
    public int getAge() {
        return age;
    }
    
    public void celebrateBirthday() {
        age++;
    }
    
    public static void main(String[] args) {
        Person person = new Person("Alice", 30);
        System.out.println(person.getName() + " is " + person.getAge() + " years old.");
        person.celebrateBirthday();
        System.out.println("After birthday: " + person.getAge());
    }
}
```

## References

- [Oracle Java Tutorials - Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Java Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
- [Java Control Structures](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](./oop-principles-in-java)
- [JVM Internals & Class Loading](./jvm-internals-and-class-loading)
- [Collections & Data Structures](../collections-and-data-structures)
- [Java Stream API & Functional Programming](../java-stream-api-and-functional-programming)
