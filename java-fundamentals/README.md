---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core concepts and building blocks of the Java programming language, including syntax, data types, control structures, and basic object-oriented principles. These form the foundation for writing Java applications and are essential for understanding more advanced topics.

## Detailed Explanation

### Variables and Data Types

Java is a statically-typed language, requiring explicit declaration of variable types. Variables store data values and can be primitive or reference types.

#### Primitive Data Types

| Type | Size | Range | Default Value |
|------|------|-------|---------------|
| byte | 1 byte | -128 to 127 | 0 |
| short | 2 bytes | -32,768 to 32,767 | 0 |
| int | 4 bytes | -2^31 to 2^31-1 | 0 |
| long | 8 bytes | -2^63 to 2^63-1 | 0L |
| float | 4 bytes | ~3.4e-038 to 3.4e+038 | 0.0f |
| double | 8 bytes | ~1.7e-308 to 1.7e+308 | 0.0d |
| char | 2 bytes | 0 to 65,535 | '\u0000' |
| boolean | 1 bit | true or false | false |

#### Reference Types

Reference types include classes, interfaces, arrays, and enums. They store references to objects in memory.

### Operators

Java supports various operators:

- Arithmetic: +, -, *, /, %
- Relational: ==, !=, >, <, >=, <=
- Logical: &&, ||, !
- Assignment: =, +=, -=, etc.
- Bitwise: &, |, ^, ~, <<, >>

### Control Structures

#### Conditional Statements

```java
if (condition) {
    // code
} else if (anotherCondition) {
    // code
} else {
    // code
}

switch (expression) {
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

#### Loops

```java
// For loop
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// While loop
int i = 0;
while (i < 10) {
    System.out.println(i);
    i++;
}

// Do-while loop
int i = 0;
do {
    System.out.println(i);
    i++;
} while (i < 10);
```

### Methods

Methods define reusable blocks of code.

```java
public static int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects

Basic OOP concepts:

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

1. **Simple Calculator**: Implementing basic arithmetic operations.
2. **Student Grade Calculator**: Calculating averages and grades.
3. **Bank Account Management**: Basic deposit and withdrawal operations.
4. **Temperature Converter**: Converting between Celsius, Fahrenheit, and Kelvin.
5. **Number Guessing Game**: Interactive game using loops and conditionals.

## Code Examples

### Hello World Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Basic Calculator

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
    }
}
```

### Array Operations

```java
public class ArrayExample {
    public static void main(String[] args) {
        int[] numbers = {1, 2, 3, 4, 5};
        
        // Print array elements
        for (int num : numbers) {
            System.out.print(num + " ");
        }
        System.out.println();
        
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
    }
}
```

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Collections & Data Structures](../collections-and-data-structures/README.md)
- [Java Stream API & Functional Programming](../java-stream-api-and-functional-programming/README.md)
