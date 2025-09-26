---
title: Popular System Designs
aliases: [system design examples]
tags: [#system-design,#lld,#hld]
created: 2025-09-26
updated: 2025-09-26
---

# Popular System Designs

## Overview

This topic explores popular system design examples, focusing on Low-Level Design (LLD) and High-Level Design (HLD) for scalable, distributed systems. It covers designs for well-known platforms such as URL shorteners, streaming services, social media, ride-sharing, and more. Each example includes architectural diagrams, capacity estimations, data models, and trade-offs to provide a comprehensive understanding of building large-scale systems.

## Detailed Explanation

### Low-Level Design (LLD)

LLD delves into the detailed design of individual components, including data structures, algorithms, class diagrams, and microservices interactions. It focuses on how specific features are implemented, such as encoding mechanisms in URL shorteners or dispatch algorithms in ride-sharing apps.

### High-Level Design (HLD)

HLD provides an overview of the system architecture, including major components, data flow, scalability strategies, and integration points. It emphasizes components like load balancers, databases, caching layers, and message queues to ensure high availability and performance.

Popular system designs often follow microservices architecture for modularity, use NoSQL databases for scalability, and incorporate caching and CDNs for low latency. Trade-offs include consistency vs. availability (CAP theorem) and read vs. write optimization.

## Real-world Examples & Use Cases

Below are key examples of popular system designs, including brief descriptions, use cases, and mermaid diagrams for HLD.

### 1. URL Shortener (e.g., bit.ly, TinyURL)

A service that converts long URLs into short, shareable links. Use cases include social media sharing, marketing campaigns, and analytics tracking.

**HLD Diagram:**

```mermaid
graph TD
    A[User] --> B[Load Balancer]
    B --> C[Application Server]
    C --> D[Caching Layer (Redis)]
    C --> E[Database (NoSQL: Cassandra)]
    C --> F[Analytics Service]
    E --> G[Cleanup Service]
```

**Key Components:**
- **Application Server:** Handles URL shortening and redirection.
- **Database:** Stores mappings; uses NoSQL for scalability.
- **Caching:** Speeds up redirections.
- **Analytics:** Tracks clicks and user behavior.

### 2. Netflix (Streaming Service)

A video streaming platform with personalized recommendations, offline downloads, and global content delivery.

**HLD Diagram:**

```mermaid
graph TD
    A[User Device] --> B[CDN (Open Connect)]
    B --> C[Backend (AWS)]
    C --> D[Microservices (User, Content, Recommendation)]
    D --> E[Database (Cassandra, MySQL)]
    D --> F[Caching (EV Cache)]
    D --> G[Message Queue (Kafka)]
    G --> H[Analytics (Spark)]
```

**Key Components:**
- **CDN:** Delivers video content globally.
- **Microservices:** Handles transcoding, recommendations, and user management.
- **Databases:** Cassandra for viewing history, MySQL for transactions.
- **Analytics:** Uses Kafka and Spark for insights.

### 3. Twitter (Social Media Platform)

A microblogging platform for posting tweets, following users, and real-time newsfeeds.

**HLD Diagram:**

```mermaid
graph TD
    A[User] --> B[Load Balancer]
    B --> C[API Gateway]
    C --> D[User Service]
    C --> E[Newsfeed Service]
    C --> F[Tweet Service]
    C --> G[Search Service (Elasticsearch)]
    D --> H[Database (MySQL, Cassandra)]
    E --> I[Caching (Redis)]
    F --> J[Message Queue (Kafka)]
    J --> K[Notification Service]
```

**Key Components:**
- **Newsfeed Service:** Generates personalized feeds using push/pull models.
- **Search Service:** Powered by Elasticsearch for real-time queries.
- **Databases:** MySQL for users, Cassandra for tweets.
- **Notifications:** Uses Kafka for push notifications.

### 4. Uber (Ride-Sharing App)

A platform connecting riders with drivers, including real-time tracking, payments, and dispatch optimization.

**HLD Diagram:**

```mermaid
graph TD
    A[Rider/Driver App] --> B[Load Balancer]
    B --> C[API Gateway]
    C --> D[Supply Service]
    C --> E[Demand Service]
    C --> F[Dispatch System (DISCO)]
    F --> G[Map Service (Google Maps)]
    D --> H[Database (Schemaless, Riak)]
    E --> I[Caching (Redis)]
    F --> J[Message Queue (Kafka)]
    J --> K[Analytics]
```

**Key Components:**
- **Dispatch System:** Matches riders to drivers using geospatial data.
- **Map Service:** Calculates ETAs and routes.
- **Databases:** Schemaless for scalability.
- **Analytics:** Fraud detection and optimization.

### 5. Additional Examples

| System | Key Features | Scalability Challenges | Database Choice |
|--------|--------------|-------------------------|-----------------|
| Instagram | Photo/video sharing, stories, reels | Media storage, real-time feeds | PostgreSQL, Cassandra |
| YouTube | Video upload/streaming, recommendations | Video transcoding, global CDN | Bigtable, MySQL |
| WhatsApp | Messaging, calls, groups | End-to-end encryption, high concurrency | Erlang-based custom DB |

## Code Examples

### URL Shortener: Base62 Encoding in Java

```java
public class URLShortener {
    private static final String BASE62 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static String encode(long num) {
        StringBuilder sb = new StringBuilder();
        while (num > 0) {
            sb.append(BASE62.charAt((int) (num % 62)));
            num /= 62;
        }
        return sb.reverse().toString();
    }

    public static long decode(String str) {
        long num = 0;
        for (char c : str.toCharArray()) {
            num = num * 62 + BASE62.indexOf(c);
        }
        return num;
    }
}
```

This code demonstrates base62 encoding for generating short URLs. It can be extended with a database layer for persistence.

### Netflix: Simple Recommendation Pseudocode

```python
def recommend_movies(user_id, viewing_history):
    # Collaborative filtering example
    similar_users = find_similar_users(user_id)
    recommendations = []
    for user in similar_users:
        for movie in user.viewed_movies:
            if movie not in viewing_history:
                recommendations.append(movie)
    return rank_by_popularity(recommendations)
```

## References

- [System Design URL Shortening Service - GeeksforGeeks](https://www.geeksforgeeks.org/system-design-url-shortening-service/)
- [System Design Netflix - GeeksforGeeks](https://www.geeksforgeeks.org/system-design/system-design-netflix-a-complete-architecture/)
- [Designing Twitter - GeeksforGeeks](https://www.geeksforgeeks.org/interview-experiences/design-twitter-a-system-design-interview-question/)
- [System Design of Uber App - GeeksforGeeks](https://www.geeksforgeeks.org/system-design/system-design-of-uber-app-uber-system-architecture/)
- [System Design Interview Guide - GeeksforGeeks](https://www.geeksforgeeks.org/interview-experiences/how-to-crack-system-design-round-in-interviews/)

## Github-README Links & Related Topics

- [LLD HLD Basics](../lld-hld-basics/)
- [Microservices](../microservices/)
- [Databases in System Design](../database-design-principles/)
- [Scalability](../scalability/)
- [Caching](../caching/)