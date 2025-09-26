---
title: Java 18 Features
aliases: [Java 18, JDK 18 Features]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Java 18, released in March 2022, is a non-LTS release that introduced several new features and enhancements. Key additions include UTF-8 as the default charset, a simple web server for prototyping, code snippets in JavaDoc, and preview features like pattern matching for switch expressions. This release continues to improve developer experience and language expressiveness.

## Detailed Explanation

Java 18 focuses on incremental improvements and previews of upcoming features. The major features include:

### UTF-8 by Default
The default charset for Java APIs is now UTF-8, ensuring consistent encoding behavior across platforms.

### Simple Web Server
A built-in web server for prototyping and testing, useful for serving static files.

### Code Snippets in JavaDoc
JavaDoc now supports code snippets with syntax highlighting and execution.

### Pattern Matching for Switch (Preview)
Extends pattern matching to switch expressions and statements.

### Other Features
- Foreign Function & Memory API (second incubator)
- Vector API (second incubator)
- Internet-Address Resolution SPI
- Deprecations and removals

## Real-world Examples & Use Cases

### Simple Web Server for Prototyping
Quickly serve static content during development.

```bash
jwebserver -p 8080 -d /path/to/static/files
```

### Code Snippets in JavaDoc
Document APIs with executable examples.

```java
/**
 * Calculates the area of a circle.
 * 
 * <p>Example usage:</p>
 * {@snippet :
 * double radius = 5.0;
 * double area = Math.PI * radius * radius;
 * System.out.println("Area: " + area);
 * }
 * 
 * @param radius the radius of the circle
 * @return the area of the circle
 */
public static double calculateCircleArea(double radius) {
    return Math.PI * radius * radius;
}
```

### Pattern Matching in Switch
Simplify complex conditional logic.

```java
public String classifyShape(Object shape) {
    return switch (shape) {
        case Circle c -> "Circle with radius " + c.radius();
        case Rectangle r -> "Rectangle " + r.width() + "x" + r.height();
        case null -> "Unknown shape";
        default -> "Other shape";
    };
}
```

## Code Examples

### UTF-8 Default Charset Example

```java
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;

public class CharsetExample {
    public static void main(String[] args) throws Exception {
        // UTF-8 is now the default
        Charset defaultCharset = Charset.defaultCharset();
        System.out.println("Default charset: " + defaultCharset);
        
        // Reading a file with UTF-8 encoding
        String content = Files.readString(Path.of("example.txt"));
        System.out.println(content);
    }
}
```

### Simple Web Server Usage

```java
// Command line usage
// jwebserver -p 8080 -d /path/to/files

// Programmatically (using java.net.http for requests)
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.URI;

public class WebServerClient {
    public static void main(String[] args) throws Exception {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create("http://localhost:8080/index.html"))
            .build();
        
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println(response.body());
    }
}
```

## References

- [Oracle Java 18 Documentation](https://docs.oracle.com/en/java/javase/18/)
- [OpenJDK JDK 18 Release Notes](https://openjdk.org/projects/jdk/18/)
- [JEP 400: UTF-8 by Default](https://openjdk.org/jeps/400)
- [JEP 408: Simple Web Server](https://openjdk.org/jeps/408)
- [JEP 413: Code Snippets in JavaDoc](https://openjdk.org/jeps/413)
- [JEP 420: Pattern Matching for Switch (Preview)](https://openjdk.org/jeps/420)

## Github-README Links & Related Topics

- [Java Pattern Matching](java-pattern-matching/)
- [Java Switch Expressions](java-switch-expressions/)
- [Java 17 Features](java-17-features/)
- [Java 19 Features](java-19-features/)