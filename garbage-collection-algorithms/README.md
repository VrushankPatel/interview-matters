---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Java GC]
tags: [#java, #gc]
created: 2023-10-01
updated: 2025-09-26
---

# Overview

Garbage Collection (GC) is the process of automatically reclaiming memory occupied by objects that are no longer in use. Java has several GC algorithms like Serial, Parallel, CMS, G1, ZGC.

# Detailed Explanation

## Mark and Sweep

Marks reachable objects, sweeps unreachable.

## Generational GC

Divides heap into young and old generations.

## G1 GC

Garbage First, divides heap into regions.

# Real-world Examples & Use Cases

- Tuning JVM for low-latency applications.
- Monitoring GC logs for performance issues.

# Code Examples

```java
// Forcing GC (not recommended)
System.gc();
```

# References

- [Oracle GC Tuning](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)

# Github-README Links & Related Topics

- [gc-tuning](../gc-tuning/)
- [java-memory-management](../java-memory-management/)