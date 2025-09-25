---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Fundamentals

## Overview

Java Fundamentals encompass the essential building blocks of the Java programming language, including syntax, data types, control structures, and basic object-oriented concepts. These fundamentals provide the foundation for writing, compiling, and running Java applications across various platforms.

## Detailed Explanation

### Java Program Structure

Every Java program consists of classes and methods. The `main` method serves as the entry point for execution:

```java
public class MyClass {
    public static void main(String[] args) {
        // Program logic here
    }
}
```

### Data Types

Java supports primitive data types and reference types:

- **Primitive types**: `int`, `double`, `boolean`, `char`, `byte`, `short`, `long`, `float`
- **Reference types**: Objects, arrays, strings

```java
int age = 25;
double salary = 50000.0;
boolean isActive = true;
String name = "John Doe";
```

### Control Structures

Java provides standard control flow statements:

- Conditional statements: `if-else`, `switch`
- Loops: `for`, `while`, `do-while`

```java
// If-else
if (age >= 18) {
    System.out.println("Adult");
} else {
    System.out.println("Minor");
}

// For loop
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}
```

### Object-Oriented Basics

Java is fundamentally object-oriented:

- **Classes and Objects**: Blueprints and instances
- **Methods**: Functions within classes
- **Constructors**: Special methods for object initialization

```java
class Car {
    String model;
    int year;
    
    Car(String model, int year) {
        this.model = model;
        this.year = year;
    }
    
    void display() {
        System.out.println(model + " " + year);
    }
}

Car myCar = new Car("Toyota", 2020);
myCar.display();
```

### Exception Handling

Java uses try-catch blocks for error handling:

```java
try {
    int result = 10 / 0;
} catch (ArithmeticException e) {
    System.out.println("Division by zero: " + e.getMessage());
}
```

## Real-world Examples & Use Cases

- **Console Applications**: Command-line tools and utilities
- **Web Applications**: Backend services using frameworks like Spring
- **Desktop Applications**: GUI apps with JavaFX or Swing
- **Android Development**: Mobile apps (though with some differences)
- **Enterprise Software**: Large-scale business applications

## Code Examples

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
        
        double result = 0;
        
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
                    System.out.println("Cannot divide by zero");
                    return;
                }
                break;
            default:
                System.out.println("Invalid operator");
                return;
        }
        
        System.out.println("Result: " + result);
    }
}
```

### Student Grade Management

```java
import java.util.ArrayList;
import java.util.List;

class Student {
    String name;
    List<Integer> grades;
    
    Student(String name) {
        this.name = name;
        this.grades = new ArrayList<>();
    }
    
    void addGrade(int grade) {
        grades.add(grade);
    }
    
    double getAverage() {
        if (grades.isEmpty()) return 0;
        int sum = 0;
        for (int grade : grades) {
            sum += grade;
        }
        return (double) sum / grades.size();
    }
}

public class GradeManager {
    public static void main(String[] args) {
        Student student = new Student("Alice");
        student.addGrade(85);
        student.addGrade(92);
        student.addGrade(78);
        
        System.out.println("Average grade: " + student.getAverage());
    }
}
```

## References

- [Oracle Java Tutorials - Getting Started](https://docs.oracle.com/javase/tutorial/getStarted/index.html)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [GeeksforGeeks Java Fundamentals](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-class-loading/README.md)
- [Collections & Data Structures](../collections-and-data-structures/README.md)
- [Java Stream API & Functional Programming](../java-stream-api-and-functional-programming/README.md)
