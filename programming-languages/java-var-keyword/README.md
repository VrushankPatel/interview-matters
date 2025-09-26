---
title: Java Var Keyword
aliases: [Local Variable Type Inference in Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

The `var` keyword in Java, introduced in Java 10, enables local-variable type inference. It allows developers to declare local variables without explicitly specifying their types, reducing boilerplate code while maintaining static type safety.

# Detailed Explanation

`var` is a reserved type name, not a keyword, allowing the compiler to infer the type from the initializer expression. It applies to:

- Local variables with initializers
- Enhanced for-loop indexes
- Traditional for-loop variables

Restrictions include no initializers, multiple variables, or null initializers. Non-denotable types like anonymous classes are allowed, but capture variables are projected to supertypes.

# Real-world Examples & Use Cases

- Simplifying generic type declarations: `var list = new ArrayList<String>();`
- Stream operations: `var stream = list.stream();`
- Reducing verbosity in complex expressions.

# Code Examples

```java
import java.util.ArrayList;
import java.util.List;

public class VarExample {
    public static void main(String[] args) {
        // Basic usage
        var list = new ArrayList<String>(); // infers ArrayList<String>
        list.add("Hello");
        list.add("World");

        // With streams
        var stream = list.stream(); // infers Stream<String>
        var count = stream.count(); // infers long

        // In loops
        for (var item : list) { // infers String
            System.out.println(item);
        }

        // Traditional for-loop
        for (var i = 0; i < list.size(); i++) { // infers int
            System.out.println(list.get(i));
        }
    }
}
```

# References

- [JEP 286: Local-Variable Type Inference](https://openjdk.org/jeps/286)

# Github-README Links & Related Topics

- [Java Generics](java-generics/README.md)
- [Java Stream API and Functional Programming](java-stream-api-and-functional-programming/README.md)