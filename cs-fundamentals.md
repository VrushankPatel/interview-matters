# CS Fundamentals

A revision-first guide for operating systems, networking, databases, and distributed systems basics used in interviews.

## Table of Contents

- [Operating Systems](#operating-systems)
- [Networking](#networking)
- [Databases](#databases)
- [Concurrency Fundamentals](#concurrency-fundamentals)
- [Distributed Systems Fundamentals](#distributed-systems-fundamentals)
- [Quick Interview Questions](#quick-interview-questions)

## Operating Systems

### Processes vs Threads

- Process: isolated memory space.
- Thread: shared memory within process.
- Context switch between threads is usually cheaper than process switch.

### Scheduling

- Round Robin, Priority, MLFQ basics.
- CPU-bound vs IO-bound behavior and scheduler implications.

### Memory Management

- Virtual memory abstraction.
- Paging and page faults.
- Thrashing when working set exceeds memory.

### Synchronization

- Mutex, semaphore, monitor concepts.
- Deadlock conditions: mutual exclusion, hold-and-wait, no preemption, circular wait.

## Networking

### TCP/IP Basics

- TCP: reliable, ordered byte stream.
- UDP: connectionless, low overhead.
- IP handles addressing and routing.

### HTTP and HTTPS

- HTTP methods, status codes, headers.
- TLS handshake basics and certificate role.
- HTTP/2 multiplexing and header compression.

### Load Balancing

- L4 vs L7 balancing.
- Algorithms: round robin, least connections, weighted variants.

### Common Practical Topics

- Timeouts, retries, exponential backoff.
- Keep-alive and connection pooling.
- DNS caching impact on failover.

## Databases

### ACID and Transactions

- Atomicity, Consistency, Isolation, Durability.
- Isolation anomalies: dirty read, non-repeatable read, phantom read.

### Indexing

- B-tree indexes for range and equality queries.
- Composite index left-prefix rule.
- Over-indexing harms write throughput.

### Normalization and Denormalization

- Normalize for consistency and reduced redundancy.
- Denormalize for read-heavy performance when justified.

### Replication and Sharding

- Replication for availability/read scaling.
- Sharding for write and storage scaling.
- Hot shard problem and key choice.

## Concurrency Fundamentals

- Race condition, deadlock, starvation, livelock.
- Critical section design.
- Happens-before and memory visibility concepts.
- Immutability and message passing reduce shared-state bugs.

## Distributed Systems Fundamentals

### Consistency and Availability

- Understand CAP in partition scenarios.
- Strong consistency vs eventual consistency trade-offs.

### Consensus and Coordination

- Leader election idea and quorum logic.
- Split-brain risk and fencing.

### Reliability Patterns

- Idempotency keys.
- At-least-once delivery with deduplication.
- Circuit breaker and bulkhead patterns.

## Quick Interview Questions

1. Difference between process and thread?
2. What causes deadlock and how to prevent it?
3. Explain TCP 3-way handshake.
4. Why does an index speed reads but hurt writes?
5. What are transaction isolation levels?
6. Replication vs sharding?
7. What is eventual consistency and where is it acceptable?
8. How do you design idempotent write APIs?

## Related

- [Java Prep](./java-prep.md)
- [System Design Concepts](./system-design-concepts.md)
- [Problem Solving Prep](./problem-solving-prep.md)
