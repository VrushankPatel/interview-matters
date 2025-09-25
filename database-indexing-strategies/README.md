---
title: Database Indexing Strategies
aliases: [Database Indexes, Indexing Strategies]
tags: [#system-design,#databases]
created: 2025-09-25
updated: 2025-09-25
---

# Database Indexing Strategies

## Overview

Database indexing is a technique to improve query performance by creating data structures that allow quick lookups. Proper indexing strategies can reduce query time from O(n) to O(log n) or better.

## Detailed Explanation

### Index Types
- **B-Tree Index**: Balanced tree structure for range queries.
- **Hash Index**: Hash table for exact match lookups.
- **Bitmap Index**: Bit arrays for low-cardinality columns.
- **Full-Text Index**: For text search operations.
- **Spatial Index**: For geographic data.

### Indexing Strategies
- **Single Column**: Index on one column.
- **Composite**: Index on multiple columns.
- **Covering**: Index includes all queried columns.
- **Partial**: Index on subset of table data.
- **Functional**: Index on expression result.

### When to Index
- Frequently queried columns
- Columns used in WHERE, JOIN, ORDER BY
- High selectivity columns
- Avoid over-indexing (increases write overhead)

## Real-world Examples & Use Cases

- **E-commerce**: Index on product_id for quick lookups.
- **Social Media**: Composite index on user_id and timestamp for feeds.
- **Analytics**: Covering indexes for complex queries.
- **Search Engines**: Full-text indexes for content search.

## Code Examples

### Creating B-Tree Index (PostgreSQL)
```sql
CREATE INDEX idx_users_email ON users (email);
```

### Composite Index
```sql
CREATE INDEX idx_orders_user_date ON orders (user_id, order_date);
```

### Covering Index
```sql
CREATE INDEX idx_products_covering ON products (category_id, name, price);
```

### Partial Index
```sql
CREATE INDEX idx_active_users ON users (email) WHERE active = true;
```

### Functional Index
```sql
CREATE INDEX idx_lower_email ON users (LOWER(email));
```

### Index Usage Analysis (PostgreSQL)
```sql
EXPLAIN SELECT * FROM users WHERE email = 'john@example.com';
-- Should show Index Scan if index is used
```

## Common Pitfalls & Edge Cases

- Over-indexing slows down INSERT/UPDATE/DELETE
- Unused indexes waste storage
- Index fragmentation requires maintenance
- Wrong column order in composite indexes

## References

- [Database Indexing Explained](https://use-the-index-luke.com/)
- [PostgreSQL Indexing](https://www.postgresql.org/docs/current/indexes.html)
- [MySQL Indexing](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html)

## Github-README Links & Related Topics

- [Database Design and Indexing](../system-design/database-design-and-indexing/README.md)
- [Replication vs Sharding vs Partitioning](../replication-vs-sharding-vs-partitioning/README.md)
- [Database ACID Properties](../system-design/database-acid-properties/README.md)