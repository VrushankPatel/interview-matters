---
title: Java Fundamentals
aliases: [Java Basics, Core Java Concepts]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java is a versatile, object-oriented programming language known for its portability, security, and robustness. Developed by Sun Microsystems (now Oracle), Java applications run on the Java Virtual Machine (JVM), enabling cross-platform compatibility. It emphasizes simplicity, readability, and maintainability, making it ideal for enterprise applications, web development, and Android apps.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

**Primitive Types:**

| Type | Size | Range | Default |
|------|------|-------|---------|
| byte | 8-bit | -128 to 127 | 0 |
| short | 16-bit | -32,768 to 32,767 | 0 |
| int | 32-bit | -2^31 to 2^31-1 | 0 |
| long | 64-bit | -2^63 to 2^63-1 | 0L |
| float | 32-bit | ~1.4e-45 to 3.4e38 | 0.0f |
| double | 64-bit | ~4.9e-324 to 1.8e308 | 0.0d |
| char | 16-bit | 0 to 65,535 | '\u0000' |
| boolean | 1-bit | true/false | false |

**Reference Types:** Objects, arrays, strings.

### Control Structures

- **Conditional:** if-else, switch
- **Loops:** for, while, do-while
- **Branching:** break, continue, return

### Classes and Objects

- Class: Blueprint for objects
- Object: Instance of a class
- Methods: Functions within classes
- Fields: Variables within classes

### Exception Handling

- **Try-Catch-Finally**: Handle runtime errors gracefully.
- **Checked vs Unchecked Exceptions**: Compile-time vs runtime exceptions.

### Input/Output

- **Streams**: For reading/writing data.
- **Files**: Using File, FileReader, etc.

### Java Program Execution Flow

```mermaid
graph TD;
    A[Write Java Code (.java)] --> B[Compile with javac];
    B --> C[Generate Bytecode (.class)];
    C --> D[Run with java command];
    D --> E[JVM loads and executes bytecode];
    E --> F[Output results];
```

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
        
        // If-else
        if (number > 0) {
            System.out.println("Positive number");
        } else if (number < 0) {
            System.out.println("Negative number");
        } else {
            System.out.println("Zero");
        }
        
        // For loop
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
        
        // Switch
        switch (number) {
            case 1:
                System.out.println("One");
                break;
            case 10:
                System.out.println("Ten");
                break;
            default:
                System.out.println("Other");
        }
    }
}
```

### Class and Object Example

```java
public class Person {
    // Fields
    private String name;
    private int age;
    
    // Constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    // Method
    public void introduce() {
        System.out.println("Hi, I'm " + name + " and I'm " + age + " years old.");
    }
    
    public static void main(String[] args) {
        Person person = new Person("Alice", 30);
        person.introduce();
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [Baeldung Java Basics](https://www.baeldung.com/java)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Collections & Data Structures](../collections-and-data-structures/README.md)
- [Java Stream API & Functional Programming](../java-stream-api-and-functional-programming/README.md)
