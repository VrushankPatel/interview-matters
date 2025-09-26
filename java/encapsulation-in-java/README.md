---
title: Encapsulation in Java
aliases: []
tags: [#java, #oop]
created: 2025-09-26
updated: 2025-09-26
---

# Encapsulation in Java

## Overview
Encapsulation is a fundamental object-oriented programming (OOP) principle that involves bundling data (fields) and methods that operate on that data within a single unit, typically a class. It restricts direct access to the internal state of an object, promoting data hiding and controlled access through public methods.

## Detailed Explanation
In Java, encapsulation is achieved by:
- Declaring fields as `private` to prevent direct access from outside the class.
- Providing public getter and setter methods to access and modify the private fields.
- Using access modifiers (`private`, `protected`, `public`) to control visibility.

This helps in maintaining the integrity of the data and allows for changes in implementation without affecting external code.

### Key Concepts
- **Data Hiding**: Internal state is hidden from external classes.
- **Access Control**: Controlled access via methods.
- **Modularity**: Changes to internal implementation don't affect users of the class.

## Real-world Examples & Use Cases
- **Bank Account**: A bank account class encapsulates balance and provides methods like `deposit()` and `withdraw()` to modify it safely.
- **Employee Records**: An employee class hides sensitive data like salary and provides controlled access.
- **Device Controllers**: Hardware interfaces encapsulate low-level operations behind high-level APIs.

## Code Examples
```java
public class BankAccount {
    private double balance;

    public BankAccount(double initialBalance) {
        this.balance = initialBalance;
    }

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
        }
    }
}
```

## References
- [Oracle Java Documentation: Encapsulation](https://docs.oracle.com/javase/tutorial/java/concepts/)
- [GeeksforGeeks: Encapsulation in Java](https://www.geeksforgeeks.org/encapsulation-in-java/)

## Github-README Links & Related Topics
- [OOP Principles in Java](../oop-principles-in-java/README.md)
- [Abstraction in Java](../abstraction-in-java/README.md)
- [Polymorphism in Java](../polymorphism-in-java/README.md)