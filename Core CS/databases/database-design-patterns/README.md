---
title: Database Design Patterns
aliases: [Database Patterns, Data Modeling Patterns]
tags: [#database, #system-design]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Database design patterns provide reusable solutions for structuring data storage and retrieval. These patterns address normalization, performance optimization, scalability, and data integrity in relational and NoSQL databases.

# Detailed Explanation

## Relational Database Patterns

### Normalization Patterns
- **First Normal Form (1NF)**: Eliminate repeating groups, ensure atomic values.
- **Second Normal Form (2NF)**: Remove partial dependencies.
- **Third Normal Form (3NF)**: Remove transitive dependencies.
- **Boyce-Codd Normal Form (BCNF)**: Stronger version of 3NF.

### Denormalization Patterns
- **Precomputed Aggregates**: Store calculated values to improve query performance.
- **Materialized Views**: Cached results of complex queries.

### Indexing Patterns
- **B-Tree Index**: For range queries and equality searches.
- **Hash Index**: For exact match lookups.
- **Composite Index**: Multiple columns for complex queries.

## NoSQL Patterns

### Document Store Patterns
- **Embedded Documents**: Store related data in single documents.
- **Reference Documents**: Use references for normalized data.

### Key-Value Patterns
- **Cache-Aside**: Load data on demand, cache frequently accessed items.

### Graph Database Patterns
- **Node-Edge Modeling**: Represent relationships explicitly.

## Scalability Patterns
- **Sharding**: Distribute data across multiple servers.
- **Replication**: Copy data for read scalability and fault tolerance.
- **Partitioning**: Divide tables into smaller, manageable pieces.

# Real-world Examples & Use Cases

- **E-commerce**: Product catalog with normalized tables for categories, products, and denormalized views for search.
- **Social Network**: Graph database for user relationships and recommendations.
- **Analytics**: Star schema in data warehouses for efficient reporting.

# Code Examples

## Normalized Table Design (SQL)
```sql
-- Users table (1NF, 2NF, 3NF)
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Order items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
```

## Star Schema for Data Warehouse
```sql
-- Fact table
CREATE TABLE sales_fact (
    sale_id INT PRIMARY KEY,
    date_id INT,
    product_id INT,
    customer_id INT,
    store_id INT,
    quantity INT,
    amount DECIMAL(10,2)
);

-- Dimension tables
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    day INT
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);
```

## MongoDB Document Design
```javascript
// Embedded document for user with orders
{
  "_id": ObjectId("..."),
  "user_id": 123,
  "name": "John Doe",
  "email": "john@example.com",
  "orders": [
    {
      "order_id": 456,
      "date": "2023-01-15",
      "items": [
        {"product_id": 789, "quantity": 2, "price": 29.99}
      ],
      "total": 59.98
    }
  ]
}
```

# References

- [Database Design for Mere Mortals](https://www.amazon.com/Database-Design-Mere-Mortals-Hands-On/dp/0321884493)
- [NoSQL Distilled](https://www.amazon.com/NoSQL-Distilled-Emerging-Polyglot-Persistence/dp/0321826620)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

# Github-README Links & Related Topics

- [Database Normalization](../database-normalization/README.md)
- [Database Indexing Strategies](../database-indexing-strategies/README.md)
- [Database Sharding Strategies](../database-sharding-strategies/README.md)