---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Java Memory Management]
tags: [#java,#jvm,#gc]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Garbage Collection (GC) algorithms in Java automatically manage memory by reclaiming unused objects. Understanding different GC algorithms helps in tuning application performance and reducing latency.

# Detailed Explanation

GC identifies and removes objects that are no longer referenced, preventing memory leaks.

## Common GC Algorithms

- **Mark-Sweep**: Marks reachable objects, sweeps unreferenced ones
- **Copying**: Copies live objects to a new area, discards old
- **Mark-Compact**: Marks live objects, compacts them in place
- **Generational GC**: Divides heap into young and old generations

## Modern GCs

- **G1 GC**: Divides heap into regions, prioritizes collection
- **ZGC**: Low-latency GC for large heaps
- **Shenandoah**: Concurrent evacuation

# Real-world Examples & Use Cases

- Tuning JVM for low-latency applications
- Reducing GC pauses in high-throughput systems
- Debugging memory leaks
- Optimizing microservices memory usage

# Code Examples

## Forcing GC (Not recommended in production)

```java
public class GCExample {
    public static void main(String[] args) {
        System.gc(); // Suggests GC run
        Runtime.getRuntime().gc(); // Another way
    }
}
```

## Monitoring GC

```java
// Use JVM flags: -XX:+PrintGC -XX:+PrintGCDetails
// Or programmatically:
ManagementFactory.getGarbageCollectorMXBeans().forEach(gc -> {
    System.out.println("GC: " + gc.getName());
});
```

# References

- [Oracle GC Tuning](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [Baeldung GC Guide](https://www.baeldung.com/java-garbage-collection)

# Github-README Links & Related Topics

- [JVM Internals & Class Loading](../jvm-internals-class-loading/)
- [GC Tuning](../gc-tuning/)
- [JVM Performance Tuning](../jvm-performance-tuning/)
