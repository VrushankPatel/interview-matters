---
title: 'Facebook System Design'
aliases: ['Meta Platform Design']
tags: [#system-design,#distributed-systems,#social-networking]
created: '2025-09-26'
updated: '2025-09-26'
---

## Overview

Facebook (Meta) is a comprehensive social networking platform that connects over 2.9 billion monthly active users worldwide. It encompasses user profiles, personalized news feeds, real-time messaging, groups, pages, advertising, marketplace, and more. The system is designed for massive scale, handling billions of daily interactions, petabytes of data, and real-time personalization using machine learning. Key engineering challenges include scalability, low-latency responses, data consistency, privacy, and combating misinformation.

## Detailed Explanation

### High-Level Architecture

Facebook's architecture is a distributed, microservices-based system built on top of custom infrastructure. It uses a combination of web services, databases, caching layers, and content delivery networks to serve global users.

#### Architecture Diagram

```mermaid
flowchart TD
    A[User] --> B[Web/Mobile Client]
    B --> C[API Gateway (Thrift/GraphQL)]
    C --> D[Authentication & User Service]
    C --> E[News Feed Service]
    C --> F[Messaging Service]
    C --> G[Ads & Monetization Service]
    C --> H[Groups & Pages Service]
    C --> I[Marketplace & Commerce Service]
    E --> J[Feed Ranking Engine (ML)]
    J --> K[Database Layer (TAO Graph DB, MySQL Shards)]
    F --> L[Real-time Messaging Infrastructure]
    G --> M[Ad Auction & Targeting]
    All --> N[Caching Layer (Memcached)]
    N --> O[CDN (Akamai)]
    O --> P[Distributed Storage (HDFS, Haystack)]
```

#### Key Components

- **API Gateway**: Handles incoming requests, routing to microservices using Thrift or GraphQL for efficient data fetching.
- **Authentication & User Service**: Manages user logins, profiles, friendships, and privacy settings. Uses OAuth and custom auth protocols.
- **News Feed Service**: Aggregates and ranks content from friends, pages, and groups using ML models for personalization.
- **Messaging Service**: Provides real-time chat, voice/video calls, and encryption (end-to-end for Messenger).
- **Ads & Monetization Service**: Runs real-time auctions for ad placements, targeting based on user data and behavior.
- **Groups & Pages Service**: Manages community interactions, events, and business pages.
- **Marketplace & Commerce Service**: Handles buying/selling, payments, and logistics.
- **Database Layer**: TAO for graph queries (friendships, likes), sharded MySQL for structured data, HDFS for analytics.
- **Caching & CDN**: Memcached for hot data, CDN for media delivery.

#### Scalability Considerations

- **Horizontal Scaling**: Microservices allow independent scaling; auto-scaling based on load.
- **Database Sharding**: User data partitioned by user ID across thousands of MySQL instances; TAO uses consistent hashing.
- **Replication**: Multi-region replication for disaster recovery and low latency (e.g., data centers in US, Europe, Asia).
- **Caching Strategies**: Multi-level caching (L1: application, L2: Memcached, L3: CDN) to reduce database load.
- **Load Balancing**: DNS-based global load balancing, L4/L7 proxies (HAProxy, custom).
- **Asynchronous Processing**: Queues (e.g., Scribe for logging, custom queues for notifications) to handle spikes.
- **Machine Learning at Scale**: Distributed training on GPUs/TPUs for feed ranking and ad targeting.
- **Fault Tolerance**: Redundant systems, circuit breakers, and graceful degradation.

#### Data Models

##### User Table
| Field | Type | Description |
|-------|------|-------------|
| user_id | BIGINT | Unique user identifier |
| username | VARCHAR(255) | Display name |
| email | VARCHAR(255) | Email address |
| created_at | TIMESTAMP | Account creation time |
| last_login | TIMESTAMP | Last login timestamp |
| profile_pic_url | TEXT | URL to profile picture |

##### Friendship Table
| Field | Type | Description |
|-------|------|-------------|
| user_id | BIGINT | User ID |
| friend_id | BIGINT | Friend's user ID |
| status | ENUM | (pending, accepted, blocked) |
| created_at | TIMESTAMP | Friendship initiation time |

##### Post Table
| Field | Type | Description |
|-------|------|-------------|
| post_id | BIGINT | Unique post ID |
| user_id | BIGINT | Author user ID |
| content | TEXT | Post text/media |
| created_at | TIMESTAMP | Post timestamp |
| likes_count | INT | Cached like count |
| comments_count | INT | Cached comment count |

##### Message Table
| Field | Type | Description |
|-------|------|-------------|
| message_id | BIGINT | Unique message ID |
| sender_id | BIGINT | Sender user ID |
| receiver_id | BIGINT | Receiver user ID |
| content | TEXT | Encrypted message content |
| sent_at | TIMESTAMP | Send time |

##### Ad Table
| Field | Type | Description |
|-------|------|-------------|
| ad_id | BIGINT | Unique ad ID |
| advertiser_id | BIGINT | Business/page ID |
| target_criteria | JSON | Targeting rules (age, interests, etc.) |
| bid_amount | DECIMAL | Maximum bid |
| impressions | BIGINT | Served impressions |

## Real-world Examples & Use Cases

- **Personalized News Feed**: A user sees posts from close friends and relevant pages ranked by engagement predictions, with ads interspersed based on interests.
- **Real-time Messaging**: Instant chat between users, with message delivery in <100ms globally, supporting group chats and media sharing.
- **Targeted Advertising**: A local business runs ads targeting users within 10 miles interested in "coffee shops," with real-time bidding.
- **Groups and Communities**: A photography group hosts discussions, events, and shared albums, with notifications for new posts.
- **Marketplace Transactions**: Users buy/sell items locally, with secure payments and shipping tracking.
- **Global Events**: During elections or sports events, content is boosted for relevance, with fact-checking to prevent misinformation.
- **Privacy Controls**: Users manage who sees their posts, with end-to-end encryption for sensitive messages.

## Code Examples

### Pseudocode for User Authentication

```python
def authenticate_user(email, password):
    user = db.query("SELECT * FROM users WHERE email = ?", email)
    if user and verify_password(password, user.hashed_password):
        token = generate_jwt_token(user.user_id)
        return {"status": "success", "token": token}
    return {"status": "error", "message": "Invalid credentials"}
```

### Simplified Feed Ranking (Python)

```python
import random

class FeedRanker:
    def rank_posts(self, user_id, candidate_posts):
        # Mock ML predictions
        for post in candidate_posts:
            post['score'] = random.uniform(0, 1)  # In reality, use neural network
        # Sort by score descending
        return sorted(candidate_posts, key=lambda p: p['score'], reverse=True)

# Usage
ranker = FeedRanker()
posts = [{'id': 1, 'content': 'Hello'}, {'id': 2, 'content': 'World'}]
ranked = ranker.rank_posts(123, posts)
```

### Java for Message Sending (Simplified)

```java
public class MessagingService {
    public void sendMessage(long senderId, long receiverId, String content) {
        Message msg = new Message(senderId, receiverId, encrypt(content));
        db.save(msg);
        notificationQueue.push(new Notification(receiverId, "New message"));
    }
}
```

### Ad Auction Logic (Pseudocode)

```python
def run_ad_auction(user, ad_slots, bidders):
    winning_ads = []
    for slot in ad_slots:
        bids = [bidder.bid(user, slot) for bidder in bidders]
        winner = max(bids, key=lambda b: b.amount)
        winning_ads.append(winner.ad)
    return winning_ads
```

## References

- [Facebook's Data Center Infrastructure](https://engineering.fb.com/2020/05/18/data-center-engineering/building-facebooks-data-centers/)
- [TAO: Facebook's Distributed Data Store for the Social Graph](https://www.usenix.org/conference/atc13/technical-sessions/presentation/bronson)
- [How News Feed Works](https://about.fb.com/news/2021/01/how-news-feed-works/)
- [Messenger Architecture](https://engineering.fb.com/2014/12/17/core-data/messenger/)
- [Ad Targeting at Scale](https://engineering.fb.com/2014/05/21/core-data/scaling-facebooks-ad-infrastructure/)
- [Privacy and Security](https://engineering.fb.com/security/)
- [Meta Engineering Blog](https://engineering.fb.com/)