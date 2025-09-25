---
title: Distributed Tracing and Observability
aliases: [tracing, observability, distributed tracing]
tags: [#system-design, #distributed-systems, #interviews]
created: 2025-09-25
updated: 2025-09-25
---

# Distributed Tracing and Observability

## Overview

Distributed tracing and observability are critical components in modern microservices architectures, enabling engineers to monitor, debug, and optimize complex systems. Distributed tracing tracks the flow of requests across multiple services, providing visibility into latency, errors, and dependencies. Observability extends this by incorporating logs, metrics, and traces to give a holistic view of system health and performance. This topic covers the principles, tools, and best practices for implementing observability in distributed systems, with a focus on interview-relevant scenarios.

## STAR Summary

**Situation:** At a large e-commerce platform, user checkout failures spiked during peak traffic, affecting revenue.

**Task:** Diagnose and resolve intermittent failures in the order processing pipeline involving 15 microservices.

**Action:** Implemented distributed tracing using OpenTelemetry and Jaeger, added structured logging with correlation IDs, and set up real-time dashboards with Prometheus and Grafana for metrics visualization.

**Result:** Identified a bottleneck in the payment service due to database connection pooling issues, reduced checkout failure rate by 75%, and improved average response time by 40%.

## Detailed Explanation

### Distributed Tracing

Distributed tracing involves capturing and visualizing the path of a request as it traverses through various services. Each service operation is represented as a "span," and related spans form a "trace." Key concepts include:

- **Trace ID:** A unique identifier for the entire request flow.
- **Span ID:** Identifies individual operations within a trace.
- **Span Context:** Includes trace ID, span ID, and metadata like baggage for custom data.
- **Sampling:** Decides which traces to capture to balance performance and visibility (e.g., probabilistic sampling).

Propagation is typically done via headers (e.g., W3C Trace Context or B3).

### Observability Pillars

- **Logs:** Detailed records of events, errors, and state changes. Use structured logging (JSON) for searchability.
- **Metrics:** Aggregated data like request count, latency percentiles, error rates. Tools like Prometheus use time-series databases.
- **Traces:** End-to-end request paths for causality analysis.

### Instrumentation

Automatic instrumentation (e.g., via OpenTelemetry agents) or manual span creation. For Java, use libraries like Micrometer for metrics and OpenTelemetry for tracing.

## Real-world Examples & Use Cases

- **Microservices Debugging:** Trace a user login request through authentication, user service, and database layers to pinpoint slow queries.
- **Incident Response:** During outages, traces help isolate failing components (e.g., a downstream API timeout).
- **Performance Optimization:** Identify hot paths in code causing latency spikes.
- **Compliance:** In finance, traces ensure audit trails for transactions.

## Code Examples

### Java Tracing with OpenTelemetry

```java
import io.opentelemetry.api.trace.Span;
import io.opentelemetry.api.trace.Tracer;
import io.opentelemetry.context.Scope;

public class OrderService {

    private static final Tracer tracer = OpenTelemetry.getGlobalTracer("order-service");

    public Order processOrder(String orderId) {
        Span span = tracer.spanBuilder("processOrder")
                .setAttribute("order.id", orderId)
                .startSpan();
        try (Scope scope = span.makeCurrent()) {
            // Simulate business logic
            validateOrder(orderId);
            span.addEvent("Order validated");
            return new Order(orderId);
        } catch (Exception e) {
            span.recordException(e);
            span.setStatus(StatusCode.ERROR, e.getMessage());
            throw e;
        } finally {
            span.end();
        }
    }

    private void validateOrder(String orderId) {
        // Validation logic
    }
}
```

### Maven Setup

```xml
<dependencies>
    <dependency>
        <groupId>io.opentelemetry</groupId>
        <artifactId>opentelemetry-api</artifactId>
        <version>1.15.0</version>
    </dependency>
    <dependency>
        <groupId>io.opentelemetry</groupId>
        <artifactId>opentelemetry-sdk</artifactId>
        <version>1.15.0</version>
    </dependency>
    <dependency>
        <groupId>io.micrometer</groupId>
        <artifactId>micrometer-registry-prometheus</artifactId>
        <version>1.9.0</version>
    </dependency>
</dependencies>
```

Run with: `mvn compile exec:java -Dexec.mainClass="com.example.OrderService"`

## Data Models / Message Formats

### Trace Span Model

| Field | Type | Description |
|-------|------|-------------|
| traceId | String (UUID) | Unique trace identifier |
| spanId | String (UUID) | Unique span identifier |
| parentSpanId | String | Parent span ID (null for root) |
| name | String | Operation name (e.g., "http_request") |
| startTime | Long (Unix timestamp) | Start time in nanoseconds |
| endTime | Long | End time in nanoseconds |
| attributes | Map<String, Object> | Key-value metadata (e.g., {"http.method": "GET"}) |
| events | List<Event> | Timed events within span |
| status | Status | OK, ERROR, etc. |

### Sample Trace JSON

```json
{
  "traceId": "12345678-1234-1234-1234-123456789abc",
  "spans": [
    {
      "spanId": "abcd1234-5678-9012-3456-789abcdef012",
      "name": "checkout",
      "startTime": 1640995200000000000,
      "endTime": 1640995201000000000,
      "attributes": {"user.id": "user123"}
    }
  ]
}
```

## Journey / Sequence

```mermaid
sequenceDiagram
    participant User
    participant Gateway
    participant AuthService
    participant OrderService
    participant PaymentService
    participant DB

    User->>Gateway: POST /checkout (traceId: abc123)
    Gateway->>AuthService: Authenticate (spanId: def456, parent: abc123)
    AuthService-->>Gateway: OK
    Gateway->>OrderService: Create Order (spanId: ghi789, parent: abc123)
    OrderService->>PaymentService: Process Payment (spanId: jkl012, parent: ghi789)
    PaymentService->>DB: Query Balance
    DB-->>PaymentService: Balance OK
    PaymentService-->>OrderService: Payment Success
    OrderService-->>Gateway: Order Created
    Gateway-->>User: 200 OK
```

## Common Pitfalls & Edge Cases

- **Header Propagation Failures:** Missing trace context in async calls or third-party integrations leads to broken traces.
- **High Cardinality Metrics:** Too many unique tag combinations in metrics can overwhelm storage.
- **Sampling Bias:** Fixed sampling rates may miss rare but critical errors.
- **Clock Synchronization:** Distributed clocks can cause inaccurate span timings; use NTP.
- **Security:** Traces may contain sensitive data; sanitize before storage.

## Tools & Libraries

- **OpenTelemetry:** Open-source instrumentation for traces, metrics, logs.
- **Jaeger:** Distributed tracing backend with UI for visualization.
- **Zipkin:** Alternative tracing system.
- **Prometheus + Grafana:** Metrics collection and dashboards.
- **ELK Stack (Elasticsearch, Logstash, Kibana):** Log aggregation and analysis.
- **Datadog, New Relic:** Commercial observability platforms.

## Github-README Links & Related Topics

[[system-design-basics]], [[load-balancing-and-routing]], [[message-queues-and-kafka]], [[event-sourcing-and-cqrs]]

Related: [[consistency-and-availability]], [[partitioning-and-sharding]]

## References

- https://opentelemetry.io/docs/concepts/observability-primer/
- https://www.jaegertracing.io/docs/
- https://prometheus.io/docs/introduction/overview/
- https://grafana.com/docs/grafana/latest/
</content>
</xai:function_call name="write">
<parameter name="filePath">networking/networking-tcp-ip-http2-tls/README.md