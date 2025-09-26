---
title: Java Fundamentals
aliases: [java basics, java syntax]
tags: [#java, #fundamentals]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java fundamentals cover the core building blocks of the Java programming language, including basic syntax, data types, control structures, and introductory object-oriented programming concepts. These form the foundation for writing, compiling, and running Java applications.

## Detailed Explanation

Java is a statically-typed, object-oriented language that compiles to bytecode for the Java Virtual Machine (JVM). Key fundamentals include:

- **Basic Syntax**: Java programs start with `public class ClassName { public static void main(String[] args) { ... } }`. Statements end with semicolons, blocks use curly braces.
- **Data Types**: Primitive types (int, double, boolean, char) and reference types (objects, arrays, strings).
- **Control Structures**: if-else, loops (for, while, do-while), switch statements for decision-making and iteration.
- **OOP Basics**: Classes, objects, methods, constructors as the basis for encapsulation and modularity.

## Real-world Examples & Use Cases

- **Console Applications**: Simple calculators or text processors.
- **Data Processing**: Reading files, parsing data, basic computations.
- **Educational Tools**: Teaching programming concepts through small programs.

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
public class Variables {
    public static void main(String[] args) {
        int age = 25; // Primitive
        String name = "John"; // Reference
        double salary = 50000.0;
        boolean isEmployed = true;
        
        System.out.println(name + " is " + age + " years old.");
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
        } else {
            System.out.println("Non-positive");
        }
        
        // For loop
        for (int i = 0; i < 5; i++) {
            System.out.println("Count: " + i);
        }
        
        // Switch
        switch (number) {
            case 10:
                System.out.println("Ten");
                break;
            default:
                System.out.println("Other");
        }
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](oop-principles-in-java/)
- [JVM Internals & Class Loading](jvm-internals-class-loading/)
- [Java Data Types](java-data-types/)