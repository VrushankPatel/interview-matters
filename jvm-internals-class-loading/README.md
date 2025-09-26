---
title: JVM Internals & Class Loading
aliases: [JVM Architecture, Java Class Loading]
tags: [#java, #jvm]
created: 2023-10-01
updated: 2025-09-26
---

# Overview

The Java Virtual Machine (JVM) is the runtime environment for Java applications. It handles memory management, bytecode execution, and class loading. Class loading is the process of loading class files into memory.

# Detailed Explanation

## JVM Architecture

- Class Loader Subsystem
- Runtime Data Areas (Heap, Stack, Method Area, etc.)
- Execution Engine (Interpreter, JIT Compiler)
- JNI and Native Method Libraries

## Class Loading Process

1. Loading: Finding and loading the class file.
2. Linking: Verification, Preparation, Resolution.
3. Initialization: Executing static initializers.

Class Loaders: Bootstrap, Extension, System/Application.

# Real-world Examples & Use Cases

- Understanding memory leaks and performance tuning.
- Custom class loaders for dynamic loading.

# Code Examples

```java
// Custom Class Loader
public class CustomClassLoader extends ClassLoader {
    @Override
    public Class<?> findClass(String name) throws ClassNotFoundException {
        // Load class from custom source
        return super.findClass(name);
    }
}
```

# References

- [JVM Specification](https://docs.oracle.com/javase/specs/jvms/se21/html/index.html)
- [Oracle Class Loading](https://docs.oracle.com/javase/tutorial/ext/basics/load.html)

# Github-README Links & Related Topics

- [java-class-loaders](../java-class-loaders/)
- [garbage-collection-algorithms](../garbage-collection-algorithms/)