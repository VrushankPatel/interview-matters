---
title: Java Records Patterns
aliases: []
tags: [#java,#pattern-matching]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Java Records Patterns, finalized in JDK 21 (JEP 440), extend pattern matching to deconstruct record values. They allow matching against record types and extracting component values directly into pattern variables, enabling more declarative and composable data processing.

## Detailed Explanation

Records patterns consist of a record class type and a pattern list for matching components. They support nesting with other patterns like type patterns.

Key features:
- **Deconstruction**: Automatically extracts record components using accessor methods.
- **Type Inference**: Supports `var` for inferred types and generic record type argument inference.
- **Nesting**: Can be combined with type patterns and other record patterns.
- **Exhaustiveness**: Switch expressions with record patterns must cover all possible cases.

## Real-world Examples & Use Cases

- **Data Processing**: Extracting fields from structured data without manual accessor calls.
- **API Design**: Pattern matching in switch expressions for handling different record types.
- **Validation**: Checking and extracting data from records in a type-safe manner.

## Code Examples

### Basic Record Pattern

```java
record Point(int x, int y) {}

static void printSum(Object obj) {
    if (obj instanceof Point(int x, int y)) {
        System.out.println(x + y);
    }
}
```

### Nested Record Patterns

```java
record ColoredPoint(Point p, Color c) {}
record Rectangle(ColoredPoint upperLeft, ColoredPoint lowerRight) {}

static void printXCoordOfUpperLeftPoint(Rectangle r) {
    if (r instanceof Rectangle(ColoredPoint(Point(var x, var y), var c), var lr)) {
        System.out.println("Upper-left corner: " + x);
    }
}
```

### Switch Expression with Record Patterns

```java
record Pair<T>(T x, T y) {}

static String classify(Object obj) {
    return switch (obj) {
        case Pair<String>(String s, String t) -> "Two strings: " + s + ", " + t;
        case Pair<Integer>(Integer i, Integer j) -> "Two ints: " + (i + j);
        case Pair(var a, var b) -> "Pair of " + a.getClass().getSimpleName();
        default -> "Not a pair";
    };
}
```

### Type Argument Inference

```java
record Box<T>(T t) {}

static void test(Box<Box<String>> bbs) {
    if (bbs instanceof Box(Box(var s))) {
        System.out.println("String " + s);
    }
}
```

## References

- [JEP 440: Record Patterns](https://openjdk.org/jeps/440)
- [Pattern Matching for Java](https://openjdk.org/projects/amber/)

## Github-README Links & Related Topics

- [Java Switch Expressions](../java-switch-expressions/README.md)
- [OOP Principles in Java](../oop-principles-in-java/README.md)