---
title: Low Latency Systems
aliases: [Low Latency Design]
tags: [#system-design, #distributed-systems]
created: 2025-09-25
updated: 2025-09-25
---

# Low Latency Systems

## Overview
Low latency systems minimize response times (<10ms for HFT, <100ms for web). Techniques include caching, async processing, proximity, and optimization at all layers. Critical for trading, gaming, real-time analytics.

## STAR Summary
**Situation:** Built a trading platform requiring <1ms latency.  
**Task:** Optimize end-to-end delay.  
**Action:** Used kernel bypass (DPDK), colocated servers, and RDMA.  
**Result:** Achieved sub-millisecond latency, outperforming competitors.

## Detailed Explanation
Latency sources: Network, CPU, I/O, GC. Strategies: Precompute, batch, compress. Measure with tools like ping, traceroute, JMH. Capacity: 1M req/s at 10ms = 10k concurrent.

Tradeoffs: Consistency vs Latency (eventual consistency), Cost vs Performance.

## Real-world Examples & Use Cases
- High-frequency trading (HFT).
- Online gaming (e.g., Fortnite).
- Ad serving (Google Ads).

## Code Examples
### Java Low-Latency Cache
```java
import java.util.concurrent.ConcurrentHashMap;

public class LowLatencyCache<K, V> {
    private ConcurrentHashMap<K, V> cache = new ConcurrentHashMap<>();

    public V get(K key) {
        return cache.get(key);
    }

    public void put(K key, V value) {
        cache.put(key, value);
    }
}
```
Tune JVM: `java -XX:+UseG1GC -Xms4g -Xmx4g -XX:MaxGCPauseMillis=10`

## Data Models / Message Formats
| Metric | Value | Unit |
|--------|-------|------|
| P50 Latency | 5ms | ms |
| P99 Latency | 50ms | ms |

## Journey / Sequence
```mermaid
flowchart TD
    A[Request In] --> B[Edge Cache]
    B --> C[Compute Layer]
    C --> D[Data Layer]
    D --> E[Response Out]
```

## Common Pitfalls & Edge Cases
- GC pauses: Use Shenandoah/ZGC.
- Network jitter: Use TCP optimizations.
- Cold starts: Pre-warm instances.

## Tools & Libraries
- Java: Netty for async I/O, Chronicle for low-latency queues.
- Monitoring: Prometheus, Grafana.

## Github-README Links & Related Topics
[[caching-strategies]], [[distributed-tracing-and-observability]], [[performance-tuning-and-profiling]]

## References
- "Building Low Latency Applications with C++" (adapt to Java).
- https://www.infoq.com/articles/low-latency-java/
- https://netflixtechblog.com/optimizing-netflix-api/
