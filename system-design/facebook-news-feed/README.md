---
title: Facebook News Feed
aliases: [Social Media Feed Design]
tags: [#system-design,#scalability,#real-time]
created: 2025-09-25
updated: 2025-09-25
---

# Facebook News Feed

## Overview

The Facebook News Feed is a personalized content aggregation and ranking system that delivers posts, photos, and updates from friends, pages, and groups to users in real-time. It handles billions of users and posts daily, focusing on relevance, engagement, and low latency. Key challenges include ranking algorithms, real-time updates, and scaling to massive data volumes.

## Detailed Explanation

### System Architecture

Facebook's News Feed uses a distributed architecture with microservices, graph databases for relationships, and machine learning for ranking.

#### Architecture Diagram

```mermaid
graph TD
    A[User] --> B[Load Balancer]
    B --> C[Edge Servers]
    C --> D[News Feed Service]
    D --> E[Graph DB (TAO)]
    D --> F[Content Store]
    D --> G[Ranking Engine]
    G --> H[ML Models]
    D --> I[Cache (Memcached)]
    D --> J[Message Queue (Scribe)]
    J --> K[Offline Processing]
```

#### Key Components

- **Edge Servers**: Handle user requests and caching.
- **News Feed Service**: Aggregates and ranks content.
- **Graph DB (TAO)**: Stores social graph relationships.
- **Content Store**: Stores posts and media.
- **Ranking Engine**: Uses ML to score and rank posts.
- **Cache**: Memcached for fast access.
- **Message Queue**: For real-time updates.

### Ranking Algorithm

The feed ranking uses EdgeRank (older) evolved to machine learning models considering factors like recency, relationship strength, content type, and engagement predictions.

## Real-world Examples & Use Cases

### Use Case 1: Feed Refresh

1. User opens app.
2. Edge server checks cache for recent feed.
3. If stale, News Feed Service queries graph for connections.
4. Fetches recent posts from Content Store.
5. Applies ranking algorithm.
6. Returns top-ranked posts.

### Use Case 2: Posting Content

1. User posts update.
2. Stored in Content Store.
3. Message sent to queue for fan-out to friends' feeds.
4. Friends' caches invalidated or updated.

### Use Case 3: Viral Content

- High engagement posts bubble up via ranking.
- Real-time updates push notifications.

## Code Examples

### Python: Simple Feed Ranking Pseudocode

```python
def rank_feed(posts, user):
    scored_posts = []
    for post in posts:
        score = calculate_score(post, user)
        scored_posts.append((score, post))
    scored_posts.sort(reverse=True)
    return [p for s, p in scored_posts]

def calculate_score(post, user):
    recency = 1 / (time.now() - post.timestamp)
    affinity = get_affinity(user, post.author)
    engagement = post.likes + post.comments * 2
    return recency * affinity * engagement
```

### Java: Cache Integration

```java
import com.google.common.cache.Cache;

public class FeedCache {
    private Cache<String, List<Post>> cache = CacheBuilder.newBuilder()
        .maximumSize(10000)
        .expireAfterWrite(10, TimeUnit.MINUTES)
        .build();

    public List<Post> getFeed(String userId) {
        return cache.getIfPresent(userId);
    }

    public void invalidate(String userId) {
        cache.invalidate(userId);
    }
}
```

### Table: Ranking Factors

| Factor | Weight | Description |
|--------|--------|-------------|
| Recency | High | How recent the post is |
| Affinity | High | Relationship strength |
| Engagement | Medium | Likes, comments, shares |
| Content Type | Low | Photo vs text vs video |

## Common Pitfalls & Edge Cases

- **Feed Staleness**: Cache invalidation issues; use TTL and push updates.
- **Ranking Bias**: Ensure diversity; avoid echo chambers.
- **Scale**: Sharding by user ID; use consistent hashing.
- **Real-time Latency**: Optimize with websockets and push notifications.
- **Privacy**: Respect user settings for content visibility.

## Tools & Libraries

- **TAO**: Facebook's graph database.
- **Memcached**: Distributed caching.
- **Scribe**: Log aggregation and messaging.
- **Hadoop/Spark**: For offline ML training.
- **React/GraphQL**: For frontend and API.

## References

- [Facebook News Feed Architecture](https://www.facebook.com/notes/facebook-engineering/the-facebook-news-feed/10151067796358859/)
- [EdgeRank Algorithm](https://en.wikipedia.org/wiki/EdgeRank)
- [Scaling Facebook's News Feed](https://www.infoq.com/presentations/Facebook-News-Feed/)

## Github-README Links & Related Topics

- [Microservices Architecture](../microservices-architecture/README.md)
- [Caching Strategies](../caching-strategies/README.md)
- [Machine Learning in Infrastructure](../machine-learning-infrastructure/README.md)
- [Event-Driven Architecture](../event-driven-architecture/README.md)
- [Distributed Tracing](../distributed-tracing-and-observability/README.md)