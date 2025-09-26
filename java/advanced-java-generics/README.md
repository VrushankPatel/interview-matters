---
title: Advanced Java Generics
aliases: [Java Generics Advanced, Generic Types in Java]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Advanced Java Generics

## Overview

Java Generics provide a way to create classes, interfaces, and methods that operate on types specified by the user at compile time, ensuring type safety and reducing the need for casting.

## Detailed Explanation

Generics use type parameters, denoted by angle brackets <>. Key concepts include:

- **Type Parameters**: E.g., <T>
- **Bounded Types**: <T extends Number>
- **Wildcards**: ? , ? extends T, ? super T
- **Type Erasure**: Generics are erased at runtime to maintain backward compatibility

### Wildcards

- `?` : Unbounded wildcard
- `? extends T` : Upper bounded
- `? super T` : Lower bounded

### Generic Methods

Methods can be generic independently of the class.

## Real-world Examples & Use Cases

- Collections Framework: `List<String>`
- API Design: Generic repositories in Spring Data
- Utility Classes: `Optional<T>`

## Code Examples

### Generic Class

```java
public class Box<T> {
    private T item;

    public void set(T item) { this.item = item; }
    public T get() { return item; }
}
```

### Bounded Types

```java
public class NumberBox<T extends Number> {
    private T number;

    public double getDoubleValue() {
        return number.doubleValue();
    }
}
```

### Wildcards

```java
public void printList(List<?> list) {
    for (Object elem : list) {
        System.out.println(elem);
    }
}

public void addNumbers(List<? super Integer> list) {
    list.add(1);
}
```

### Generic Method

```java
public static <T> void swap(T[] array, int i, int j) {
    T temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}
```

## References

- [Oracle Generics Tutorial](https://docs.oracle.com/javase/tutorial/java/generics/)
- [Effective Java by Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

## Github-README Links & Related Topics

- [Java Generics](../java-generics/README.md)
- [Collections & Data Structures](../collections-and-data-structures/README.md)