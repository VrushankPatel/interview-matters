---
title: 'Garbage Collection Algorithms'
aliases: ['GC Algorithms']
tags: ['#java', '#gc']
created: '2025-09-26'
updated: '2025-09-26'
---

## Overview

Garbage Collection (GC) algorithms are mechanisms used by runtime environments, particularly in languages like Java, to automatically manage memory by reclaiming space occupied by objects that are no longer in use. This prevents memory leaks and optimizes application performance. GC algorithms vary in approach, from tracing live objects to reference counting, each with trade-offs in terms of pause times, throughput, and memory overhead.

## Detailed Explanation

GC algorithms can be broadly categorized into tracing and reference counting. Tracing algorithms identify reachable objects and collect the rest, while reference counting tracks references to objects.

### Key GC Algorithms

1. **Mark-Sweep**
   - **How it works**: Scans the heap to mark reachable objects, then sweeps away unmarked ones.
   - **Pros**: Simple, no object movement.
   - **Cons**: Fragmentation, potential long pauses.
   - **Diagram**:
     ```mermaid
     flowchart TD
         A[Start GC] --> B[Mark Phase: Traverse from roots, mark reachable objects]
         B --> C[Sweep Phase: Free unmarked objects]
         C --> D[End GC]
     ```

2. **Mark-Compact**
   - **How it works**: Marks reachable objects, then compacts them to eliminate fragmentation.
   - **Pros**: Reduces fragmentation.
   - **Cons**: More complex, higher overhead.
   - **Diagram**:
     ```mermaid
     flowchart TD
         A[Start GC] --> B[Mark Phase]
         B --> C[Compact Phase: Move marked objects together]
         C --> D[Update references]
         D --> E[End GC]
     ```

3. **Copying (Semi-Space)**
   - **How it works**: Divides heap into two spaces; copies live objects from one to the other.
   - **Pros**: Fast allocation, no fragmentation.
   - **Cons**: Requires twice the memory.
   - **Diagram**:
     ```mermaid
     flowchart TD
         A[From Space] --> B[Copy live objects to To Space]
         B --> C[Swap spaces]
         C --> D[End GC]
     ```

4. **Generational GC**
   - **How it works**: Exploits the "weak generational hypothesis" by dividing heap into young and old generations.
   - **Pros**: Efficient for most applications.
   - **Cons**: Complex tuning.
   - **Diagram**:
     ```mermaid
     graph TD
         A[Heap] --> B[Young Generation]
         A --> C[Old Generation]
         B --> D[Eden]
         B --> E[Survivor Spaces]
     ```

5. **Reference Counting**
   - **How it works**: Each object has a count of references; when count reaches zero, object is freed.
   - **Pros**: Immediate reclamation, no global pauses.
   - **Cons**: Cyclic references, overhead per reference.

### Comparison Table

| Algorithm       | Pause Time | Throughput | Memory Overhead | Fragmentation |
|-----------------|------------|------------|-----------------|---------------|
| Mark-Sweep     | High       | Medium     | Low             | High          |
| Mark-Compact   | High       | Medium     | Medium          | Low           |
| Copying        | Low        | High       | High            | None          |
| Generational   | Variable   | High       | Medium          | Variable      |
| Reference Counting | Low    | Medium     | High            | None          |

## Real-world Examples & Use Cases

- **JVM Collectors**: Java's HotSpot VM uses generational GC with variants like Serial (single-threaded), Parallel (multi-threaded), CMS (concurrent mark-sweep), G1 (garbage-first), ZGC (low-latency), and Shenandoah (concurrent copying).
- **Web Servers**: Applications like Tomcat use G1 for predictable pauses in high-throughput scenarios.
- **Big Data**: Spark jobs benefit from ZGC to minimize GC pauses during data processing.
- **Embedded Systems**: Reference counting in languages like Python for deterministic cleanup.

## Code Examples

### Triggering GC in Java

```java
public class GCExample {
    public static void main(String[] args) {
        // Create objects
        for (int i = 0; i < 100000; i++) {
            new Object();
        }
        
        // Suggest GC (not guaranteed)
        System.gc();
        
        // Force GC (use with caution)
        Runtime.getRuntime().gc();
    }
}
```

### Demonstrating Object Lifecycle

```java
public class ObjectLifecycle {
    static class MyObject {
        @Override
        protected void finalize() throws Throwable {
            System.out.println("Object finalized");
        }
    }
    
    public static void main(String[] args) {
        MyObject obj = new MyObject();
        obj = null; // Eligible for GC
        System.gc(); // May trigger finalize
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
            System.out.println("GC: " + gcBean.getName() + ", Collections: " + gcBean.getCollectionCount());
        }
    }
}
```

## References

- [Oracle JVM Garbage Collection Tuning](https://docs.oracle.com/en/java/javase/21/gctuning/introduction-garbage-collection-tuning.html)
- [Wikipedia: Garbage Collection](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science))
- [Java SE 21 GC Implementation](https://docs.oracle.com/en/java/javase/21/gctuning/garbage-collector-implementation.html)

## Github-README Links & Related Topics

- [java-memory-management](../java-memory-management/README.md)
- [gc-tuning](../gc-tuning/README.md)
- [jvm-internals-and-class-loading](../jvm-internals-and-class-loading/README.md)
- [java](../java/README.md)