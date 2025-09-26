---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals encompass the essential building blocks of the Java programming language, including syntax, data types, control structures, methods, and basic object-oriented concepts. Mastering these fundamentals is crucial for developing robust Java applications.

## Detailed Explanation

### Data Types

Java supports two main categories of data types: primitive types and reference types.

#### Primitive Data Types

| Type | Size | Range | Default Value | Example |
|------|------|-------|---------------|---------|
| byte | 8 bits | -128 to 127 | 0 | `byte b = 100;` |
| short | 16 bits | -32,768 to 32,767 | 0 | `short s = 1000;` |
| int | 32 bits | -2^31 to 2^31-1 | 0 | `int i = 100000;` |
| long | 64 bits | -2^63 to 2^63-1 | 0L | `long l = 100000L;` |
| float | 32 bits | ~ -3.4e38 to 3.4e38 | 0.0f | `float f = 3.14f;` |
| double | 64 bits | ~ -1.7e308 to 1.7e308 | 0.0d | `double d = 3.14159;` |
| char | 16 bits | 0 to 65,535 | '\u0000' | `char c = 'A';` |
| boolean | 1 bit | true or false | false | `boolean flag = true;` |

#### Reference Data Types

Reference types include classes, interfaces, arrays, and enums. They store references to objects in memory rather than the actual data.

### Variables and Constants

Variables are declared with a data type followed by an identifier:

```java
int age = 25;
String name = "John";
double salary = 50000.0;
```

Constants are declared using the `final` keyword and must be initialized at declaration:

```java
final double PI = 3.14159;
final int MAX_USERS = 100;
```

### Operators

Java provides various operators categorized as follows:

- **Arithmetic Operators**: +, -, *, /, %
- **Relational Operators**: ==, !=, <, >, <=, >=
- **Logical Operators**: &&, ||, !
- **Assignment Operators**: =, +=, -=, *=, /=, %=
- **Increment/Decrement Operators**: ++, --
- **Bitwise Operators**: &, |, ^, ~, <<, >>

### Control Structures

#### Conditional Statements

```java
if (condition) {
    // code block
} else if (anotherCondition) {
    // code block
} else {
    // code block
}
```

```java
switch (expression) {
    case value1:
        // code block
        break;
    case value2:
        // code block
        break;
    default:
        // code block
}
```

#### Loops

```java
// For loop
for (int i = 0; i < 10; i++) {
    System.out.println(i);
}

// While loop
while (condition) {
    // code block
}

// Do-while loop
do {
    // code block
} while (condition);
```

### Methods

Methods are functions defined within classes that perform specific tasks:

```java
public int add(int a, int b) {
    return a + b;
}

public void printMessage(String message) {
    System.out.println(message);
}
```

### Classes and Objects

Classes are blueprints for creating objects:

```java
public class Person {
    // Fields
    private String name;
    private int age;
    
    // Constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    // Methods
    public String getName() {
        return name;
    }
    
    public int getAge() {
        return age;
    }
    
    public void setAge(int age) {
        this.age = age;
    }
}
```

Objects are instances of classes:

```java
Person person = new Person("Alice", 30);
System.out.println(person.getName()); // Output: Alice
```

## Real-world Examples & Use Cases

1. **E-commerce Application**: Using classes and objects to model products, customers, and orders.

2. **Banking System**: Implementing methods for deposit, withdrawal, and balance inquiry operations.

3. **Student Management System**: Utilizing arrays and loops to manage student records and calculate grades.

4. **Weather Monitoring Application**: Using data types and operators to process temperature readings and generate reports.

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
public class Calculator {
    public static void main(String[] args) {
        int a = 10;
        int b = 5;
        
        System.out.println("Addition: " + (a + b));
        System.out.println("Subtraction: " + (a - b));
        System.out.println("Multiplication: " + (a * b));
        System.out.println("Division: " + (a / b));
    }
}
```

### Person Class with Encapsulation

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
    
    public int getAge() {
        return age;
    }
    
    public void setAge(int age) {
        if (age > 0) {
            this.age = age;
        }
    }
    
    public static void main(String[] args) {
        Person person = new Person("Bob", 25);
        System.out.println("Name: " + person.getName());
        System.out.println("Age: " + person.getAge());
        person.setAge(26);
        System.out.println("Updated Age: " + person.getAge());
    }
}
```

### Array Operations

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

## Common Pitfalls & Edge Cases

1. **Integer Overflow**: Be cautious with large numbers that exceed the range of int or long types.

2. **Floating-Point Precision**: Double and float may not represent decimal numbers exactly due to binary representation.

3. **Null Pointer Exceptions**: Always check for null before accessing reference type variables.

4. **Array Index Out of Bounds**: Ensure array indices are within valid range before accessing elements.

5. **Case Sensitivity**: Java is case-sensitive, so `myVariable` and `myvariable` are different.

## Tools & Libraries

- **JDK (Java Development Kit)**: Essential for compiling and running Java programs.
- **IDE**: Eclipse, IntelliJ IDEA, or VS Code for development.
- **Build Tools**: Maven or Gradle for project management and dependency handling.

## References

- [Oracle Java Tutorials - Language Basics](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)
- [Java Data Types - GeeksforGeeks](https://www.geeksforgeeks.org/data-types-in-java/)
- [Java Operators - W3Schools](https://www.w3schools.com/java/java_operators.asp)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)

## Github-README Links & Related Topics

- [OOP Principles in Java](./oop-principles-in-java/README.md)
- [JVM Internals & Class Loading](./jvm-internals-and-class-loading/README.md)
- [Java Design Patterns](./java-design-patterns/README.md)
- [Java Exception Handling](./java-exception-handling/README.md)
- [Collections & Data Structures](./collections-and-data-structures/README.md)