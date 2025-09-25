---
title: Java Text Blocks
aliases: [Text Blocks, Multi-line Strings]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Text Blocks

## Overview

Java Text Blocks, introduced in Java 13 as a preview feature and finalized in Java 15, provide a way to define multi-line string literals without the need for escape sequences. They improve readability for strings containing newlines, quotes, or complex formatting.

## Detailed Explanation

Text blocks are enclosed in triple quotes (`"""`) and automatically handle indentation and line breaks. The compiler strips common leading whitespace and normalizes line endings. They support string interpolation and can be used anywhere a string literal is expected.

Key features:
- Automatic indentation handling
- Preservation of internal whitespace
- No need for `\n` or `\"` escapes
- Support for `\` for line continuation

## Real-world Examples & Use Cases

- **JSON Strings**: Embedding JSON data in code without escaping quotes.
- **SQL Queries**: Writing multi-line SQL statements.
- **HTML Templates**: Defining HTML snippets.
- **Configuration Files**: Storing YAML or XML content.

## Code Examples

### Basic Text Block

```java
String json = """
{
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}
""";
```

### SQL Query

```java
String query = """
SELECT id, name, email
FROM users
WHERE active = true
ORDER BY name
""";
```

### HTML Template

```java
String html = """
<html>
    <head>
        <title>My Page</title>
    </head>
    <body>
        <h1>Hello, World!</h1>
    </body>
</html>
""";
```

### With String Interpolation

```java
String name = "Alice";
int age = 25;
String message = """
Hello, %s!
You are %d years old.
""".formatted(name, age);
```

### Escaping in Text Blocks

```java
String text = """
This is a line with a quote: \"""
And this is another line.
""";
```

## Common Pitfalls & Edge Cases

- Trailing whitespace on lines may be preserved if not part of common indentation.
- Empty lines at the start or end are handled carefully.
- Mixing text blocks with regular strings requires attention to concatenation.

## References

- [Oracle Java Documentation: Text Blocks](https://docs.oracle.com/en/java/javase/15/text-blocks/index.html)
- [JEP 378: Text Blocks](https://openjdk.org/jeps/378)

## Github-README Links & Related Topics

- [Java Language Basics](../java-language-basics/README.md)
- [Java Strings and Text Processing](../java-language-basics/README.md)