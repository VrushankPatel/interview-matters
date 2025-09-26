---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including syntax, data types, control structures, and object-oriented concepts.

## Detailed Explanation

### Data Types

Java has two main categories of data types: primitive and reference.

#### Primitive Data Types

| Type    | Size    | Range                                      | Default Value |
|---------|---------|--------------------------------------------|---------------|
| byte    | 1 byte  | -128 to 127                               | 0             |
| short   | 2 bytes | -32,768 to 32,767                         | 0             |
| int     | 4 bytes | -2,147,483,648 to 2,147,483,647           | 0             |
| long    | 8 bytes | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | 0L            |
| float   | 4 bytes | Approximately ±3.40282347E+38F            | 0.0f          |
| double  | 8 bytes | Approximately ±1.79769313486231570E+308   | 0.0d          |
| char    | 2 bytes | '\u0000' to '\uffff' (0 to 65,535)        | '\u0000'      |
| boolean | 1 bit   | true or false                              | false         |

#### Reference Types

Reference types include classes, interfaces, arrays, and enums. They store references to objects in memory.

Example: `String str = "Hello";` - str is a reference to a String object.

### Variables and Constants

Variables declared with type, e.g., int x = 5;

Constants with final, e.g., final int MAX = 100;

### Operators

Arithmetic: +, -, *, /, %

Relational: ==, !=, <, >, <=, >=

Logical: &&, ||, !

### Control Structures

If-else, switch, loops: for, while, do-while.

## Real-world Examples & Use Cases

Java fundamentals are essential for building robust applications across various domains:

- **Enterprise Applications**: Building backend systems for banking, e-commerce, and CRM using Spring Framework.
- **Android Development**: Creating mobile apps with Android SDK, utilizing Java's OOP for UI components and data handling.
- **Web Servers**: Developing server-side applications with servlets and JSP for dynamic web content.
- **Scientific Computing**: Implementing algorithms for data analysis and simulations using Java's numeric types and control structures.
- **Embedded Systems**: Programming IoT devices with Java's portability and memory management.

Example: Calculating average salary in a company payroll system, handling employee data with arrays and loops.

## Code Examples

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

```java
int[] numbers = {1, 2, 3, 4, 5};
int sum = 0;
for (int num : numbers) {
    sum += num;
}
System.out.println("Sum: " + sum);
```

```java
// Simple class example
public class Employee {
    private String name;
    private double salary;

    public Employee(String name, double salary) {
        this.name = name;
        this.salary = salary;
    }

    public double getSalary() {
        return salary;
    }

    public static void main(String[] args) {
        Employee emp = new Employee("John Doe", 50000);
        System.out.println("Salary: " + emp.getSalary());
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/)
- [Collections & Data Structures](../collections-and-data-structures/)
