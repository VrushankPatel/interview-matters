---
title: Database Normalization Techniques
aliases: [Database Normalization, Normal Forms]
tags: [#database, #system-design]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Database normalization is a process to organize data in relational databases to minimize redundancy, improve data integrity, and ensure efficient data management.

# Detailed Explanation

Normalization involves decomposing tables to eliminate anomalies: insertion, update, deletion.

Normal Forms:
- 1NF: Eliminate repeating groups, ensure atomic values.
- 2NF: Remove partial dependencies.
- 3NF: Remove transitive dependencies.
- BCNF: Every determinant is a candidate key.
- 4NF: Eliminate multi-valued dependencies.
- 5NF: Eliminate join dependencies.

# Real-world Examples & Use Cases

- E-commerce: Separate customers, orders, products tables.
- Banking: Normalize accounts, transactions, customers.
- Inventory: Products, suppliers, categories.

# Code Examples

```sql
-- Unnormalized table
CREATE TABLE Orders (
    order_id INT,
    customer_name VARCHAR(100),
    customer_address VARCHAR(200),
    product_name VARCHAR(100),
    quantity INT
);

-- 1NF: Atomic values
CREATE TABLE Orders_1NF (
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity INT
);

-- 3NF: Separate customers and products
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

# References

- [Wikipedia: Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)
- [Database System Concepts by Silberschatz](https://www.amazon.com/Database-System-Concepts-Abraham-Silberschatz/dp/0073523321)

# Github-README Links & Related Topics

- [Database Design Principles](./database-design-principles/README.md)
- [Database Indexing Strategies](./database-indexing-strategies/README.md)
- [Database Normalization](./database-normalization/README.md)

## Common Pitfalls & Edge Cases

- Over-normalization: Too many joins, performance issues.
- Under-normalization: Data redundancy, anomalies.
- Denormalization for read-heavy systems.

## Tools & Libraries

- SQL databases: MySQL, PostgreSQL
- ORM tools: Hibernate, JPA
