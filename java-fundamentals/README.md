---
title: Java Fundamentals
aliases: [Java Basics, Java Essentials]
tags: [#java]
created: 2023-10-01
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core building blocks of the Java programming language, including data types, variables, operators, control structures, and basic syntax. These concepts form the foundation for writing Java programs and are essential for understanding more advanced topics.

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

**Reference Types:** Objects, arrays, and strings.

### Variables
Variables store data values. Declaration: `type variableName = value;`

### Operators
- Arithmetic: +, -, *, /, %
- Relational: ==, !=, >, <, >=, <=
- Logical: &&, ||, !
- Assignment: =, +=, -=, etc.

### Control Structures
- If-else statements
- Switch statements
- Loops: for, while, do-while

## Real-world Examples & Use Cases

- Building a simple calculator application
- Processing user input in a console application
- Validating data in forms

## Code Examples

```java
public class HelloWorld {
    public static void main(String[] args) {
        // Primitive data types
        int age = 25;
        double salary = 50000.50;
        boolean isEmployed = true;
        char grade = 'A';

        // Operators
        int sum = 10 + 20;
        boolean isAdult = age >= 18;

        // Control structure
        if (isAdult) {
            System.out.println("Adult");
        } else {
            System.out.println("Minor");
        }

        // Loop
        for (int i = 0; i < 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [Java Data Types](../java-data-types/README.md)
- [Java Operators](../java-operators/README.md)