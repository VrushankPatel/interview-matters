---
title: Java Fundamentals
aliases: [Java Basics]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Java Fundamentals encompass the core concepts and syntax of the Java programming language, including data types, variables, operators, control structures, and basic object-oriented programming principles. These form the foundation for building robust Java applications.

# Detailed Explanation

Java is a statically-typed, object-oriented language that runs on the Java Virtual Machine (JVM), enabling "write once, run anywhere" portability. Key elements include:

- **Data Types**: Primitive types (int, double, boolean, char) and reference types (objects, arrays).
- **Variables**: Declaration, initialization, and scope.
- **Operators**: Arithmetic, relational, logical, and assignment operators.
- **Control Structures**: Conditional statements (if-else, switch) and loops (for, while, do-while).

```mermaid
flowchart TD
    A[Start] --> B{Condition}
    B -->|True| C[Execute if block]
    B -->|False| D[Execute else block]
    C --> E[End]
    D --> E
```

- **Methods**: Function definitions with parameters and return types.
- **Classes and Objects**: Blueprint for objects, instantiation, and basic inheritance.

### Primitive Data Types

| Type | Size | Default Value | Range |
|------|------|---------------|-------|
| byte | 1 byte | 0 | -128 to 127 |
| short | 2 bytes | 0 | -32,768 to 32,767 |
| int | 4 bytes | 0 | -2,147,483,648 to 2,147,483,647 |
| long | 8 bytes | 0L | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |
| float | 4 bytes | 0.0f | Approximately ±3.40282347E+38F |
| double | 8 bytes | 0.0d | Approximately ±1.79769313486231570E+308 |
| char | 2 bytes | '\u0000' | 0 to 65,535 |
| boolean | 1 bit | false | true or false |

Java emphasizes strong typing, exception handling, and memory management through garbage collection.

# Real-world Examples & Use Cases

- **Enterprise Applications**: Building backend services for banking systems.
- **Android Development**: Core language for mobile app development.
- **Web Applications**: Server-side logic using frameworks like Spring.
- **Embedded Systems**: Lightweight applications on constrained devices.

Example: A simple banking application that manages account balances and transactions.

# Code Examples

Basic Hello World program:

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

Variable declaration and operations:

```java
public class VariablesExample {
    public static void main(String[] args) {
        int age = 25;
        double salary = 50000.50;
        String name = "John Doe";
        
        System.out.println("Name: " + name + ", Age: " + age + ", Salary: " + salary);
    }
}
```

Control structure example:

```java
public class ControlExample {
    public static void main(String[] args) {
        int number = 10;
        if (number > 5) {
            System.out.println("Number is greater than 5");
        } else {
            System.out.println("Number is 5 or less");
        }
        
        for (int i = 0; i < 5; i++) {
            System.out.println("Iteration: " + i);
        }
    }
}
```

Method example:

```java
public class MethodExample {
    public static void main(String[] args) {
        int result = add(5, 3);
        System.out.println("Sum: " + result);
    }
    
    public static int add(int a, int b) {
        return a + b;
    }
}
```

Class and object example:

```java
public class Person {
    String name;
    int age;
    
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    public void display() {
        System.out.println("Name: " + name + ", Age: " + age);
    }
}

public class ClassExample {
    public static void main(String[] args) {
        Person p = new Person("Alice", 30);
        p.display();
    }
}
```

# References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Language Specification](https://docs.oracle.com/javase/specs/jls/se21/html/index.html)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)
- [Head First Java](https://www.amazon.com/Head-First-Java-Kathy-Sierra/dp/0596009208)

# Common Pitfalls & Edge Cases

- **Uninitialized Variables**: Local variables must be initialized before use, or compilation fails.
- **Integer Division**: Division of integers truncates the decimal part; use floating-point for precision.
- **String Comparison**: Use `.equals()` for content comparison, not `==` which checks reference equality.
- **Array Bounds**: Accessing indices outside array length throws `ArrayIndexOutOfBoundsException`.
- **Null Pointer Exceptions**: Dereferencing null objects causes runtime errors.

# Tools & Libraries

- **JDK (Java Development Kit)**: Essential for compiling and running Java programs.
- **IDEs**: IntelliJ IDEA, Eclipse, NetBeans for development.
- **Build Tools**: Maven and Gradle for dependency management and project building.

# Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/)
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/)
- [Collections & Data Structures](../collections-and-data-structures/)