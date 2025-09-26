---
title: URL Shortener System Design
aliases: [URL Shortener, TinyURL Design]
tags: [#system-design, #web-development, #scalability]
created: 2025-09-26
updated: 2025-09-26
---

# URL Shortener System Design

## Overview

A URL shortener service, such as Bitly or TinyURL, converts long URLs into short, unique aliases that redirect to the original URLs. This enables easier sharing, tracking of clicks, and analytics for marketing campaigns.

## Detailed Explanation

### Functional Requirements
- Shorten a given URL to a unique short code.
- Redirect from short URL to original URL.
- Support custom short URLs (if requested).
- Handle URL expiration and deletion.
- Provide analytics on click counts and sources.

### Non-Functional Requirements
- High availability (99.9% uptime).
- Low latency (<100ms for redirects).
- Scalability to handle millions of URLs and billions of redirects.
- Security against malicious URLs.

### System Components
- **API Layer**: RESTful endpoints for shortening and redirecting.
- **Application Servers**: Handle business logic, validation, and generation of short codes.
- **Database**: Store URL mappings, metadata, and analytics.
- **Cache**: In-memory store for frequent redirects to reduce database load.
- **CDN**: Distribute redirects globally for low latency.
- **Analytics Service**: Track and aggregate click data.

### Architecture Diagram

```mermaid
graph TD
    A[User] --> B[CDN / Load Balancer]
    B --> C[API Gateway]
    C --> D[Application Servers]
    D --> E[Cache (Redis)]
    D --> F[Database (NoSQL like DynamoDB)]
    D --> G[Analytics Service]
    G --> F
```

### Data Models
- URL Table: short_code (PK), original_url, created_at, expires_at, user_id.
- Click Table: short_code, timestamp, ip, user_agent.

### Common Pitfalls & Edge Cases
- Collision in short codes: Use base62 encoding with sufficient length.
- Malicious URLs: Implement URL validation and blacklisting.
- High traffic spikes: Auto-scaling and rate limiting.
- Data consistency: Use eventual consistency for analytics.

## Real-world Examples & Use Cases

- **Bitly**: Provides link shortening with detailed analytics for social media and marketing.
- **TinyURL**: Simple shortening service used in emails and forums.
- **Google URL Shortener (goo.gl)**: Integrated with Google Analytics.

Use cases include social media sharing (e.g., Twitter character limits), email campaigns, QR codes for offline marketing, and affiliate link tracking.

## Code Examples

### Simple In-Memory URL Shortener in Java

```java
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public class URLShortener {
    private Map<String, String> urlMap = new HashMap<>();
    private Map<String, String> reverseMap = new HashMap<>();
    private AtomicInteger counter = new AtomicInteger(0);
    private static final String BASE_URL = "http://short.ly/";

    public String shorten(String longUrl) {
        if (reverseMap.containsKey(longUrl)) {
            return BASE_URL + reverseMap.get(longUrl);
        }
        String shortCode = generateShortCode();
        urlMap.put(shortCode, longUrl);
        reverseMap.put(longUrl, shortCode);
        return BASE_URL + shortCode;
    }

    public String redirect(String shortCode) {
        return urlMap.get(shortCode);
    }

    private String generateShortCode() {
        return Integer.toString(counter.incrementAndGet(), 36);
    }
}
```

### REST API with Spring Boot

```java
@RestController
@RequestMapping("/api")
public class URLController {
    @Autowired
    private URLService urlService;

    @PostMapping("/shorten")
    public ResponseEntity<Map<String, String>> shorten(@RequestBody Map<String, String> request) {
        String longUrl = request.get("url");
        String shortUrl = urlService.shorten(longUrl);
        Map<String, String> response = new HashMap<>();
        response.put("shortUrl", shortUrl);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{shortCode}")
    public ResponseEntity<Void> redirect(@PathVariable String shortCode) {
        String longUrl = urlService.redirect(shortCode);
        if (longUrl == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.status(HttpStatus.FOUND)
                .header(HttpHeaders.LOCATION, longUrl)
                .build();
    }
}
```

### Database Schema (SQL)

```sql
CREATE TABLE urls (
    short_code VARCHAR(10) PRIMARY KEY,
    original_url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP,
    user_id VARCHAR(50)
);

CREATE TABLE clicks (
    id SERIAL PRIMARY KEY,
    short_code VARCHAR(10),
    clicked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    user_agent TEXT,
    FOREIGN KEY (short_code) REFERENCES urls(short_code)
);
```

## References

- [System Design: Designing a URL Shortening service like TinyURL](https://www.educative.io/courses/grokking-the-system-design-interview/m2ygV4E81AR)
- [URL Shortener System Design Interview](https://www.youtube.com/watch?v=JQDHz72OA3c)
- [Bitly Engineering Blog](https://engineering.bitly.com/)

## Github-README Links & Related Topics

- [Caching](../caching/README.md)
- [Database Sharding Strategies](../database-sharding-strategies/README.md)
- [API Rate Limiting](../api-rate-limiting/README.md)
- [CDN Architecture](../cdn-architecture/README.md)
- [Load Balancing Strategies](../load-balancing-and-strategies/README.md)
