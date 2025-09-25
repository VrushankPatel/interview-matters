---
title: Database Indexing Best Practices
aliases: [Database Indexes, Indexing Strategies]
tags: [#databases,#system-design]
created: 2025-09-25
updated: 2025-09-25
---

# Database Indexing Best Practices

## Overview

Database indexing is a technique to improve query performance by creating data structures that allow quick lookups. Indexes speed up data retrieval but can slow down writes and consume storage. Best practices involve choosing the right indexes for query patterns.

## Detailed Explanation

Indexes work like book indexes, pointing to data locations. Types include B-Tree (default for most), Hash (equality), and specialized like GiST/GIN for PostgreSQL.

### Key Principles

- **Selectivity**: Index columns with high cardinality.
- **Composite Indexes**: For multi-column queries, order matters.
- **Covering Indexes**: Include all queried columns.
- **Avoid Over-Indexing**: Each index has maintenance cost.
- **Monitor Usage**: Use EXPLAIN to analyze query plans.

### Common Index Types

| Type | Use Case | Example |
|------|----------|---------|
| B-Tree | Range queries, equality | Standard index |
| Hash | Exact matches | Unique constraints |
| Full-Text | Text search | PostgreSQL tsvector |
| Spatial | Geospatial data | PostGIS |

## Real-world Examples & Use Cases

- **E-commerce**: Index product_id for fast lookups.
- **Social Media**: Composite index on (user_id, timestamp) for feeds.
- **Analytics**: Partial indexes for active users.

## Code Examples

### Creating an Index in SQL

```sql
-- Single column index
CREATE INDEX idx_users_email ON users(email);

-- Composite index
CREATE INDEX idx_orders_user_date ON orders(user_id, order_date);

-- Partial index
CREATE INDEX idx_active_users ON users(email) WHERE active = true;
```

### PostgreSQL Index Usage

```sql
EXPLAIN SELECT * FROM users WHERE email = 'example@example.com';
-- Should show Index Scan if index is used
```

## References

- [PostgreSQL Indexing](https://www.postgresql.org/docs/current/indexes.html)
- [MySQL Indexing](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html)
- [Database Indexing Strategies](database-indexing-strategies/README.md)

## Github-README Links & Related Topics

- [Database Indexing Strategies](database-indexing-strategies/README.md)
- [Database Performance Tuning](database-performance-tuning/README.md)
- [Database Design Principles](database-design-principles/README.md)