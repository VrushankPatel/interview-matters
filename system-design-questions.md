# System Design Questions

A curated question bank for system design interviews with focus points and expected depth.

## How To Use

For each question:

1. Clarify requirements and traffic assumptions.
2. Draw HLD.
3. Deep dive into data model + scaling bottlenecks.
4. Cover reliability, consistency, security, and observability.

## Foundational Questions

### 1. Design URL Shortener

Focus:
- Key generation strategy
- Redirect latency
- Read-heavy caching
- Analytics pipeline separation

### 2. Design Rate Limiter

Focus:
- Token bucket vs leaky bucket vs sliding window
- Distributed counter consistency
- Burst handling and fairness

### 3. Design Notification Service

Focus:
- Multi-channel delivery (email/SMS/push)
- Retry and dead letter flows
- User preference and idempotency

### 4. Design API Gateway

Focus:
- Routing, auth, rate limits
- Gateway vs service mesh boundaries
- Failure isolation

## Intermediate Questions

### 5. Design Chat Application (WhatsApp/Slack style)

Focus:
- WebSocket connection scale
- Message ordering and delivery semantics
- Presence, unread counts, media handling

### 6. Design News Feed

Focus:
- Fanout-on-write vs fanout-on-read
- Ranking pipeline
- Cache invalidation for feed updates

### 7. Design Video Streaming Platform

Focus:
- Upload, transcoding, storage tiers
- CDN strategy
- Playback resilience and regional failover

### 8. Design Ride Sharing System

Focus:
- Geospatial indexing
- Driver-rider matching
- Real-time state updates

### 9. Design E-commerce Platform

Focus:
- Catalog, cart, order, payment boundaries
- Inventory consistency strategy
- Checkout failure handling

## Advanced Questions

### 10. Design Payment System

Focus:
- Ledger correctness and idempotency keys
- Exactly-once effects at business layer
- Reconciliation and audit requirements

### 11. Design Distributed Cache

Focus:
- Eviction policy and memory strategy
- Replication and consistency model
- Hot key mitigation

### 12. Design Job Scheduler

Focus:
- Delay/retry/backoff
- Worker coordination and lease model
- Throughput vs fairness trade-offs

### 13. Design Search Autocomplete

Focus:
- Trie/index design
- Ranking and freshness
- Query latency optimization

### 14. Design Real-time Analytics Pipeline

Focus:
- Event ingestion and partitioning
- Stream processing and windowing
- Late events and reprocessing strategy

### 15. Design Multi-tenant SaaS

Focus:
- Tenant isolation models
- Per-tenant rate and storage controls
- Noisy neighbor mitigation

## Typical Follow-up Probes

- What breaks first at 10x traffic?
- How do you migrate schema with zero downtime?
- What is your data retention and archival policy?
- How do you monitor correctness, not just uptime?
- How do you do regional failover?
- What trade-off did you choose and why?

## Quick Evaluation Rubric (Self)

- Requirements clarity: 20%
- Architecture correctness: 25%
- Scale and data decisions: 20%
- Reliability and failure handling: 20%
- Communication and trade-offs: 15%

## Related

- [System Design Concepts](./system-design-concepts.md)
- [Kafka Prep](./kafka-prep.md)
- [Kubernetes and Docker Prep](./kubernetes-docker-prep.md)
