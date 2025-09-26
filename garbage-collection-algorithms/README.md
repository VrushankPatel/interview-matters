---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Java Garbage Collection]
tags: [#java,#jvm,#performance]
created: 2025-09-26
updated: 2025-09-26
---

# Garbage Collection Algorithms

## Overview

Garbage Collection (GC) in Java automatically manages memory by reclaiming unused objects. Various algorithms optimize for different scenarios, balancing pause times and throughput.

## Detailed Explanation

### Mark-Sweep

- **Mark Phase**: Identifies reachable objects
- **Sweep Phase**: Reclaims memory from unreachable objects
- Pros: Simple
- Cons: Fragmentation, pauses

### Mark-Compact

- Similar to Mark-Sweep but compacts memory to reduce fragmentation
- More efficient for long-running applications

### Generational GC

- Divides heap into Young (Eden, Survivor) and Old generations
- Most objects die young (generational hypothesis)

### G1 GC

- Divides heap into regions
- Concurrent marking and evacuation
- Predictable pause times

### ZGC / Shenandoah

- Low-latency collectors with sub-millisecond pauses

## Real-world Examples & Use Cases

- Web servers requiring low latency (G1)
- Batch processing with high throughput (Parallel GC)
- Real-time systems (ZGC)

## Code Examples

### Forcing GC (Not Recommended)

```java
System.gc(); // Hint to JVM, not guaranteed
```

### Monitoring GC

```java
// Use JVM flags: -XX:+PrintGCDetails -XX:+PrintGCTimeStamps
```

## Common Pitfalls & Edge Cases

- Memory leaks from static references
- Large objects causing fragmentation
- Incorrect tuning leading to excessive pauses

## Tools & Libraries

- VisualVM for monitoring
- GC logs analysis with tools like GCViewer

| Algorithm | Pause Time | Throughput | Use Case |
|-----------|------------|------------|----------|
| Serial GC | High | Low | Small apps |
| Parallel GC | Medium | High | Batch processing |
| CMS | Low | Medium | Web apps |
| G1 | Low | High | Large heaps |
| ZGC | Very Low | High | Real-time |

## References

- [Oracle - Garbage Collection Tuning](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [Baeldung - Java Garbage Collection](https://www.baeldung.com/java-garbage-collection)

## Github-README Links & Related Topics

- [JVM Internals & Class Loading](./../jvm-internals-and-class-loading/README.md)
- [Java Memory Management](./../java-memory-management/README.md)
- [GC Tuning](./../gc-tuning/README.md)
