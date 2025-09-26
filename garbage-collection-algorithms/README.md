---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, JVM Garbage Collection]
tags: [#java,#jvm,#performance]
created: 2025-09-26
updated: 2025-09-26
---

# Garbage Collection Algorithms

## Overview
Garbage Collection (GC) is the process of automatically reclaiming memory occupied by objects that are no longer in use. The JVM's garbage collector manages heap memory, preventing memory leaks and reducing the burden on developers. Understanding different GC algorithms is essential for optimizing Java application performance and troubleshooting memory-related issues.

## Detailed Explanation

### Garbage Collection Fundamentals
- **Reachability:** An object is considered garbage if it cannot be reached from any root references (static variables, local variables, etc.)
- **Generational Hypothesis:** Most objects die young; objects that survive multiple GC cycles are likely to live longer
- **Stop-the-World:** GC pauses application threads to safely collect garbage

### Common GC Algorithms

#### 1. Mark-Sweep
- **Mark Phase:** Traverse the object graph from roots, marking reachable objects
- **Sweep Phase:** Reclaim memory from unmarked objects
- **Pros:** Simple implementation
- **Cons:** Fragmentation, performance degradation with large heaps

#### 2. Mark-Sweep-Compact
- Extends mark-sweep with a compaction phase
- **Compact Phase:** Move surviving objects to eliminate fragmentation
- **Pros:** Reduces fragmentation
- **Cons:** More complex, longer pause times

#### 3. Copying Collectors
- Divide heap into two equal spaces: from-space and to-space
- Copy live objects from from-space to to-space
- **Pros:** No fragmentation, fast allocation
- **Cons:** Wastes half the heap space

#### 4. Generational Collectors
- **Young Generation:** Where most objects are allocated and die quickly
  - Eden space
  - Survivor spaces (S0, S1)
- **Old Generation:** Long-lived objects
- **Minor GC:** Collects young generation
- **Major/Full GC:** Collects entire heap

### JVM GC Implementations

#### Serial GC
- Single-threaded collector
- Suitable for small applications and single-core machines
- Uses mark-sweep-compact algorithm

#### Parallel GC
- Multi-threaded version of serial GC
- Uses multiple threads for GC work
- Good for throughput-oriented applications

#### Concurrent Mark Sweep (CMS)
- Concurrent collection with application threads
- Minimizes pause times
- Deprecated in Java 9, removed in Java 14

#### G1 (Garbage First)
- Divides heap into regions
- Prioritizes regions with most garbage
- Balances throughput and latency
- Default GC since Java 9

#### ZGC
- Low-latency collector
- Handles heaps up to 16TB
- Pause times under 10ms
- Available since Java 11

#### Shenandoah
- Similar to ZGC
- Focuses on low pause times
- Available since Java 12

## Real-world Examples & Use Cases
1. **High-Throughput Batch Processing:** Parallel GC for applications prioritizing overall throughput over response time.
2. **Low-Latency Web Services:** G1 or ZGC for applications requiring predictable response times.
3. **Big Data Applications:** CMS or G1 for large heap sizes with concurrent collection.
4. **Embedded Systems:** Serial GC for resource-constrained environments.
5. **Real-time Systems:** ZGC or Shenandoah for applications needing sub-millisecond pauses.

## Code Examples

### Monitoring GC Activity
```java
import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.util.List;

public class GCMonitoring {
    public static void main(String[] args) {
        List<GarbageCollectorMXBean> gcBeans = ManagementFactory.getGarbageCollectorMXBeans();
        
        for (GarbageCollectorMXBean gcBean : gcBeans) {
            System.out.println("GC Name: " + gcBean.getName());
            System.out.println("Collection Count: " + gcBean.getCollectionCount());
            System.out.println("Collection Time: " + gcBean.getCollectionTime() + " ms");
            System.out.println();
        }
        
        // Force GC to see the effect
        System.gc();
        
        System.out.println("After System.gc():");
        for (GarbageCollectorMXBean gcBean : gcBeans) {
            System.out.println("GC Name: " + gcBean.getName());
            System.out.println("Collection Count: " + gcBean.getCollectionCount());
            System.out.println("Collection Time: " + gcBean.getCollectionTime() + " ms");
            System.out.println();
        }
    }
}
```

### Demonstrating Generational GC
```java
import java.util.ArrayList;
import java.util.List;

public class GenerationalGCDemo {
    
    private static class ShortLivedObject {
        private byte[] data = new byte[1024]; // 1KB object
    }
    
    private static class LongLivedObject {
        private byte[] data = new byte[1024 * 1024]; // 1MB object
        private List<ShortLivedObject> references = new ArrayList<>();
    }
    
    public static void main(String[] args) {
        List<LongLivedObject> longLived = new ArrayList<>();
        
        // Create some long-lived objects
        for (int i = 0; i < 10; i++) {
            LongLivedObject obj = new LongLivedObject();
            longLived.add(obj);
        }
        
        // Simulate application workload
        for (int iteration = 0; iteration < 100; iteration++) {
            // Create many short-lived objects
            for (int i = 0; i < 10000; i++) {
                ShortLivedObject shortObj = new ShortLivedObject();
                // Add to long-lived object's references temporarily
                if (i % 1000 == 0) {
                    longLived.get(i % 10).references.add(shortObj);
                }
                // shortObj goes out of scope here, eligible for GC
            }
            
            // Clear references to allow GC
            for (LongLivedObject obj : longLived) {
                obj.references.clear();
            }
            
            // Periodic full GC to demonstrate
            if (iteration % 10 == 0) {
                System.gc();
                System.out.println("Iteration " + iteration + ": Performed full GC");
            }
        }
        
        System.out.println("Demo completed. Long-lived objects: " + longLived.size());
    }
}
```

### GC Tuning Example
```java
// JVM arguments for G1 GC tuning:
// -XX:+UseG1GC
// -XX:MaxGCPauseMillis=200
// -XX:G1HeapRegionSize=16m
// -XX:InitiatingHeapOccupancyPercent=75
// -Xmx4g
// -Xms4g

public class G1GCTuningDemo {
    
    public static void main(String[] args) {
        System.out.println("G1 GC Tuning Demo");
        System.out.println("JVM Arguments should include G1 GC settings");
        
        // Create objects to trigger GC
        List<byte[]> objects = new ArrayList<>();
        
        for (int i = 0; i < 1000; i++) {
            // Allocate 1MB objects
            objects.add(new byte[1024 * 1024]);
            
            if (i % 100 == 0) {
                System.out.println("Created " + (i + 1) + " objects");
                // Force minor GC
                System.gc();
            }
        }
        
        System.out.println("Demo completed");
    }
}
```

## Common Pitfalls & Edge Cases
1. **Memory Leaks:** Holding references to objects longer than necessary
2. **Large Object Allocation:** Objects larger than half a region in G1 can cause issues
3. **GC Thrashing:** Too frequent GC due to small heap sizes
4. **Premature Promotion:** Objects promoted to old generation too early
5. **Humongous Objects:** Large objects in G1 that span multiple regions

## Tools & Libraries
- **JVM Tools:** jstat, jmap, jhat for GC analysis
- **VisualVM:** GUI tool for GC monitoring
- **GC Logs:** -XX:+PrintGCDetails for detailed logging
- **APM Tools:** New Relic, AppDynamics for production monitoring
- **Memory Profilers:** YourKit, JProfiler for detailed analysis

## References
- [Oracle GC Tuning Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [Baeldung Garbage Collection](https://www.baeldung.com/java-garbage-collection)
- [JVM Anatomy Park - GC](https://shipilev.net/jvm/anatomy-quarks/23-gc-anatomy/)

## Github-README Links & Related Topics
- [JVM Internals & Class Loading](../jvm-internals-class-loading/)
- [Java Memory Management](../java-memory-management/)
- [GC Tuning](../gc-tuning/)
