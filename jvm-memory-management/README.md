---
title: JVM Memory Management
aliases: [JVM Memory, Java Memory Management]
tags: [#java,#jvm]
created: 2025-09-26
updated: 2025-09-26
---

# JVM Memory Management

## Overview

JVM Memory Management involves the allocation, usage, and reclamation of memory in the Java Virtual Machine. It includes memory areas like Heap, Stack, and Metaspace, and mechanisms like Garbage Collection to ensure efficient memory usage and prevent leaks.

## Detailed Explanation

### Memory Areas

- **Heap**: Stores objects and arrays. Divided into Young Generation (Eden, Survivor spaces) and Old Generation.
- **Stack**: Stores method calls, local variables, and partial results. Each thread has its own stack.
- **Metaspace**: Replaces PermGen in Java 8+, stores class metadata, constants, and method bytecode.
- **Program Counter (PC) Register**: Holds the address of the current JVM instruction.
- **Native Method Stack**: For native methods.

### Garbage Collection

GC automatically reclaims memory occupied by unreachable objects.

- **Generational GC**: Young GC (minor), Old GC (major/full).
- **GC Algorithms**: Serial, Parallel, CMS, G1, ZGC, Shenandoah.
- **Tuning**: JVM flags like `-Xmx`, `-Xms`, `-XX:+UseG1GC`.

### Memory Allocation

- Objects allocated in Eden space.
- Survived objects move to Survivor, then Old Gen.
- Large objects may go directly to Old Gen.

### Memory Leaks

Caused by strong references preventing GC. Use tools like VisualVM or MAT for analysis.

## Real-world Examples & Use Cases

- **Web Applications**: Tuning heap size for high-traffic sites.
- **Batch Processing**: Adjusting GC for long-running jobs.
- **Microservices**: Memory limits in containers.
- **Performance Monitoring**: Using JMX to monitor memory usage.

## Code Examples

### JVM Memory Options

```bash
java -Xmx2g -Xms1g -XX:+UseG1GC MyApp
```

### Monitoring Memory Usage

```java
Runtime runtime = Runtime.getRuntime();
long totalMemory = runtime.totalMemory();
long freeMemory = runtime.freeMemory();
long usedMemory = totalMemory - freeMemory;
System.out.println("Used Memory: " + usedMemory / (1024 * 1024) + " MB");
```

### Custom Object Allocation

```java
public class MemoryExample {
    public static void main(String[] args) {
        List<byte[]> list = new ArrayList<>();
        for (int i = 0; i < 1000; i++) {
            list.add(new byte[1024 * 1024]); // 1MB each
        }
        // Force GC
        System.gc();
    }
}
```

### Weak References

```java
WeakReference<String> weakRef = new WeakReference<>(new String("Hello"));
System.out.println(weakRef.get()); // Hello
System.gc();
System.out.println(weakRef.get()); // null
```

## Common Pitfalls & Edge Cases

- **OutOfMemoryError**: Heap space, PermGen/Metaspace.
- **StackOverflowError**: Deep recursion.
- **Memory Fragmentation**: In Old Gen.
- **GC Pauses**: Long pauses in high-throughput apps.

## Tools & Libraries

- **VisualVM**: GUI for monitoring JVM.
- **JConsole**: JMX-based monitoring.
- **MAT (Memory Analyzer Tool)**: Heap dump analysis.
- **GC Logs**: `-Xlog:gc*` for logging.

## References

- [Oracle JVM Memory Management](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [Java Memory Model](https://docs.oracle.com/javase/specs/jls/se17/html/jls-17.html)
- [Baeldung: JVM Memory](https://www.baeldung.com/jvm-memory)

## Github-README Links & Related Topics

- [Garbage Collection Algorithms](../garbage-collection-algorithms/README.md)
- [JVM Internals](../java-virtual-machine-jvm-architecture/README.md)
- [Java Memory Model](../java-memory-model-and-concurrency/README.md)
