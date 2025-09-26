---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, JVM Garbage Collection]
tags: [#java,#jvm,#performance]
created: 2025-09-26
updated: 2025-09-26
---

# Garbage Collection Algorithms

## Overview

Garbage Collection (GC) is the process of automatically reclaiming memory occupied by objects that are no longer in use. The JVM provides several GC algorithms with different trade-offs in terms of throughput, latency, and memory usage. Understanding these algorithms is essential for optimizing Java application performance.

## Detailed Explanation

### Generational Hypothesis

Most objects die young (generational hypothesis). This leads to generational GC:
- **Young Generation:** Where new objects are allocated
- **Old Generation:** Long-lived objects
- **Permanent Generation/Metaspace:** Class metadata (Java 8+)

### GC Algorithms

#### Serial GC
- Single-threaded
- Suitable for small applications
- Uses mark-sweep-compact

#### Parallel GC
- Multi-threaded version of Serial GC
- Default in Java 8
- Good for throughput

#### Concurrent Mark Sweep (CMS)
- Concurrent marking phase
- Low pause times
- Deprecated in Java 9, removed in Java 14

#### G1 GC
- Default since Java 9
- Divides heap into regions
- Predictable pause times
- Good balance of throughput and latency

#### Z Garbage Collector (ZGC)
- Available since Java 11
- Sub-millisecond pause times
- Handles heaps up to 16TB
- Concurrent compaction

#### Shenandoah
- Similar to ZGC
- Concurrent evacuation
- Low pause times

### GC Phases

1. **Mark:** Identify live objects
2. **Sweep:** Remove dead objects
3. **Compact:** Defragment memory (optional)

```mermaid
graph TD
    A[GC Triggered] --> B[Mark Phase]
    B --> C[Sweep Phase]
    C --> D[Compact Phase]
    D --> E[GC Complete]
```

## Real-world Examples & Use Cases

- **High-throughput applications:** Use Parallel GC for maximum throughput
- **Low-latency applications:** Use G1 or ZGC for predictable pause times
- **Large heap applications:** ZGC for heaps > 4GB with low latency requirements
- **Microservices:** Tune GC based on workload characteristics

## Code Examples

### Monitoring GC
```java
public class GCMonitoring {
    public static void main(String[] args) {
        // Print GC information
        System.out.println("GC Information:");
        for (java.lang.management.GarbageCollectorMXBean gc : 
             java.lang.management.ManagementFactory.getGarbageCollectorMXBeans()) {
            System.out.println("Name: " + gc.getName());
            System.out.println("Collection count: " + gc.getCollectionCount());
            System.out.println("Collection time: " + gc.getCollectionTime() + "ms");
        }
        
        // Force GC (not recommended in production)
        System.gc();
    }
}
```

### Memory Leak Simulation
```java
import java.util.ArrayList;
import java.util.List;

public class MemoryLeakExample {
    private static List<Object> leak = new ArrayList<>();
    
    public static void main(String[] args) {
        while (true) {
            leak.add(new byte[1024 * 1024]); // 1MB objects
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
```

### Weak References
```java
import java.lang.ref.WeakReference;

public class WeakReferenceExample {
    public static void main(String[] args) {
        Object strongRef = new Object();
        WeakReference<Object> weakRef = new WeakReference<>(strongRef);
        
        System.out.println("Strong ref: " + strongRef);
        System.out.println("Weak ref: " + weakRef.get());
        
        // Remove strong reference
        strongRef = null;
        System.gc();
        
        System.out.println("After GC - Weak ref: " + weakRef.get());
    }
}
```

## Common Pitfalls & Edge Cases

- **GC thrashing:** Too frequent GC due to small heap
- **Memory leaks:** Objects not being garbage collected
- **Long GC pauses:** Impacting application responsiveness
- **Incorrect GC tuning:** Using wrong GC for workload

## Tools & Libraries

- **JVM flags:** -XX:+UseG1GC, -XX:MaxGCPauseMillis=200
- **Monitoring tools:** VisualVM, JConsole, GC logs
- **Profiling tools:** YourKit, JProfiler

## References

- [Oracle GC Tuning Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [G1 GC](https://www.oracle.com/technetwork/tutorials/tutorials-1876574.html)
- [ZGC](https://wiki.openjdk.java.net/display/zgc/Main)
- [JVM GC Algorithms](https://www.baeldung.com/jvm-garbage-collectors)

## Github-README Links & Related Topics

- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Memory Management](../java-memory-management/README.md)
- [GC Tuning](../gc-tuning/README.md)
- [JVM Performance Tuning](../jvm-performance-tuning/README.md)
