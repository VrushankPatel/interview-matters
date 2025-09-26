---
title: Java Phaser
aliases: [Java Phaser, Phaser]
tags: [#java, #concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Java Phaser

## Overview

Phaser, introduced in Java 7, is a synchronization barrier that allows threads to wait for each other at multiple synchronization points, known as phases. It provides more flexibility than CyclicBarrier or CountDownLatch.

## Detailed Explanation

Key methods:

- `register()`: Adds a party to the phaser.
- `arrive()`: Signals arrival at the current phase.
- `awaitAdvance(int phase)`: Waits for all parties to arrive at the given phase.
- `arriveAndAwaitAdvance()`: Arrives and waits for others.
- `arriveAndDeregister()`: Arrives and removes itself.

Phasers can have multiple phases, and parties can be added or removed dynamically.

## Real-world Examples & Use Cases

- Coordinating multi-phase algorithms.
- Pipeline processing where stages need to synchronize.
- Dynamic thread pools where threads join and leave.
- Implementing barriers in concurrent simulations.

## Code Examples

```java
import java.util.concurrent.Phaser;

// Simple phaser example
Phaser phaser = new Phaser(3); // 3 parties

for (int i = 0; i < 3; i++) {
    new Thread(() -> {
        System.out.println("Phase 0: Thread " + Thread.currentThread().getId());
        phaser.arriveAndAwaitAdvance(); // Wait for all

        System.out.println("Phase 1: Thread " + Thread.currentThread().getId());
        phaser.arriveAndAwaitAdvance();

        phaser.arriveAndDeregister(); // Done
    }).start();
}

// Wait for all phases
phaser.awaitAdvance(0);
System.out.println("All threads completed phase 0");

phaser.awaitAdvance(1);
System.out.println("All threads completed phase 1");
```

## Common Pitfalls & Edge Cases

- Ensure all registered parties call arrive methods to avoid deadlocks.
- Be careful with deregistration; unregistered parties can't participate.
- Phaser is not reusable like CyclicBarrier; phases advance sequentially.

## Tools & Libraries

- Java's built-in Phaser in java.util.concurrent.

## References

- [Oracle Phaser Documentation](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/Phaser.html)

## Github-README Links & Related Topics

- [Multithreading & Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)
- [Concurrent Programming Patterns](../concurrent-programming-patterns/README.md)