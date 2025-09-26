---
title: Java Fundamentals
aliases: [Java Basics]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Java Fundamentals encompass the core concepts and syntax of the Java programming language, including data types, variables, operators, control structures, and basic object-oriented programming principles. These form the foundation for building robust Java applications.

# Detailed Explanation

Java is a statically-typed, object-oriented language that runs on the Java Virtual Machine (JVM), enabling "write once, run anywhere" portability. Key elements include:

- **Data Types**: Primitive types (int, double, boolean, char) and reference types (objects, arrays).
- **Variables**: Declaration, initialization, and scope.
- **Operators**: Arithmetic, relational, logical, and assignment operators.
- **Control Structures**: Conditional statements (if-else, switch) and loops (for, while, do-while).
- **Methods**: Function definitions with parameters and return types.
- **Classes and Objects**: Blueprint for objects, instantiation, and basic inheritance.

Java emphasizes strong typing, exception handling, and memory management through garbage collection.

# Real-world Examples & Use Cases

- **Enterprise Applications**: Building backend services for banking systems.
- **Android Development**: Core language for mobile app development.
- **Web Applications**: Server-side logic using frameworks like Spring.
- **Embedded Systems**: Lightweight applications on constrained devices.

Example: A simple banking application that manages account balances and transactions.

# Code Examples

Basic Hello World program:

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

Variable declaration and operations:

```java
public class VariablesExample {
    public static void main(String[] args) {
        int age = 25;
        double salary = 50000.50;
        String name = "John Doe";
        
        System.out.println("Name: " + name + ", Age: " + age + ", Salary: " + salary);
    }
}
```

Control structure example:

```java
public class ControlExample {
    public static void main(String[] args) {
        int number = 10;
        if (number > 5) {
            System.out.println("Number is greater than 5");
        } else {
            System.out.println("Number is 5 or less");
        }
        
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteration: " + i);
        }
    }
}
```

# References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)

# Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/)
- [Collections & Data Structures](../collections-and-data-structures/)