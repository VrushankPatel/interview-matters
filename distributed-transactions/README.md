---
title: Distributed Transactions
aliases: ["Distributed Transaction Management"]
tags: ["#distributed-systems","#system-design","#databases"]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Distributed transactions ensure that a set of operations across multiple distributed systems are executed atomically, maintaining ACID properties even in failure scenarios. They address the challenge of coordinating changes across services that may span different databases, networks, or geographic locations.

## Detailed Explanation

In monolithic systems, transactions are straightforward using database mechanisms. However, in distributed systems, transactions involve multiple services or databases, introducing complexities like network failures, partial commits, and coordination overhead.

### Key Concepts

- **Atomicity**: All operations succeed or all fail.
- **Consistency**: System state remains valid.
- **Isolation**: Concurrent transactions don't interfere.
- **Durability**: Changes persist despite failures.

### Common Protocols

- **Two-Phase Commit (2PC)**: A coordinator collects votes from participants before committing.
- **Three-Phase Commit (3PC)**: Extends 2PC with a pre-commit phase to reduce blocking.
- **Saga Pattern**: Uses compensating transactions for long-running processes, avoiding locks.

### Challenges

- **Network Partitions**: Can lead to split-brain scenarios.
- **Performance**: Coordination adds latency.
- **Scalability**: Traditional protocols don't scale well.

## Real-world Examples & Use Cases

- **Banking Systems**: Transferring funds between accounts in different banks requires atomicity to prevent partial transfers.
- **E-commerce Platforms**: Placing an order involves inventory deduction, payment processing, and shipping coordination.
- **Microservices Coordination**: Updating user profiles across multiple services (e.g., auth, billing, notifications).
- **Distributed Databases**: Cross-shard transactions in systems like Google Spanner.

## Code Examples

### Two-Phase Commit Pseudocode

```python
class Coordinator:
    def __init__(self, participants):
        self.participants = participants

    def commit_transaction(self):
        # Phase 1: Prepare
        for p in self.participants:
            if not p.prepare():
                self.abort()
                return False
        
        # Phase 2: Commit
        for p in self.participants:
            p.commit()
        return True

    def abort(self):
        for p in self.participants:
            p.abort()

class Participant:
    def prepare(self):
        # Check if can commit
        return True  # or False based on logic
    
    def commit(self):
        # Apply changes
    
    def abort(self):
        # Rollback changes
```

### Saga Pattern in Java

```java
public class OrderSaga {
    public void processOrder(Order order) {
        try {
            reserveInventory(order);
            processPayment(order);
            shipOrder(order);
        } catch (Exception e) {
            compensate(order);
        }
    }

    private void compensate(Order order) {
        // Reverse operations
        cancelShipment(order);
        refundPayment(order);
        releaseInventory(order);
    }
}
```

### XA Transactions with JTA

```java
@Stateless
public class DistributedService {
    @Resource
    private UserTransaction utx;

    public void transfer(Account from, Account to, double amount) throws Exception {
        utx.begin();
        try {
            from.debit(amount);
            to.credit(amount);
            utx.commit();
        } catch (Exception e) {
            utx.rollback();
            throw e;
        }
    }
}
```

## Journey / Sequence

1. **Transaction Initiation**: A client or service starts a distributed transaction.
2. **Preparation Phase**: Coordinator sends prepare requests; participants vote yes/no.
3. **Decision Phase**: If all vote yes, coordinator sends commit; else abort.
4. **Execution Phase**: Participants apply or rollback changes.
5. **Recovery**: In case of failure, use logs to recover state.

## Common Pitfalls & Edge Cases

- **Coordinator Failure**: In 2PC, participants may block indefinitely.
- **Heuristic Decisions**: Participants might unilaterally commit or abort.
- **Timeout Handling**: Network delays can cause premature aborts.
- **Nested Transactions**: Complex hierarchies increase failure points.
- **Cross-Domain Issues**: Regulatory or security constraints in multi-cloud setups.

## Tools & Libraries

- **JTA (Java Transaction API)**: For XA transactions in Java EE.
- **Spring Transaction Management**: Supports distributed transactions via JTA.
- **Eventuate Framework**: Implements saga pattern for microservices.
- **Atomikos**: Open-source transaction manager for Java.
- **Microsoft DTC**: Distributed Transaction Coordinator for Windows.

## References

- [Distributed Transactions - Wikipedia](https://en.wikipedia.org/wiki/Distributed_transaction)
- [Saga Pattern - Microservices.io](https://microservices.io/patterns/data/saga.html)
- [Two-Phase Commit - ACM](https://dl.acm.org/doi/10.1145/1283920.1283935)
- [XA Specification](https://pubs.opengroup.org/onlinepubs/009680699/toc.pdf)

## Github-README Links & Related Topics

- [CAP Theorem & Distributed Systems](../cap-theorem-and-distributed-systems/)
- [ACID vs BASE Tradeoffs](../acid-vs-base-tradeoffs/)
- [Microservices Architecture](../microservices-architecture/)
- [Database Replication Strategies](../database-replication-strategies/)
- [Fault Tolerance in Distributed Systems](../fault-tolerance-in-distributed-systems/)