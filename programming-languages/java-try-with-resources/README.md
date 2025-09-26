---
title: Java Try-With-Resources
aliases: [Automatic Resource Management in Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

The try-with-resources statement, introduced in Java 7, automatically closes resources that implement `AutoCloseable` or `Closeable`, preventing resource leaks and reducing boilerplate code.

# Detailed Explanation

Resources declared in the try-with-resources statement are closed automatically at the end of the block, regardless of whether an exception occurs. This eliminates the need for explicit finally blocks for closing resources. Resources are closed in reverse order of declaration.

Suppressed exceptions from closing resources are accessible via `Throwable.getSuppressed()`.

# Real-world Examples & Use Cases

- File I/O operations
- Database connections and statements
- Network sockets
- Any resource requiring cleanup

# Code Examples

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TryWithResourcesExample {
    static String readFirstLineFromFile(String path) throws IOException {
        try (FileReader fr = new FileReader(path);
             BufferedReader br = new BufferedReader(fr)) {
            return br.readLine();
        }
    }

    public static void main(String[] args) {
        try {
            String line = readFirstLineFromFile("example.txt");
            System.out.println(line);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

# References

- [Oracle Java Tutorials: The try-with-resources Statement](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html)

# Github-README Links & Related Topics

- [File I/O NIO](file-io-nio/README.md)
- [Java Fundamentals](java-fundamentals/README.md)