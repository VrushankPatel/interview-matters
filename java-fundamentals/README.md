---
title: Java Fundamentals
aliases: [Java Basics, Java Language Basics]
tags: [#java,#fundamentals,#oop]
created: 2025-09-26
updated: 2025-09-26
---

# Java Fundamentals

## Overview

Java Fundamentals cover the core concepts of the Java programming language, including syntax, object-oriented programming (OOP) principles, data types, control structures, and the Java Virtual Machine (JVM). Mastering these basics is essential for building robust Java applications.

## Detailed Explanation

### Basic Syntax

Java programs consist of classes with a main method as entry point.

```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

### Data Types

- **Primitive**: int, double, boolean, char.
- **Reference**: Objects, arrays, strings.

### OOP Principles

- **Encapsulation**: Bundling data and methods.
- **Inheritance**: Extending classes.
- **Polymorphism**: Method overriding/overloading.
- **Abstraction**: Interfaces and abstract classes.

### JVM and JRE

- **JVM**: Executes bytecode.
- **JRE**: Runtime environment including JVM and libraries.
- **JDK**: Development kit with JRE and tools.

## Real-world Examples & Use Cases

- **Web Applications**: Using servlets and JSP.
- **Android Apps**: Core language for Android development.
- **Enterprise Software**: Frameworks like Spring.

## Code Examples

### OOP Example

```java
class Animal {
    void sound() {
        System.out.println("Animal sound");
    }
}

class Dog extends Animal {
    void sound() {
        System.out.println("Bark");
    }
}

public class Main {
    public static void main(String[] args) {
        Animal a = new Dog();
        a.sound(); // Polymorphism
    }
}
```

### Collections

```java
import java.util.*;

public class CollectionsExample {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("Java");
        list.add("Fundamentals");
        for (String s : list) {
            System.out.println(s);
        }
    }
}
```

## Common Pitfalls & Edge Cases

- **Null Pointer Exceptions**: Always check for null.
- **Memory Leaks**: Improper object references.
- **Type Casting**: ClassCastException risks.

## Tools & Libraries

- **JDK**: Oracle JDK or OpenJDK.
- **IDEs**: IntelliJ IDEA, Eclipse.

## References

- [Oracle Java Tutorials](https://docs.oracle.com/javase/tutorial/)
- [Java Fundamentals on GeeksforGeeks](https://www.geeksforgeeks.org/java/)

## Github-README Links & Related Topics

- [OOP Principles in Java](../oop-principles-in-java/)
- [JVM Internals & Class Loading](../jvm-internals-class-loading/)
- [Java Collections](../java-collections/)
