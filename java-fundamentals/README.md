---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview
Java is a high-level, object-oriented programming language designed for portability and robustness. It follows the "write once, run anywhere" principle through the Java Virtual Machine (JVM). Key features include automatic memory management, strong typing, and extensive standard libraries.

## Detailed Explanation
Java fundamentals encompass the core concepts and syntax that form the building blocks of Java programming. This includes data types, variables, operators, control structures, and basic object-oriented principles.

### Data Types
Java has two categories of data types: primitive and reference.

**Primitive Types:**
- `byte`: 8-bit signed integer (-128 to 127)
- `short`: 16-bit signed integer (-32,768 to 32,767)
- `int`: 32-bit signed integer (-2^31 to 2^31-1)
- `long`: 64-bit signed integer (-2^63 to 2^63-1)
- `float`: 32-bit IEEE 754 floating-point
- `double`: 64-bit IEEE 754 floating-point
- `char`: 16-bit Unicode character
- `boolean`: true or false

**Reference Types:**
- Classes, interfaces, arrays, and enums

### Variables
Variables are containers for storing data values. They must be declared with a data type.

```java
int age = 25;
String name = "John Doe";
double salary = 50000.0;
```

### Operators
Java supports various operators for arithmetic, comparison, logical, and assignment operations.

**Arithmetic Operators:**
```java
int a = 10, b = 5;
int sum = a + b;        // 15
int difference = a - b; // 5
int product = a * b;    // 50
int quotient = a / b;   // 2
int remainder = a % b;  // 0
```

**Comparison Operators:**
```java
boolean isEqual = (a == b);     // false
boolean isGreater = (a > b);    // true
boolean isLessOrEqual = (a <= b); // false
```

**Logical Operators:**
```java
boolean condition1 = true, condition2 = false;
boolean andResult = condition1 && condition2; // false
boolean orResult = condition1 || condition2;  // true
boolean notResult = !condition1;              // false
```

### Control Structures
Control structures direct the flow of program execution.

**If-Else Statement:**
```java
int score = 85;
if (score >= 90) {
    System.out.println("Grade: A");
} else if (score >= 80) {
    System.out.println("Grade: B");
} else {
    System.out.println("Grade: C");
}
```

**Switch Statement:**
```java
int day = 3;
switch (day) {
    case 1:
        System.out.println("Monday");
        break;
    case 2:
        System.out.println("Tuesday");
        break;
    case 3:
        System.out.println("Wednesday");
        break;
    default:
        System.out.println("Other day");
}
```

**Loops:**
```java
// For loop
for (int i = 0; i < 5; i++) {
    System.out.println("Iteration: " + i);
}

// While loop
int count = 0;
while (count < 3) {
    System.out.println("Count: " + count);
    count++;
}

// Do-while loop
int num = 1;
do {
    System.out.println("Number: " + num);
    num++;
} while (num <= 3);
```

## Real-world Examples & Use Cases
1. **Simple Calculator Application:** Implementing basic arithmetic operations using variables, operators, and control structures.
2. **Student Grade Management System:** Using arrays and loops to store and process student grades.
3. **Bank Account Simulator:** Demonstrating object creation and method calls for basic banking operations.
4. **Temperature Converter:** Converting between Celsius, Fahrenheit, and Kelvin using mathematical formulas.
5. **Number Guessing Game:** Implementing game logic with random number generation and user input validation.

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
        scanner.close();
    }
}
```

### Array Operations
```java
public class ArrayExample {
    public static void main(String[] args) {
        // Declare and initialize an array
        int[] numbers = {10, 20, 30, 40, 50};
        
        // Print array elements
        System.out.println("Array elements:");
        for (int i = 0; i < numbers.length; i++) {
            System.out.println("Index " + i + ": " + numbers[i]);
        }
        
        // Calculate sum
        int sum = 0;
        for (int num : numbers) {
            sum += num;
        }
        System.out.println("Sum of array elements: " + sum);
        
        // Find maximum
        int max = numbers[0];
        for (int num : numbers) {
            if (num > max) {
                max = num;
            }
        }
        System.out.println("Maximum value: " + max);
    }
}
```

## References
- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)
- [Baeldung Java Guides](https://www.baeldung.com/java)

## Github-README Links & Related Topics
- [OOP Principles in Java](../oop-principles-in-java/)
- [Collections & Data Structures](../collections-and-data-structures/)
- [Java Stream API & Functional Programming](../java-stream-api-functional-programming/)
