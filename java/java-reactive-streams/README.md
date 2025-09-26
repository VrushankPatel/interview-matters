---
title: Java Reactive Streams
aliases: [Reactive Streams, Flow API]
tags: [#java,#reactive,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Java Reactive Streams

## Overview

Java Reactive Streams, introduced in Java 9 via the Flow API, provides a standard for asynchronous stream processing with non-blocking backpressure. It's the foundation for reactive programming in Java.

## Detailed Explanation

Reactive Streams defines four interfaces: Publisher, Subscriber, Subscription, and Processor. It ensures that fast data sources don't overwhelm slow consumers through backpressure.

Key principles:
- Asynchronous processing
- Non-blocking
- Backpressure handling
- Composability

### Reactive Streams Flow

```mermaid
graph TD
    A[Publisher] -->|onSubscribe| B[Subscriber]
    B -->|request(n)| C[Subscription]
    C -->|onNext| B
    B -->|cancel| C
    C -->|onComplete/onError| B
```

## Real-world Examples & Use Cases

- Streaming data processing (e.g., log analysis)
- Real-time analytics
- Event-driven systems
- High-throughput messaging
- Reactive web applications

## Code Examples

### Simple Publisher and Subscriber

```java
import java.util.concurrent.Flow.*;

public class SimpleReactive {
    public static void main(String[] args) {
        SubmissionPublisher<String> publisher = new SubmissionPublisher<>();
        
        publisher.subscribe(new Subscriber<>() {
            private Subscription subscription;
            
            @Override
            public void onSubscribe(Subscription subscription) {
                this.subscription = subscription;
                subscription.request(1);
            }
            
            @Override
            public void onNext(String item) {
                System.out.println("Received: " + item);
                subscription.request(1);
            }
            
            @Override
            public void onError(Throwable throwable) {
                throwable.printStackTrace();
            }
            
            @Override
            public void onComplete() {
                System.out.println("Done");
            }
        });
        
        publisher.submit("Hello");
        publisher.submit("Reactive");
        publisher.submit("Streams");
        publisher.close();
    }
}
```

### Custom Publisher

```java
public class RangePublisher implements Publisher<Integer> {
    private final int start;
    private final int end;
    
    public RangePublisher(int start, int end) {
        this.start = start;
        this.end = end;
    }
    
    @Override
    public void subscribe(Subscriber<? super Integer> subscriber) {
        subscriber.onSubscribe(new RangeSubscription(subscriber, start, end));
    }
    
    static class RangeSubscription implements Subscription {
        // Implementation details...
    }
}
```

## References

- [Reactive Streams Specification](https://www.reactive-streams.org/)
- [Oracle Flow API Guide](https://docs.oracle.com/en/java/javase/21/core/flow-api.html)

## Github-README Links & Related Topics

- [Java Virtual Threads](../java-virtual-threads/README.md)
- [Event-Driven Systems](../event-driven-systems/README.md)
- [Message Queues and Brokers](../message-queues-and-brokers/README.md)