---
title: Performance analysis tools
aliases: [JMH, VisualVM, Profiling]
tags: [#java,#performance]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Profiling tools help analyze Java application performance, identifying bottlenecks in CPU, memory, and I/O.

# Detailed Explanation

## VisualVM

- Free tool for monitoring JVM.
- CPU profiling, memory heap analysis, thread dumps.

## JMH (Java Microbenchmark Harness)

- For accurate microbenchmarks.
- Avoids JIT optimizations issues.

## JProfiler

- Commercial tool for detailed profiling.
- Database, heap walker, CPU views.

# Real-world Examples & Use Cases

- Identifying memory leaks.
- Optimizing hot methods.
- Analyzing thread contention.

# Code Examples

```java
// JMH benchmark example
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
public class MyBenchmark {
    @Benchmark
    public void testMethod() {
        // code to benchmark
    }
}
```

# References

- [VisualVM](https://visualvm.github.io/)
- [JMH](https://openjdk.java.net/projects/code-tools/jmh/)

# Github-README Links & Related Topics

- [Performance Tuning and Profiling](java/performance-tuning-and-profiling/README.md)
- [JVM Performance Tuning](java/jvm-performance-tuning/README.md)