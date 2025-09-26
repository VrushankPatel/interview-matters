---
title: Netflix System Design
aliases: [Netflix Video Streaming, Netflix Architecture]
tags: [#system-design, #video-streaming, #scalability, #microservices]
created: 2025-09-26
updated: 2025-09-26
---

# Netflix System Design

## Overview

Netflix is a global video streaming platform that delivers personalized content to millions of users. The system handles video storage, encoding, recommendation, and streaming with high scalability and low latency.

## Detailed Explanation

### Functional Requirements
- User registration and authentication.
- Content catalog browsing and search.
- Video playback with adaptive bitrate.
- Personalized recommendations.
- Offline downloads.

### Non-Functional Requirements
- Handle billions of hours of streaming monthly.
- Global CDN for low latency.
- 99.99% availability.
- Scalable to 200+ million subscribers.

### System Components
- **Client Apps**: Mobile, TV, web apps for playback.
- **API Gateway**: Route requests to microservices.
- **Microservices**: User management, catalog, recommendations, billing.
- **Content Delivery**: CDN for video distribution.
- **Data Pipeline**: Ingest, encode, and store videos.
- **Recommendation Engine**: ML-based suggestions.
- **Databases**: Cassandra for user data, Elasticsearch for search.

### Architecture Diagram

```mermaid
graph TD
    A[User Device] --> B[CDN Edge]
    B --> C[API Gateway]
    C --> D[Microservices]
    D --> E[Databases]
    D --> F[Recommendation Engine]
    F --> G[ML Models]
    H[Content Ingest] --> I[Encoding Pipeline]
    I --> J[Storage (S3)]
    J --> B
```

### Data Models / Message Formats
- User Profile: JSON with preferences, watch history.
- Video Metadata: Title, genre, duration, encodings.
- Recommendation Events: User actions streamed to Kafka.

### Common Pitfalls & Edge Cases
- Video buffering: Adaptive bitrate streaming.
- Regional restrictions: Geo-blocking.
- High concurrency: Microservices with auto-scaling.
- Data privacy: GDPR compliance.

## Real-world Examples & Use Cases

- Netflix itself: Streaming movies and shows globally.
- Similar platforms: Amazon Prime Video, Disney+.

Use cases: Entertainment, education (documentaries), personalized content discovery.

## Code Examples

### Simple Video Player in JavaScript

```javascript
class VideoPlayer {
    constructor(videoElement) {
        this.video = videoElement;
        this.currentQuality = '720p';
    }

    play() {
        this.video.play();
    }

    changeQuality(quality) {
        // Switch to different bitrate
        this.currentQuality = quality;
        this.video.src = `path/to/video_${quality}.mp4`;
        this.video.load();
    }
}

// Usage
const player = new VideoPlayer(document.getElementById('video'));
player.play();
```

### Microservice for Recommendations (Spring Boot)

```java
@RestController
@RequestMapping("/recommendations")
public class RecommendationController {
    @Autowired
    private RecommendationService service;

    @GetMapping("/{userId}")
    public List<Video> getRecommendations(@PathVariable String userId) {
        return service.getPersonalizedRecommendations(userId);
    }
}

@Service
public class RecommendationService {
    public List<Video> getPersonalizedRecommendations(String userId) {
        // ML logic here
        return List.of(new Video("Movie1"), new Video("Movie2"));
    }
}
```

### Kafka Producer for User Events

```java
@Configuration
public class KafkaConfig {
    @Bean
    public ProducerFactory<String, String> producerFactory() {
        Map<String, Object> config = new HashMap<>();
        config.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        return new DefaultKafkaProducerFactory<>(config);
    }

    @Bean
    public KafkaTemplate<String, String> kafkaTemplate() {
        return new KafkaTemplate<>(producerFactory());
    }
}

@Service
public class EventService {
    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    public void sendWatchEvent(String userId, String videoId) {
        kafkaTemplate.send("watch-events", userId + ":" + videoId);
    }
}
```

## References

- [Netflix Tech Blog](https://netflixtechblog.com/)
- [Designing Netflix's Video Streaming Architecture](https://www.youtube.com/watch?v=psQzyFfsUGU)
- [Netflix Open Source](https://netflix.github.io/)

## Github-README Links & Related Topics

- [Microservices Architecture](microservices-architecture/)
- [CDN Architecture](cdn-architecture/)
- [Event Streaming with Apache Kafka](event-streaming-with-apache-kafka/)
- [Distributed Caching with Redis](distributed-caching-with-redis/)
- [Machine Learning in System Design](machine-learning-in-system-design/)
