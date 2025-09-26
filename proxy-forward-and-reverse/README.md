---
title: Proxy Forward and Reverse
aliases: [forward proxy, reverse proxy]
tags: [#networking, #system-design]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Proxies act as intermediaries between clients and servers. Forward proxies serve clients, while reverse proxies serve servers.

# Detailed Explanation

A forward proxy sits between client and internet, hiding client identity. A reverse proxy sits between internet and servers, hiding server details and providing load balancing.

## Types

- **Forward Proxy**: Client-side, for anonymity or caching
- **Reverse Proxy**: Server-side, for security, load balancing

# Real-world Examples & Use Cases

- Corporate networks using forward proxies for security
- Web applications using reverse proxies like Nginx for SSL termination and load balancing

# Code Examples

```nginx
# Nginx reverse proxy configuration
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend_servers;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

```java
// Simple forward proxy in Java (conceptual)
import java.net.*;

public class ForwardProxy {
    public static void main(String[] args) throws Exception {
        ServerSocket serverSocket = new ServerSocket(8080);
        while (true) {
            Socket clientSocket = serverSocket.accept();
            // Handle client request and forward to target
        }
    }
}
```

# References

- [Nginx Proxy Module](https://nginx.org/en/docs/http/ngx_http_proxy_module.html)
- [HAProxy](http://www.haproxy.org/)

# Github-README Links & Related Topics

- [Load Balancing and Strategies](./load-balancing-and-strategies)
