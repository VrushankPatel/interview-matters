---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Memory Management in Java]
tags: [#java, #jvm]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Garbage Collection (GC) in Java automatically manages memory by reclaiming unused objects, preventing memory leaks and improving application stability.

# Detailed Explanation

## Common Algorithms

- Mark-and-Sweep: Marks reachable objects, sweeps unreachable ones.
- Generational GC: Divides heap into young and old generations.
- G1 GC: Garbage-First, divides heap into regions.

# Real-world Examples & Use Cases

- Long-running server applications where manual memory management is error-prone.
- Real-time systems requiring predictable pause times.

# Code Examples

```java
public class GCExample {
    public static void main(String[] args) {
        for (int i = 0; i < 100000; i++) {
            new Object(); // Creating objects to trigger GC
        }
        System.gc(); // Suggesting GC
    }
}
```

# References

- [Oracle GC Tuning](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)

# Github-README Links & Related Topics

- [JVM Internals & Class Loading](../jvm-internals-class-loading/README.md)
- [Java Memory Management](../java-memory-management/README.md)