---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, JVM Garbage Collection]
tags: [#java, #jvm, #performance]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Garbage Collection (GC) is an automatic memory management feature in Java that reclaims memory occupied by objects that are no longer in use. Understanding GC algorithms is essential for optimizing Java application performance, reducing pause times, and preventing memory leaks. This topic covers various GC algorithms, their mechanisms, and best practices.

## Detailed Explanation

## What is Garbage Collection?

Garbage collection automatically identifies and reclaims memory occupied by objects that are no longer reachable from the application roots (stack, static variables, etc.).

## JVM Memory Generations

The JVM divides heap memory into generations:

- **Young Generation**: Newly created objects
  - Eden space
  - Survivor spaces (S0, S1)
- **Old Generation (Tenured)**: Long-lived objects
- **Permanent Generation/Metaspace**: Class metadata (Java 8+)

## Common GC Algorithms

### 1. Mark-Sweep
- **Mark Phase**: Mark all reachable objects
- **Sweep Phase**: Reclaim memory from unmarked objects
- **Pros**: Simple, fast marking
- **Cons**: Fragmentation, potential for memory leaks if marking is incomplete

### 2. Mark-Compact
- **Mark Phase**: Mark reachable objects
- **Compact Phase**: Move marked objects to one end of the heap
- **Pros**: Eliminates fragmentation
- **Cons**: More expensive due to compaction

### 3. Copying (Scavenge)
- Divide heap into two equal spaces
- Copy live objects from one space to the other
- **Pros**: Fast allocation, no fragmentation
- **Cons**: Wastes half the heap space

### 4. Generational GC
- Combines multiple algorithms
- Young generation: Copying GC
- Old generation: Mark-Sweep-Compact
- **Pros**: Exploits object lifecycle patterns

## JVM GC Implementations

- **Serial GC**: Single-threaded, suitable for small applications
- **Parallel GC**: Multi-threaded, for throughput
- **CMS (Concurrent Mark Sweep)**: Low pause times, deprecated in Java 9+
- **G1 GC**: Region-based, predictable pauses
- **ZGC**: Low latency, large heaps
- **Shenandoah**: Similar to ZGC, concurrent evacuation

## GC Tuning Parameters

- `-Xms`: Initial heap size
- `-Xmx`: Maximum heap size
- `-XX:NewRatio`: Ratio of old to young generation
- `-XX:SurvivorRatio`: Ratio of Eden to survivor space

## Real-world Examples & Use Cases

1. **High-Throughput Applications**: Using Parallel GC for batch processing
2. **Low-Latency Systems**: Implementing G1 or ZGC for real-time applications
3. **Memory-Constrained Environments**: Tuning heap sizes for embedded systems
4. **Microservices**: Configuring GC for containerized applications

## Code Examples

### Monitoring GC Activity
```java
public class GCMonitoring {
    public static void main(String[] args) {
        Runtime runtime = Runtime.getRuntime();
        
        System.out.println("Total Memory: " + runtime.totalMemory());
        System.out.println("Free Memory: " + runtime.freeMemory());
        System.out.println("Used Memory: " + (runtime.totalMemory() - runtime.freeMemory()));
        
        // Force GC (not recommended in production)
        System.gc();
        
        System.out.println("After GC - Free Memory: " + runtime.freeMemory());
    }
}
```

### Creating Objects to Demonstrate GC
```java
import java.util.ArrayList;
import java.util.List;

public class GCExample {
    public static void main(String[] args) {
        List<byte[]> list = new ArrayList<>();
        
        for (int i = 0; i < 1000; i++) {
            // Create large objects
            byte[] array = new byte[1024 * 1024]; // 1MB
            list.add(array);
            
            if (i % 100 == 0) {
                System.out.println("Created " + (i + 1) + " objects");
                System.out.println("Free Memory: " + Runtime.getRuntime().freeMemory());
            }
        }
        
        // Clear references
        list.clear();
        
        // Suggest GC
        System.gc();
        
        System.out.println("After GC - Free Memory: " + Runtime.getRuntime().freeMemory());
    }
}
```

### Weak References Example
```java
import java.lang.ref.WeakReference;

public class WeakReferenceExample {
    public static void main(String[] args) {
        Object strongRef = new Object();
        WeakReference<Object> weakRef = new WeakReference<>(strongRef);
        
        System.out.println("Strong reference: " + strongRef);
        System.out.println("Weak reference: " + weakRef.get());
        
        // Remove strong reference
        strongRef = null;
        
        // Suggest GC
        System.gc();
        
        System.out.println("After GC - Weak reference: " + weakRef.get());
    }
}
```

## Common Pitfalls & Edge Cases

1. **Premature Optimization**: Don't tune GC unless there's a proven performance issue
2. **Memory Leaks**: Holding references longer than necessary
3. **Large Object Allocation**: Objects larger than survivor space go directly to old generation
4. **GC Pauses**: Long pauses in high-throughput systems

## References

- [Oracle GC Tuning Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/index.html)
- [JVM Garbage Collection](https://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/index.html)
- [G1 Garbage Collector](https://docs.oracle.com/javase/9/gctuning/g1-garbage-collector.htm)
- [Z Garbage Collector](https://docs.oracle.com/en/java/javase/11/gctuning/z-garbage-collector.html)

## Github-README Links & Related Topics

- [JVM Internals & Class Loading](./jvm-internals-and-class-loading/README.md)
- [Java Memory Management](./java-memory-management/README.md)
- [GC Tuning](./gc-tuning/README.md)
- [Java Performance Tuning](./java-performance-tuning/README.md)
