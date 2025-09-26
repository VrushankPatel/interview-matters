---
title: Java 26 Features
aliases: []
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

# Java 26 Features

## Overview

JDK 26 is planned for release in September 2026. Current targeted features include removal of the Applet API, HTTP/3 support, and G1 throughput improvements.

## Detailed Explanation

### Remove the Applet API (JEP 504)

Removes deprecated Applet classes.

### HTTP/3 for the HTTP Client API (JEP 517)

Adds HTTP/3 support.

### G1 GC: Improve Throughput by Reducing Synchronization (JEP 522)

Optimizes G1 synchronization.

## Real-world Examples & Use Cases

- **HTTP/3**: For modern web applications requiring low-latency connections.
- **G1 Improvements**: Better performance for high-throughput applications.

## Code Examples

### HTTP/3 Client

```java
HttpClient client = HttpClient.newBuilder()
    .version(Version.HTTP_3)
    .build();
```

## References

- [JDK 26 Project](https://openjdk.org/projects/jdk/26/)
- [JEP Index](https://openjdk.org/jeps/0)

## Github-README Links & Related Topics

- [Java 25 Features](java-25-features/)
- [API Design Best Practices](api-design-best-practices/)