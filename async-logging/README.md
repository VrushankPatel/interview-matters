---
title: Async Logging
aliases: [Asynchronous Logging]
tags: [#logging, #concurrency, #performance]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Asynchronous logging decouples log writing from the main application thread, improving performance by preventing I/O blocking. Logs are queued and processed in background threads.

## Detailed Explanation

In synchronous logging, the application waits for log writes to complete, which can slow down operations. Async logging uses a queue and separate threads to handle logging, allowing the main thread to continue.

```mermaid
graph TD;
    A[Application Thread] -->|Log Message| B[Log Queue];
    B --> C[Background Thread];
    C -->|Write| D[File/Database/Destination];
```

### Key Components

- **Log Queue:** Buffer for log messages.
- **Background Threads:** Process the queue.
- **Overflow Handling:** Discard or block when queue full.

### Benefits

- Reduced latency.
- Better throughput.
- Non-blocking for app.

### Drawbacks

- Potential log loss if app crashes.
- Complexity in configuration.

## Real-world Examples & Use Cases

- High-traffic web servers (e.g., Nginx with async logs).
- Financial trading systems needing low latency.
- Mobile apps to avoid UI freezes.

## Code Examples

### Java with Logback Async Appender

```xml
<!-- logback.xml -->
<configuration>
  <appender name="ASYNC" class="ch.qos.logback.classic.AsyncAppender">
  <discardingThreshold>20</discardingThreshold>
  <queueSize>512</queueSize>
  <appender-ref ref="FILE" />
</appender>

<appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
  <file>logs/app.log</file>
  <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
    <fileNamePattern>logs/app.%d{yyyy-MM-dd}.%i.log</fileNamePattern>
  </rollingPolicy>
  <encoder>
    <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
  </encoder>
</appender>

<root level="INFO">
  <appender-ref ref="ASYNC" />
</root>
</configuration>
```

### Python with logging.handlers.QueueHandler

```python
import logging
import logging.handlers
import queue
import threading

# Create a queue
log_queue = queue.Queue()

# Create a queue handler
queue_handler = logging.handlers.QueueHandler(log_queue)
logger = logging.getLogger()
logger.addHandler(queue_handler)
logger.setLevel(logging.INFO)

# Listener thread
listener = logging.handlers.QueueListener(log_queue, logging.StreamHandler())
listener.start()

# Log messages
logger.info("This is an async log message")

# Stop listener
listener.stop()
```

## Common Pitfalls & Edge Cases

- Queue overflow leading to dropped logs.
- Thread safety issues.
- Configuration errors causing sync fallback.
- Edge case: System shutdown before logs flushed.

## Tools & Libraries

- Logback (Java)
- Log4j Async Appender
- Python logging with QueueHandler
- Serilog (C#)

## Github-README Links & Related Topics

- [monitoring-and-logging](../monitoring-and-logging/)
- [async-logging](../system-design/async-logging/)
- [concurrency-parallelism](../concurrency-parallelism/)

## References

- Logback Async Appender: https://logback.qos.ch/manual/appenders.html#AsyncAppender
- Python Logging Cookbook: https://docs.python.org/3/howto/logging-cookbook.html#logging-to-a-single-file-from-multiple-processes
- Async Logging Best Practices: https://www.scalyr.com/blog/async-logging/