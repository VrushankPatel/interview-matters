---
title: Load Balancing and Strategies
aliases: [load balancer, distribution strategies]
tags: [#system-design, #scalability]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Load balancing distributes incoming network traffic across multiple servers to ensure no single server becomes overwhelmed, improving availability and scalability.

# Detailed Explanation

Load balancers use algorithms to decide how to distribute requests. Common strategies include Round Robin, Least Connections, IP Hash.

## Algorithms

- **Round Robin**: Cycles through servers sequentially
- **Least Connections**: Routes to server with fewest active connections
- **IP Hash**: Routes based on client IP for session persistence

# Real-world Examples & Use Cases

- Web servers handling high traffic
- Microservices architectures distributing API calls

# Code Examples

```java
// Simple Round Robin Load Balancer in Java
import java.util.*;

public class RoundRobinLoadBalancer {
    private List<String> servers = Arrays.asList("server1", "server2", "server3");
    private int currentIndex = 0;

    public synchronized String getServer() {
        String server = servers.get(currentIndex);
        currentIndex = (currentIndex + 1) % servers.size();
        return server;
    }
}
```

```nginx
# Nginx load balancing
upstream backend {
    server backend1.example.com;
    server backend2.example.com;
    server backend3.example.com;
}

server {
    listen 80;
    location / {
        proxy_pass http://backend;
    }
}
```

# References

- [Nginx Load Balancing](https://nginx.org/en/docs/http/load_balancing.html)
- [HAProxy Algorithms](http://www.haproxy.org/download/1.8/doc/configuration.txt)

# Github-README Links & Related Topics

- [Proxy Forward and Reverse](./proxy-forward-and-reverse)
- [High Scalability Patterns](./high-scalability-patterns)
