---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java is a high-level, object-oriented programming language designed to be platform-independent through the Java Virtual Machine (JVM). It emphasizes simplicity, robustness, and portability, making it ideal for enterprise applications, web development, and Android apps.

## Detailed Explanation

### Key Concepts

- **Variables and Data Types**: Primitive types (int, double, boolean, char, byte, short, long, float) and reference types (objects, arrays, strings).

- **Operators**: Arithmetic (+, -, *, /, %), relational (==, !=, <, >), logical (&&, ||, !), bitwise, and assignment operators.

- **Control Structures**: Conditional statements (if-else, switch), loops (for, while, do-while), and branching (break, continue).

- **Methods and Functions**: Defining and calling methods, method overloading, and recursion.

- **Arrays and Collections**: Fixed-size arrays and dynamic collections like ArrayList.

### JVM and Platform Independence

Java source code is compiled into bytecode, which runs on any JVM, enabling "write once, run anywhere".

```mermaid
graph TD
    A[Java Source Code] --> B[Compiler]
    B --> C[Bytecode (.class)]
    C --> D[JVM]
    D --> E[Machine Code]
    E --> F[Execution on OS]
```

## Real-world Examples & Use Cases

- **Enterprise Applications**: Building scalable backend systems with Spring Framework.

- **Android Development**: Core language for mobile app development.

- **Web Applications**: Server-side development with servlets and JSP.

- **Big Data Processing**: Frameworks like Hadoop use Java for distributed computing.

## Code Examples

### Hello World

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Variables and Data Types

```java
public class DataTypesExample {
    public static void main(String[] args) {
        // Primitive types
        int age = 25;
        double salary = 50000.50;
        boolean isEmployed = true;
        char grade = 'A';
        
        // Reference type
        String name = "John Doe";
        
        System.out.println("Name: " + name + ", Age: " + age + ", Salary: " + salary);
    }
}
```

### Control Structures

```java
public class ControlStructures {
    public static void main(String[] args) {
        int number = 10;
        
        // If-else
        if (number > 0) {
            System.out.println("Positive");
        } else if (number < 0) {
            System.out.println("Negative");
        } else {
            System.out.println("Zero");
        }
        
        // For loop
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
        
        // While loop
        int i = 1;
        while (i <= 5) {
            System.out.println("While count: " + i);
            i++;
        }
    }
}
```

### Methods

```java
public class MethodsExample {
    public static void main(String[] args) {
        int sum = add(5, 10);
        System.out.println("Sum: " + sum);
    }
    
    public static int add(int a, int b) {
        return a + b;
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Baeldung Java Basics](https://www.baeldung.com/java)
- [GeeksforGeeks Java Fundamentals](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Data Types](../java-data-types/README.md)
- [Java Operators](../java-operators/README.md)
