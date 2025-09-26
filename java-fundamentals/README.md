---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Java Fundamentals encompass the core concepts and syntax of the Java programming language. This includes data types, variables, operators, control structures, methods, and basic object-oriented principles. Understanding these fundamentals is essential for building robust Java applications.

## Detailed Explanation

## Data Types

Java supports two main categories of data types: primitive types and reference types.

### Primitive Data Types

| Type | Size | Range | Default Value |
|------|------|-------|---------------|
| byte | 1 byte | -128 to 127 | 0 |
| short | 2 bytes | -32,768 to 32,767 | 0 |
| int | 4 bytes | -2,147,483,648 to 2,147,483,647 | 0 |
| long | 8 bytes | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | 0L |
| float | 4 bytes | Approximately ±3.40282347E+38F | 0.0f |
| double | 8 bytes | Approximately ±1.79769313486231570E+308 | 0.0d |
| char | 2 bytes | '\u0000' to '\uffff' | '\u0000' |
| boolean | 1 bit | true or false | false |

### Reference Data Types

Reference types include classes, interfaces, and arrays. They store references to objects in memory.

## Variables

Variables are containers for storing data values. In Java, you must declare a variable with a data type before using it.

```java
int age = 25;
String name = "John Doe";
boolean isStudent = true;
```

## Operators

Java provides various operators for performing operations on variables and values.

### Arithmetic Operators

- `+` : Addition
- `-` : Subtraction
- `*` : Multiplication
- `/` : Division
- `%` : Modulus

### Relational Operators

- `==` : Equal to
- `!=` : Not equal to
- `>` : Greater than
- `<` : Less than
- `>=` : Greater than or equal to
- `<=` : Less than or equal to

### Logical Operators

- `&&` : Logical AND
- `||` : Logical OR
- `!` : Logical NOT

## Control Structures

Control structures allow you to control the flow of execution in your programs.

### Conditional Statements

```java
if (condition) {
    // code to execute if condition is true
} else if (anotherCondition) {
    // code to execute if anotherCondition is true
} else {
    // code to execute if all conditions are false
}
```

### Loops

#### For Loop
```java
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}
```

#### While Loop
```java
int i = 0;
while (i < 10) {
    System.out.println(i);
    i++;
}
```

#### Do-While Loop
```java
int i = 0;
do {
    System.out.println(i);
    i++;
} while (i < 10);
```

## Methods

Methods are blocks of code that perform specific tasks. The main method is the entry point of a Java program.

```java
public static void main(String[] args) {
    System.out.println("Hello, World!");
}

public int add(int a, int b) {
    return a + b;
}
```

## Real-world Examples & Use Cases

1. **Simple Calculator**: Using arithmetic operators and methods to perform calculations.
2. **Student Grade Calculator**: Using conditional statements to determine grades based on scores.
3. **Number Guessing Game**: Using loops and random number generation for interactive gameplay.
4. **Temperature Converter**: Converting between Celsius and Fahrenheit using formulas and user input.

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

### Student Grade Calculator
```java
public class GradeCalculator {
    public static void main(String[] args) {
        int score = 85;
        char grade;
        
        if (score >= 90) {
            grade = 'A';
        } else if (score >= 80) {
            grade = 'B';
        } else if (score >= 70) {
            grade = 'C';
        } else if (score >= 60) {
            grade = 'D';
        } else {
            grade = 'F';
        }
        
        System.out.println("Grade: " + grade);
    }
}
```

## References

- [Oracle Java Tutorials: Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Java Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
- [Java Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)
- [Java Control Structures](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](./oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](./jvm-internals-class-loading/README.md)
- [Java Collections](./java-collections/README.md)
- [Java Exception Handling](./java-exception-handling/README.md)
