---
title: Java Fundamentals
aliases: [Java Fundamentals, Java Basics]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Java Fundamentals cover the core building blocks of the Java programming language, including variables, data types, operators, expressions, statements, and control flow structures. These elements form the foundation for writing any Java program, enabling developers to store data, perform computations, and control program execution flow.

# Detailed Explanation

## Variables

Variables in Java are containers for storing data values. Java is a statically-typed language, meaning you must declare the type of a variable before using it.

### Variable Declaration and Initialization

```java
int age;        // Declaration
age = 25;       // Initialization
int height = 180; // Declaration and initialization
```

### Naming Rules and Conventions

- Must start with a letter, underscore (_), or dollar sign ($)
- Can contain letters, digits, underscores, and dollar signs
- Case-sensitive
- Cannot be Java keywords
- Convention: camelCase for variables (e.g., `myVariable`)

## Primitive Data Types

Java provides eight primitive data types:

| Type | Size | Range | Default Value |
|------|------|-------|---------------|
| byte | 8 bits | -128 to 127 | 0 |
| short | 16 bits | -32,768 to 32,767 | 0 |
| int | 32 bits | -2^31 to 2^31-1 | 0 |
| long | 64 bits | -2^63 to 2^63-1 | 0L |
| float | 32 bits | ~1.4e-45 to ~3.4e38 | 0.0f |
| double | 64 bits | ~4.9e-324 to ~1.8e308 | 0.0d |
| char | 16 bits | '\u0000' to '\uffff' | '\u0000' |
| boolean | 1 bit | true or false | false |

## Arrays

Arrays are used to store multiple values of the same type in a single variable.

```java
// Declaration and initialization
int[] numbers = new int[5];
int[] primes = {2, 3, 5, 7, 11};

// Accessing elements
numbers[0] = 10;
int firstPrime = primes[0];
```

## Operators

Java provides various operators for performing operations on variables and values.

### Assignment Operators

```java
int x = 10;
x += 5;  // x = x + 5
x *= 2;  // x = x * 2
```

### Arithmetic Operators

```java
int a = 10, b = 3;
int sum = a + b;      // 13
int difference = a - b; // 7
int product = a * b;  // 30
int quotient = a / b; // 3
int remainder = a % b; // 1
```

### Comparison Operators

```java
boolean result1 = (a == b);  // false
boolean result2 = (a != b);  // true
boolean result3 = (a > b);   // true
boolean result4 = (a < b);   // false
boolean result5 = (a >= b);  // true
boolean result6 = (a <= b);  // false
```

### Logical Operators

```java
boolean x = true, y = false;
boolean andResult = x && y;  // false
boolean orResult = x || y;   // true
boolean notResult = !x;      // false
```

## Expressions, Statements, and Blocks

### Expressions

Expressions are constructs that evaluate to a single value.

```java
int result = 5 + 3 * 2;  // Arithmetic expression
boolean isAdult = age >= 18;  // Boolean expression
```

### Statements

Statements are complete units of execution.

```java
int x = 5;              // Declaration statement
x = x + 1;              // Assignment statement
System.out.println(x);  // Method call statement
```

### Blocks

Blocks are groups of statements enclosed in curly braces.

```java
{
    int localVar = 10;
    System.out.println(localVar);
} // localVar is not accessible outside this block
```

## Control Flow Statements

Control flow statements allow you to control the order of execution in your program.

### Decision-Making Statements

#### if-then Statement

```java
if (condition) {
    // code to execute if condition is true
}
```

#### if-then-else Statement

```java
if (condition) {
    // code if true
} else {
    // code if false
}
```

#### switch Statement

```java
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

### Looping Statements

#### while Loop

```java
while (condition) {
    // code to repeat
}
```

#### do-while Loop

```java
do {
    // code to repeat
} while (condition);
```

#### for Loop

```java
for (initialization; condition; update) {
    // code to repeat
}
```

#### Enhanced for Loop (for-each)

```java
for (Type element : collection) {
    // code using element
}
```

### Branching Statements

#### break Statement

```java
for (int i = 0; i < 10; i++) {
    if (i == 5) {
        break;  // Exit the loop
    }
    System.out.println(i);
}
```

#### continue Statement

```java
for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
        continue;  // Skip even numbers
    }
    System.out.println(i);
}
```

#### return Statement

```java
public int add(int a, int b) {
    return a + b;  // Return the sum
}
```

# Real-world Examples & Use Cases

## Temperature Converter

```java
public class TemperatureConverter {
    public static void main(String[] args) {
        double celsius = 25.0;
        double fahrenheit = (celsius * 9/5) + 32;
        
        System.out.println(celsius + "°C is " + fahrenheit + "°F");
        
        // Decision making
        if (fahrenheit > 80) {
            System.out.println("It's hot!");
        } else if (fahrenheit < 60) {
            System.out.println("It's cold!");
        } else {
            System.out.println("It's comfortable.");
        }
    }
}
```

## Simple Calculator

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
        
        // Switch statement for operation selection
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
                    System.out.println("Error: Division by zero!");
                    return;
                }
                break;
            default:
                System.out.println("Error: Invalid operator!");
                return;
        }
        
        System.out.println("Result: " + result);
    }
}
```

## Array Processing Example

```java
public class ArrayProcessor {
    public static void main(String[] args) {
        int[] numbers = {12, 45, 23, 67, 89, 34, 56, 78, 90, 11};
        
        // Find maximum value
        int max = numbers[0];
        for (int i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i];
            }
        }
        System.out.println("Maximum value: " + max);
        
        // Calculate average
        double sum = 0;
        for (int number : numbers) {
            sum += number;
        }
        double average = sum / numbers.length;
        System.out.println("Average: " + average);
        
        // Count even numbers
        int evenCount = 0;
        for (int number : numbers) {
            if (number % 2 == 0) {
                evenCount++;
            }
        }
        System.out.println("Number of even values: " + evenCount);
    }
}
```

# Code Examples

## Variable Scope Example

```java
public class VariableScope {
    static int classVariable = 10;  // Class variable
    
    public static void main(String[] args) {
        int methodVariable = 20;  // Method variable
        
        if (true) {
            int blockVariable = 30;  // Block variable
            System.out.println("Block variable: " + blockVariable);
        }
        
        // System.out.println(blockVariable);  // Error: blockVariable not accessible
        
        System.out.println("Class variable: " + classVariable);
        System.out.println("Method variable: " + methodVariable);
    }
}
```

## Control Flow Diagram

```mermaid
graph TD
    A[Start] --> B{Condition}
    B -->|True| C[Execute if block]
    B -->|False| D[Execute else block]
    C --> E[Continue]
    D --> E
    E[End]
```

## Operator Precedence Example

```java
public class OperatorPrecedence {
    public static void main(String[] args) {
        int a = 5, b = 10, c = 15;
        
        // Multiplication has higher precedence than addition
        int result1 = a + b * c;  // 5 + (10 * 15) = 155
        System.out.println("a + b * c = " + result1);
        
        // Parentheses can change precedence
        int result2 = (a + b) * c;  // (5 + 10) * 15 = 225
        System.out.println("(a + b) * c = " + result2);
        
        // Logical operators
        boolean result3 = a < b && b < c;  // true && true = true
        boolean result4 = a > b || b < c;  // false || true = true
        System.out.println("a < b && b < c = " + result3);
        System.out.println("a > b || b < c = " + result4);
    }
}
```

# References

- [Oracle Java Tutorials: Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Oracle Java Tutorials: Variables](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/variables.html)
- [Oracle Java Tutorials: Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)
- [Oracle Java Tutorials: Control Flow Statements](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)

# Github-README Links & Related Topics

- [java-data-types](java-data-types/)
- [java-operators](java-operators/)
- [java-control-flow](java-control-flow/)
- [java-arrays](java-arrays/)
- [oop-principles-in-java](oop-principles-in-java/)
