---
title: Java Method References
aliases: [Method References in Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Method references in Java provide a shorthand syntax for lambda expressions that call existing methods. Introduced in Java 8, they make code more readable and concise when a lambda expression merely invokes an existing method.

# Detailed Explanation

Method references allow you to refer to methods without executing them. They are used in functional interfaces and are equivalent to lambda expressions that call the referenced method.

There are four kinds of method references:

| Kind | Syntax | Example |
|------|--------|---------|
| Reference to a static method | `ContainingClass::staticMethodName` | `Person::compareByAge` |
| Reference to an instance method of a particular object | `containingObject::instanceMethodName` | `myApp::appendStrings` |
| Reference to an instance method of an arbitrary object of a particular type | `ContainingType::methodName` | `String::compareToIgnoreCase` |
| Reference to a constructor | `ClassName::new` | `HashSet::new` |

# Real-world Examples & Use Cases

- **Sorting Collections**: Use method references to sort arrays or lists by existing comparison methods.
- **Stream Operations**: Apply transformations or filters using method references in streams.
- **Functional Interfaces**: Pass method references to methods expecting functional interfaces like `Comparator`, `Function`, etc.

# Code Examples

```java
import java.util.Arrays;
import java.util.Comparator;

// Person class
public class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() { return name; }
    public int getAge() { return age; }

    public static int compareByAge(Person a, Person b) {
        return Integer.compare(a.age, b.age);
    }

    public static void main(String[] args) {
        Person[] roster = {
            new Person("Alice", 30),
            new Person("Bob", 25),
            new Person("Charlie", 35)
        };

        // Using lambda
        Arrays.sort(roster, (a, b) -> Person.compareByAge(a, b));

        // Using method reference
        Arrays.sort(roster, Person::compareByAge);

        // Instance method reference
        Comparator<Person> byName = Comparator.comparing(Person::getName);
        Arrays.sort(roster, byName);

        // Constructor reference
        java.util.function.Supplier<java.util.List<Person>> listSupplier = java.util.ArrayList::new;
        java.util.List<Person> list = listSupplier.get();
    }
}
```

# References

- [Oracle Java Tutorials: Method References](https://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html)

# Github-README Links & Related Topics

- [Java Lambda Expressions](java-lambda-expressions/README.md)
- [Java Stream API and Functional Programming](java-stream-api-and-functional-programming/README.md)