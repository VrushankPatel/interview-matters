---
title: Async Logging
aliases: [asynchronous logging, non-blocking logging]
tags: [#java, #performance, #concurrency]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Async logging is a technique to perform logging operations asynchronously, preventing logging from blocking the main application thread. This improves application performance and responsiveness, especially under high load.

## Detailed Explanation

### Synchronous vs Asynchronous Logging
- **Synchronous Logging**: Logging operations block the calling thread until complete
- **Asynchronous Logging**: Logging operations are queued and processed by background threads

### Benefits
- Reduced latency for application operations
- Improved throughput under high logging volume
- Better resource utilization
- Prevention of logging bottlenecks

### Implementation Approaches
- **Queue-Based**: Log events queued and processed by worker threads
- **Ring Buffer**: High-performance circular buffer for log events
- **Batch Processing**: Grouping log events for efficient I/O

### Configuration Considerations
- Buffer sizes and overflow handling
- Thread pool sizing
- Fallback to synchronous logging on failure
- Memory usage vs performance trade-offs

## Real-world Examples & Use Cases

### High-Traffic Web Applications
- E-commerce platforms during flash sales
- Social media feeds with millions of users
- Real-time analytics dashboards

### Financial Trading Systems
- High-frequency trading platforms requiring low latency
- Transaction processing systems with audit logging requirements

### IoT Data Processing
- Sensor data ingestion with logging for each event
- Real-time monitoring systems with continuous data streams

### Microservices Architecture
- Service mesh with distributed logging
- API gateways handling thousands of requests per second

## Code Examples

### Log4j2 Async Logging Configuration

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="WARN">
    <Appenders>
        <File name="AsyncFile" fileName="logs/app.log">
            <PatternLayout pattern="%d{yyyy-MM-dd HH:mm:ss} [%t] %-5level %logger{36} - %msg%n"/>
        </File>
        <Async name="Async">
            <AppenderRef ref="AsyncFile"/>
        </Async>
    </Appenders>
    <Loggers>
        <Root level="info">
            <AppenderRef ref="Async"/>
        </Root>
    </Loggers>
</Configuration>
```

### Logback Async Appender

```xml
<configuration>
    <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>logs/app.log</file>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>logs/app.%d{yyyy-MM-dd}.log</fileNamePattern>
        </rollingPolicy>
        <encoder>
            <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>

    <appender name="ASYNC" class="ch.qos.logback.classic.AsyncAppender">
        <queueSize>512</queueSize>
        <discardingThreshold>20</discardingThreshold>
        <appender-ref ref="FILE"/>
    </appender>

    <root level="INFO">
        <appender-ref ref="ASYNC"/>
    </root>
</configuration>
```

### Custom Async Logger Implementation

```java
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class AsyncLogger {
    private final BlockingQueue<LogEvent> queue = new LinkedBlockingQueue<>();
    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    public AsyncLogger() {
        executor.submit(this::processLogs);
    }

    public void log(String message, LogLevel level) {
        try {
            queue.put(new LogEvent(message, level, System.currentTimeMillis()));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    private void processLogs() {
        while (!Thread.currentThread().isInterrupted()) {
            try {
                LogEvent event = queue.take();
                writeToFile(event);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                break;
            }
        }
    }

    private void writeToFile(LogEvent event) {
        // Actual file writing logic
        System.out.println(event.toString());
    }

    public void shutdown() {
        executor.shutdown();
    }

    private static class LogEvent {
        final String message;
        final LogLevel level;
        final long timestamp;

        LogEvent(String message, LogLevel level, long timestamp) {
            this.message = message;
            this.level = level;
            this.timestamp = timestamp;
        }

        @Override
        public String toString() {
            return timestamp + " [" + level + "] " + message;
        }
    }

    public enum LogLevel { DEBUG, INFO, WARN, ERROR }
}
```

## Common Pitfalls & Edge Cases

- **Queue Overflow**: Handling when async queue fills up
- **Lost Logs**: Ensuring no log events are dropped during shutdown
- **Memory Leaks**: Improper thread management leading to resource leaks
- **Performance Trade-offs**: Balancing async benefits with increased complexity
- **Debugging Difficulty**: Async logging can make debugging harder due to timing issues

## Tools & Libraries

- **Log4j2**: High-performance logging framework with built-in async support
- **Logback**: Successor to Log4j with async appenders
- **SLF4J**: Logging facade supporting async implementations
- **Disruptor**: High-performance inter-thread messaging library for logging
- **Fluentd**: Data collector for unified logging layer

## References

- [Log4j2 Async Logging](https://logging.apache.org/log4j/2.x/manual/async.html)
- [Logback Async Appender](https://logback.qos.ch/manual/appenders.html#AsyncAppender)
- [Async Logging Performance](https://www.slf4j.org/faq.html#performance)
- [Disruptor Pattern](https://lmax-exchange.github.io/disruptor/)

## Github-README Links & Related Topics

- [Java Multithreading and Concurrency](../java-multithreading-and-concurrency/README.md)
- [Monitoring and Logging](../monitoring-and-logging/README.md)
- [Async Logging Patterns](../async-logging/README.md)
- [Java Executorservice](../java-executorservice/README.md)