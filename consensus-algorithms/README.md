---
title: Consensus Algorithms
aliases: ["Distributed Consensus"]
tags: ["#distributed-systems","#system-design"]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Consensus algorithms enable a group of distributed processes to agree on a single value or decision, even in the presence of failures. They are fundamental to fault-tolerant distributed systems.

## Detailed Explanation

Consensus ensures safety (agreement, validity, termination) and liveness properties.

### Key Algorithms

- **Paxos**: Classic consensus protocol with proposer, acceptor, learner roles.
- **Raft**: Simpler alternative to Paxos, used in etcd, Consul.
- **ZAB**: Used in ZooKeeper.
- **PBFT**: Practical Byzantine Fault Tolerance for Byzantine failures.

### Phases in Paxos

1. Prepare
2. Accept
3. Learn

## Real-world Examples & Use Cases

- **Leader Election**: In Kubernetes, etcd uses Raft.
- **Distributed Databases**: Spanner uses Paxos for transactions.
- **Blockchain**: Proof-of-work for consensus.

## Code Examples

### Raft Leader Election Pseudocode

```python
class RaftNode:
    def __init__(self):
        self.term = 0
        self.voted_for = None

    def request_vote(self, candidate_id, term):
        if term > self.term:
            self.term = term
            self.voted_for = candidate_id
            return True
        return False
```

## References

- [Consensus in Distributed Systems](https://en.wikipedia.org/wiki/Consensus_(computer_science))

## Github-README Links & Related Topics

- [Paxos Algorithm](../paxos-algorithm/)
- [Raft and Leader Election](../raft-and-leader-election/)
- [Zookeeper for Coordination](../zookeeper-for-coordination/)
