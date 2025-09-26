---
title: Distributed Consensus
aliases: [Consensus in Distributed Systems]
tags: [#distributed-systems, #system-design, #consensus]
created: 2025-09-25
updated: 2025-09-25
---

# Distributed Consensus

## Overview

Distributed consensus is the process by which a group of processes in a distributed system agree on a single value or decision. It is essential for building reliable, fault-tolerant systems.

## Detailed Explanation

In distributed systems, consensus must handle network delays, partitions, and node failures. The FLP impossibility result shows that consensus is impossible in asynchronous systems with even one faulty process.

### Key Properties

- **Agreement**: All correct processes decide the same value.
- **Validity**: The decided value was proposed by some process.
- **Termination**: All correct processes eventually decide.
- **Integrity**: No process decides twice.

### Algorithms

- Paxos, Raft, etc., as above.

Include table of algorithms.

| Algorithm | Leader-Based | Fault Tolerance | Complexity |
|-----------|--------------|-----------------|------------|
| Paxos    | No          | f failures     | High      |
| Raft     | Yes         | f failures     | Medium    |

## Real-world Examples & Use Cases

- **Configuration Management**: etcd for cluster config.
- **Database Replication**: Ensuring replicas agree on state.
- **Leader Election**: As part of consensus.

## Code Examples

High-level implementation of a simple consensus.

## Common Pitfalls & Edge Cases

- **FLP Theorem**: Impossibility in async systems.
- **Byzantine Generals**: Need algorithms like PBFT for malicious failures.

## Tools & Libraries

- Same as above.

## References

- [Impossibility of Distributed Consensus with One Faulty Process](https://groups.csail.mit.edu/tds/papers/Lynch/jacm85.pdf)

## Github-README Links & Related Topics

- [Consensus Algorithms Overview](consensus-algorithms-overview/README.md)
- [Byzantine Fault Tolerance](byzantine-fault-tolerance/README.md)
- [CAP Theorem & Distributed Systems](cap-theorem-and-distributed-systems/README.md)