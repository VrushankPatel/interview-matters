---
title: Circuit Breaker Pattern
aliases: [Circuit Breaker]
tags: [#system-design,#reliability]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

The Circuit Breaker pattern prevents cascading failures by stopping calls to a failing service, allowing it to recover, and providing fallback behavior.

# Detailed Explanation

Inspired by electrical circuit breakers, it monitors failures and trips when thresholds are exceeded, failing fast instead of wasting resources. States: Closed (normal), Open (blocking), Half-Open (testing recovery).

## Benefits
- **Fault Isolation**: Protects downstream services.
- **Recovery**: Allows automatic reset.
- **Fallbacks**: Graceful degradation.

# Real-world Examples & Use Cases

- **Microservices**: Prevent overload from slow APIs.
- **External APIs**: Handle third-party outages.
- **Databases**: Avoid exhausting connection pools.
- **Cloud Services**: AWS Lambda with circuit breakers.

# Code Examples

## Java with Resilience4j
```java
CircuitBreaker circuitBreaker = CircuitBreaker.ofDefaults("backendService");
Supplier<String> decoratedSupplier = CircuitBreaker.decorateSupplier(circuitBreaker, backendService::call);

String result = Try.ofSupplier(decoratedSupplier)
    .recover(throwable -> "Fallback response")
    .get();
```

## Python with Circuit Breaker
```python
from circuitbreaker import circuit

@circuit(failure_threshold=5, recovery_timeout=60)
def call_service():
    return requests.get('http://api.example.com').json()

# Usage
try:
    data = call_service()
except CircuitBreakerError:
    data = get_fallback_data()
```

# References

- Fowler, M. "Circuit Breaker." *martinfowler.com*, 2014.
- "Release It!" by Michael Nygard.
- Netflix Hystrix documentation.

# Github-README Links & Related Topics

- [fault-tolerance-in-distributed-systems/](fault-tolerance-in-distributed-systems/)
- [microservices-communication-patterns/](microservices-communication-patterns/)
- [rate-limiting/](rate-limiting/)

# STAR Summary

- **Situation**: Frequent service failures causing cascades.
- **Task**: Isolate and recover from faults.
- **Action**: Implemented circuit breaker pattern.
- **Result**: Improved system stability and user experience.

# Journey / Sequence

1. Identify unreliable dependencies.
2. Configure thresholds (failures, timeout).
3. Implement states and transitions.
4. Add monitoring and alerts.
5. Test with fault injection.

# Data Models / Message Formats

- **Breaker State**: {state, failure_count, last_failure_time}

# Common Pitfalls & Edge Cases

- Incorrect thresholds: Too sensitive or insensitive.
- Shared state: In distributed setups.
- Fallback loops: Infinite retries.

# Tools & Libraries

- **Resilience4j**: Java library.
- **Hystrix**: Netflix's tool.
- **Polly**: .NET circuit breaker.