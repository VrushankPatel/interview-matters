# System Design Concepts

A structured guide for high-level design interviews: from requirement gathering to trade-offs and production concerns.

## Table of Contents

- [Interview Flow](#interview-flow)
- [Requirement Gathering](#requirement-gathering)
- [Capacity Estimation](#capacity-estimation)
- [Core Building Blocks](#core-building-blocks)
- [Data Layer Design](#data-layer-design)
- [Caching](#caching)
- [Messaging and Async Processing](#messaging-and-async-processing)
- [Scalability and Availability](#scalability-and-availability)
- [Consistency and Distributed Systems](#consistency-and-distributed-systems)
- [Reliability and Fault Tolerance](#reliability-and-fault-tolerance)
- [Observability](#observability)
- [Security](#security)
- [API Design Principles](#api-design-principles)
- [System Design Round Checklist](#system-design-round-checklist)

## Interview Flow

1. Clarify functional and non-functional requirements.
2. Define scale (RPS, data volume, latency, availability target).
3. Propose high-level architecture.
4. Deep dive into bottlenecks and trade-offs.
5. Address data model, reliability, and operations.

## Requirement Gathering

### Functional

- What must the system do?
- Key user journeys?
- Read-heavy or write-heavy?

### Non-Functional

- Latency target (p95/p99).
- Throughput target.
- Availability/SLA/SLO.
- Durability and compliance constraints.

## Capacity Estimation

Estimate quickly and speak numbers.

- Requests per second.
- Peak factor (2x, 5x, seasonal spikes).
- Storage/day and retention period.
- Network bandwidth.
- Cache size needed for hot set.

## Core Building Blocks

- Client / CDN
- API Gateway / Load Balancer
- Stateless application services
- Cache layer
- Database(s)
- Message broker
- Object storage
- Search index
- Monitoring/logging/tracing pipeline

## Data Layer Design

### SQL vs NoSQL

- SQL: strong consistency, joins, structured schema.
- NoSQL: scale-out patterns, flexible models, specialized access patterns.

### Partitioning and Sharding

- Shard by user ID/hash/time/region.
- Handle hot partitions via key strategy and traffic shaping.

### Replication

- Leader-follower for read scaling and failover.
- Multi-region replication for disaster resilience.

## Caching

### Use Cases

- Reduce database load.
- Improve p99 latency.

### Patterns

- Cache-aside.
- Write-through.
- Write-behind (careful with durability and ordering).

### Pitfalls

- Cache stampede.
- Invalidation complexity.
- Hot key imbalance.

## Messaging and Async Processing

- Queue for decoupling and retries.
- Pub/Sub for event fanout.
- Idempotent consumers for safe retries.
- Dead letter queue for poison messages.

## Scalability and Availability

- Horizontal scaling of stateless services.
- Auto-scaling policies based on CPU/latency/queue lag.
- Multi-AZ deployment as default baseline.
- Graceful degradation under partial failure.

## Consistency and Distributed Systems

- CAP trade-offs: consistency vs availability under partition.
- Eventual consistency for non-critical async views.
- Strong consistency for critical writes (payments, inventory correctness boundaries).
- Consensus and leader election concepts where coordination is required.

## Reliability and Fault Tolerance

- Timeouts, retries, circuit breaker.
- Bulkheads to isolate failing dependencies.
- Backpressure to protect downstream services.
- Rate limiting and load shedding.
- Disaster recovery: RTO/RPO planning.

## Observability

- Logs: structured and correlated.
- Metrics: RED/USE style dashboards.
- Traces: distributed call path and latency breakdown.
- Alerts: actionable with clear ownership.

## Security

- AuthN/AuthZ (JWT, OAuth2, RBAC).
- Encryption in transit and at rest.
- Secret rotation and secure storage.
- Input validation, abuse controls, audit logs.

## API Design Principles

- Clear resource modeling.
- Idempotency for retries (`PUT`, idempotency keys for `POST`).
- Versioning strategy.
- Pagination, filtering, sorting.
- Backward compatibility.

## System Design Round Checklist

- I can estimate scale with rough numbers quickly.
- I can justify DB/cache/message-broker choices.
- I can identify bottlenecks and mitigation plans.
- I can discuss failure modes and resilience controls.
- I can adapt design when interviewer changes constraints.

## Related

- [System Design Questions](./system-design-questions.md)
- [CS Fundamentals](./cs-fundamentals.md)
- [Kafka Prep](./kafka-prep.md)
- [Kubernetes and Docker Prep](./kubernetes-docker-prep.md)
