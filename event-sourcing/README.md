---
title: Event Sourcing
aliases: []
tags: [#system-design,#architecture]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Event Sourcing ensures that all changes to application state are stored as a sequence of events. Not just can we query these events, we can also use the event log to reconstruct past states, and as a foundation to automatically adjust the state to cope with retroactive changes.

# Detailed Explanation

- **Event Log**: Sequence of events capturing all changes.
- **Complete Rebuild**: Reconstruct application state by replaying events.
- **Temporal Query**: Query application state at any point in time.
- **Event Replay**: Handle retroactive changes by reversing and replaying events.
- **Application State Storage**: Can store current state or derive from event log.
- **External Interactions**: Gateways handle external systems during replays.

Benefits include audit trails, debugging, and scalable architectures.

# Real-world Examples & Use Cases

- Accounting systems for audit and transaction tracking.
- Version control systems (e.g., Git).
- CQRS architectures for read/write separation.
- Systems requiring high auditability and temporal queries.

# Code Examples

## Domain Event

```java
public interface DomainEvent {
    void process();
    void reverse();
}

public class ArrivalEvent implements DomainEvent {
    private DateTime occurred;
    private Port port;
    private Ship ship;

    @Override
    public void process() {
        ship.handleArrival(this);
    }

    @Override
    public void reverse() {
        ship.reverseArrival(this);
    }
}
```

## Event Processor

```java
public class EventProcessor {
    private List<DomainEvent> log = new ArrayList<>();
    private boolean isActive = false;

    public void process(DomainEvent event) {
        isActive = true;
        event.process();
        isActive = false;
        log.add(event);
    }

    public List<DomainEvent> getLog() {
        return log;
    }
}
```

## Ship Domain Object

```java
public class Ship {
    private Port port;

    public void handleArrival(ArrivalEvent event) {
        this.port = event.getPort();
    }

    public void reverseArrival(ArrivalEvent event) {
        // Logic to reverse, e.g., set to previous port
    }
}
```

# References

- [Event Sourcing by Martin Fowler](https://martinfowler.com/eaaDev/EventSourcing.html)
- [CQRS and Event Sourcing](https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs)

# Github-README Links & Related Topics

- [Event Sourcing and CQRS](event-sourcing-and-cqrs/README.md)
- [System Design Basics](system-design-basics/README.md)
- [CAP Theorem & Distributed Systems](cap-theorem-and-distributed-systems/README.md)
- [Fault Tolerance in Distributed Systems](fault-tolerance-in-distributed-systems/README.md)
- [Message Queues and Brokers](message-queues-and-brokers/README.md)