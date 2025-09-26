---
title: System Design Basics
aliases: [System Design Fundamentals, Basic System Design]
tags: [#system-design, #basics]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

System design basics encompass the fundamental principles and concepts required to architect scalable, reliable, and efficient software systems. At its core, system design involves understanding trade-offs between performance, scalability, availability, and consistency. Key elements include evaluating system requirements, identifying bottlenecks, and applying patterns like load balancing, caching, and database sharding. This foundation prepares engineers to design systems that handle growth from thousands to millions of users, ensuring reliability under varying loads and failure scenarios.

# Detailed Explanation

System design basics build on core computer science principles, focusing on distributed systems. Here's a breakdown of essential concepts:

## Performance vs Scalability
- **Performance**: Measures how fast a system responds to a single user or request. A performance issue means the system is slow for individual operations.
- **Scalability**: Refers to the system's ability to handle increased load by adding resources proportionally. Vertical scaling (adding more power to a single machine) is limited, while horizontal scaling (adding more machines) is preferred for large systems.

## Latency vs Throughput
- **Latency**: The time to complete a single operation (e.g., response time for a web request).
- **Throughput**: The number of operations completed per unit time (e.g., requests per second).
- Aim for maximal throughput with acceptable latency, as they often trade off.

## Availability vs Consistency (CAP Theorem)
The CAP theorem states that in a distributed system, you can only guarantee two of the following three properties:
- **Consistency**: Every read receives the most recent write or an error.
- **Availability**: Every request receives a response, without guarantee of the latest data.
- **Partition Tolerance**: The system continues operating despite network failures.
- Most systems prioritize availability and partition tolerance (AP), accepting eventual consistency.

## Consistency Patterns
- **Weak Consistency**: Reads may not see the latest writes; suitable for real-time apps like VoIP.
- **Eventual Consistency**: Reads will eventually reflect writes; common in DNS and email systems.
- **Strong Consistency**: Reads always see the latest writes; used in RDBMS for transactions.

## Availability Patterns
- **Fail-over**: Active-passive (standby takes over) or active-active (both handle traffic).
- **Replication**: Master-slave or master-master to ensure data redundancy.

## Core Components
- **Load Balancers**: Distribute traffic across servers (e.g., Layer 4 for TCP/UDP, Layer 7 for HTTP).
- **Caching**: Store frequently accessed data in memory (e.g., Redis, Memcached) to reduce database load.
- **Databases**: Choose SQL for structured data/transactions or NoSQL for flexibility/scalability.
- **CDNs**: Serve static content from geographically distributed servers to reduce latency.
- **Message Queues**: Enable asynchronous processing (e.g., RabbitMQ for decoupling services).

## Design Process
1. **Requirements Gathering**: Define use cases, constraints, and assumptions (e.g., users, requests/second, data volume).
2. **High-Level Design**: Sketch components and connections.
3. **Component Deep Dive**: Detail core elements like APIs, databases, and scaling strategies.
4. **Scaling and Optimization**: Address bottlenecks with caching, sharding, etc.
5. **Back-of-the-Envelope Calculations**: Estimate capacity using latency numbers (e.g., memory reference: 100ns, disk seek: 10ms).

# Real-world Examples & Use Cases

- **Web Search Engine (e.g., Google)**: Uses distributed indexing, caching, and load balancing to handle billions of queries daily. Sharding data across servers ensures scalability, while eventual consistency allows for fast responses.
- **Social Media Feed (e.g., Facebook/Twitter)**: Employs caching for timelines, replication for availability, and message queues for notifications. Trade-offs prioritize availability over strict consistency to support real-time updates.
- **E-commerce Platform (e.g., Amazon)**: Leverages CDNs for product images, load balancers for traffic distribution, and database sharding for user data. High availability ensures uptime during peak shopping seasons.
- **Video Streaming (e.g., Netflix)**: Uses CDNs to deliver content globally, caching for popular videos, and microservices for recommendation engines. Partition tolerance handles regional outages.

# Code Examples

Here are simple pseudocode examples illustrating basic system design concepts:

### Load Balancing (Round Robin)
```
servers = ["server1", "server2", "server3"]
index = 0

function getServer() {
    server = servers[index]
    index = (index + 1) % servers.length
    return server
}
```

### Cache-aside Pattern
```
cache = {}  // In-memory cache

function getUser(userId) {
    if (cache[userId]) {
        return cache[userId]
    }
    user = db.query("SELECT * FROM users WHERE id = ?", userId)
    if (user) {
        cache[userId] = user  // Cache for future requests
    }
    return user
}
```

### Simple Message Queue
```
queue = []

function enqueue(message) {
    queue.push(message)
}

function dequeue() {
    if (queue.length > 0) {
        return queue.shift()
    }
    return null
}
```

# References

- [System Design Primer on GitHub](https://github.com/donnemartin/system-design-primer) - Comprehensive guide with diagrams and examples.
- [CAP Theorem Revisited](http://robertgreiner.com/2014/08/cap-theorem-revisited/) - In-depth explanation of CAP theorem.
- [Scalability for Dummies](https://web.archive.org/web/20220530193911/https://www.lecloud.net/post/7295452622/scalability-for-dummies-part-1-clones) - Series on scaling principles.
- [Latency Numbers Every Programmer Should Know](https://gist.github.com/jboner/2841832) - Key performance benchmarks.
- [System Design Interview Prep](https://www.educative.io/courses/grokking-the-system-design-interview) - Interactive course on basics.

# Github-README Links & Related Topics

- [Scalability Patterns](./scalability-patterns/) - Advanced scaling techniques.
- [Database Design Principles](./database-design-principles/) - In-depth database choices and trade-offs.
- [Caching Strategies](./caching/) - Detailed caching mechanisms.
- [Load Balancing](./load-balancer/) - Types and implementations.
- [Microservices Architecture](./microservices/) - Breaking down monolithic systems.
