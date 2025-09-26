---
title: Java 24 Features
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java 24 Features

## Overview

JDK 24, released on March 18, 2025, brings significant updates including generational Shenandoah, compact object headers, and finalizations of several preview features. It also includes security enhancements and performance improvements.

## Detailed Explanation

### Generational Shenandoah (Experimental) (JEP 404)

Introduces generational collection to Shenandoah GC.

### Compact Object Headers (Experimental) (JEP 450)

Reduces object header size for memory efficiency.

### Prepare to Restrict the Use of JNI (JEP 472)

Limits JNI for security.

### Late Barrier Expansion for G1 (JEP 475)

Optimizes G1 barrier operations.

### Key Derivation Function API (Preview) (JEP 478)

API for key derivation.

### Remove the Windows 32-bit x86 Port (JEP 479)

Deprecates 32-bit Windows support.

### Ahead-of-Time Class Loading & Linking (JEP 483)

Improves AOT compilation.

### Class-File API (JEP 484)

Finalizes the class-file API.

### Stream Gatherers (JEP 485)

Finalizes stream gatherers.

### Permanently Disable the Security Manager (JEP 486)

Removes security manager.

### Scoped Values (Fourth Preview) (JEP 487)

Further preview.

### Primitive Types in Patterns, instanceof, and switch (Second Preview) (JEP 488)

Continued preview.

### Vector API (Ninth Incubator) (JEP 489)

More incubation.

### ZGC: Remove the Non-Generational Mode (JEP 490)

Makes ZGC generational only.

### Synchronize Virtual Threads without Pinning (JEP 491)

Improves virtual thread performance.

### Flexible Constructor Bodies (Third Preview) (JEP 492)

Further preview.

### Linking Run-Time Images without JMODs (JEP 493)

Simplifies linking.

### Module Import Declarations (Second Preview) (JEP 494)

Continued.

### Simple Source Files and Instance Main Methods (Fourth Preview) (JEP 495)

Further.

### Quantum-Resistant Module-Lattice-Based Key Encapsulation Mechanism (JEP 496)

Cryptographic enhancements.

### Quantum-Resistant Module-Lattice-Based Digital Signature Algorithm (JEP 497)

More crypto.

### Warn upon Use of Memory-Access Methods in sun.misc.Unsafe (JEP 498)

Warnings for unsafe usage.

### Structured Concurrency (Fourth Preview) (JEP 499)

Continued.

### Deprecate the 32-bit x86 Port for Removal (JEP 501)

Deprecates 32-bit x86.

## Real-world Examples & Use Cases

- **Generational Shenandoah**: Better performance for applications with varying object lifetimes.
- **Compact Object Headers**: Reduces memory footprint in memory-constrained environments.
- **Key Derivation API**: Enhances security in cryptographic applications.
- **Class-File API**: Useful for bytecode manipulation tools.
- **Stream Gatherers**: Enables advanced data processing.

## Code Examples

### Stream Gatherers

```java
List<Integer> list = Stream.of(1, 2, 3, 4, 5)
    .gather(Gatherers.windowFixed(2))
    .flatMap(List::stream)
    .toList();
```

### Scoped Values

```java
ScopedValue<String> key = ScopedValue.newInstance();
ScopedValue.runWhere(key, "value", () -> {
    // use key.get()
});
```

### Primitive Types in Patterns

```java
if (obj instanceof int i) {
    System.out.println(i);
}
```

## References

- [JDK 24 Release Notes](https://openjdk.org/projects/jdk/24/)
- [JEP Index](https://openjdk.org/jeps/0)

## Github-README Links & Related Topics

- [Java 23 Features](java-23-features/)
- [Java Virtual Threads](java-virtual-threads/)
- [Garbage Collection Algorithms](garbage-collection-algorithms/)