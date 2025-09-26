---
title: Java Operators
aliases: [Java Operators Overview]
tags: [#java,#fundamentals]
created: 2025-09-26
updated: 2025-09-26
---

# Java Operators

## Overview

Operators in Java are special symbols that perform operations on variables and values. They are categorized into arithmetic, relational, logical, bitwise, assignment, and others.

## Detailed Explanation

### Arithmetic Operators

| Operator | Description | Example |
|----------|-------------|---------|
| + | Addition | a + b |
| - | Subtraction | a - b |
| * | Multiplication | a * b |
| / | Division | a / b |
| % | Modulo | a % b |
| ++ | Increment | a++ |
| -- | Decrement | a-- |

### Relational Operators

| Operator | Description | Example |
|----------|-------------|---------|
| == | Equal to | a == b |
| != | Not equal to | a != b |
| > | Greater than | a > b |
| < | Less than | a < b |
| >= | Greater than or equal | a >= b |
| <= | Less than or equal | a <= b |

### Logical Operators

| Operator | Description | Example |
|----------|-------------|---------|
| && | Logical AND | a && b |
| \|\| | Logical OR | a \|\| b |
| ! | Logical NOT | !a |

### Bitwise Operators

| Operator | Description | Example |
|----------|-------------|---------|
| & | Bitwise AND | a & b |
| \| | Bitwise OR | a \| b |
| ^ | Bitwise XOR | a ^ b |
| ~ | Bitwise NOT | ~a |
| << | Left shift | a << 2 |
| >> | Right shift | a >> 2 |
| >>> | Unsigned right shift | a >>> 2 |

### Assignment Operators

| Operator | Description | Example |
|----------|-------------|---------|
| = | Simple assignment | a = b |
| += | Add and assign | a += b |
| -= | Subtract and assign | a -= b |
| *= | Multiply and assign | a *= b |
| /= | Divide and assign | a /= b |
| %= | Modulo and assign | a %= b |
| &= | Bitwise AND assign | a &= b |
| \|= | Bitwise OR assign | a \|= b |
| ^= | Bitwise XOR assign | a ^= b |
| <<= | Left shift assign | a <<= 2 |
| >>= | Right shift assign | a >>= 2 |
| >>>= | Unsigned right shift assign | a >>>= 2 |

### Ternary Operator

`condition ? value_if_true : value_if_false`

### instanceof Operator

Checks if an object is an instance of a class.

## Real-world Examples & Use Cases

- **Arithmetic**: Calculating totals, averages in financial apps.
- **Relational**: Comparing values in sorting algorithms.
- **Logical**: Combining conditions in if statements.
- **Bitwise**: Low-level operations in networking, cryptography.
- **Assignment**: Updating variables efficiently.

## Code Examples

### Arithmetic and Assignment

```java
public class ArithmeticExample {
    public static void main(String[] args) {
        int a = 10, b = 3;
        System.out.println("Addition: " + (a + b)); // 13
        System.out.println("Division: " + (a / b)); // 3
        System.out.println("Modulo: " + (a % b)); // 1

        a += 5; // a = a + 5
        System.out.println("After += : " + a); // 15
    }
}
```

### Logical Operators

```java
public class LogicalExample {
    public static void main(String[] args) {
        boolean x = true, y = false;
        System.out.println("x && y: " + (x && y)); // false
        System.out.println("x || y: " + (x || y)); // true
        System.out.println("!x: " + (!x)); // false

        int age = 25;
        boolean isAdult = age >= 18 && age <= 65;
        System.out.println("Is adult: " + isAdult); // true
    }
}
```

### Bitwise Operations

```java
public class BitwiseExample {
    public static void main(String[] args) {
        int a = 60; // 0011 1100
        int b = 13; // 0000 1101
        System.out.println("a & b: " + (a & b)); // 12 (0000 1100)
        System.out.println("a | b: " + (a | b)); // 61 (0011 1101)
        System.out.println("a ^ b: " + (a ^ b)); // 49 (0011 0001)
        System.out.println("~a: " + (~a)); // -61
        System.out.println("a << 2: " + (a << 2)); // 240
        System.out.println("a >> 2: " + (a >> 2)); // 15
    }
}
```

### Ternary and instanceof

```java
public class TernaryExample {
    public static void main(String[] args) {
        int a = 10, b = 20;
        int max = (a > b) ? a : b;
        System.out.println("Max: " + max); // 20

        Object obj = "Hello";
        if (obj instanceof String) {
            String str = (String) obj;
            System.out.println("Length: " + str.length()); // 5
        }
    }
}
```

## References

- [Oracle Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)
- [Bitwise Operators](https://www.baeldung.com/java-bitwise-operators)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Java Control Structures](../java-control-structures/README.md)