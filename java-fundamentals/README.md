---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Fundamentals

## Overview

Java is a versatile, object-oriented programming language known for its "write once, run anywhere" philosophy, enabled by the Java Virtual Machine (JVM). It emphasizes portability, security, and robustness, making it ideal for enterprise applications, web development, and mobile apps.

## Detailed Explanation

### Key Concepts

- **Variables and Data Types**: Java supports primitive types (int, double, boolean, char) and reference types (objects).
- **Operators**: Arithmetic (+, -, *, /), relational (==, !=, <, >), logical (&&, ||, !), assignment (=, +=), etc.
- **Control Structures**: Conditional statements (if-else, switch) and loops (for, while, do-while).
- **Classes and Objects**: Classes as blueprints for objects, with encapsulation, methods, and constructors.
- **Methods**: Functions defined within classes, including static and instance methods.
- **Packages**: Mechanism for organizing classes and interfaces.

### Data Types

Java has two categories of data types:

1. **Primitive Types**:
   - byte, short, int, long (integers)
   - float, double (floating-point)
   - char (characters)
   - boolean (true/false)

2. **Reference Types**: Objects, arrays, strings.

| Primitive Type | Size | Default Value | Range |
|----------------|------|---------------|-------|
| byte | 1 byte | 0 | -128 to 127 |
| short | 2 bytes | 0 | -32,768 to 32,767 |
| int | 4 bytes | 0 | -2,147,483,648 to 2,147,483,647 |
| long | 8 bytes | 0L | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |
| float | 4 bytes | 0.0f | Approximately ±3.40282347E+38F |
| double | 8 bytes | 0.0d | Approximately ±1.79769313486231570E+308 |
| char | 2 bytes | '\u0000' | 0 to 65,535 |
| boolean | 1 bit | false | true or false |

## Real-world Examples & Use Cases

- **Enterprise Software**: Java is widely used in banking systems, insurance applications, and ERP systems due to its reliability and scalability.
- **Android Applications**: The primary language for Android app development.
- **Web Applications**: Frameworks like Spring Boot for building RESTful APIs and microservices.
- **Big Data Processing**: Tools like Apache Hadoop and Apache Spark are built with Java.
- **Scientific Computing**: Libraries like Apache Commons Math for numerical computations.

## Code Examples

### Basic Hello World Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Variables, Operators, and Control Structures

```java
public class BasicExample {
    public static void main(String[] args) {
        // Variables
        int age = 25;
        double salary = 50000.0;
        String name = "John Doe";
        
        // Operators
        int doubledAge = age * 2;
        boolean isAdult = age >= 18;
        
        // Control structures
        if (isAdult) {
            System.out.println(name + " is an adult.");
        } else {
            System.out.println(name + " is not an adult.");
        }
        
        // Loop
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
    }
}
```

### Simple Class and Object

```java
public class Person {
    private String name;
    private int age;
    
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
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

- [Oracle Java Documentation](https://docs.oracle.com/en/java/javase/)
- [Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

## Github-README Links & Related Topics

- [OOP Principles in Java](./oop-principles-in-java)
- [JVM Internals & Class Loading](./jvm-internals-class-loading)
- [Multithreading & Concurrency in Java](./multithreading-concurrency-in-java)
- [Collections & Data Structures](./collections-data-structures)