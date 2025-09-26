---
title: Java Fundamentals
aliases: [Java Basics, Core Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview
Java Fundamentals cover the core concepts and building blocks of the Java programming language, including syntax, data types, control structures, and basic object-oriented principles. These form the foundation for more advanced Java topics and are essential for any Java developer.

## Detailed Explanation
Java is a high-level, object-oriented programming language developed by Sun Microsystems (now Oracle). It follows the "Write Once, Run Anywhere" (WORA) principle through the Java Virtual Machine (JVM).

### Key Concepts
- **Data Types**: Primitive types (int, double, boolean, char) and reference types (objects, arrays)
- **Variables**: Declaration, initialization, and scope
- **Operators**: Arithmetic, relational, logical, assignment, and bitwise operators
- **Control Structures**: if-else, switch, loops (for, while, do-while)
- **Methods**: Declaration, parameters, return types, and method overloading
- **Classes and Objects**: Basic OOP concepts like encapsulation, inheritance, and polymorphism

### JVM Architecture Basics
Java code is compiled to bytecode, which runs on the JVM. The JVM provides platform independence and memory management through garbage collection.

## Real-world Examples & Use Cases
- **Web Applications**: Building servlets and JSPs for dynamic web content
- **Mobile Apps**: Android development using Java (though Kotlin is gaining popularity)
- **Enterprise Software**: Large-scale applications using frameworks like Spring
- **Embedded Systems**: Java ME for resource-constrained devices

## Code Examples

### Basic Hello World
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Data Types and Variables
```java
public class DataTypesExample {
    public static void main(String[] args) {
        // Primitive types
        int age = 25;
        double salary = 50000.50;
        boolean isEmployed = true;
        char grade = 'A';
        
        // Reference type
        String name = "John Doe";
        
        System.out.println("Name: " + name + ", Age: " + age);
    }
}
```

### Control Structures
```java
public class ControlStructures {
    public static void main(String[] args) {
        int number = 10;
        
        // If-else
        if (number > 0) {
            System.out.println("Positive number");
        } else if (number < 0) {
            System.out.println("Negative number");
        } else {
            System.out.println("Zero");
        }
        
        // For loop
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
        
        // Switch
        switch (number) {
            case 1:
                System.out.println("One");
                break;
            case 10:
                System.out.println("Ten");
                break;
            default:
                System.out.println("Other");
        }
    }
}
```

### Simple Class and Object
```java
public class Person {
    private String name;
    private int age;
    
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    public void displayInfo() {
        System.out.println("Name: " + name + ", Age: " + age);
    }
    
    public static void main(String[] args) {
        Person person = new Person("Alice", 30);
        person.displayInfo();
    }
}
```

## Common Pitfalls & Edge Cases
- Forgetting to initialize variables before use
- Using == for string comparison instead of .equals()
- Not handling null pointer exceptions
- Misunderstanding integer overflow
- Confusing pass-by-value for objects (references are passed by value)

## References
- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se17/html/index.html)
- "Java: A Beginner's Guide" by Herbert Schildt

## Github-README Links & Related Topics
- [java-language-basics](../java/java-language-basics/)
- [oop-principles-in-java](../oop-principles-in-java/)
- [java-data-types](../java-data-types/)
