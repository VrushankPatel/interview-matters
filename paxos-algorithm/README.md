---
title: Paxos Algorithm
aliases: []
tags: [#distributed-systems, #consensus-algorithms]
created: 2025-09-25
updated: 2025-09-25
---

# Paxos Algorithm

## Overview

Paxos is a family of protocols for solving consensus in a network of unreliable processors. It ensures that a single value is chosen, even in the presence of failures, and once chosen, that value is learned by all correct processes.

## Detailed Explanation

Paxos involves three roles: Proposers, Acceptors, and Learners. The algorithm proceeds in two phases: Prepare and Accept.

### Phases

1. **Prepare Phase**: Proposer sends prepare request with proposal number
2. **Accept Phase**: If majority accept, proposer sends accept request

### Safety Properties

- Only a value that has been proposed may be chosen
- Only one value is chosen
- A process never learns a value unless it has been chosen

### Liveness

- Eventually, a value is chosen if a majority of processes are correct

```mermaid
sequenceDiagram
    participant P as Proposer
    participant A1 as Acceptor 1
    participant A2 as Acceptor 2
    participant A3 as Acceptor 3
    participant L as Learner

    P->>A1: Prepare(n)
    P->>A2: Prepare(n)
    P->>A3: Prepare(n)
    A1-->>P: Promise(n, prev)
    A2-->>P: Promise(n, prev)
    A3-->>P: Promise(n, prev)
    P->>A1: Accept(n, v)
    P->>A2: Accept(n, v)
    P->>A3: Accept(n, v)
    A1-->>P: Accepted(n, v)
    A2-->>P: Accepted(n, v)
    A3-->>P: Accepted(n, v)
    A1-->>L: Learn(v)
    A2-->>L: Learn(v)
    A3-->>L: Learn(v)
```

## Real-world Examples & Use Cases

- Google's Chubby lock service
- Apache ZooKeeper (uses ZAB, similar to Paxos)
- Distributed databases for leader election

## Code Examples

### Simplified Paxos Pseudocode

```python
class Paxos:
    def __init__(self, acceptors):
        self.acceptors = acceptors
        self.proposal_number = 0

    def propose(self, value):
        self.proposal_number += 1
        # Prepare phase
        promises = []
        for acceptor in self.acceptors:
            promise = acceptor.prepare(self.proposal_number)
            if promise:
                promises.append(promise)
        
        if len(promises) > len(self.acceptors) // 2:
            # Choose value
            max_accepted = max((p.accepted_proposal for p in promises if p.accepted_proposal), default=None)
            if max_accepted:
                value = max_accepted.value
            
            # Accept phase
            accepts = 0
            for acceptor in self.acceptors:
                if acceptor.accept(self.proposal_number, value):
                    accepts += 1
            
            if accepts > len(self.acceptors) // 2:
                return value
        return None
```

## References

- [Paxos Made Simple](https://lamport.azurewebsites.net/pubs/paxos-simple.pdf)
- [The Part-Time Parliament](https://lamport.azurewebsites.net/pubs/lamport-paxos.pdf)
- [Paxos Wikipedia](https://en.wikipedia.org/wiki/Paxos_(computer_science))

## Github-README Links & Related Topics

- [consensus-algorithms](../consensus-algorithms/README.md)
- [raft-and-leader-election](../raft-and-leader-election/README.md)
- [zookeeper-for-coordination](../zookeeper-for-coordination/README.md)