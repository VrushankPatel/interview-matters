---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including data types, variables, operators, control structures, and object-oriented concepts. These are essential for writing any Java program.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

**Primitive Data Types:**

| Type | Size | Range |
|------|------|-------|
| byte | 1 byte | -128 to 127 |
| short | 2 bytes | -32,768 to 32,767 |
| int | 4 bytes | -2^31 to 2^31-1 |
| long | 8 bytes | -2^63 to 2^63-1 |
| float | 4 bytes | ~6-7 decimal digits |
| double | 8 bytes | ~15 decimal digits |
| char | 2 bytes | 0 to 65,535 |
| boolean | 1 bit | true or false |

**Reference Types:** Objects, arrays, strings.

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

## Real-world Examples & Use Cases

- Building a simple calculator application
- Processing user input in a console application
- Implementing basic algorithms like sorting or searching

## Code Examples

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        
        // Variables
        int number = 42;
        String message = "The answer is: " + number;
        
        // Control structure
        if (number > 40) {
            System.out.println(message);
        }
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)

## Github-README Links & Related Topics

- [Java OOP Principles](oop-principles-in-java)
- [JVM Internals](jvm-internals-class-loading)
- [Multithreading in Java](multithreading-concurrency-in-java)
