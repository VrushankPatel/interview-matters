---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Java Garbage Collection]
tags: [#java,#jvm,#gc]
created: 2025-09-26
updated: 2025-09-26
---

# Garbage Collection Algorithms

## Overview

Garbage Collection (GC) is the process of automatically managing memory by reclaiming space occupied by objects that are no longer in use. The JVM provides several GC algorithms with different trade-offs between throughput, latency, and memory usage. Understanding these algorithms is essential for optimizing Java application performance.

## Detailed Explanation

### Mark and Sweep

The basic GC algorithm that marks reachable objects and sweeps away unreachable ones.

**Process:**
1. Mark: Traverse object graph from GC roots, marking reachable objects
2. Sweep: Reclaim memory from unmarked objects

**Pros:** Simple implementation
**Cons:** Fragmentation, stop-the-world pauses

### Mark and Compact

Similar to mark and sweep but compacts surviving objects to reduce fragmentation.

**Process:**
1. Mark reachable objects
2. Compact by moving objects to one end of the heap

### Copying Collectors

Divides heap into two spaces: from-space and to-space.

**Process:**
1. Copy live objects from from-space to to-space
2. Swap spaces

**Pros:** No fragmentation, fast allocation
**Cons:** Uses only half the heap

### Generational GC

Exploits the generational hypothesis: most objects die young.

**Generations:**
- **Young Generation**: New objects, frequent minor GC
- **Old Generation**: Long-lived objects, infrequent major GC
- **Permanent Generation/Metaspace**: Class metadata

### Common GC Algorithms

#### Serial GC
Single-threaded, stop-the-world collector. Good for small applications.

```bash
java -XX:+UseSerialGC MyApp
```

#### Parallel GC
Multi-threaded version of Serial GC. Default in Java 8.

```bash
java -XX:+UseParallelGC MyApp
```

#### CMS (Concurrent Mark Sweep)
Concurrent collection with short pauses. Deprecated in Java 9.

#### G1 (Garbage First)
Divides heap into regions, prioritizes regions with most garbage.

```bash
java -XX:+UseG1GC MyApp
```

#### ZGC
Low-latency collector for large heaps.

```bash
java -XX:+UseZGC MyApp
```

#### Shenandoah
Similar to ZGC, concurrent evacuation.

## Real-world Examples & Use Cases

- **Web Applications**: G1 GC for balanced throughput and latency
- **Big Data Processing**: Parallel GC for high throughput
- **Real-time Systems**: ZGC or Shenandoah for low pause times
- **Embedded Systems**: Serial GC for simple, low-memory applications

## Code Examples

### GC Monitoring

```java
public class GCMonitoring {
    public static void main(String[] args) {
        Runtime runtime = Runtime.getRuntime();
        
        // Force GC
        System.gc();
        
        // Memory info
        long totalMemory = runtime.totalMemory();
        long freeMemory = runtime.freeMemory();
        long usedMemory = totalMemory - freeMemory;
        
        System.out.println("Total Memory: " + totalMemory / 1024 / 1024 + " MB");
        System.out.println("Free Memory: " + freeMemory / 1024 / 1024 + " MB");
        System.out.println("Used Memory: " + usedMemory / 1024 / 1024 + " MB");
    }
}
```

### Object Lifecycle Example

```java
public class ObjectLifecycle {
    public static void main(String[] args) {
        // Young generation
        String youngObject = new String("Short-lived");
        
        // Method returns, youngObject becomes eligible for GC
        methodCall();
        
        // Long-lived object
        String oldObject = new String("Long-lived");
        
        // Keep reference to prevent GC
        System.out.println(oldObject);
    }
    
    private static void methodCall() {
        String localObject = new String("Local");
        // localObject eligible for GC after method returns
    }
}
```

## Common Pitfalls & Edge Cases

- **Memory Leaks**: Holding references to unused objects
- **GC Pauses**: Long pauses in real-time applications
- **Heap Sizing**: Incorrect Xmx/Xms settings
- **Finalizers**: Can cause GC issues, avoid if possible

## Tools & Libraries

- **VisualVM**: GC monitoring and analysis
- **GCViewer**: Log file analysis
- **JMC (Java Mission Control)**: Advanced profiling
- **Async Profiler**: Low-overhead profiling

## References

- [Oracle GC Tuning Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [JVM GC Algorithms](https://www.oracle.com/technetwork/java/javase/tech/memorymanagement-whitepaper-1-150020.pdf)
- [G1 GC Paper](https://dl.acm.org/doi/10.1145/1029873.1029874)

## Github-README Links & Related Topics

- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [JVM Performance Tuning](../jvm-performance-tuning/README.md)
- [Java Memory Management](../java-memory-management/README.md)
