---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Memory Management in Java]
tags: [#java, #jvm, #gc]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Garbage Collection (GC) algorithms in Java automatically manage memory by reclaiming unused objects. Understanding different algorithms helps in tuning JVM performance and avoiding memory leaks.

# Detailed Explanation

GC identifies and removes objects no longer referenced. Common algorithms:

- **Mark-and-Sweep**: Marks reachable objects, sweeps unreachable ones.
- **Mark-and-Compact**: Compacts memory after sweeping to reduce fragmentation.
- **Copying GC**: Copies live objects to a new area, efficient for young generation.
- **Generational GC**: Divides heap into young, old, permanent generations with different strategies.

JVM uses G1, ZGC, Shenandoah for modern applications.

# Real-world Examples & Use Cases

- **High-Throughput Apps**: Batch processing with Parallel GC.
- **Low-Latency Systems**: ZGC for real-time applications.
- **Memory-Constrained Environments**: Tuning GC for embedded systems.

Example: Monitoring GC logs in a web server.

# Code Examples

Forcing GC (not recommended in production):

```java
public class GCExample {
    public static void main(String[] args) {
        // Create objects
        for (int i = 0; i < 100000; i++) {
            new Object();
        }
        // Suggest GC
        System.gc();
    }
}
```

# References

- [Oracle GC Tuning](https://docs.oracle.com/en/java/javase/21/gctuning/)
- [Baeldung GC Algorithms](https://www.baeldung.com/jvm-garbage-collectors)

# Github-README Links & Related Topics

- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/)
- [JVM Memory Model](../jvm-memory-model/)