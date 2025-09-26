---
title: Java Generics Deep Dive
aliases: [Java Generics]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java Generics Deep Dive

## Overview

Java Generics provide a way to create classes, interfaces, and methods that operate on types specified by the user at compile time. Introduced in Java 5, generics enable type safety, eliminate the need for explicit casting, and allow for reusable code without compromising type checking.

## Detailed Explanation

### Type Parameters

Generics use type parameters, denoted by angle brackets `<T>`, where `T` is a placeholder for the actual type.

- **Unbounded Type Parameters**: `<T>` can be any reference type.
- **Bounded Type Parameters**: `<T extends Number>` restricts `T` to subclasses of `Number`.
- **Multiple Bounds**: `<T extends Comparable & Serializable>` combines interfaces.

### Wildcards

Wildcards (`?`) represent unknown types:

- **Unbounded Wildcard**: `List<?>` - any type.
- **Upper Bounded Wildcard**: `List<? extends Number>` - any subtype of `Number`.
- **Lower Bounded Wildcard**: `List<? super Integer>` - any supertype of `Integer`.

### Type Erasure

At runtime, generics are erased to their raw types. This is done for backward compatibility. For example, `List<String>` becomes `List` at runtime.

### Raw Types

Using generics without type parameters, e.g., `List`, is allowed but not recommended as it bypasses type safety.

### Generic Methods

Methods can be generic independently of the class:

```java
public static <T> void printArray(T[] array) {
    for (T element : array) {
        System.out.println(element);
    }
}
```

### Generic Classes and Interfaces

```java
public class Box<T> {
    private T value;

    public void set(T value) { this.value = value; }
    public T get() { return value; }
}
```

## Real-world Examples & Use Cases

- **Collections Framework**: `ArrayList<String>`, `HashMap<K, V>` ensure type safety.
- **Custom Data Structures**: Generic stacks, queues for any type.
- **API Design**: Libraries like Apache Commons use generics for flexible APIs.
- **Type-Safe Builders**: Builder patterns with generics for fluent interfaces.

## Code Examples

### Basic Generic Class

```java
public class Pair<K, V> {
    private K key;
    private V value;

    public Pair(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public K getKey() { return key; }
    public V getValue() { return value; }
}

Pair<String, Integer> pair = new Pair<>("Age", 30);
```

### Bounded Type Parameters

```java
public class Calculator<T extends Number> {
    public double add(T a, T b) {
        return a.doubleValue() + b.doubleValue();
    }
}

Calculator<Integer> calc = new Calculator<>();
System.out.println(calc.add(5, 10)); // 15.0
```

### Wildcards in Methods

```java
public static void printList(List<?> list) {
    for (Object elem : list) {
        System.out.print(elem + " ");
    }
    System.out.println();
}

List<String> strings = Arrays.asList("a", "b", "c");
printList(strings);
```

### Generic Method with Wildcards

```java
public static <T> void copy(List<? super T> dest, List<? extends T> src) {
    for (int i = 0; i < src.size(); i++) {
        dest.set(i, src.get(i));
    }
}
```

## References

- [Oracle Java Tutorials: Generics](https://docs.oracle.com/javase/tutorial/java/generics/)
- [Effective Java by Joshua Bloch: Chapter on Generics](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)
- [Java Language Specification: Generics](https://docs.oracle.com/javase/specs/jls/se17/html/jls-8.html)

## Github-README Links & Related Topics

- [Java Collections Framework](../java-collections/README.md)
- [Java OOP Principles](../oop-principles-in-java/README.md)
- [Java Design Patterns](../java-design-patterns/README.md)
