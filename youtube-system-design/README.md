---
title: YouTube System Design
aliases: ["Video Streaming Platform"]
tags: [#system-design,#video-streaming,#scalability]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

YouTube is a global video-sharing platform that enables users to upload, view, share, and comment on videos. Launched in 2005, it serves over 2 billion logged-in users monthly, with billions of hours of video watched daily. The system must handle massive scale, including video uploads, real-time streaming, recommendations, and social interactions. Key challenges include video transcoding, content delivery, data consistency, and handling peak traffic during viral events.

## Detailed Explanation

## Architecture Diagram

```mermaid
graph TD
    A[User] --> B[Load Balancer]
    B --> C[API Gateway]
    C --> D[Authentication Service]
    C --> E[Video Upload Service]
    C --> F[Video Processing Service]
    C --> G[Recommendation Engine]
    C --> H[Search Service]
    C --> I[Comment Service]
    F --> J[Transcoding Workers]
    J --> K[Video Storage (S3/GCS)]
    K --> L[CDN (Cloudflare/Akamai)]
    L --> M[Video Playback]
    G --> N[User Data Store (Cassandra)]
    H --> O[Search Index (Elasticsearch)]
    I --> P[Comment Store (DynamoDB)]
    D --> Q[User Store (MySQL)]
    E --> R[Metadata Store (Bigtable)]
```

This diagram illustrates a high-level architecture: users interact via an API gateway, videos are processed and stored, and content is delivered via CDN.

## Key Components

- **API Gateway**: Routes requests to microservices, handles rate limiting, and authentication.
- **Video Upload Service**: Handles file uploads, validates content, and initiates processing.
- **Video Processing Service**: Manages transcoding into multiple formats/resolutions using tools like FFmpeg.
- **Recommendation Engine**: Uses machine learning (e.g., collaborative filtering) to suggest videos based on user history.
- **Search Service**: Indexes videos for fast retrieval using inverted indexes.
- **Comment Service**: Manages threaded comments with moderation.
- **Storage Layer**: Videos in object storage (S3/GCS), metadata in NoSQL (Bigtable), user data in relational DB (MySQL).
- **CDN**: Distributes video content globally to reduce latency.

## Scalability Considerations

- **Horizontal Scaling**: Microservices scale independently; use Kubernetes for orchestration.
- **Data Sharding**: User and video data sharded by user ID or video ID to distribute load.
- **Caching**: Redis for session data, metadata; CDN for video chunks.
- **Asynchronous Processing**: Video transcoding uses queues (e.g., SQS) to handle bursts.
- **Global Distribution**: Data centers worldwide; geo-replication for availability.
- **Load Balancing**: Distributes traffic; auto-scaling based on metrics.
- **Fault Tolerance**: Redundant storage, circuit breakers, and graceful degradation.

## Data Models

- **User**: {user_id (PK), username, email, profile_pic_url, subscriptions (list of channelIds), created_at}
- **Video**: {video_id (PK), title, description, uploader_id (FK), upload_time, duration, views, likes, tags, video_urls (map of resolutions)}
- **Comment**: {comment_id (PK), video_id (FK), user_id (FK), text, timestamp, replies (list of comment_ids)}
- **View**: {view_id (PK), video_id (FK), user_id (FK), timestamp, watch_time}

## Real-world Examples & Use Cases

- **Viral Video Handling**: During events like Super Bowl ads, traffic spikes to millions of concurrent views. CDN pre-caches popular content; auto-scaling provisions extra servers.
- **Live Streaming**: Uses WebRTC for low-latency delivery; transcodes in real-time for adaptive bitrate.
- **Recommendation Personalization**: Analyzes user watch history and engagement to suggest content, improving retention (e.g., 70% of views from recommendations).
- **Content Moderation**: AI detects inappropriate content; human review for appeals.
- **Global Accessibility**: Supports multiple languages; regional restrictions via geolocation.

## Code Examples

### Pseudocode for Video Upload Handler (Python-like)

```python
def upload_video(file, user_id, title, description):
    # Validate file size/type
    if file.size > MAX_SIZE or not is_video(file):
        raise ValidationError("Invalid file")
    
    # Generate video_id
    video_id = generate_uuid()
    
    # Store metadata
    metadata = {
        'video_id': video_id,
        'uploader_id': user_id,
        'title': title,
        'description': description,
        'status': 'uploading'
    }
    metadata_store.insert(metadata)
    
    # Upload to temp storage
    temp_url = upload_to_temp(file)
    
    # Queue for processing
    queue.send({'video_id': video_id, 'temp_url': temp_url})
    
    return video_id
```

### Pseudocode for Recommendation Algorithm (Simplified Collaborative Filtering)

```python
def recommend_videos(user_id, num_recommendations=10):
    # Get user's watch history
    watched = user_store.get_watched_videos(user_id)
    
    # Find similar users
    similar_users = find_similar_users(user_id, watched)
    
    # Aggregate recommendations
    candidates = set()
    for sim_user in similar_users:
        candidates.update(user_store.get_watched_videos(sim_user))
    
    # Filter out already watched
    recommendations = candidates - watched
    
    # Rank by popularity/engagement
    ranked = sorted(recommendations, key=lambda v: video_store.get_views(v), reverse=True)
    
    return ranked[:num_recommendations]
```

## References

- [System Design Primer - YouTube](https://github.com/donnemartin/system-design-primer/tree/master/solutions/system_design/youtube)
- [Grokking the System Design Interview - Video Streaming](https://www.educative.io/courses/grokking-the-system-design-interview/m2ygV4E81AR)
- [YouTube's Architecture Evolution](https://www.youtube.com/watch?v=AUdDeF3J3fA)
- [AWS Case Study: YouTube](https://aws.amazon.com/solutions/case-studies/youtube/)

## Github-README Links & Related Topics
- [Twitter System Design](./twitter-system-design/README.md)
- [Facebook System Design](./facebook-system-design/README.md)
- [Uber System Design](./uber-system-design/README.md)
- [Airbnb System Design](./airbnb-system-design/README.md)
- [Popular System Designs LLD and HLD](./popular-system-designs-lld-and-hld/README.md)