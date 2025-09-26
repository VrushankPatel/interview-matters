---
title: Java 25 Features
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java 25 Features

## Overview

JDK 25, released on September 16, 2025, is an LTS release with major finalizations including stable scoped values, finalized module imports, and new experimental features for profiling and ahead-of-time compilation.

## Detailed Explanation

### PEM Encodings of Cryptographic Objects (Preview) (JEP 470)

Support for PEM encodings.

### Stable Values (Preview) (JEP 502)

New preview for stable values.

### Remove the 32-bit x86 Port (JEP 503)

Removes 32-bit support.

### Structured Concurrency (Fifth Preview) (JEP 505)

Continued.

### Scoped Values (JEP 506)

Finalizes scoped values.

### Primitive Types in Patterns, instanceof, and switch (Third Preview) (JEP 507)

Continued.

### Vector API (Tenth Incubator) (JEP 508)

More incubation.

### JFR CPU-Time Profiling (Experimental) (JEP 509)

Experimental profiling.

### Key Derivation Function API (JEP 510)

Finalizes KDF API.

### Module Import Declarations (JEP 511)

Finalizes module imports.

### Compact Source Files and Instance Main Methods (JEP 512)

Finalizes simple source files.

### Flexible Constructor Bodies (JEP 513)

Finalizes flexible constructors.

### Ahead-of-Time Command-Line Ergonomics (JEP 514)

Improves AOT CLI.

### Ahead-of-Time Method Profiling (JEP 515)

AOT profiling.

### JFR Cooperative Sampling (JEP 518)

JFR enhancements.

### Compact Object Headers (JEP 519)

Finalizes compact headers.

### JFR Method Timing & Tracing (JEP 520)

More JFR.

### Generational Shenandoah (JEP 521)

Finalizes generational Shenandoah.

## Real-world Examples & Use Cases

- **Scoped Values**: For sharing context in concurrent applications.
- **Module Import Declarations**: Simplifies module usage.
- **Vector API**: For high-performance computations.
- **JFR Profiling**: For performance monitoring.

## Code Examples

### Scoped Values

```java
ScopedValue<String> user = ScopedValue.newInstance();
String result = ScopedValue.callWhere(user, "admin", () -> {
    return "Hello " + user.get();
});
```

### Module Import Declarations

```java
import module java.base;
import java.util.List;
```

### Flexible Constructor Bodies

```java
public Example(int x) {
    this.value = switch (x) {
        case 0 -> 0;
        default -> x * 2;
    };
}
```

## References

- [JDK 25 Release Notes](https://openjdk.org/projects/jdk/25/)
- [JEP Index](https://openjdk.org/jeps/0)

## Github-README Links & Related Topics

- [Java 24 Features](java-24-features/)
- [Java Vector API](java-vector-api/)
- [Monitoring and Logging](monitoring-and-logging/)