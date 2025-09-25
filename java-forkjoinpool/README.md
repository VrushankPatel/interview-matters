---
title: Java ForkJoinPool
aliases: [Java ForkJoinPool, ForkJoinPool]
tags: [#java, #concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Java ForkJoinPool

## Overview

ForkJoinPool, introduced in Java 7, is a special ExecutorService designed for efficiently executing divide-and-conquer algorithms. It uses a work-stealing algorithm to balance load among threads.

## Detailed Explanation

Key components:

- ForkJoinPool: The executor.
- RecursiveTask<V>: For tasks that return a result.
- RecursiveAction: For tasks that don't return a result.
- fork(): Submits a task asynchronously.
- join(): Waits for task completion and gets result.

It automatically manages thread pools and steals work from busy threads to idle ones.

## Real-world Examples & Use Cases

- Parallel sorting of large arrays.
- Computing sums or aggregates on big datasets.
- Image processing with recursive algorithms.
- Tree traversals and graph algorithms.

## Code Examples

```java
import java.util.concurrent.RecursiveTask;
import java.util.concurrent.ForkJoinPool;

// Task to sum an array
class SumTask extends RecursiveTask<Long> {
    private final long[] array;
    private final int start, end;
    private static final int THRESHOLD = 1000;

    SumTask(long[] array, int start, int end) {
        this.array = array;
        this.start = start;
        this.end = end;
    }

    @Override
    protected Long compute() {
        if (end - start <= THRESHOLD) {
            long sum = 0;
            for (int i = start; i < end; i++) {
                sum += array[i];
            }
            return sum;
        } else {
            int mid = (start + end) / 2;
            SumTask left = new SumTask(array, start, mid);
            SumTask right = new SumTask(array, mid, end);
            left.fork();
            long rightResult = right.compute();
            long leftResult = left.join();
            return leftResult + rightResult;
        }
    }
}

// Usage
ForkJoinPool pool = ForkJoinPool.commonPool();
long[] array = new long[10000]; // populate array
SumTask task = new SumTask(array, 0, array.length);
long result = pool.invoke(task);
System.out.println("Sum: " + result);
```

## Common Pitfalls & Edge Cases

- Tasks should be CPU-intensive; I/O bound tasks may not benefit.
- Avoid deep recursion; use appropriate thresholds.
- Be careful with shared mutable state.

## Tools & Libraries

- Java's built-in ForkJoinPool in java.util.concurrent.

## References

- [Oracle ForkJoinPool Documentation](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ForkJoinPool.html)

## Github-README Links & Related Topics

- [Multithreading & Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)
- [Java CompletableFuture](../java-completablefuture/README.md)