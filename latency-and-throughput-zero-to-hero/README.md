---
title: Latency and Throughput Zero to Hero
aliases: [Latency Throughput Guide]
tags: [#system-design, #performance]
created: 2025-09-25
updated: 2025-09-25
---

# Latency and Throughput Zero to Hero

## Overview

Latency is the time delay between a request and its response, while throughput is the rate at which requests are processed. This guide covers measurement, optimization techniques, and trade-offs from basic concepts to advanced strategies.

## Detailed Explanation

### Latency

- **Definition**: Time for a single operation to complete
- **Types**: Network latency, disk I/O latency, processing latency, queueing latency
- **Measurement**: Use percentiles (P50, P95, P99) for distribution
- **Units**: Milliseconds (ms), microseconds (μs), nanoseconds (ns)

### Throughput

- **Definition**: Number of operations per unit time
- **Metrics**: Requests per second (RPS), transactions per second (TPS)
- **Factors**: CPU, memory, I/O bandwidth, concurrency

### Trade-offs

- High throughput often increases latency due to queuing
- Low latency may limit throughput due to resource constraints
- Optimization: Balance based on application requirements

## Real-world Examples & Use Cases

### Web Application

- Low latency for user experience (<100ms for interactive)
- High throughput for scalability (10k+ RPS)
- Example: Google search results

### Database Queries

- Latency: Optimize query execution time
- Throughput: Handle concurrent connections
- Example: OLTP vs OLAP systems

### Streaming Service

- Low latency for real-time data
- High throughput for large user base
- Example: Netflix video streaming

## Code Examples

### Java Latency Measurement

```java
import java.time.Duration;
import java.time.Instant;

public class LatencyExample {
    public static void main(String[] args) {
        Instant start = Instant.now();
        // Simulate operation
        try { Thread.sleep(10); } catch (InterruptedException e) {}
        Instant end = Instant.now();
        long latency = Duration.between(start, end).toMillis();
        System.out.println("Latency: " + latency + " ms");
    }
}
```

### Throughput Test with JMH

```java
@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
public class ThroughputBenchmark {
    @Benchmark
    public void testThroughput() {
        // Operation to benchmark
        int result = 0;
        for (int i = 0; i < 1000; i++) {
            result += i;
        }
    }
}
```

## References

- [Latency vs Throughput](https://www.nginx.com/blog/latency-vs-throughput/)
- [Measuring Latency](https://www.brendangregg.com/usemethod.html)

## Github-README Links & Related Topics

- [Caching](caching/README.md)
- [Load Balancing and Strategies](load-balancing-and-strategies/README.md)
- [Rate Limiting](rate-limiting/README.md)
- [Performance Optimization Techniques](performance-optimization-techniques/README.md)