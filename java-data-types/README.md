---
title: Java Data Types
aliases: [Java Types, Primitive Types]
tags: [#java,#fundamentals]
created: 2025-09-26
updated: 2025-09-26
---

# Java Data Types

## Overview

Java has two categories of data types: primitive and reference. Primitives are basic types stored directly in memory, while references point to objects on the heap.

## Detailed Explanation

### Primitive Data Types

| Type | Size | Range | Default |
|------|------|-------|---------|
| byte | 1 byte | -128 to 127 | 0 |
| short | 2 bytes | -32,768 to 32,767 | 0 |
| int | 4 bytes | -2^31 to 2^31-1 | 0 |
| long | 8 bytes | -2^63 to 2^63-1 | 0L |
| float | 4 bytes | ~ -3.4e38 to 3.4e38 | 0.0f |
| double | 8 bytes | ~ -1.7e308 to 1.7e308 | 0.0d |
| char | 2 bytes | 0 to 65,535 | '\u0000' |
| boolean | 1 bit | true/false | false |

### Reference Types

- Classes, interfaces, arrays, enums.
- Stored on heap, references on stack.

### Autoboxing/Unboxing

Automatic conversion between primitives and wrappers.

```java
Integer boxed = 42; // autoboxing
int primitive = boxed; // unboxing
```

### Wrapper Classes

| Primitive | Wrapper |
|-----------|---------|
| byte | Byte |
| short | Short |
| int | Integer |
| long | Long |
| float | Float |
| double | Double |
| char | Character |
| boolean | Boolean |

## Real-world Examples & Use Cases

- **Counters and Loops**: Use `int` for loop counters and array indices.
- **Timestamps**: Use `long` for milliseconds since epoch.
- **Financial Calculations**: Use `BigDecimal` instead of `float`/`double` for precision.
- **Text Processing**: Use `String` for immutable text, `StringBuilder` for mutable.
- **Collections**: Generics require reference types, so use wrappers for primitives in collections.

## Code Examples

### Primitive Declarations

```java
public class DataTypesExample {
    public static void main(String[] args) {
        // Primitive types
        byte b = 100;
        short s = 1000;
        int i = 100000;
        long l = 1000000000L;
        float f = 3.14f;
        double d = 3.141592653589793;
        char c = 'A';
        boolean bool = true;

        // Reference types
        String str = "Hello World";
        int[] arr = {1, 2, 3};
        Integer boxedInt = i; // Autoboxing

        System.out.println("Primitive int: " + i);
        System.out.println("Boxed Integer: " + boxedInt);
    }
}
```

### Using Wrapper Classes

```java
import java.util.ArrayList;
import java.util.List;

public class WrapperExample {
    public static void main(String[] args) {
        // Primitives can't be used in generics directly
        List<Integer> numbers = new ArrayList<>();
        numbers.add(10); // Autoboxing: int -> Integer
        numbers.add(20);

        int sum = 0;
        for (Integer num : numbers) {
            sum += num; // Unboxing: Integer -> int
        }
        System.out.println("Sum: " + sum);
    }
}
```

### BigDecimal for Precision

```java
import java.math.BigDecimal;

public class BigDecimalExample {
    public static void main(String[] args) {
        double d1 = 0.1;
        double d2 = 0.2;
        System.out.println("Double sum: " + (d1 + d2)); // 0.30000000000000004

        BigDecimal bd1 = new BigDecimal("0.1");
        BigDecimal bd2 = new BigDecimal("0.2");
        BigDecimal sum = bd1.add(bd2);
        System.out.println("BigDecimal sum: " + sum); // 0.3
    }
}
```

## References

- [Oracle Java Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
- [Primitive vs Reference Types](https://www.baeldung.com/java-primitives-vs-objects)
- [Autoboxing and Unboxing](https://docs.oracle.com/javase/tutorial/java/data/autoboxing.html)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Java Generics](../java-generics/README.md)
- [Java Collections](../java-collections/README.md)