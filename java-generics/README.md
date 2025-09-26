---
title: Java Generics
aliases: []
tags: ["#java"]
created: 2025-09-26
updated: 2025-09-26
---

# Java Generics

## Overview

Java Generics provide a way to create classes, interfaces, and methods that operate on types specified by the user at compile time. They enable type safety, eliminate casting, and promote code reusability by allowing algorithms to be written in a type-agnostic manner.

## Detailed Explanation

### Type Parameters

- **Generic Classes**: Classes that take type parameters (e.g., `List<T>`).
- **Generic Interfaces**: Interfaces with type parameters.
- **Generic Methods**: Methods with their own type parameters.
- **Type Bounds**: Restrict type parameters using `extends` or `super`.

### Wildcards

- **Unbounded Wildcard**: `?` - represents any type.
- **Upper Bounded Wildcard**: `? extends T` - represents T or its subtypes.
- **Lower Bounded Wildcard**: `? super T` - represents T or its supertypes.

### Type Erasure

- **Compile-time Check**: Generics are checked at compile time.
- **Runtime Behavior**: Type information is erased at runtime (type erasure).
- **Bridge Methods**: Compiler-generated methods to maintain polymorphism.

### Benefits

- **Type Safety**: Prevents ClassCastException at runtime.
- **Code Reusability**: Write generic algorithms that work with multiple types.
- **Performance**: No runtime overhead due to type erasure.

## Real-world Examples & Use Cases

- **Collections Framework**: ArrayList, HashMap, etc., use generics for type-safe storage.
- **Custom Containers**: Generic classes for reusable data structures.
- **Algorithms**: Generic methods for sorting, filtering, or transforming data.
- **API Design**: Generic interfaces for flexible, type-safe APIs.
- **Builder Patterns**: Type-safe builders using generics for method chaining.

## Code Examples

### Generic Class

```java
public class Box<T> {
    private T item;

    public void setItem(T item) {
        this.item = item;
    }

    public T getItem() {
        return item;
    }

    public static void main(String[] args) {
        Box<String> stringBox = new Box<>();
        stringBox.setItem("Hello Generics!");
        System.out.println(stringBox.getItem());

        Box<Integer> intBox = new Box<>();
        intBox.setItem(42);
        System.out.println(intBox.getItem());
    }
}
```

### Generic Method

```java
public class Utils {
    public static <T> T getFirst(List<T> list) {
        if (list.isEmpty()) throw new IllegalArgumentException("List is empty");
        return list.get(0);
    }

    public static <T extends Comparable<T>> T findMax(T[] array) {
        if (array == null || array.length == 0) {
            return null;
        }
        T max = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i].compareTo(max) > 0) {
                max = array[i];
            }
        }
        return max;
    }

    public static void main(String[] args) {
        List<Integer> numbers = Arrays.asList(1, 2, 3);
        Integer first = Utils.getFirst(numbers);
        System.out.println("First: " + first);

        Integer[] intArray = {1, 3, 2, 5, 4};
        Integer max = Utils.findMax(intArray);
        System.out.println("Max: " + max);
    }
}
```

### Wildcards Example

```java
import java.util.*;

public class WildcardExample {
    public static void printList(List<?> list) {
        for (Object item : list) {
            System.out.print(item + " ");
        }
        System.out.println();
    }

    public static void addNumbers(List<? super Integer> list) {
        for (int i = 1; i <= 5; i++) {
            list.add(i);
        }
    }

    public static double sumOfList(List<? extends Number> list) {
        double sum = 0.0;
        for (Number number : list) {
            sum += number.doubleValue();
        }
        return sum;
    }

    public static void main(String[] args) {
        List<Integer> intList = new ArrayList<>();
        List<Double> doubleList = new ArrayList<>();
        List<String> stringList = Arrays.asList("a", "b", "c");

        printList(intList);
        printList(doubleList);
        printList(stringList);

        doubleList.add(1.5);
        doubleList.add(2.7);
        System.out.println("Sum: " + sumOfList(doubleList));

        List<Number> numberList = new ArrayList<>();
        addNumbers(numberList);
        System.out.println("Numbers: " + numberList);
    }
}
```

## References

- [Oracle Java Generics Tutorial](https://docs.oracle.com/javase/tutorial/java/generics/)
- [Java Generics FAQs](https://docs.oracle.com/javase/tutorial/java/generics/FAQ.html)
- [Effective Java: Generics - Joshua Bloch](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)

## Github-README Links & Related Topics

- [Java Collections](java-collections/README.md)
- [Java Annotations and Reflection](java-annotations-and-reflection/README.md)
- [Collections and Data Structures](collections-and-data-structures/README.md)