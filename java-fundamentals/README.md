---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the basic building blocks of the Java programming language, including syntax, data types, operators, control structures, and object-oriented concepts. These are essential for writing any Java program and form the foundation for more advanced topics.

## Detailed Explanation

### Data Types

Java supports two categories of data types: primitive and reference.

**Primitive Data Types:**
- `byte`: 8-bit signed integer (-128 to 127)
- `short`: 16-bit signed integer (-32,768 to 32,767)
- `int`: 32-bit signed integer (-2^31 to 2^31-1)
- `long`: 64-bit signed integer (-2^63 to 2^63-1)
- `float`: 32-bit floating-point
- `double`: 64-bit floating-point
- `char`: 16-bit Unicode character
- `boolean`: true or false

**Reference Types:**
- Classes, interfaces, arrays, and enums

### Variables and Constants

Variables store data values. They must be declared with a type.

```java
int age = 25;
String name = "John";
```

Constants are immutable variables declared with `final`:

```java
final double PI = 3.14159;
```

### Operators

Java provides various operators:

- **Arithmetic:** +, -, *, /, %
- **Relational:** ==, !=, <, >, <=, >=
- **Logical:** &&, ||, !
- **Bitwise:** &, |, ^, ~, <<, >>, >>>
- **Assignment:** =, +=, -=, *=, /=, %=, etc.

### Control Structures

**Conditional Statements:**
```java
if (condition) {
    // code
} else if (anotherCondition) {
    // code
} else {
    // code
}

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

### Methods

Methods are blocks of code that perform specific tasks.

```java
public static int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects

Classes are blueprints for objects. Objects are instances of classes.

```java
public class Person {
    private String name;
    private int age;
    
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
}
```

## Real-world Examples & Use Cases

- **Calculator Application:** Using arithmetic operators and control structures to perform calculations.
- **User Registration System:** Storing user data using classes and objects.
- **Data Processing:** Reading and manipulating data from files or databases using loops and conditionals.
- **Simple Games:** Implementing game logic with variables, methods, and control structures.

## Code Examples

### Hello World Program
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Simple Calculator
```java
import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter first number: ");
        double num1 = scanner.nextDouble();
        System.out.print("Enter operator (+, -, *, /): ");
        char operator = scanner.next().charAt(0);
        System.out.print("Enter second number: ");
        double num2 = scanner.nextDouble();
        
        double result;
        switch (operator) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            case '/':
                result = num1 / num2;
                break;
            default:
                System.out.println("Invalid operator");
                return;
        }
        System.out.println("Result: " + result);
    }
}
```

### Array Manipulation
```java
public class ArrayExample {
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3, 4, 5};
        
        // Print array elements
        for (int i = 0; i < numbers.length; i++) {
            System.out.println("Element at index " + i + ": " + numbers[i]);
        }
        
        // Calculate sum
        int sum = 0;
        for (int num : numbers) {
            sum += num;
        }
        System.out.println("Sum: " + sum);
    }
}
```

## References

- [Oracle Java Tutorials - Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Java Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
- [Java Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)
- [Control Flow Statements](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Data Types](../java-data-types/README.md)
- [Java Operators](../java-operators/README.md)
