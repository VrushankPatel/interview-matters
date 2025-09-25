---
title: Replication vs Sharding vs Partitioning
aliases: [Data Distribution Strategies, Database Scaling Techniques]
tags: [#system-design,#database,#scalability]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Replication, sharding, and partitioning are key strategies for scaling databases and distributing data across multiple servers. This topic explores the differences between these approaches, their use cases, advantages, and trade-offs in building scalable systems.

## Detailed Explanation

## Replication

Replication involves creating and maintaining multiple copies of the same data across different servers or databases.

### Types of Replication

- **Master-Slave Replication**: One master handles writes, slaves handle reads.
- **Master-Master Replication**: Multiple masters can handle both reads and writes.
- **Multi-Master Replication**: Similar to master-master but with conflict resolution.

### Benefits

- Improved read performance through load distribution
- High availability and fault tolerance
- Data redundancy for backup and disaster recovery

### Drawbacks

- Increased storage costs
- Potential for data inconsistency (eventual consistency)
- Write performance may not improve (bottleneck at master)

## Sharding

Sharding (also called horizontal partitioning) splits data across multiple databases or servers based on a shard key.

### Sharding Strategies

- **Hash-based Sharding**: Uses a hash function on the shard key.
- **Range-based Sharding**: Divides data based on ranges of the shard key.
- **Directory-based Sharding**: Uses a lookup table to determine shard location.

### Benefits

- Improved write performance
- Better scalability for large datasets
- Reduced index size per shard

### Drawbacks

- Complex query routing
- Potential for uneven data distribution (hot spots)
- Cross-shard queries can be expensive
- Rebalancing shards is challenging

## Partitioning

Partitioning divides a large table into smaller, more manageable pieces within the same database.

### Types of Partitioning

- **Horizontal Partitioning**: Rows are divided across partitions.
- **Vertical Partitioning**: Columns are divided across partitions.
- **Functional Partitioning**: Data is partitioned based on usage patterns.

### Benefits

- Improved query performance
- Easier maintenance and backup
- Better data locality

### Drawbacks

- Limited to single database instance
- May not solve all scalability issues
- Partitioning key selection is critical

## Key Differences

| Aspect | Replication | Sharding | Partitioning |
|--------|-------------|----------|--------------|
| Data Copies | Multiple identical copies | Unique data subsets | Data subsets within same DB |
| Scalability | Read scalability | Read and write scalability | Query performance |
| Consistency | Eventual consistency possible | Strong consistency within shard | Strong consistency |
| Complexity | Moderate | High | Low to moderate |
| Use Case | High read loads, HA | Massive datasets, high throughput | Large tables, query optimization |

## Real-world Examples & Use Cases

- **Replication**: Social media feeds (read-heavy), content delivery networks.
- **Sharding**: Large e-commerce platforms (user data), search engines (index data).
- **Partitioning**: Time-series data (logs by date), geographical data.

## Code Examples

## Simple Replication Concept (Pseudocode)

```python
class ReplicatedDatabase:
    def __init__(self, masters, slaves):
        self.masters = masters
        self.slaves = slaves
    
    def write(self, key, value):
        # Write to all masters
        for master in self.masters:
            master.put(key, value)
        # Asynchronous replication to slaves
    
    def read(self, key):
        # Read from a random slave for load balancing
        slave = random.choice(self.slaves)
        return slave.get(key)
```

## Sharding Implementation

```java
public class ShardedDatabase {
    private List<Database> shards;
    private int numShards;
    
    public ShardedDatabase(int numShards) {
        this.numShards = numShards;
        this.shards = new ArrayList<>();
        for (int i = 0; i < numShards; i++) {
            shards.add(new Database());
        }
    }
    
    private int getShardIndex(String key) {
        return Math.abs(key.hashCode()) % numShards;
    }
    
    public void put(String key, String value) {
        int shardIndex = getShardIndex(key);
        shards.get(shardIndex).put(key, value);
    }
    
    public String get(String key) {
        int shardIndex = getShardIndex(key);
        return shards.get(shardIndex).get(key);
    }
}
```

## Table Partitioning Example (SQL)

```sql
-- Range partitioning by date
CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
)
PARTITION BY RANGE (YEAR(sale_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);

-- Query specific partition
SELECT * FROM sales PARTITION (p2021) WHERE amount > 1000;
```

## References

- [Database Sharding: Concepts and Examples](https://www.mongodb.com/blog/post/database-sharding-concepts-and-examples)
- [Replication vs Sharding](https://www.cockroachlabs.com/blog/replication-vs-sharding/)
- [Partitioning in PostgreSQL](https://www.postgresql.org/docs/current/ddl-partitioning.html)
- [Designing Data-Intensive Applications by Martin Kleppmann](https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable/dp/1449373321)

## Github-README Links & Related Topics

- [Database Sharding Strategies](database-sharding-strategies/README.md)
- [Database Replication Strategies](database-replication-strategies/README.md)
- [High Scalability Patterns](high-scalability-patterns/README.md)
- [CAP Theorem & Distributed Systems](cap-theorem-and-distributed-systems/README.md)