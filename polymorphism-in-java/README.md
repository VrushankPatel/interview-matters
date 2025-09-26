---
title: Polymorphism in Java
aliases: []
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# Polymorphism in Java

## Overview
Polymorphism is an OOP principle that allows objects of different classes to be treated as objects of a common superclass. It enables a single interface to represent different underlying forms (data types), promoting flexibility and extensibility in code.

## Detailed Explanation
Java supports two types of polymorphism:
- **Compile-time Polymorphism (Static)**: Achieved through method overloading, where multiple methods with the same name but different parameters are defined.
- **Runtime Polymorphism (Dynamic)**: Achieved through method overriding, where a subclass provides a specific implementation of a method defined in its superclass.

Polymorphism is facilitated by inheritance and interfaces, allowing for dynamic method dispatch.

### Key Concepts
- **Method Overloading**: Same method name, different signatures.
- **Method Overriding**: Subclass redefines superclass method.
- **Upcasting**: Treating subclass object as superclass type.

## Real-world Examples & Use Cases
- **Shape Drawing**: A `draw()` method in a `Shape` superclass is overridden in `Circle`, `Rectangle`, etc.
- **Payment Processing**: A `processPayment()` method in `Payment` interface implemented by `CreditCardPayment`, `PayPalPayment`.
- **Animal Sounds**: An `Animal` class with `makeSound()` overridden in `Dog`, `Cat`.

## Code Examples
```java
// Method Overloading (Compile-time)
public class Calculator {
    public int add(int a, int b) {
        return a + b;
    }
    
    public double add(double a, double b) {
        return a + b;
    }
}

// Method Overriding (Runtime)
public class Animal {
    public void makeSound() {
        System.out.println("Animal sound");
    }
}

public class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Woof");
    }
}
```

## References
- [Oracle Java Documentation: Polymorphism](https://docs.oracle.com/javase/tutorial/java/IandI/polymorphism.html)
- [GeeksforGeeks: Polymorphism in Java](https://www.geeksforgeeks.org/polymorphism-in-java/)

## Github-README Links & Related Topics
- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [Inheritance in Java](../inheritance-in-java/README.md)
- [Interfaces in Java](../interfaces-in-java/README.md)