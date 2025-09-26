---
title: Data Consistency Models
aliases: ["Consistency Models"]
tags: ["#distributed-systems","#system-design"]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Data consistency models define the rules for how and when data updates are visible across a distributed system. They balance trade-offs between consistency, availability, and partition tolerance, as outlined in the CAP theorem.

## Detailed Explanation

Consistency models range from strong to weak, each with different guarantees.

### Types of Consistency Models

- **Strong Consistency**: All reads see the most recent write (e.g., linearizability).
- **Eventual Consistency**: Updates propagate eventually.
- **Causal Consistency**: Causally related operations are seen in order.
- **Sequential Consistency**: Operations appear in a global order.
- **Weak Consistency**: No guarantees beyond eventual consistency.

### Trade-offs

| Model | Consistency | Availability | Partition Tolerance | Example |
|-------|-------------|--------------|---------------------|---------|
| Strong | High | Low | Low | ACID databases |
| Eventual | Low | High | High | NoSQL like DynamoDB |

## Real-world Examples & Use Cases

- **Banking Systems**: Require strong consistency for transactions.
- **Social Networks**: Use eventual consistency for timelines.
- **File Systems**: Sequential consistency for shared files.
- **Distributed Caches**: Weak consistency for performance.

## Code Examples

### Linearizability Check in Go

```go
// Simplified linearizability test
func isLinearizable(operations []Operation) bool {
    // Check if operations can be ordered to match real-time order
    // Implementation omitted for brevity
    return true
}
```

### Eventual Consistency with Vector Clocks

```python
# As in eventual consistency example
```

## References

- [Consistency Models - Wikipedia](https://en.wikipedia.org/wiki/Consistency_model)
- [CAP Theorem](https://en.wikipedia.org/wiki/CAP_theorem)

## Github-README Links & Related Topics

- [CAP Theorem and Distributed Systems](../cap-theorem-and-distributed-systems/)
- [Eventual Consistency](../eventual-consistency/)
- [Replication vs Sharding vs Partitioning](../replication-vs-sharding-vs-partitioning/)
