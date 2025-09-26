---
title: Spring Boot Actuator
aliases: [Spring Actuator, Spring Boot Monitoring]
tags: [#java,#spring-boot,#monitoring]
created: 2025-09-26
updated: 2025-09-26
---

# Spring Boot Actuator

## Overview

Spring Boot Actuator provides production-ready features to help monitor and manage Spring Boot applications. It exposes various endpoints that provide insights into the application's health, metrics, environment, and more. Actuator helps in building robust, observable applications by providing out-of-the-box monitoring capabilities.

## Detailed Explanation

Actuator adds several endpoints to your application, prefixed with `/actuator` by default. These endpoints can be accessed via HTTP or JMX. Key features include:

- **Health Checks**: Monitor application health and dependencies.
- **Metrics**: Collect and expose application metrics.
- **Environment**: View configuration properties.
- **Info**: Display application information.
- **Mappings**: Show web mappings.
- **Shutdown**: Gracefully shut down the application.

### Endpoint Categories

| Endpoint | Description |
|----------|-------------|
| `/actuator/health` | Application health information |
| `/actuator/info` | Application information |
| `/actuator/metrics` | Application metrics |
| `/actuator/env` | Environment properties |
| `/actuator/mappings` | Web mappings |
| `/actuator/shutdown` | Shutdown the application |

### Security Considerations

Endpoints can expose sensitive information, so proper security configuration is crucial. Use Spring Security to restrict access.

## Real-world Examples & Use Cases

- **Health Monitoring**: Integrate with load balancers or orchestration platforms to check application health.
- **Metrics Collection**: Feed metrics to monitoring systems like Prometheus.
- **Production Debugging**: Inspect environment variables and configuration without restarting.
- **Automated Shutdown**: Implement graceful shutdown in CI/CD pipelines.
- **Custom Dashboards**: Build dashboards using actuator data for application insights.

## Code Examples

### Basic Configuration

Add the dependency to `pom.xml`:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

### Enabling Endpoints

In `application.properties`:

```properties
# Enable all endpoints
management.endpoints.web.exposure.include=*

# Enable specific endpoints
management.endpoints.web.exposure.include=health,info,metrics

# Change base path
management.endpoints.web.base-path=/manage
```

### Custom Health Indicator

```java
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class CustomHealthIndicator implements HealthIndicator {

    @Override
    public Health health() {
        // Custom health check logic
        boolean isHealthy = checkDatabaseConnection();
        if (isHealthy) {
            return Health.up().withDetail("database", "available").build();
        } else {
            return Health.down().withDetail("database", "unavailable").build();
        }
    }

    private boolean checkDatabaseConnection() {
        // Implement actual check
        return true; // Placeholder
    }
}
```

### Custom Info Contributor

```java
import org.springframework.boot.actuate.info.Info;
import org.springframework.boot.actuate.info.InfoContributor;
import org.springframework.stereotype.Component;

@Component
public class CustomInfoContributor implements InfoContributor {

    @Override
    public void contribute(Info.Builder builder) {
        builder.withDetail("app", Map.of("name", "MyApp", "version", "1.0.0"));
    }
}
```

### Accessing Metrics

```java
import org.springframework.boot.actuate.metrics.MetricsEndpoint;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MetricsController {

    private final MetricsEndpoint metricsEndpoint;

    public MetricsController(MetricsEndpoint metricsEndpoint) {
        this.metricsEndpoint = metricsEndpoint;
    }

    @GetMapping("/custom-metrics")
    public MetricsEndpoint.MetricResponse getCustomMetrics() {
        return metricsEndpoint.metric("jvm.memory.used", null);
    }
}
```

## Common Pitfalls & Edge Cases

- **Security Risks**: Exposing sensitive endpoints without authentication.
- **Performance Impact**: Metrics collection can affect performance; monitor resource usage.
- **Custom Indicators**: Ensure custom health checks don't block or timeout.
- **Endpoint Exposure**: Be selective about which endpoints to expose in production.
- **Version Compatibility**: Check compatibility with Spring Boot versions.

## Tools & Libraries

- **Spring Boot Actuator**: Core library for monitoring.
- **Micrometer**: Metrics collection facade used by Actuator.
- **Prometheus**: Monitoring system that integrates with Actuator.
- **Grafana**: Dashboard tool for visualizing metrics.

## References

- [Spring Boot Actuator Documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/actuator.html)
- [Actuator Endpoints](https://docs.spring.io/spring-boot/docs/current/actuator-api/html/)
- [Micrometer Documentation](https://micrometer.io/)
- [Spring Boot Actuator Guide](https://www.baeldung.com/spring-boot-actuators)

## Github-README Links & Related Topics

- [monitoring-and-logging](monitoring-and-logging/README.md)
- [spring-boot-microservices](spring-boot-microservices/README.md)
- [prometheus-monitoring](prometheus-monitoring/README.md)