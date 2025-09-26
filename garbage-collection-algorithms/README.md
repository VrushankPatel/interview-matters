---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Java Garbage Collection]
tags: [#java, #jvm, #performance]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Garbage Collection (GC) in Java automatically manages memory by reclaiming unused objects. Understanding GC algorithms is essential for optimizing application performance and preventing memory leaks. Java provides several GC algorithms, each with different trade-offs in terms of throughput, latency, and memory usage.

# Detailed Explanation

## Mark and Sweep

The basic algorithm:
1. Mark: Identify reachable objects starting from GC roots.
2. Sweep: Remove unmarked objects and reclaim memory.

## Generational GC

Divides heap into generations:
- Young Generation: For short-lived objects (Eden, Survivor spaces).
- Old Generation: For long-lived objects.

Algorithms:
- Serial GC: Single-threaded, for small applications.
- Parallel GC: Multi-threaded, for throughput.
- CMS (Concurrent Mark Sweep): Low latency, concurrent with application.
- G1: Regional, predictable pauses.
- ZGC/Shenandoah: Low latency, large heaps.

## Common Pitfalls & Edge Cases

- Memory leaks from static references.
- Large object allocation causing fragmentation.
- Tuning GC parameters for specific workloads.

# Real-world Examples & Use Cases

- Web servers: Using G1 GC for predictable response times.
- Batch processing: Parallel GC for high throughput.
- Real-time systems: ZGC for sub-millisecond pauses.

# Code Examples

### Monitoring GC

```java
public class GCMonitoring {
    public static void main(String[] args) {
        Runtime runtime = Runtime.getRuntime();
        System.out.println("Max Memory: " + runtime.maxMemory());
        System.out.println("Total Memory: " + runtime.totalMemory());
        System.out.println("Free Memory: " + runtime.freeMemory());
    }
}
```

### Forcing GC (Not Recommended)

```java
System.gc(); // Request GC, but JVM may ignore
```

# References

- [Oracle GC Tuning Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [Baeldung - Java Garbage Collection](https://www.baeldung.com/java-garbage-collection)

# Github-README Links & Related Topics

- [jvm-internals-class-loading](../jvm-internals-class-loading/README.md)
- [gc-tuning](../gc-tuning/README.md)
- [jvm-performance-tuning](../jvm-performance-tuning/README.md)
