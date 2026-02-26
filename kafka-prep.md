# Kafka Prep

A single, interview-focused guide for Apache Kafka concepts, internals, and production use.

## Table of Contents

- [Kafka Fundamentals](#kafka-fundamentals)
- [Core Data Model](#core-data-model)
- [Producer Internals](#producer-internals)
- [Consumer Internals](#consumer-internals)
- [Delivery Semantics](#delivery-semantics)
- [Partitioning and Ordering](#partitioning-and-ordering)
- [Replication and Fault Tolerance](#replication-and-fault-tolerance)
- [Consumer Groups and Rebalancing](#consumer-groups-and-rebalancing)
- [Performance Tuning](#performance-tuning)
- [Kafka in System Design](#kafka-in-system-design)
- [Common Failure Scenarios](#common-failure-scenarios)
- [Most Asked Kafka Interview Questions](#most-asked-kafka-interview-questions)
- [Quick Revision Checklist](#quick-revision-checklist)

## Kafka Fundamentals

Kafka is a distributed event streaming platform used for high-throughput, durable, ordered logs.

Primary use cases:

- Event-driven architecture
- Real-time analytics pipelines
- Log aggregation
- Asynchronous microservice communication

## Core Data Model

- Topic: logical stream of records.
- Partition: ordered, append-only shard of a topic.
- Offset: monotonically increasing record position within partition.
- Broker: Kafka server node.
- Cluster: set of brokers.

Important property:

- Ordering is guaranteed only within a partition.

## Producer Internals

### Send Path

1. Serialize record.
2. Choose partition (key hash or custom strategy).
3. Batch records per partition.
4. Send to partition leader.

### Producer Settings (high impact)

- `acks`: `0`, `1`, `all`.
- `retries`: retry transient failures.
- `linger.ms`: waits briefly to improve batching.
- `batch.size`: max batch memory per partition.
- `compression.type`: `snappy`, `lz4`, `zstd` commonly.
- `enable.idempotence=true`: reduces duplicate writes from retries.

## Consumer Internals

### Poll Loop

- Consumer fetches records from assigned partitions.
- Application processes records.
- Offsets are committed.

### Offset Commit Modes

- Auto commit: simpler, less control.
- Manual commit: safer for at-least-once correctness.

Best practice:

- Commit offset only after successful processing.

## Delivery Semantics

- At-most-once: may lose records, no duplicates.
- At-least-once: no loss, duplicates possible.
- Exactly-once (EOS): stronger guarantees using idempotent producers + transactions + careful sink behavior.

Interview note:

- “Exactly once” is contextual and must include end-to-end boundaries.

## Partitioning and Ordering

- Same key -> same partition -> per-key ordering.
- No key -> round robin or sticky partitioner behavior.
- More partitions improves parallelism but can increase coordination and rebalance cost.

## Replication and Fault Tolerance

- Leader handles reads/writes for a partition.
- Followers replicate leader log.
- ISR (in-sync replicas) track healthy up-to-date replicas.
- `min.insync.replicas` + `acks=all` improves durability guarantees.

## Consumer Groups and Rebalancing

- Each partition is consumed by at most one consumer in a group.
- Group scales up to number of partitions.
- Rebalancing reassigns partitions when members join/leave/fail.

Rebalance strategies:

- Eager: stop-the-world reassignment.
- Cooperative sticky: reduced disruption.

## Performance Tuning

### Producer

- Increase batching and compression for throughput.
- Tune retries and timeout for reliability.

### Broker

- Disk and network throughput are common bottlenecks.
- Keep healthy ISR and monitor under-replicated partitions.

### Consumer

- Control `max.poll.records` and processing batch size.
- Pause/resume or backpressure for slow downstreams.

## Kafka in System Design

### Where Kafka Fits Well

- Event sourcing and change streams.
- Async workflows with decoupled services.
- Real-time materialized view pipelines.

### Where Kafka Is Not Ideal

- Low-latency request/response style synchronous calls.
- Small systems where operational overhead outweighs value.

## Common Failure Scenarios

1. Consumer lag keeps growing.
   - Causes: slow processing, insufficient consumers/partitions.
2. Duplicate messages seen downstream.
   - Causes: retries + non-idempotent processing.
3. Data loss concerns.
   - Causes: weak `acks`, low replication, improper retention assumptions.
4. Rebalance storms.
   - Causes: unstable consumer instances, poor timeout config.

## Most Asked Kafka Interview Questions

1. How does Kafka guarantee ordering?
2. Explain `acks=all` and `min.insync.replicas`.
3. At-least-once vs exactly-once in Kafka?
4. What happens during consumer rebalance?
5. How do you handle poison pill messages?
6. How do you scale consumers for higher throughput?
7. Why does consumer lag happen and how do you fix it?
8. Topic partition count trade-offs?
9. When should you use Kafka vs queue systems?
10. How do you design idempotent consumers?

## Quick Revision Checklist

- I can explain topic/partition/offset clearly.
- I can choose delivery semantics for a real use case.
- I can design partition key strategy intentionally.
- I can reason about lag, rebalance, and durability settings.
- I can place Kafka correctly in a full system design.

## Related

- [System Design Concepts](./system-design-concepts.md)
- [Spring Boot Prep](./spring-boot-prep.md)
- [Kubernetes and Docker Prep](./kubernetes-docker-prep.md)
