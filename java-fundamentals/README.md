---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java is a versatile, object-oriented programming language known for its portability, security, and robustness. Developed by Sun Microsystems (now Oracle), Java applications run on the Java Virtual Machine (JVM), enabling cross-platform compatibility. It emphasizes simplicity, readability, and maintainability, making it ideal for enterprise applications, web development, and Android apps.

## Detailed Explanation

### Core Concepts

- **Variables and Data Types**: Java is statically typed. Primitive types include int, double, char, boolean. Reference types include classes, interfaces, and arrays.

- **Operators**: Arithmetic, relational, logical, bitwise, and assignment operators.

- **Control Flow**: Conditional statements (if-else, switch), loops (for, while, do-while), and jump statements (break, continue, return).

- **Methods**: Functions defined in classes, with parameters and return types.

- **Arrays**: Fixed-size collections of elements of the same type.

### Object-Oriented Basics

- **Classes and Objects**: Classes are blueprints; objects are instances.

- **Constructors**: Special methods for object initialization.

- **Static Members**: Belong to the class, not instances.

### Exception Handling

- **Try-Catch-Finally**: Handle runtime errors gracefully.

- **Checked vs Unchecked Exceptions**: Compile-time vs runtime exceptions.

### Input/Output

- **Streams**: For reading/writing data.

- **Files**: Using File, FileReader, etc.

## Real-world Examples & Use Cases

- **Web Applications**: Building REST APIs with Spring Boot.

- **Mobile Apps**: Android development.

- **Desktop Applications**: GUI with JavaFX or Swing.

- **Embedded Systems**: IoT devices.

- **Big Data**: Frameworks like Hadoop.

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
public class DataTypes {
    public static void main(String[] args) {
        int age = 25;
        double salary = 50000.50;
        boolean isStudent = true;
        String name = "John";
        System.out.println("Name: " + name + ", Age: " + age + ", Salary: " + salary + ", Student: " + isStudent);
    }
}
```

### Control Structures

```java
public class ControlStructures {
    public static void main(String[] args) {
        int number = 10;
        if (number > 0) {
            System.out.println("Positive");
        } else {
            System.out.println("Non-positive");
        }
        for (int i = 0; i < 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}
```

### Simple Class

```java
public class Person {
    private String name;
    private int age;
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    public void display() {
        System.out.println("Name: " + name + ", Age: " + age);
    }
    public static void main(String[] args) {
        Person p = new Person("Alice", 30);
        p.display();
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [Baeldung Java Basics](https://www.baeldung.com/java)

## Github-README Links & Related Topics

- [oop-principles-in-java](../oop-principles-in-java/)
- [jvm-internals-class-loading](../jvm-internals-class-loading/)
- [java](../java/)
