---
title: Java Fundamentals
aliases: [Java Basics, Java Core Concepts]
tags: [#java,#fundamentals]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java is a high-level, object-oriented programming language designed to be platform-independent, secure, and robust. Developed by Sun Microsystems (now part of Oracle) in 1995, Java runs on the Java Virtual Machine (JVM), allowing "write once, run anywhere" capability. It's widely used for building enterprise applications, Android mobile apps, web servers, big data processing, and more. Key features include automatic memory management via garbage collection, strong typing, and extensive standard libraries.

## Detailed Explanation

### Basic Syntax and Structure
Java programs are organized into classes and methods. Every Java application must have a `main` method as the entry point.

### Data Types
Java has two categories of data types: primitive and reference.

#### Primitive Data Types
| Type | Size | Range | Example |
|------|------|-------|---------|
| byte | 1 byte | -128 to 127 | `byte b = 100;` |
| short | 2 bytes | -32,768 to 32,767 | `short s = 1000;` |
| int | 4 bytes | -2^31 to 2^31-1 | `int i = 100000;` |
| long | 8 bytes | -2^63 to 2^63-1 | `long l = 100000L;` |
| float | 4 bytes | ~ -3.4e38 to 3.4e38 | `float f = 3.14f;` |
| double | 8 bytes | ~ -1.7e308 to 1.7e308 | `double d = 3.14159;` |
| char | 2 bytes | 0 to 65,535 (Unicode) | `char c = 'A';` |
| boolean | 1 bit | true or false | `boolean flag = true;` |

#### Reference Data Types
These include classes, interfaces, arrays, and strings. They store references to objects in memory.

### Operators
Java supports various operators for performing operations on variables and values.

- **Arithmetic Operators**: +, -, *, /, %
- **Relational Operators**: ==, !=, >, <, >=, <=
- **Logical Operators**: &&, ||, !
- **Assignment Operators**: =, +=, -=, *=, /=, %=
- **Bitwise Operators**: &, |, ^, ~, <<, >>, >>>
- **Unary Operators**: +, -, ++, --

### Control Structures
Control structures direct the flow of program execution.

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
Methods are blocks of code that perform specific tasks.

```java
public static int add(int a, int b) {
    return a + b;
}
```

### Classes and Objects
Java is object-oriented. Classes are blueprints for objects.

```java
public class Car {
    String model;
    int year;
    
    public Car(String model, int year) {
        this.model = model;
        this.year = year;
    }
    
    public void display() {
        System.out.println("Model: " + model + ", Year: " + year);
    }
}

// Usage
Car myCar = new Car("Toyota", 2020);
myCar.display();
```

## Real-world Examples & Use Cases

1. **Simple Calculator Application**: Using arithmetic operators and control structures to perform calculations based on user input.
2. **Bank Account Management**: Creating classes to represent bank accounts with methods for deposit, withdrawal, and balance checking.
3. **Student Grade Calculator**: Using arrays and loops to calculate average grades for a class.
4. **Temperature Converter**: Converting between Celsius, Fahrenheit, and Kelvin using methods and conditional logic.
5. **Basic Inventory System**: Managing product inventory with classes, arrays, and basic CRUD operations.

## Code Examples

### Hello World Program
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Data Types and Operators Example
```java
public class DataTypesExample {
    public static void main(String[] args) {
        // Primitive data types
        int age = 25;
        double salary = 50000.50;
        char grade = 'A';
        boolean isEmployed = true;
        
        // Reference data type
        String name = "John Doe";
        
        // Operators
        int sum = age + 5;
        boolean isAdult = age >= 18;
        
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Sum: " + sum);
        System.out.println("Is Adult: " + isAdult);
    }
}
```

### Control Structures Example
```java
public class ControlStructuresExample {
    public static void main(String[] args) {
        int number = 15;
        
        // If-else
        if (number > 10) {
            System.out.println("Number is greater than 10");
        } else {
            System.out.println("Number is 10 or less");
        }
        
        // Switch
        switch (number % 2) {
            case 0:
                System.out.println("Even number");
                break;
            case 1:
                System.out.println("Odd number");
                break;
        }
        
        // For loop
        System.out.println("Counting to 5:");
        for (int i = 1; i <= 5; i++) {
            System.out.println(i);
        }
    }
}
```

### Class and Object Example
```java
public class Person {
    String name;
    int age;
    
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

## Common Pitfalls & Edge Cases

1. **Integer Overflow:** Be careful with large numbers that exceed the range of `int` or `long`.
2. **Division by Zero:** Always check for zero before division operations.
3. **Array Index Out of Bounds:** Ensure array indices are within valid range.
4. **String Immutability:** Remember that strings are immutable in Java.
5. **Floating-Point Precision:** Be aware of precision issues with `float` and `double` for financial calculations.

## Tools & Libraries

- **JDK (Java Development Kit):** Essential for compiling and running Java programs.
- **IDE:** Eclipse, IntelliJ IDEA, or VS Code for development.
- **Build Tools:** Maven or Gradle for project management and dependency management.
- **JUnit:** For unit testing Java applications.

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)
- [Baeldung Java Tutorials](https://www.baeldung.com/java)
- [GeeksforGeeks Java](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Data Types](../java-data-types/README.md)
- [Java Operators](../java-operators/README.md)
