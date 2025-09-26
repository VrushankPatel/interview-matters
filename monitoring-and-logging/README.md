---
title: Monitoring and Logging
aliases: [observability, system monitoring]
tags: [#devops, #system-design, #reliability]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Monitoring and logging are essential practices for maintaining system health, diagnosing issues, and ensuring reliability. Monitoring provides real-time insights into system performance, while logging captures historical data for analysis and debugging.

## Detailed Explanation

### Monitoring
Monitoring involves collecting, analyzing, and alerting on system metrics and health indicators.

#### Key Metrics
- **System Metrics**: CPU, memory, disk, network usage
- **Application Metrics**: Response times, error rates, throughput
- **Business Metrics**: User engagement, conversion rates
- **Infrastructure Metrics**: Server health, container status

#### Monitoring Types
- **Infrastructure Monitoring**: Hardware and OS level metrics
- **Application Monitoring**: Code-level performance and errors
- **Business Monitoring**: User-facing functionality and KPIs
- **Synthetic Monitoring**: Simulated user interactions

### Logging
Logging involves recording events, errors, and state changes for later analysis.

#### Log Levels
- **DEBUG**: Detailed information for debugging
- **INFO**: General information about application operation
- **WARN**: Potentially harmful situations
- **ERROR**: Error conditions that don't stop execution
- **FATAL**: Severe errors that cause program abortion

#### Structured Logging
Using consistent formats (JSON) for logs to enable better querying and analysis.

## Real-world Examples & Use Cases

### E-commerce Platform
- Monitor checkout flow conversion rates
- Log payment transaction details for audit trails
- Alert on high error rates during peak traffic

### Microservices Architecture
- Distributed tracing for request flows across services
- Centralized logging for correlating events
- Health checks for service discovery

### Cloud Infrastructure
- Auto-scaling based on CPU utilization metrics
- Log aggregation from multiple instances
- Anomaly detection for security threats

### IoT Systems
- Monitor device connectivity and data ingestion rates
- Log sensor readings for historical analysis
- Alert on device failures or unusual patterns

## Code Examples

### Java Logging with SLF4J

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    public User getUser(Long id) {
        logger.debug("Fetching user with id: {}", id);
        try {
            User user = userRepository.findById(id);
            logger.info("Successfully retrieved user: {}", user.getName());
            return user;
        } catch (Exception e) {
            logger.error("Failed to retrieve user with id: {}", id, e);
            throw e;
        }
    }
}
```

### Structured Logging with JSON

```java
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StructuredLogger {
    private static final Logger logger = LoggerFactory.getLogger(StructuredLogger.class);
    private static final ObjectMapper mapper = new ObjectMapper();

    public void logUserAction(String action, String userId, Map<String, Object> details) {
        Map<String, Object> logEntry = new HashMap<>();
        logEntry.put("timestamp", Instant.now());
        logEntry.put("action", action);
        logEntry.put("userId", userId);
        logEntry.put("details", details);

        try {
            String jsonLog = mapper.writeValueAsString(logEntry);
            logger.info("User action: {}", jsonLog);
        } catch (Exception e) {
            logger.error("Failed to serialize log entry", e);
        }
    }
}
```

### Metrics Collection with Micrometer

```java
import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.stereotype.Service;

@Service
public class MetricsService {
    private final Counter requestCounter;
    private final Timer requestTimer;

    public MetricsService(MeterRegistry registry) {
        this.requestCounter = Counter.builder("http_requests_total")
                .description("Total HTTP requests")
                .register(registry);
        this.requestTimer = Timer.builder("http_request_duration")
                .description("HTTP request duration")
                .register(registry);
    }

    public void recordRequest() {
        requestCounter.increment();
    }

    public void recordRequestDuration(Runnable operation) {
        requestTimer.record(operation);
    }
}
```

## Common Pitfalls & Edge Cases

- **Log Noise**: Excessive logging impacting performance
- **Missing Context**: Logs without sufficient information for debugging
- **Security Concerns**: Sensitive data in logs
- **Distributed Tracing Complexity**: Correlating logs across services
- **Alert Fatigue**: Too many alerts leading to ignored warnings

## Tools & Libraries

- **ELK Stack**: Elasticsearch, Logstash, Kibana for log aggregation and visualization
- **Prometheus**: Monitoring and alerting toolkit
- **Grafana**: Analytics and monitoring dashboards
- **Splunk**: Enterprise logging and monitoring platform
- **Datadog**: Cloud monitoring and analytics

## References

- [Monitoring Best Practices](https://landing.google.com/sre/sre-book/chapters/monitoring-distributed-systems/)
- [Logging Best Practices](https://12factor.net/logs)
- [Observability](https://opentelemetry.io/docs/concepts/observability-principles/)
- [SLF4J Documentation](https://www.slf4j.org/)

## Github-README Links & Related Topics

- [Distributed Tracing](../distributed-tracing/README.md)
- [Async Logging](../async-logging/README.md)
- [Infrastructure Monitoring](../infrastructure-monitoring/README.md)
- [DevOps & Infrastructure as Code](../devops-and-infrastructure-as-code/README.md)