---
title: Garbage Collection Algorithms
aliases: [GC Algorithms, Java Garbage Collection]
tags: [#java,#jvm,#gc]
created: 2025-09-25
updated: 2025-09-25
---

# Garbage Collection Algorithms

## Overview

Garbage collection (GC) is a form of automatic memory management that reclaims memory occupied by objects that are no longer in use by the program. Invented by John McCarthy in 1959 for Lisp, GC eliminates the need for manual memory deallocation, preventing common errors like dangling pointers, double frees, and memory leaks. In languages like Java, C#, and Go, GC is integral to the runtime, while in others like C++ and Rust, it's optional or handled differently.

GC algorithms vary in complexity, performance, and pause times. They typically involve identifying "garbage" (unreachable objects) and reclaiming their memory. Key strategies include tracing (e.g., mark-sweep, mark-compact) and reference counting. In the JVM, HotSpot VM offers multiple collectors like Serial, Parallel, CMS, G1, ZGC, and Shenandoah, each suited for different workloads.

## Detailed Explanation

GC algorithms determine which objects are live (reachable from root references like stack variables, static fields) and collect the rest. Here's a breakdown of major types:

### Tracing Garbage Collection

Tracing starts from root objects and marks all reachable objects. Unmarked objects are garbage.

#### Mark-Sweep
- **How it works**: Mark phase traverses the heap to mark live objects; sweep phase reclaims unmarked memory.
- **Pros**: Simple, no object movement.
- **Cons**: Fragmentation, unpredictable pauses.
- **Diagram**:
  ```mermaid
  graph TD
      A[Root Objects] --> B[Mark Live Objects]
      B --> C[Sweep Unmarked Memory]
      C --> D[Heap with Fragmentation]
  ```

#### Mark-Compact
- **How it works**: After marking, moves live objects to one end of the heap, compacting them.
- **Pros**: Eliminates fragmentation, better cache locality.
- **Cons**: Higher overhead due to compaction.
- **Diagram**:
  ```mermaid
  graph TD
      A[Mark Phase] --> B[Compact Live Objects]
      B --> C[Free Contiguous Space]
  ```

#### Copying (Semi-Space)
- **How it works**: Divides heap into two spaces; copies live objects from one to the other, discarding the old space.
- **Pros**: Fast allocation, no fragmentation.
- **Cons**: Requires 2x heap space, copies data.
- **Diagram**:
  ```mermaid
  graph TD
      A[From Space] --> B[Copy Live to To Space]
      B --> C[Swap Roles]
  ```

### Generational GC
Exploits the "generational hypothesis": most objects die young. Divides heap into young (eden, survivors) and old generations.

- **Young Gen**: Frequent minor GCs (copying).
- **Old Gen**: Less frequent major GCs (mark-sweep/compact).
- **Example**: JVM's G1 uses regions across generations.

### Reference Counting
Each object has a count of references. When count reaches zero, object is freed.

- **Pros**: Immediate reclamation, no pauses.
- **Cons**: Cyclic references, overhead per reference update.
- **Variants**: Deferred (e.g., CPython's cycle detector).

### Other Algorithms
- **Concurrent/Incremental**: Run GC concurrently with application (e.g., CMS, ZGC).
- **Real-Time**: Bounded pauses (e.g., Metronome).
- **Escape Analysis**: Compile-time optimization to stack-allocate objects.

| Algorithm | Pros | Cons | Use Case |
|-----------|------|------|----------|
| Mark-Sweep | Simple | Fragmentation | Embedded systems |
| Mark-Compact | No fragmentation | Slower | General-purpose |
| Copying | Fast, no frag | 2x space | Young gen in generational |
| Reference Counting | Immediate | Cycles, overhead | Python, Swift |
| Generational | Efficient | Complex | JVM, .NET |

## Real-world Examples & Use Cases

- **JVM HotSpot Collectors**:
  - **Serial**: Single-threaded, for small apps.
  - **Parallel**: Multi-threaded, for throughput.
  - **CMS**: Concurrent, low pauses for web servers.
  - **G1**: Regional, balanced for large heaps.
  - **ZGC/Shenandoah**: Ultra-low pauses for real-time apps.
- **Use Cases**:
  - High-throughput batch processing: Parallel GC.
  - Low-latency web services: G1 or ZGC.
  - Embedded/IoT: Simple mark-sweep.
  - Functional languages (Haskell, ML): Tracing GC.
- **Examples**: Netflix uses G1 for microservices; financial systems opt for low-pause collectors to avoid transaction delays.

## Code Examples

### Java: Observing GC Behavior
```java
public class GCExample {
    public static void main(String[] args) {
        // Allocate objects
        for (int i = 0; i < 100000; i++) {
            new Object();
        }
        // Force GC
        System.gc();
        // JVM flags: -XX:+PrintGCDetails -XX:+PrintGCTimeStamps
    }
}
```
Run with: `java -XX:+PrintGCDetails GCExample.java`

### JVM Tuning Flags
- Serial: `-XX:+UseSerialGC`
- Parallel: `-XX:+UseParallelGC`
- G1: `-XX:+UseG1GC -XX:MaxGCPauseMillis=200`
- ZGC: `-XX:+UseZGC`

### Python: Reference Counting Example
```python
import gc
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

# Create cycle
a = Node(1)
b = Node(2)
a.next = b
b.next = a  # Cycle

del a, b  # Ref count doesn't go to zero
gc.collect()  # Manual cycle detection
```

## Common Pitfalls & Edge Cases

- **Memory Leaks**: Holding references unintentionally (e.g., static collections).
- **GC Pauses**: Long pauses in stop-the-world collectors; mitigate with concurrent GC.
- **Fragmentation**: In mark-sweep; use compacting algorithms.
- **Cyclic References**: Reference counting fails; use tracing.
- **Large Objects**: Promotion to old gen; tune survivor ratios.
- **Edge Case**: Finalizers can resurrect objects, complicating GC.

## Tools & Libraries

- **JVM Tools**: `jstat`, `jmap`, `jconsole` for monitoring.
- **VisualVM**: GUI for heap analysis.
- **GC Logs**: `-Xlog:gc*` for detailed logging.
- **Libraries**: JOL (Java Object Layout) for object size; Eclipse Memory Analyzer for heap dumps.
- **Third-party**: Shenandoah in OpenJDK; Azul Zing for C4 collector.

## References

- [Garbage Collection (Wikipedia)](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science))
- [Java HotSpot VM Garbage Collection Tuning Guide](https://docs.oracle.com/en/java/javase/21/gctuning/)
- [JVM Options](https://www.oracle.com/java/technologies/javase/vmoptions-jsp.html)
- Jones, Richard; Hosking, Antony; Moss, J. Eliot B. *The Garbage Collection Handbook*. CRC Press, 2011.
- Wilson, Paul R. "Uniprocessor Garbage Collection Techniques". *Memory Management*, 1992.

## Github-README Links & Related Topics

- [GC Tuning](../gc-tuning/)
- [Java Memory Management](../java-memory-management/)
- [JVM Internals and Class Loading](../../jvm-internals-and-class-loading/)
- [Memory Models](../memory-models/)
- [Java Memory Model and Concurrency](../java-memory-model-and-concurrency/)