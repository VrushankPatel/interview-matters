---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java,#fundamentals]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core concepts and building blocks of the Java programming language. This includes basic syntax, data types, operators, control structures, and object-oriented principles that form the foundation for developing Java applications. Understanding these fundamentals is essential for writing efficient, maintainable, and scalable Java code.

## Detailed Explanation

### Data Types

Java supports two categories of data types: primitive and reference types.

#### Primitive Data Types

| Type | Size | Range | Default Value |
|------|------|-------|---------------|
| byte | 1 byte | -128 to 127 | 0 |
| short | 2 bytes | -32,768 to 32,767 | 0 |
| int | 4 bytes | -2^31 to 2^31-1 | 0 |
| long | 8 bytes | -2^63 to 2^63-1 | 0L |
| float | 4 bytes | ~ -3.4e38 to 3.4e38 | 0.0f |
| double | 8 bytes | ~ -1.7e308 to 1.7e308 | 0.0d |
| char | 2 bytes | 0 to 65,535 | '\u0000' |
| boolean | 1 bit | true or false | false |

#### Reference Types

Reference types include classes, interfaces, arrays, and enums. They store references to objects in memory.

### Variables

Variables are containers for storing data values. In Java, you must declare a variable before using it.

```java
// Variable declaration
int age;
String name;

// Variable initialization
age = 25;
name = "John Doe";

// Declaration and initialization
double salary = 50000.50;
boolean isEmployed = true;
```

### Operators

Java provides various operators for performing operations on variables and values.

#### Arithmetic Operators

```java
int a = 10, b = 5;
int sum = a + b;        // 15
int difference = a - b; // 5
int product = a * b;    // 50
int quotient = a / b;   // 2
int remainder = a % b;  // 0
```

#### Comparison Operators

```java
boolean isEqual = (a == b);     // false
boolean isNotEqual = (a != b);  // true
boolean isGreater = (a > b);    // true
boolean isLess = (a < b);       // false
```

#### Logical Operators

```java
boolean x = true, y = false;
boolean andResult = x && y;  // false
boolean orResult = x || y;   // true
boolean notResult = !x;      // false
```

### Control Structures

#### Conditional Statements

```java
// If-else statement
if (age >= 18) {
    System.out.println("Adult");
} else {
    System.out.println("Minor");
}

// Switch statement
switch (day) {
    case 1:
        System.out.println("Monday");
        break;
    case 2:
        System.out.println("Tuesday");
        break;
    default:
        System.out.println("Other day");
}
```

#### Loops

```java
// For loop
for (int i = 0; i < 5; i++) {
    System.out.println("Count: " + i);
}

// While loop
int count = 0;
while (count < 5) {
    System.out.println("Count: " + count);
    count++;
}

// Do-while loop
do {
    System.out.println("Executed at least once");
} while (false);
```

### Arrays

Arrays are used to store multiple values of the same type.

```java
// Array declaration and initialization
int[] numbers = new int[5];
int[] primes = {2, 3, 5, 7, 11};

// Accessing array elements
System.out.println(numbers[0]);  // 0
numbers[1] = 10;

// Array length
System.out.println(numbers.length);  // 5
```

### Methods

Methods are blocks of code that perform specific tasks.

```java
// Method definition
public static int add(int a, int b) {
    return a + b;
}

// Method call
int result = add(5, 3);  // 8
```

## Real-world Examples & Use Cases

1. **Calculator Application**: Using arithmetic operators and methods to perform calculations.

2. **Student Grade System**: Utilizing arrays and conditional statements to manage student grades.

3. **Banking System**: Implementing data types and variables to handle account balances and transactions.

4. **Inventory Management**: Using loops and arrays to track product stock levels.

5. **User Authentication**: Applying conditional statements and boolean logic for login validation.

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
                if (num2 != 0) {
                    result = num1 / num2;
                } else {
                    System.out.println("Error: Division by zero");
                    return;
                }
                break;
            default:
                System.out.println("Error: Invalid operator");
                return;
        }
        
        System.out.println("Result: " + result);
        scanner.close();
    }
}
```

### Array Operations

```java
public class ArrayOperations {
    public static void main(String[] args) {
        int[] numbers = {10, 20, 30, 40, 50};
        
        // Calculate sum
        int sum = 0;
        for (int num : numbers) {
            sum += num;
        }
        System.out.println("Sum: " + sum);
        
        // Find maximum
        int max = numbers[0];
        for (int i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i];
            }
        }
        System.out.println("Maximum: " + max);
        
        // Reverse array
        for (int i = 0; i < numbers.length / 2; i++) {
            int temp = numbers[i];
            numbers[i] = numbers[numbers.length - 1 - i];
            numbers[numbers.length - 1 - i] = temp;
        }
        
        System.out.print("Reversed array: ");
        for (int num : numbers) {
            System.out.print(num + " ");
        }
    }
}
```

## References

- [Oracle Java Tutorials - Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Java Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
- [Java Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)
- [Java Control Structures](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)

## Github-README Links & Related Topics

- [oop-principles-in-java/](oop-principles-in-java/)
- [jvm-internals-and-class-loading/](jvm-internals-and-class-loading/)
- [collections-and-data-structures/](collections-and-data-structures/)
- [java-stream-api-and-functional-programming/](java-stream-api-and-functional-programming/)

# STAR Summary

- **Situation**: Need to learn Java for software development.
- **Task**: Master fundamental concepts.
- **Action**: Study syntax, OOP, and practice coding.
- **Result**: Ability to build basic Java applications.

# Journey / Sequence

1. Install JDK and IDE (e.g., IntelliJ).
2. Learn syntax: variables, loops, methods.
3. Understand OOP: classes, inheritance, polymorphism.
4. Practice with small projects.
5. Explore advanced topics like generics.

# Common Pitfalls & Edge Cases

- **Null Pointer Exceptions**: Always check for null.
- **Type Casting**: Avoid ClassCastException.
- **Memory Leaks**: Improper object references.

# Tools & Libraries

- **JDK**: Java Development Kit.
- **Maven/Gradle**: Build tools.
- **JUnit**: For unit testing.
