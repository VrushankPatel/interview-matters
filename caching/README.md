---
title: Caching
aliases: [cache, caching strategies]
tags: [#system-design, #performance, #scalability]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Caching is a technique to store frequently accessed data in a fast-access storage layer to reduce latency, improve performance, and decrease load on backend systems. It acts as a temporary data store that sits between the application and the primary data source.

## Detailed Explanation

### Types of Caches
- **In-Memory Cache**: Stores data in RAM for fastest access (e.g., Redis, Memcached)
- **Database Cache**: Query result caching at the database level
- **CDN Cache**: Content delivery network caching for static assets
- **Browser Cache**: Client-side caching in web browsers
- **Application Cache**: Caching within the application layer

### Cache Strategies
- **Cache-Aside (Lazy Loading)**: Application checks cache first; if miss, fetches from source and populates cache
- **Write-Through**: Data written to cache and source simultaneously
- **Write-Behind (Write-Back)**: Data written to cache first, then asynchronously to source
- **Read-Through**: Cache sits between application and data source, handles all reads

### Cache Eviction Policies
- **LRU (Least Recently Used)**: Evicts least recently accessed items
- **LFU (Least Frequently Used)**: Evicts least frequently accessed items
- **TTL (Time To Live)**: Items expire after a set time
- **Size-Based**: Evicts when cache reaches maximum size

## Real-world Examples & Use Cases

### Web Applications
- User session data caching to avoid repeated database queries
- API response caching for public data that doesn't change often

### E-commerce Platforms
- Product catalog caching to handle high traffic during sales
- Shopping cart data caching for personalized experiences

### Social Media
- Timeline feed caching to reduce computation for personalized feeds
- User profile data caching for quick access

### Gaming
- Game state caching for real-time multiplayer games
- Leaderboard caching for competitive features

## Code Examples

### Redis In-Memory Caching (Java)

```java
import redis.clients.jedis.Jedis;

public class CacheExample {
    private Jedis jedis = new Jedis("localhost");

    public String getData(String key) {
        String cached = jedis.get(key);
        if (cached != null) {
            return cached;
        }
        // Fetch from database
        String data = fetchFromDatabase(key);
        jedis.setex(key, 3600, data); // Cache for 1 hour
        return data;
    }

    private String fetchFromDatabase(String key) {
        // Database logic here
        return "data";
    }
}
```

### Spring Boot Cache Annotation

```java
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Cacheable(value = "users", key = "#id")
    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
}
```

### Cache-Aside Pattern Implementation

```java
public class CacheAsideService {
    private Cache cache;
    private DataSource dataSource;

    public Data getData(String key) {
        Data data = cache.get(key);
        if (data == null) {
            data = dataSource.get(key);
            cache.put(key, data);
        }
        return data;
    }

    public void updateData(String key, Data data) {
        dataSource.update(key, data);
        cache.put(key, data);
    }
}
```

## Common Pitfalls & Edge Cases

- **Cache Invalidation**: Ensuring stale data is removed when source data changes
- **Cache Penetration**: Handling requests for non-existent data that bypass cache
- **Cache Avalanche**: Mass cache expiration causing sudden load spikes
- **Hot Key Problem**: Single popular key causing cache server overload
- **Data Consistency**: Balancing between cache and source data freshness

## Tools & Libraries

- **Redis**: High-performance in-memory data structure store
- **Memcached**: Distributed memory object caching system
- **Ehcache**: Java-based cache library
- **Caffeine**: High-performance Java caching library
- **Varnish**: HTTP accelerator designed for content-heavy dynamic web sites

## References

- [Redis Documentation](https://redis.io/documentation)
- [Memcached Wiki](https://memcached.org/)
- [Cache Strategies](https://martinfowler.com/bliki/Caching.html)
- [CAP Theorem and Caching](https://en.wikipedia.org/wiki/CAP_theorem)

## Github-README Links & Related Topics

- [Distributed Caching with Redis](../distributed-caching-with-redis/README.md)
- [CDN Architecture](../cdn-architecture/README.md)
- [Database Performance Tuning](../database-performance-tuning/README.md)
- [High Scalability Patterns](../high-scalability-patterns/README.md)