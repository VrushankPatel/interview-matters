---
title: Java Fundamentals
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals encompass the core building blocks of the Java programming language, including data types, variables, operators, control structures, classes, objects, and essential object-oriented programming (OOP) concepts. Mastering these fundamentals is crucial for developing robust, maintainable Java applications and serves as the foundation for advanced topics like concurrency, collections, and JVM internals.

## Detailed Explanation

### Data Types

Java supports two main categories of data types: primitive types, which are built-in and store simple values, and reference types, which refer to objects or arrays.

#### Primitive Data Types

| Type    | Size    | Range/Default | Description |
|---------|---------|---------------|-------------|
| `byte`  | 8 bits  | -128 to 127  | Small integer values |
| `short` | 16 bits | -32,768 to 32,767 | Medium integer values |
| `int`   | 32 bits | -2^31 to 2^31-1 | Standard integer |
| `long`  | 64 bits | -2^63 to 2^63-1 | Large integer |
| `float` | 32 bits | ~6-7 decimal digits | Single-precision floating point |
| `double`| 64 bits | ~15 decimal digits | Double-precision floating point |
| `char`  | 16 bits | 0 to 65,535 (Unicode) | Single character |
| `boolean`| 1 bit  | true/false | Logical values |

#### Reference Types

Reference types include classes, interfaces, arrays, and enums. They store references to objects rather than the actual data.

### Variables

Variables are named storage locations for data. In Java, variables must be declared with a specific type before use. Java supports instance variables, class variables (static), local variables, and parameters.

```java
// Instance variable
private int age;

// Class variable
public static final String COMPANY_NAME = "Example Corp";

// Local variable
public void method() {
    int localVar = 10;
}
```

### Operators

Java provides various operators for performing operations on variables and values.

#### Arithmetic Operators
- `+` (addition), `-` (subtraction), `*` (multiplication), `/` (division), `%` (modulo)

#### Comparison Operators
- `==` (equal), `!=` (not equal), `<` (less than), `>` (greater than), `<=` (less or equal), `>=` (greater or equal)

#### Logical Operators
- `&&` (AND), `||` (OR), `!` (NOT)

#### Assignment Operators
- `=`, `+=`, `-=`, `*=`, `/=`, `%=`

#### Increment/Decrement Operators
- `++`, `--`

### Control Structures

Control structures direct the flow of program execution based on conditions or loops.

#### Conditional Statements

```java
if (condition) {
    // execute if true
} else if (anotherCondition) {
    // execute if first false, second true
} else {
    // execute if all false
}
```

#### Switch Statement

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

#### Loops

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

### Classes and Objects

Classes are blueprints for creating objects, encapsulating data (fields) and behavior (methods). Objects are instances of classes.

#### Class Definition

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

    public void setAge(int age) {
        this.age = age;
    }

    // Static method
    public static Person createDefault() {
        return new Person("Default", 0);
    }
}
```

#### Object Creation and Usage

```java
Person person = new Person("Alice", 30);
System.out.println(person.getName()); // Alice
person.setAge(31);
Person defaultPerson = Person.createDefault();
```

#### Inheritance and Polymorphism

Java supports inheritance, allowing classes to inherit properties from parent classes.

```java
public class Employee extends Person {
    private String department;

    public Employee(String name, int age, String department) {
        super(name, age);
        this.department = department;
    }

    @Override
    public String getName() {
        return super.getName() + " (" + department + ")";
    }
}
```

### Packages and Access Modifiers

Packages organize classes into namespaces. Access modifiers control visibility: `public`, `protected`, `private`, and package-private (default).

```java
package com.example;

public class ExampleClass {
    public int publicField;
    private int privateField;
    protected int protectedField;
    int packageField; // package-private
}
```

### Arrays

Arrays are fixed-size containers for storing multiple values of the same type.

```java
// Declaration and initialization
int[] numbers = new int[5];
int[] primes = {2, 3, 5, 7, 11};

// Multi-dimensional arrays
int[][] matrix = new int[3][3];
```

### Methods

Methods define behaviors of classes. They can have parameters and return values.

```java
public int calculateSum(int a, int b) {
    return a + b;
}

public void printMessage(String message) {
    System.out.println(message);
}
```

### Exception Handling

Java uses try-catch blocks for handling runtime errors.

```java
try {
    // risky code
    int result = 10 / 0;
} catch (ArithmeticException e) {
    System.out.println("Division by zero: " + e.getMessage());
} finally {
    // always executed
}
```

## Real-world Examples & Use Cases

### Banking Application
A banking system uses classes to represent accounts, with methods for deposits, withdrawals, and balance checks. Control structures validate transactions, while primitive types handle monetary values.

### E-commerce Platform
Product catalogs use arrays or collections of objects, with conditional logic for pricing, discounts, and inventory management. Inheritance models different product types (electronics, clothing).

### Data Processing Pipeline
Loops iterate through large datasets, operators perform calculations, and exception handling manages file I/O errors or network timeouts.

### Game Development
Game entities as objects with state (position, health) and behavior (move, attack). Control structures manage game loops and AI decision-making.

## Code Examples

### Hello World Program

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Simple Calculator with User Input

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
                System.out.println("Invalid operator");
                return;
        }
        
        System.out.println("Result: " + result);
        scanner.close();
    }
}
```

### Student Grade Management System

```java
public class Student {
    private String name;
    private int[] grades;
    
    public Student(String name, int[] grades) {
        this.name = name;
        this.grades = grades;
    }
    
    public double getAverageGrade() {
        int sum = 0;
        for (int grade : grades) {
            sum += grade;
        }
        return (double) sum / grades.length;
    }
    
    public char getLetterGrade() {
        double avg = getAverageGrade();
        if (avg >= 90) return 'A';
        else if (avg >= 80) return 'B';
        else if (avg >= 70) return 'C';
        else if (avg >= 60) return 'D';
        else return 'F';
    }
    
    public static void main(String[] args) {
        int[] grades = {85, 92, 78, 96, 88};
        Student student = new Student("Alice Johnson", grades);
        
        System.out.println("Student: " + student.name);
        System.out.println("Average Grade: " + student.getAverageGrade());
        System.out.println("Letter Grade: " + student.getLetterGrade());
    }
}
```

### Library Book Management

```java
import java.util.ArrayList;
import java.util.List;

public class Book {
    private String title;
    private String author;
    private boolean isAvailable;
    
    public Book(String title, String author) {
        this.title = title;
        this.author = author;
        this.isAvailable = true;
    }
    
    public void borrow() {
        if (isAvailable) {
            isAvailable = false;
            System.out.println("Book borrowed: " + title);
        } else {
            System.out.println("Book not available: " + title);
        }
    }
    
    public void returnBook() {
        isAvailable = true;
        System.out.println("Book returned: " + title);
    }
    
    public String getInfo() {
        return title + " by " + author + " (" + (isAvailable ? "Available" : "Borrowed") + ")";
    }
}

class Library {
    private List<Book> books = new ArrayList<>();
    
    public void addBook(Book book) {
        books.add(book);
    }
    
    public void listBooks() {
        for (Book book : books) {
            System.out.println(book.getInfo());
        }
    }
    
    public static void main(String[] args) {
        Library library = new Library();
        
        Book book1 = new Book("1984", "George Orwell");
        Book book2 = new Book("To Kill a Mockingbird", "Harper Lee");
        
        library.addBook(book1);
        library.addBook(book2);
        
        library.listBooks();
        
        book1.borrow();
        library.listBooks();
        
        book1.returnBook();
        library.listBooks();
    }
}
```

## References

- [Oracle Java SE Documentation](https://docs.oracle.com/en/java/javase/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)
- [Head First Java](https://www.amazon.com/Head-First-Java-Kathy-Sierra/dp/0596009208)
- [Baeldung Java Tutorials](https://www.baeldung.com/java)

## Github-README Links & Related Topics

- [Java OOP Principles](../java-oop-principles/README.md)
- [Java Collections](../java-collections/README.md)
- [Java Exception Handling](../java-exception-handling/README.md)
- [JVM Internals and Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Multithreading and Concurrency](../java-multithreading-and-concurrency/README.md)
- [Java Design Patterns](../java-design-patterns/README.md)
