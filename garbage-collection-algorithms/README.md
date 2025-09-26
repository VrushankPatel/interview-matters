---
title: Garbage Collection Algorithms
aliases: [gc, garbage collection]
tags: [#java, #gc]
created: 2025-09-26
updated: 2025-09-26
---

# Garbage Collection Algorithms

## Overview
Garbage Collection (GC) is the process of automatically reclaiming memory occupied by objects that are no longer in use. Java provides several GC algorithms, each with different trade-offs in terms of throughput, latency, and memory usage.

## Detailed Explanation

### Basic Concepts
- **Reachability**: An object is reachable if it can be accessed through a chain of references from GC roots
- **GC Roots**: Static variables, local variables in stack frames, JNI references
- **Generations**: Young Generation (Eden, Survivor spaces), Old Generation

### Common GC Algorithms

#### Mark-Sweep
Basic tracing GC algorithm: marks reachable objects, sweeps unreclaimed memory.  
Pros: Simple implementation, low memory overhead.  
Cons: Causes heap fragmentation, long pause times during sweeps, inefficient for large heaps.

#### Generational GC
Divides heap into young (Eden/Survivor) and old generations; most objects die young. Uses mark-sweep in young gen, mark-compact in old.  
Pros: Exploits weak generational hypothesis for efficiency, reduces full heap scans.  
Cons: More complex, still has pause times, potential for old gen bloat.

#### G1 (Garbage-First) GC
Partitions heap into regions, prioritizes garbage-rich regions for collection; concurrent marking and evacuation.  
Pros: Predictable low pause times, handles large heaps well, reduces fragmentation.  
Cons: Higher CPU overhead, more tuning required, not ideal for small heaps.

#### ZGC (Z Garbage Collector)
Concurrent GC using colored pointers and load barriers; pauses <10ms, supports 8MB-16TB heaps.  
Pros: Ultra-low latency, scalable, no pause scaling with heap size.  
Cons: Higher memory usage, increased CPU overhead, not default (enable with -XX:+UseZGC).

## Real-world Examples & Use Cases
- **Web Applications**: Choosing GC based on latency requirements
- **Big Data Processing**: Throughput-oriented GC for batch jobs
- **Real-time Systems**: Low-latency GC like ZGC
- **Microservices**: Tuning GC for containerized environments

## Code Examples

### Forcing GC (Not Recommended)
```java
public class GCExample {
    public static void main(String[] args) {
        System.gc(); // Request GC, but not guaranteed
        Runtime.getRuntime().gc(); // Same as above
    }
}
```

### Monitoring GC
```java
import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.util.List;

public class GCMonitor {
    public static void main(String[] args) {
        List<GarbageCollectorMXBean> gcBeans = ManagementFactory.getGarbageCollectorMXBeans();
        for (GarbageCollectorMXBean gcBean : gcBeans) {
            System.out.println("GC Name: " + gcBean.getName());
            System.out.println("Collection Count: " + gcBean.getCollectionCount());
            System.out.println("Collection Time: " + gcBean.getCollectionTime() + " ms");
        }
    }
}
```

## Common Pitfalls & Edge Cases
- **GC Pauses**: Long pauses in high-throughput applications
- **Memory Leaks**: Objects kept alive unintentionally
- **Fragmentation**: In Mark-Sweep without compaction
- **Tuning Complexity**: Over-tuning can lead to worse performance

## Tools & Libraries
- **JVM Options**: -XX:+UseG1GC, -XX:+UseZGC
- **Monitoring Tools**: VisualVM, JConsole, GC logs
- **Profilers**: YourKit, JProfiler

## References
- [Oracle GC Tuning](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [OpenJDK GC Wiki](https://wiki.openjdk.java.net/display/shenandoah/Main)
- "Java Performance: The Definitive Guide" by Scott Oaks

## Github-README Links & Related Topics
- [gc-tuning](../gc-tuning/)
- [jvm-performance-tuning](../java/jvm-performance-tuning/)
- [java-memory-management](../java-memory-management/)
