---
title: CAP Theorem & Distributed Systems
aliases: [CAP Theorem, Distributed Systems Basics]
tags: [#distributed-systems,#cap-theorem,#system-design]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

The CAP Theorem, formulated by Eric Brewer in 2000, states that in a distributed system, it is impossible to simultaneously guarantee Consistency, Availability, and Partition Tolerance. Distributed systems are networks of independent computers that appear as a single coherent system to users. Understanding CAP helps architects make informed trade-offs when designing systems that must handle network failures, high loads, and data replication across multiple nodes.

# Detailed Explanation

Distributed systems consist of multiple interconnected nodes that communicate over a network. They face challenges like latency, bandwidth limitations, and partial failures.

## CAP Theorem Components
- **Consistency**: Every read receives the most recent write or an error. All nodes see the same data simultaneously.
- **Availability**: Every request receives a response, without guaranteeing it contains the most recent data.
- **Partition Tolerance**: The system continues to operate despite network partitions (communication breakdowns between nodes).

According to CAP, you can achieve at most two of these three properties in the presence of network partitions.

## Trade-offs
- **CP (Consistency + Partition Tolerance)**: Sacrifices availability; e.g., systems wait for consistency during partitions (e.g., HBase, MongoDB with strict consistency).
- **AP (Availability + Partition Tolerance)**: Sacrifices consistency; accepts eventual consistency (e.g., Cassandra, DynamoDB).
- **CA (Consistency + Availability)**: Assumes no partitions; rare in real-world distributed systems (e.g., single-node databases).

## Related Concepts
- **Eventual Consistency**: Data becomes consistent over time, not immediately.
- **ACID vs BASE**: ACID (Atomicity, Consistency, Isolation, Durability) for strong consistency; BASE (Basically Available, Soft state, Eventually consistent) for high availability.
- **Consensus Algorithms**: Paxos, Raft for achieving consistency in distributed systems.

## Distributed System Patterns
- **Replication**: Copying data across nodes for redundancy.
- **Sharding**: Splitting data across nodes.
- **Load Balancing**: Distributing requests.
- **Fault Tolerance**: Handling node failures.

# Real-world Examples & Use Cases

- **Banking Systems**: Prioritize consistency (CP) to ensure accurate transaction records, accepting temporary unavailability during network issues.
- **Social Media (e.g., Twitter)**: Favor availability (AP) for posting tweets, allowing eventual consistency for timelines.
- **E-commerce (e.g., Amazon)**: Use AP for product availability, with eventual consistency for inventory updates.
- **DNS Systems**: Employ eventual consistency for global name resolution.
- **File Storage (e.g., Dropbox)**: Balance CP for file integrity with replication for availability.

# Code Examples

### Simple Distributed Counter (Pseudocode for AP System)
```python
class DistributedCounter:
    def __init__(self, nodes):
        self.nodes = nodes  # List of node values

    def increment(self):
        for node in self.nodes:
            node.value += 1  # Eventual consistency

    def get_value(self):
        return sum(node.value for node in self.nodes)  # Approximate value
```

### Consensus with Raft (Simplified)
```java
// Simplified Raft leader election
class RaftNode {
    int term = 0;
    boolean isLeader = false;

    void requestVote() {
        // Send vote requests to peers
        // If majority votes, become leader
    }
}
```

# Common Pitfalls & Edge Cases

- **Network Partitions**: Test systems under partition scenarios; many fail unexpectedly.
- **Clock Skew**: Distributed systems rely on synchronized clocks; use NTP or logical clocks.
- **Split Brain**: Multiple leaders emerge; implement quorum-based decisions.
- **Data Conflicts**: Resolve with last-write-wins or conflict-free replicated data types (CRDTs).
- **Scalability Limits**: Over-replication increases latency; balance with sharding.

# References

- [Brewer's CAP Theorem](https://www.infoq.com/articles/cap-twelve-years-later-how-the-rules-have-changed/)
- [CAP Theorem Explained](https://en.wikipedia.org/wiki/CAP_theorem)
- [Distributed Systems for Fun and Profit](http://book.mixu.net/distsys/)
- [Martin Kleppmann's DDIA](https://dataintensive.net/)
- [Paxos Made Simple](https://lamport.azurewebsites.net/pubs/paxos-simple.pdf)

# Github-README Links & Related Topics

- [Consensus Algorithms](../consensus-algorithms/)
- [Distributed Caching with Redis](../distributed-caching-with-redis/)
- [Fault Tolerance in Distributed Systems](../fault-tolerance-in-distributed-systems/)
- [Replication vs Sharding vs Partitioning](../replication-vs-sharding-vs-partitioning/)
