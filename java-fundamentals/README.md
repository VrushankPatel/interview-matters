---
title: Java Fundamentals
aliases: ["Java Basics", "Java Language Basics"]
tags: ["#java"]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core building blocks of the Java programming language, including variables, data types, operators, and control flow statements. These concepts form the foundation for writing Java programs and are essential for understanding more advanced topics.

## Detailed Explanation

### Variables

Variables are containers for storing data values. In Java, you must declare a variable before using it, specifying its type and name.

- **Declaration**: `int age;`
- **Initialization**: `age = 25;` or `int age = 25;`
- **Naming Rules**: Start with letter, $, or _; case-sensitive; no keywords.

### Primitive Data Types

Java has 8 primitive data types:

| Type | Size | Range | Example |
|------|------|-------|---------|
| byte | 1 byte | -128 to 127 | `byte b = 100;` |
| short | 2 bytes | -32,768 to 32,767 | `short s = 1000;` |
| int | 4 bytes | -2^31 to 2^31-1 | `int i = 100000;` |
| long | 8 bytes | -2^63 to 2^63-1 | `long l = 100000L;` |
| float | 4 bytes | ~6-7 decimal digits | `float f = 3.14f;` |
| double | 8 bytes | ~15 decimal digits | `double d = 3.14159;` |
| char | 2 bytes | 0 to 65,535 | `char c = 'A';` |
| boolean | 1 byte | true/false | `boolean flag = true;` |

### Operators

Operators perform operations on variables and values.

- **Arithmetic**: +, -, *, /, %
- **Relational**: ==, !=, >, <, >=, <=
- **Logical**: &&, ||, !
- **Assignment**: =, +=, -=, etc.

### Control Flow Statements

Control the execution flow of the program.

- **if-else**:

```java
if (condition) {
    // code
} else {
    // code
}
```

- **switch**:

```java
switch (expression) {
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

- **Loops**: for, while, do-while

```java
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}
```

## Real-world Examples & Use Cases

- **User Input Validation**: Use if-else to check user age.
- **Data Processing**: Loops to iterate over arrays.
- **Calculations**: Operators for mathematical computations in financial apps.

## Code Examples

### Hello World

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Variable Usage

```java
public class VariablesExample {
    public static void main(String[] args) {
        int age = 25;
        double salary = 50000.0;
        boolean isEmployed = true;
        
        if (isEmployed && age > 21) {
            System.out.println("Eligible for loan");
        }
    }
}
```

### Loop Example

```java
public class LoopExample {
    public static void main(String[] args) {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}
```

## References

- [Oracle Java Tutorials: Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Java Primitive Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/)
- [Collections & Data Structures](../collections-data-structures/)
- [Java Stream API & Functional Programming](../java-stream-api-functional-programming/)
