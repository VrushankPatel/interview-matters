---
title: Event-Driven Architecture Patterns
aliases: [EDA, Event-Driven Systems]
tags: [#system-design, #architecture]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Event-Driven Architecture (EDA) is a design pattern where components communicate through events, decoupling producers and consumers for scalability and flexibility.

# Detailed Explanation

Key patterns:
- Event Sourcing: Store state as sequence of events.
- CQRS: Separate read and write models.
- Publish-Subscribe: Producers publish events, consumers subscribe.
- Event Streaming: Continuous flow of events (e.g., Kafka).

Benefits: Loose coupling, scalability, real-time processing.

# Real-world Examples & Use Cases

- E-commerce: Order placed event triggers inventory update, email notification.
- IoT: Sensor data events processed in real-time.
- Microservices: Service A emits event, Service B reacts.

# Code Examples

```java
// Simple event
public class OrderPlacedEvent {
    private String orderId;
    private String customerId;
    // getters, setters
}

// Event publisher
public interface EventPublisher {
    void publish(Event event);
}

// Event handler
@Component
public class OrderHandler {
    @EventListener
    public void handleOrderPlaced(OrderPlacedEvent event) {
        // Process order
    }
}
```

# References

- [Martin Fowler: Event Sourcing](https://martinfowler.com/eaaDev/EventSourcing.html)
- [CQRS Pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs)

# Github-README Links & Related Topics

- [Event Driven Architecture](./event-driven-architecture/README.md)
- [Event Sourcing](./event-sourcing/README.md)
- [Microservices Communication Patterns](./microservices-communication-patterns/README.md)

## Journey / Sequence

1. Event Generation: Producer creates event.
2. Event Publishing: Send to message broker.
3. Event Routing: Broker routes to subscribers.
4. Event Processing: Consumers handle events.
5. State Update: Update system state if needed.

## Common Pitfalls & Edge Cases

- Event ordering: Ensure sequence in distributed systems.
- Idempotency: Handle duplicate events.
- Event schema evolution: Versioning events.

## Tools & Libraries

- Message Brokers: Apache Kafka, RabbitMQ
- Frameworks: Spring Cloud Stream, Axon Framework
