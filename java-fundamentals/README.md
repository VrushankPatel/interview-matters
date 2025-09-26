---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core concepts and building blocks of the Java programming language, including data types, variables, operators, control structures, and basic object-oriented principles. These fundamentals form the foundation for writing Java applications and are essential for understanding more advanced topics.

## Detailed Explanation

### Data Types

Java has two categories of data types: primitive and reference.

**Primitive Data Types:**

| Type | Size | Range | Default Value |
|------|------|-------|---------------|
| byte | 1 byte | -128 to 127 | 0 |
| short | 2 bytes | -32,768 to 32,767 | 0 |
| int | 4 bytes | -2,147,483,648 to 2,147,483,647 | 0 |
| long | 8 bytes | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | 0L |
| float | 4 bytes | ±3.40282347E+38F | 0.0f |
| double | 8 bytes | ±1.79769313486231570E+308 | 0.0d |
| char | 2 bytes | '\u0000' to '\uffff' | '\u0000' |
| boolean | 1 bit | true or false | false |

**Reference Data Types:**

Reference types store references to objects. Examples include classes, interfaces, arrays, and strings.

### Variables

Variables are containers for storing data values. In Java, you must declare a variable before using it.

```java
// Primitive variable
int age = 25;

// Reference variable
String name = "John Doe";

// Array
int[] numbers = {1, 2, 3, 4, 5};
```

### Operators

Java supports various operators:

- **Arithmetic:** +, -, *, /, %
- **Relational:** ==, !=, >, <, >=, <=
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

**Loops:**

```java
// For loop
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// While loop
while (condition) {
    // code
}

// Do-while loop
do {
    // code
} while (condition);
```

## Real-world Examples & Use Cases

1. **User Input Validation:** Using conditional statements to validate user input in a login system.

2. **Data Processing:** Employing loops to process large datasets, such as calculating averages from a list of numbers.

3. **Configuration Management:** Using variables and data types to store application configuration settings.

4. **Basic Calculator:** Implementing arithmetic operations using operators and control structures.

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
    }
}
```

### Array Operations

```java
public class ArrayExample {
    public static void main(String[] args) {
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
        System.out.println("Sum: " + sum);
        
        // Find maximum
        int max = numbers[0];
        for (int num : numbers) {
            if (num > max) {
                max = num;
            }
        }
        System.out.println("Maximum: " + max);
    }
}
```

## References

- [Oracle Java Tutorials - Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Java Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
- [Java Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)
- [Java Control Structures](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Data Types](../java-data-types/README.md)
- [Java Operators](../java-operators/README.md)
