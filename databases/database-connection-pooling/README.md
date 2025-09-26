---
title: Database Connection Pooling
aliases: [Connection Pooling, DB Pooling]
tags: [#databases,#system-design]
created: 2025-09-25
updated: 2025-09-25
---

# Database Connection Pooling

## Overview

Database connection pooling is a technique that maintains a cache of database connections for reuse, improving performance and resource management in applications that frequently interact with databases.

## Detailed Explanation

### Why Connection Pooling?

- Creating database connections is expensive (network overhead, authentication).
- Pools maintain a set of open connections ready for use.
- Reduces latency and server load.

### How It Works

1. **Pool Creation**: Initialize a pool with minimum connections.
2. **Connection Request**: Borrow from pool; if none available, wait or create new (up to max).
3. **Usage**: Execute queries.
4. **Return**: Release connection back to pool.
5. **Maintenance**: Health checks, eviction of stale connections.

### Configuration Parameters

- **Min Pool Size**: Minimum connections to maintain.
- **Max Pool Size**: Maximum connections allowed.
- **Idle Timeout**: Time before closing idle connections.
- **Max Lifetime**: Maximum time a connection can be reused.

### Implementations

- **HikariCP**: High-performance JDBC connection pool (default in Spring Boot).
- **C3P0**: Mature connection pooling library.
- **Apache DBCP**: Part of Apache Commons.

## Real-world Examples & Use Cases

- **Web Applications**: E-commerce sites handling thousands of concurrent users.
- **Microservices**: Each service maintains its own pool for database interactions.
- **High-Traffic Systems**: Social media platforms like Twitter use pooling to manage database load.

## Code Examples

### HikariCP Configuration in Spring Boot

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: user
    password: pass
    hikari:
      minimum-idle: 5
      maximum-pool-size: 20
      connection-timeout: 20000
      idle-timeout: 300000
      max-lifetime: 1200000
```

### Manual HikariCP Setup in Java

```java
HikariConfig config = new HikariConfig();
config.setJdbcUrl("jdbc:mysql://localhost:3306/mydb");
config.setUsername("user");
config.setPassword("pass");
config.setMaximumPoolSize(20);
config.setMinimumIdle(5);

HikariDataSource ds = new HikariDataSource(config);

// Usage
try (Connection conn = ds.getConnection()) {
    // Execute queries
}
```

### C3P0 Example

```java
ComboPooledDataSource cpds = new ComboPooledDataSource();
cpds.setDriverClass("com.mysql.jdbc.Driver");
cpds.setJdbcUrl("jdbc:mysql://localhost:3306/mydb");
cpds.setUser("user");
cpds.setPassword("pass");
cpds.setMinPoolSize(5);
cpds.setMaxPoolSize(20);
cpds.setMaxIdleTime(300);
```

## Common Pitfalls & Edge Cases

- **Connection Leaks**: Forgetting to close connections.
- **Pool Exhaustion**: Too many concurrent requests.
- **Stale Connections**: Network issues causing invalid connections.
- **Configuration Mismatch**: Pool size not matching application needs.

## References

- [HikariCP GitHub](https://github.com/brettwooldridge/HikariCP)
- [C3P0 Documentation](https://www.mchange.com/projects/c3p0/)
- [Database Connection Pooling Best Practices](https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-usagenotes-j2ee-concepts-connection-pooling.html)

## Github-README Links & Related Topics

- [Database Indexing Strategies](database-indexing-strategies/README.md)
- [Database Sharding Strategies](database-sharding-strategies/README.md)
- [Microservices Architecture](microservices-architecture/README.md)