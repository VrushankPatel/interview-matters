---
title: Replication vs Sharding vs Partitioning
aliases: ["Database Replication Sharding Partitioning", "Data Distribution Strategies"]
tags: [#system-design,#database,#scalability]
created: 2025-09-26
updated: 2025-09-26
---

# Replication vs Sharding vs Partitioning

## Overview

Replication, sharding, and partitioning are key strategies for managing data in distributed systems. They address different aspects of scalability, availability, and performance in database systems.

## Detailed Explanation

### Replication

Replication creates copies of data across multiple nodes:

- **Types**: Master-Slave, Master-Master, Multi-Master
- **Benefits**: High availability, read scalability, fault tolerance
- **Trade-offs**: Write performance, data consistency challenges
- **Use Cases**: Read-heavy applications, disaster recovery

### Sharding

Sharding splits data across multiple databases:

- **Types**: Horizontal sharding, Vertical sharding
- **Benefits**: Write scalability, reduced index size
- **Trade-offs**: Complex queries, rebalancing challenges
- **Use Cases**: Large-scale applications with high write loads

### Partitioning

Partitioning divides a single database into smaller pieces:

- **Types**: Range, Hash, List partitioning
- **Benefits**: Improved query performance, easier maintenance
- **Trade-offs**: Limited to single database instance
- **Use Cases**: Large tables in traditional RDBMS

### Comparison Table
| Strategy | Purpose | Scalability | Complexity | Consistency |
|----------|---------|-------------|------------|-------------|
| Replication | Availability & Read Performance | Read Scalable | Low | Eventual |
| Sharding | Write Scalability | Highly Scalable | High | Strong (per shard) |
| Partitioning | Query Performance | Limited | Medium | Strong |

## Real-world Examples & Use Cases

### Social Media Platform

- **Replication**: User timelines replicated for fast reads
- **Sharding**: User data sharded by user ID
- **Partitioning**: Posts table partitioned by date

### E-commerce Site

- **Replication**: Product catalog replicated across regions
- **Sharding**: Order data sharded by customer ID
- **Partitioning**: Transaction logs partitioned by month

## Code Examples

### Java: Simple Sharding Implementation

```java
public class ShardManager {
    private final List<DataSource> shards;
    private final ShardStrategy strategy;

    public ShardManager(List<DataSource> shards, ShardStrategy strategy) {
        this.shards = shards;
        this.strategy = strategy;
    }

    public DataSource getShard(String key) {
        int shardIndex = strategy.getShardIndex(key, shards.size());
        return shards.get(shardIndex);
    }
}

interface ShardStrategy {
    int getShardIndex(String key, int shardCount);
}

class HashShardStrategy implements ShardStrategy {
    @Override
    public int getShardIndex(String key, int shardCount) {
        return Math.abs(key.hashCode()) % shardCount;
    }
}
```

### SQL: Table Partitioning

```sql
CREATE TABLE orders (
    id BIGINT,
    customer_id BIGINT,
    order_date DATE,
    amount DECIMAL
) PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023)
);
```

## References

- [MongoDB Sharding Documentation](https://docs.mongodb.com/manual/sharding/)
- [PostgreSQL Partitioning](https://www.postgresql.org/docs/current/ddl-partitioning.html)
- [Database Sharding Explained](https://www.cockroachlabs.com/blog/what-is-database-sharding/)

## Github-README Links & Related Topics

- [Database Sharding Strategies](../database-sharding-strategies/)
- [Database Replication Strategies](../database-replication-strategies/)
- [CAP Theorem and Distributed Systems](../cap-theorem-and-distributed-systems/)