---
title: Distributed Locks
aliases: [Distributed Locking]
tags: [#distributed-systems,#concurrency]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Distributed locks ensure mutual exclusion across multiple processes or nodes in a distributed system, preventing race conditions and data corruption.

# Detailed Explanation

In single-machine apps, locks use OS primitives, but distributed systems need coordination via shared storage like Redis or ZooKeeper. Algorithms like Redlock prevent deadlocks and ensure safety.

## Types
- **Exclusive Locks**: One holder at a time.
- **Read-Write Locks**: Multiple readers, single writer.

# Real-world Examples & Use Cases

- **Database Transactions**: Prevent concurrent updates.
- **Job Scheduling**: Ensure cron jobs don't overlap.
- **Leader Election**: In clusters like Kubernetes.
- **Rate Limiting**: Shared counters across services.

# Code Examples

## Redis Distributed Lock
```python
import redis

def acquire_lock(lock_key, ttl=10):
    r = redis.Redis()
    return r.set(lock_key, 'locked', nx=True, ex=ttl)

def release_lock(lock_key):
    r = redis.Redis()
    r.delete(lock_key)

# Usage
if acquire_lock('my_lock'):
    # Critical section
    release_lock('my_lock')
```

## Java with Redisson
```java
RedissonClient redisson = Redisson.create();
RLock lock = redisson.getLock("myLock");
lock.lock();
try {
    // Critical section
} finally {
    lock.unlock();
}
```

# References

- [Redis Distributed Locks](https://redis.io/docs/manual/patterns/distributed-locks/)
- "Distributed Systems" by Maarten van Steen.
- Redlock Algorithm by Redis.

# Github-README Links & Related Topics

- [concurrency-parallelism/](concurrency-parallelism/)
- [zookeeper-for-coordination/](zookeeper-for-coordination/)
- [database-connection-pooling/](database-connection-pooling/)

# STAR Summary

- **Situation**: Race conditions in distributed apps.
- **Task**: Ensure exclusive access.
- **Action**: Implement distributed locks with Redis.
- **Result**: Eliminated data inconsistencies.

# Journey / Sequence

1. Choose lock provider (Redis/ZooKeeper).
2. Implement acquire/release logic.
3. Handle timeouts and failures.
4. Test for deadlocks.
5. Monitor lock contention.

# Data Models / Message Formats

- **Lock Record**: {key, owner, expiry}

# Common Pitfalls & Edge Cases

- Clock skew: Causes incorrect expiries.
- Network partitions: Split-brain scenarios.
- Lock leaks: Forgotten unlocks.

# Tools & Libraries

- **Redis**: SET NX command.
- **ZooKeeper**: Ephemeral nodes.
- **Redisson**: Java client.