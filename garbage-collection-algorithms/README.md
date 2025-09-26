---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Memory Management in Java]
tags: [#java,#gc,#algorithms]
created: 2025-09-26
updated: 2025-09-26
---

# Garbage Collection Algorithms

## Overview

Garbage Collection (GC) is the process of automatically freeing memory by reclaiming space occupied by objects that are no longer in use. Java has several GC algorithms to manage heap memory efficiently.

## Detailed Explanation

### Mark and Sweep

- Mark phase: Identify reachable objects.

- Sweep phase: Reclaim memory from unreachable objects.

### Generational GC

- Young Generation: For short-lived objects.

- Old Generation: For long-lived objects.

- Minor GC: Collects young generation.

- Major/Full GC: Collects entire heap.

### Common Algorithms

- Serial GC: Single-threaded, for small applications.

- Parallel GC: Multi-threaded, for throughput.

- CMS (Concurrent Mark Sweep): Low pause times.

- G1 GC: Regional, for large heaps.

- ZGC: Low latency, for very large heaps.

## Real-world Examples & Use Cases

- Tuning GC for high-throughput applications.

- Reducing pause times in real-time systems.

- Monitoring GC logs for performance issues.

## Code Examples

### Forcing GC (Not recommended in production)

```java
System.gc();
```

### Monitoring GC

```java
public class GCMonitor {
    public static void main(String[] args) {
        // Add JVM args: -XX:+PrintGCDetails -XX:+PrintGCTimeStamps
        System.out.println("GC monitoring enabled via JVM flags");
    }
}
```

### Custom Finalizer (Deprecated)

```java
public class ResourceHolder {
    @Override
    protected void finalize() throws Throwable {
        // Cleanup code
        super.finalize();
    }
}
```

## References

- [Oracle GC Tuning](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)

- [G1 GC](https://www.oracle.com/technetwork/tutorials/tutorials-1876574.html)

## Github-README Links & Related Topics

- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)

- [GC Tuning](../gc-tuning/README.md)
