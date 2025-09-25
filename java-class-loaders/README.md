---
title: Java Class Loaders
aliases: [Class Loading in Java]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Class loaders in Java are responsible for loading class files into the JVM at runtime. They follow a delegation model to ensure security and avoid conflicts.

# Detailed Explanation

The JVM uses a hierarchical class loading mechanism:

1. **Bootstrap Class Loader**: Loads core Java classes (rt.jar).
2. **Extension Class Loader**: Loads classes from lib/ext.
3. **System/Application Class Loader**: Loads classes from classpath.

Delegation: A class loader delegates to its parent before loading itself.

Custom class loaders can be created by extending `ClassLoader`.

# Real-world Examples & Use Cases

- Dynamic loading of plugins
- Hot-swapping code
- Isolating class versions
- Security sandboxes

# Code Examples

```java
import java.net.URL;
import java.net.URLClassLoader;

public class CustomClassLoaderExample {
    public static void main(String[] args) throws Exception {
        // Using URLClassLoader
        URL[] urls = {new URL("file:///path/to/jar/")};
        URLClassLoader loader = new URLClassLoader(urls);
        Class<?> clazz = loader.loadClass("com.example.MyClass");
        Object instance = clazz.newInstance();
    }
}

// Custom ClassLoader
class MyClassLoader extends ClassLoader {
    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        // Implement custom loading logic
        return super.findClass(name);
    }
}
```

# References

- [Oracle Java Tutorials: Understanding Extension Class Loading](https://docs.oracle.com/javase/tutorial/ext/basics/load.html)

# Github-README Links & Related Topics

- [JVM Internals and Class Loading](jvm-internals-and-class-loading/README.md)
- [Java Fundamentals](java-fundamentals/README.md)