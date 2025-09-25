---
title: Eventual Consistency
aliases: ["Eventual Consistency Model"]
tags: ["#distributed-systems","#system-design"]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Eventual consistency is a consistency model used in distributed systems where, if no new updates are made to a given data item, eventually all accesses to that item will return the last updated value. It prioritizes availability and partition tolerance over strong consistency, as per the CAP theorem.

## Detailed Explanation

In eventual consistency, replicas of data may temporarily diverge due to network partitions or concurrent updates, but they converge to the same state over time through mechanisms like gossip protocols or conflict resolution.

### Key Concepts

- **Convergence**: All replicas eventually agree on the final value.
- **Read-your-writes**: A client sees its own writes immediately.
- **Monotonic Reads**: Once a value is read, subsequent reads return the same or newer values.
- **Causal Consistency**: Operations that are causally related are seen in order.

### Techniques

- **Version Vectors**: Track updates to detect conflicts.
- **Conflict-Free Replicated Data Types (CRDTs)**: Data structures that merge automatically.
- **Gossip Protocols**: Spread updates probabilistically.

## Real-world Examples & Use Cases

- **Amazon DynamoDB**: Uses eventual consistency for high availability, with options for strong consistency.
- **Apache Cassandra**: Default eventual consistency, with tunable consistency levels.
- **DNS Systems**: Updates propagate eventually across servers.
- **Social Media Feeds**: Posts appear eventually to all followers.
- **Collaborative Editing**: Like Google Docs, where changes merge over time.

## Code Examples

### Simple Version Vector in Python

```python
class VersionVector:
    def __init__(self):
        self.versions = {}  # node_id -> version

    def update(self, node_id):
        self.versions[node_id] = self.versions.get(node_id, 0) + 1

    def merge(self, other):
        for node, ver in other.versions.items():
            self.versions[node] = max(self.versions.get(node, 0), ver)

    def dominates(self, other):
        return all(self.versions.get(n, 0) >= other.versions.get(n, 0) for n in self.versions)
```

### CRDT Counter Example

```java
public class GCounter {
    private Map<String, Long> counts = new HashMap<>();

    public void increment(String nodeId) {
        counts.put(nodeId, counts.getOrDefault(nodeId, 0L) + 1);
    }

    public long value() {
        return counts.values().stream().mapToLong(Long::longValue).sum();
    }

    public void merge(GCounter other) {
        other.counts.forEach((node, count) -> 
            this.counts.merge(node, count, Math::max));
    }
}
```

## References

- [Eventual Consistency - Wikipedia](https://en.wikipedia.org/wiki/Eventual_consistency)
- [CAP Theorem - Brewer](https://www.cs.berkeley.edu/~brewer/cs262b-2004/PODC-keynote.pdf)
- [Dynamo Paper](https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf)

## Github-README Links & Related Topics

- [CAP Theorem and Distributed Systems](../cap-theorem-and-distributed-systems/)
- [Data Consistency Models](../data-consistency-models/)
- [Replication vs Sharding vs Partitioning](../replication-vs-sharding-vs-partitioning/)
- [Fault Tolerance in Distributed Systems](../fault-tolerance-in-distributed-systems/)
