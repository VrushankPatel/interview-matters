---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including data types, variables, operators, control structures, and basic syntax. These concepts form the foundation for writing Java programs.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

**Primitive types:**
- byte: 8-bit signed integer
- short: 16-bit signed integer
- int: 32-bit signed integer
- long: 64-bit signed integer
- float: 32-bit floating point
- double: 64-bit floating point
- char: 16-bit Unicode character
- boolean: true or false

**Reference types:** classes, interfaces, arrays, etc., which store references to objects.

### Variables

Variables are containers for storing data values. They must be declared with a data type before use.

```java
int age = 25;
String name = "John Doe";
boolean isStudent = true;
```

Variables can be local, instance, or static.

### Operators

**Arithmetic operators:** +, -, *, /, %

**Comparison operators:** ==, !=, <, >, <=, >=

**Logical operators:** && (and), || (or), ! (not)

**Assignment operators:** =, +=, -=, *=, /=, %=

**Bitwise operators:** &, |, ^, ~, <<, >>

### Control Structures

**Conditional statements:**

```java
if (condition) {
    // execute if true
} else if (anotherCondition) {
    // execute if another true
} else {
    // execute otherwise
}
```

**Switch statement:**

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

- For loop:

```java
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}
```

- While loop:

```java
while (condition) {
    // code
}
```

- Do-while loop:

```java
do {
    // code
} while (condition);
```

## Real-world Examples & Use Cases

- **User Input Validation:** Using conditionals to check if user input meets criteria.
- **Data Processing:** Looping through arrays or lists to perform calculations.
- **Configuration Settings:** Using variables to store application settings.
- **Simple Calculator:** Implementing arithmetic operations based on user choice.

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
        
        System.out.println("Addition: " + (a + b));
        System.out.println("Subtraction: " + (a - b));
        System.out.println("Multiplication: " + (a * b));
        System.out.println("Division: " + (a / b));
    }
}
```

### Using Control Structures

```java
public class GradeCalculator {
    public static void main(String[] args) {
        int score = 85;
        
        if (score >= 90) {
            System.out.println("Grade: A");
        } else if (score >= 80) {
            System.out.println("Grade: B");
        } else if (score >= 70) {
            System.out.println("Grade: C");
        } else {
            System.out.println("Grade: F");
        }
    }
}
```

## References

- [Oracle Java Tutorials: Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [GeeksforGeeks: Java Basics](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java)
- [Collections & Data Structures](../collections-and-data-structures)
- [Java Stream API & Functional Programming](../java-stream-api-and-functional-programming)
