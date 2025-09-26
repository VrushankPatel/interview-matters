---
title: Chaos Engineering
aliases: [Chaos Testing]
tags: [#system-design,#reliability]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Chaos Engineering is the practice of intentionally introducing failures and disruptions into a system to test its resilience and identify weaknesses before they cause real issues in production.

# Detailed Explanation

By proactively simulating failures like server crashes, network outages, or resource exhaustion, teams can build confidence in their systems' ability to withstand turbulent conditions. Chaos Engineering follows principles like defining a steady state, forming hypotheses, and running experiments safely.

## Key Principles
- **Build a Hypothesis**: Predict system behavior under failure.
- **Minimize Blast Radius**: Test in controlled environments.
- **Automate**: Use tools for repeatable experiments.

# Real-world Examples & Use Cases

- **Netflix**: Uses Chaos Monkey to randomly terminate instances, ensuring redundancy.
- **Amazon**: Game Days simulate large-scale failures.
- **Google**: DiRT (Disaster Recovery Testing) for data center outages.
- **Banking**: Test failover during peak loads.

# Code Examples

## Python Script for Simple Chaos Injection
```python
import random
import time

def chaos_experiment(service):
    if random.random() < 0.1:  # 10% chance
        print("Injecting failure: killing service")
        service.kill()
    time.sleep(1)
    # Check if system recovers

# Usage
chaos_experiment(my_service)
```

## Java with Resilience4j for Circuit Breaker
```java
// Integrate chaos with resilience patterns
CircuitBreaker circuitBreaker = CircuitBreaker.ofDefaults("chaosBreaker");
Supplier<String> supplier = CircuitBreaker.decorateSupplier(circuitBreaker, () -> callService());
```

# References

- [Principles of Chaos Engineering](https://principlesofchaos.org/)
- Basiri, A., et al. "Chaos Engineering." *IEEE Software*, 2016.
- Netflix Tech Blog: "The Netflix Simian Army"

# Github-README Links & Related Topics

- [fault-tolerance-in-distributed-systems/](fault-tolerance-in-distributed-systems/)
- [monitoring-and-logging/](monitoring-and-logging/)
- [high-scalability-patterns/](high-scalability-patterns/)

# STAR Summary

- **Situation**: Unpredictable failures in production.
- **Task**: Improve system resilience.
- **Action**: Run controlled chaos experiments.
- **Result**: Identified and fixed weaknesses proactively.

# Journey / Sequence

1. Define steady state metrics (e.g., response time < 100ms).
2. Hypothesize: "Killing a server won't affect users."
3. Run experiment in staging.
4. Analyze results and remediate.
5. Repeat with increasing complexity.

# Data Models / Message Formats

- **Experiment Log**: {timestamp, failure_type, impact_metrics}

# Common Pitfalls & Edge Cases

- Over-disruption: Causing real outages.
- False positives: Temporary blips mistaken for failures.
- Cultural resistance: Teams fearing experiments.

# Tools & Libraries

- **Chaos Monkey**: Netflix's instance termination tool.
- **Gremlin**: Failure-as-a-service platform.
- **Litmus**: Kubernetes chaos engineering.