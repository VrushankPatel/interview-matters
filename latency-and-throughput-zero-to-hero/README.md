---
title: Latency and Throughput Zero to Hero
aliases: [latency throughput, performance metrics]
tags: [#system-design, #performance, #scalability]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Latency and throughput are fundamental performance metrics in system design. Latency measures the time delay for a single operation, while throughput measures the rate of successful operations. Understanding and optimizing these metrics is crucial for building high-performance systems.

## Detailed Explanation

### Latency
Latency is the time taken for a request to travel from source to destination and back. It includes:
- **Network Latency**: Time for data to travel across networks
- **Disk Latency**: Time to read/write from storage
- **Processing Latency**: Time for CPU to process requests
- **Queue Latency**: Time spent waiting in queues

### Throughput
Throughput is the rate at which a system processes requests, typically measured in requests per second (RPS) or transactions per second (TPS).

### Relationship Between Latency and Throughput
- **Little's Law**: Throughput = Concurrency / Latency
- Increasing concurrency can improve throughput but may increase latency due to contention
- Optimizing for low latency often requires trade-offs with throughput

### Measuring Latency
- **Percentiles**: P50, P95, P99 latencies provide distribution insights
- **Average vs. Tail Latencies**: Average may hide performance issues for edge cases

## Real-world Examples & Use Cases

### Web Services
- API response times: Target <100ms for good UX
- Database queries: Optimize slow queries affecting overall latency

### Streaming Services
- Video buffering: Low latency critical for real-time streaming
- Data pipelines: High throughput for processing large datasets

### Financial Systems
- High-frequency trading: Microsecond latency requirements
- Payment processing: Balancing throughput with fraud detection latency

### IoT Systems
- Sensor data collection: High throughput with acceptable latency
- Real-time analytics: Low latency for immediate insights

## Code Examples

### Measuring Latency in Java

```java
import java.time.Duration;
import java.time.Instant;

public class LatencyMeasurement {
    public static void measureLatency(Runnable operation) {
        Instant start = Instant.now();
        operation.run();
        Instant end = Instant.now();
        Duration latency = Duration.between(start, end);
        System.out.println("Latency: " + latency.toMillis() + " ms");
    }

    public static void main(String[] args) {
        measureLatency(() -> {
            // Simulate operation
            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
    }
}
```

### Throughput Calculation

```java
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ThroughputCalculator {
    private AtomicLong requestCount = new AtomicLong(0);
    private ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    public void startMonitoring() {
        scheduler.scheduleAtFixedRate(() -> {
            long count = requestCount.getAndSet(0);
            System.out.println("Throughput: " + count + " requests/second");
        }, 1, 1, TimeUnit.SECONDS);
    }

    public void recordRequest() {
        requestCount.incrementAndGet();
    }
}
```

### Optimizing Latency with Async Processing

```java
import java.util.concurrent.CompletableFuture;

public class AsyncLatencyOptimization {
    public CompletableFuture<String> processAsync(String input) {
        return CompletableFuture.supplyAsync(() -> {
            // Simulate processing
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            return "Processed: " + input;
        });
    }

    public static void main(String[] args) {
        AsyncLatencyOptimization optimizer = new AsyncLatencyOptimization();
        Instant start = Instant.now();
        CompletableFuture<String> future = optimizer.processAsync("data");
        future.thenAccept(result -> {
            Instant end = Instant.now();
            System.out.println("Async Latency: " + Duration.between(start, end).toMillis() + " ms");
        });
    }
}
```

## Common Pitfalls & Edge Cases

- **Latency Spikes**: Sudden increases due to garbage collection or network issues
- **Throughput Limits**: System saturation leading to performance degradation
- **Measurement Bias**: Not accounting for cold starts or cache misses
- **Network Variability**: Latency fluctuations in distributed systems
- **Resource Contention**: CPU, memory, or I/O bottlenecks affecting both metrics

## Tools & Libraries

- **Apache JMeter**: Load testing and performance measurement
- **Grafana**: Visualization of latency and throughput metrics
- **Prometheus**: Monitoring and alerting for performance metrics
- **New Relic**: Application performance monitoring
- **Micrometer**: Metrics collection for Java applications

## References

- [Latency vs Throughput](https://en.wikipedia.org/wiki/Latency_(engineering))
- [Little's Law](https://en.wikipedia.org/wiki/Little%27s_law)
- [Performance Best Practices](https://developers.google.com/web/fundamentals/performance/)
- [System Performance Tuning](https://www.brendangregg.com/linuxperf.html)

## Github-README Links & Related Topics

- [High Scalability Patterns](../high-scalability-patterns/README.md)
- [Distributed Tracing](../distributed-tracing/README.md)
- [Load Balancing and Strategies](../load-balancing-and-strategies/README.md)
- [Monitoring and Logging](../monitoring-and-logging/README.md)