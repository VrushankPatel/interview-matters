---
title: HTTP Caching Headers
aliases: [HTTP Cache Control, Web Caching]
tags: [#networking,#system-design]
created: 2025-09-25
updated: 2025-09-25
---

# HTTP Caching Headers

## Overview

HTTP caching headers control how web browsers and intermediate caches store and reuse HTTP responses, reducing server load, improving performance, and enhancing user experience by serving content from cache when possible.

## Detailed Explanation

### Cache-Control Header

Primary header for controlling caching behavior.

- **public**: Response can be cached by any cache.
- **private**: Only browser cache, not shared caches.
- **no-cache**: Cache but revalidate with server before use.
- **no-store**: Do not cache at all.
- **max-age**: Maximum time in seconds to cache.
- **s-maxage**: Overrides max-age for shared caches.

### Other Headers

- **ETag**: Entity tag for conditional requests.
- **Last-Modified**: Timestamp of last modification.
- **Expires**: Absolute expiration date (deprecated, use Cache-Control).
- **Vary**: Specifies which request headers affect caching.

### Caching Strategies

- **Browser Caching**: Client-side storage.
- **CDN Caching**: Distributed caching at edge locations.
- **Reverse Proxy Caching**: Server-side caching (e.g., Nginx, Varnish).

### Cache Invalidation

- **Conditional Requests**: If-None-Match (ETag), If-Modified-Since.
- **Cache Busting**: Append version/query params to URLs.

## Real-world Examples & Use Cases

- **Static Assets**: Images, CSS, JS cached for long periods.
- **API Responses**: Short-lived caches for dynamic data.
- **CDN Usage**: Content delivery networks cache global content.

## Code Examples

### Setting Cache-Control in HTTP Response (Java/Spring)

```java
@RestController
public class ApiController {
    @GetMapping("/api/data")
    public ResponseEntity<String> getData() {
        HttpHeaders headers = new HttpHeaders();
        headers.setCacheControl(CacheControl.maxAge(1, TimeUnit.HOURS).cachePublic());
        return ResponseEntity.ok().headers(headers).body("Cached data");
    }
}
```

### Nginx Configuration for Caching

```nginx
location /static/ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}

location /api/ {
    expires 30s;
    add_header Cache-Control "private, max-age=30";
}
```

### Express.js Middleware

```javascript
const express = require('express');
const app = express();

app.get('/api/data', (req, res) => {
    res.set('Cache-Control', 'public, max-age=300');
    res.json({ data: 'cached response' });
});
```

## Common Pitfalls & Edge Cases

- **Stale Data**: Serving outdated cached content.
- **Cache Poisoning**: Malicious cache entries.
- **Mobile Networks**: Different caching behavior.
- **HTTPS Considerations**: Secure contexts may have restrictions.

## References

- [MDN HTTP Caching](https://developer.mozilla.org/en-US/docs/Web/HTTP/Caching)
- [RFC 7234 - HTTP/1.1 Caching](https://tools.ietf.org/html/rfc7234)
- [Google Web Fundamentals: HTTP Caching](https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/http-caching)

## Github-README Links & Related Topics

- [CDN Architecture](cdn-architecture/README.md)
- [API Rate Limiting](api-rate-limiting/README.md)
- [Proxy Forward and Reverse](proxy-forward-and-reverse/README.md)