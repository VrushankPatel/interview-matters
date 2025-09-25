---
title: API Gateway Design
aliases: [API Gateway, Gateway Pattern]
tags: [#system-design,#api]
created: 2025-09-25
updated: 2025-09-25
---

# API Gateway Design

## Overview

An API Gateway is a server that acts as an API front-end, receiving API requests, enforcing throttling and security policies, passing requests to the back-end service, and then passing the response back to the requester.

## Detailed Explanation

### Core Functions
- **Request Routing**: Directs requests to appropriate microservices.
- **Authentication & Authorization**: Validates tokens and permissions.
- **Rate Limiting**: Controls request frequency.
- **Load Balancing**: Distributes traffic across instances.
- **Response Transformation**: Modifies responses for clients.
- **Logging & Monitoring**: Tracks requests and performance.

### Design Patterns
- **Single Entry Point**: All client requests go through the gateway.
- **Backend for Frontend (BFF)**: Tailored gateways for different clients.
- **Sidecar Pattern**: Gateway deployed alongside services.

### Technologies
- Netflix Zuul
- Spring Cloud Gateway
- AWS API Gateway
- Kong

## Real-world Examples & Use Cases

- **Netflix**: Uses Zuul for routing, authentication, and load balancing.
- **Amazon**: API Gateway for e-commerce APIs with rate limiting.
- **Uber**: Manages API traffic for ride requests and payments.
- **Spotify**: Gateway for music streaming APIs.

## Code Examples

### Spring Cloud Gateway Route Configuration
```java
@Configuration
public class GatewayConfig {
    
    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()
            .route("user-service", r -> r.path("/api/users/**")
                .uri("lb://user-service"))
            .route("order-service", r -> r.path("/api/orders/**")
                .uri("lb://order-service"))
            .build();
    }
}
```

### Rate Limiting Filter
```java
@Configuration
public class RateLimitConfig {
    
    @Bean
    public RequestRateLimiter rateLimiter() {
        return new RedisRateLimiter(10, 20); // 10 requests per second, burst 20
    }
}
```

### Authentication Filter
```java
@Component
public class AuthFilter implements GlobalFilter {
    
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String token = exchange.getRequest().getHeaders().getFirst("Authorization");
        if (!isValidToken(token)) {
            exchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
            return exchange.getResponse().setComplete();
        }
        return chain.filter(exchange);
    }
}
```

## Data Models / Message Formats

### API Request
```json
{
  "method": "GET",
  "path": "/api/users/123",
  "headers": {
    "Authorization": "Bearer token123",
    "Content-Type": "application/json"
  }
}
```

### Gateway Response
```json
{
  "status": 200,
  "data": {
    "id": 123,
    "name": "John Doe"
  },
  "timestamp": "2023-09-25T10:00:00Z"
}
```

## Common Pitfalls & Edge Cases

- Single point of failure
- Performance bottlenecks
- Complex configuration management
- Handling legacy API versions

## References

- [API Gateway Pattern](https://microservices.io/patterns/apigateway.html)
- [Spring Cloud Gateway Documentation](https://spring.io/projects/spring-cloud-gateway)
- [AWS API Gateway](https://aws.amazon.com/api-gateway/)

## Github-README Links & Related Topics

- [Microservices Architecture](../microservices-architecture/README.md)
- [Rate Limiting](../rate-limiting/README.md)
- [Load Balancing and Strategies](../load-balancing-and-strategies/README.md)