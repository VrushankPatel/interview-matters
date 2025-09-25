---
title: Java Switch Expressions
aliases: [Switch Expressions, Enhanced Switch]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Switch expressions, introduced in Java 12 as a preview and finalized in Java 14, extend the traditional switch statement to be used as expressions that yield values. They support pattern matching, multiple case labels, and arrow syntax, making code more concise and expressive.

## Detailed Explanation

Switch expressions use `->` for case branches and `yield` to return values. They can be used in assignments, returns, and method calls. Traditional switch statements are still supported, but expressions eliminate fall-through and require exhaustive cases.

Key improvements:
- Arrow syntax (`->`) prevents fall-through
- `yield` keyword for returning values
- Support for multiple constants per case
- Exhaustive checking for enums and sealed classes

## Real-world Examples & Use Cases

- **Enum Handling**: Processing different enum values with specific logic.
- **State Machines**: Transitioning between states based on input.
- **Parsing**: Converting strings to enums or objects.
- **Configuration**: Selecting implementations based on type.

## Code Examples

### Basic Switch Expression

```java
Day day = Day.MONDAY;
String type = switch (day) {
    case MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY -> "Weekday";
    case SATURDAY, SUNDAY -> "Weekend";
};
```

### With Yield

```java
int numLetters = switch (day) {
    case MONDAY, FRIDAY, SUNDAY -> {
        System.out.println("Processing " + day);
        yield 6;
    }
    case TUESDAY -> 7;
    case THURSDAY, SATURDAY -> 8;
    case WEDNESDAY -> 9;
};
```

### Traditional vs Expression

```java
// Traditional statement
String result;
switch (day) {
    case MONDAY:
        result = "Start of work week";
        break;
    case FRIDAY:
        result = "TGIF";
        break;
    default:
        result = "Regular day";
        break;
}

// Expression
String result = switch (day) {
    case MONDAY -> "Start of work week";
    case FRIDAY -> "TGIF";
    default -> "Regular day";
};
```

### With Sealed Classes

```java
sealed interface Shape permits Circle, Rectangle {}
// ... implementations

String description = switch (shape) {
    case Circle c -> "Circle with radius " + c.radius();
    case Rectangle r -> "Rectangle " + r.width() + "x" + r.height();
};
```

## Common Pitfalls & Edge Cases

- Exhaustive cases required for enums and sealed types; use `default` otherwise to avoid compilation errors.
- Arrow cases cannot have multiple statements without braces and `yield`.
- Mixing statements and expressions can lead to confusion; prefer expressions for consistency.
- Pattern matching with guards requires careful ordering to avoid unreachable code.

## References

- [Oracle Java Documentation: Switch Expressions](https://docs.oracle.com/en/java/javase/14/language/switch-expressions.html)
- [JEP 361: Switch Expressions](https://openjdk.org/jeps/361)

## Github-README Links & Related Topics

- [Java Language Basics](../java/java-language-basics/README.md)
- [Java Sealed Classes](../java-sealed-classes/README.md)