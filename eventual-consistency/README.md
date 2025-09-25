---
title: Eventual Consistency
aliases: []
tags: [#distributed-systems, #data-consistency]
created: 2025-09-25
updated: 2025-09-25
---

# Eventual Consistency

## Overview

Eventual consistency is a consistency model used in distributed systems where, if no new updates are made to a given data item, eventually all accesses to that item will return the last updated value. It prioritizes availability and partition tolerance over strong consistency.

## Detailed Explanation

In CAP theorem terms, eventual consistency allows for AP (Availability and Partition tolerance) systems. Updates propagate asynchronously through the system, and conflicts are resolved using techniques like last-write-wins or conflict-free replicated data types (CRDTs).

### Key Concepts

- **Replication Lag**: Time between update and propagation to all replicas
- **Conflict Resolution**: Strategies for handling concurrent updates
- **Read Your Writes**: Guarantee that a process can read its own writes
- **Monotonic Reads**: Once a value is read, future reads won't return older values

### Trade-offs

Pros: High availability, low latency writes

Cons: Stale reads possible, complex conflict resolution

## Real-world Examples & Use Cases

- Social media timelines: Posts appear eventually across all views
- DNS propagation: Changes take time to spread globally
- Shopping cart: Items added might not immediately reflect in all sessions

## Code Examples

### DynamoDB Eventual Consistency

```python
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('my-table')

# Write with eventual consistency
table.put_item(Item={'id': '123', 'data': 'value'})

# Read with eventual consistency (default)
response = table.get_item(Key={'id': '123'})
print(response['Item'])
```

### CRDT Example (Simple Counter)

```javascript
class GCounter {
  constructor(id) {
    this.id = id;
    this.counters = {};
    this.counters[id] = 0;
  }

  increment() {
    this.counters[this.id]++;
  }

  merge(other) {
    for (let id in other.counters) {
      this.counters[id] = Math.max(this.counters[id] || 0, other.counters[id]);
    }
  }

  value() {
    return Object.values(this.counters).reduce((a, b) => a + b, 0);
  }
}
```

## Common Pitfalls & Edge Cases

- Assuming immediate consistency
- Handling conflicts in application logic
- Testing eventual consistency scenarios
- User expectations of data freshness

## References

- [Eventual Consistency](https://en.wikipedia.org/wiki/Eventual_consistency)
- [BASE vs ACID](https://www.johndcook.com/blog/2009/07/06/brewer-cap-theorem-base/)
- [DynamoDB Consistency](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html)

## Github-README Links & Related Topics

- [data-consistency-models](../data-consistency-models/README.md)
- [cap-theorem-and-distributed-systems](../cap-theorem-and-distributed-systems/README.md)
- [database-replication-strategies](../database-replication-strategies/README.md)