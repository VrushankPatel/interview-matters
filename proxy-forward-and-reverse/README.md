---
title: 'Proxy: Forward and Reverse'
aliases: ['Forward Proxy', 'Reverse Proxy']
tags: ['#networking', '#proxy']
created: '2025-09-26'
updated: '2025-09-26'
---

# Proxy: Forward and Reverse

## Overview

Proxies act as intermediaries between clients and servers, facilitating requests and responses. Forward proxies handle client requests to external servers, often for anonymity or access control. Reverse proxies manage server-side requests, directing traffic to internal servers for load balancing, security, and performance optimization.

## Detailed Explanation

### Forward Proxy

A forward proxy sits between clients and the internet, forwarding client requests to external servers. It hides the client's identity from the destination server while allowing access to restricted content or enforcing policies.

Key features:
- **Anonymity**: Masks client IP addresses.
- **Caching**: Stores responses to speed up repeated requests.
- **Filtering**: Blocks access to certain sites or content.
- **Logging**: Monitors and logs client activities.

```mermaid
graph LR
    A[Client] --> B[Forward Proxy]
    B --> C[Internet]
    C --> D[External Server]
    D --> C
    C --> B
    B --> A
```

### Reverse Proxy

A reverse proxy sits in front of web servers, receiving requests from clients and forwarding them to appropriate backend servers. It hides server details from clients, providing a single entry point.

Key features:
- **Load Balancing**: Distributes requests across multiple servers.
- **SSL Termination**: Handles encryption/decryption offloading from servers.
- **Caching**: Caches static content to reduce server load.
- **Security**: Protects against attacks like DDoS.
- **Compression**: Optimizes response sizes.

```mermaid
graph LR
    A[Client] --> B[Reverse Proxy]
    B --> C[Server 1]
    B --> D[Server 2]
    B --> E[Server 3]
    C --> B
    D --> B
    E --> B
    B --> A
```

### Comparison

| Aspect              | Forward Proxy                          | Reverse Proxy                          |
|---------------------|----------------------------------------|----------------------------------------|
| Position           | Client-side                            | Server-side                            |
| Purpose            | Client anonymity, access control       | Server protection, load balancing      |
| Visibility         | Hides client from server               | Hides server from client               |
| Caching            | Client-side caching                    | Server-side caching                    |
| Security           | Protects client from malicious sites   | Protects server from malicious clients |
| Examples           | Squid, corporate proxies               | NGINX, HAProxy, Apache mod_proxy       |

## Real-world Examples & Use Cases

### Forward Proxy Use Cases
- **Corporate Networks**: Employees access the internet through a proxy that enforces company policies and logs activities.
- **VPN-like Access**: Bypassing geo-restrictions, e.g., accessing region-locked content.
- **Content Filtering**: Schools or libraries block inappropriate sites.
- **Anonymity Tools**: Tor network uses onion routing, a form of proxy chaining.

### Reverse Proxy Use Cases
- **Web Applications**: NGINX reverse proxy in front of Node.js or Python apps for load balancing and SSL termination.
- **Microservices**: API gateways like [Kong](kong-api-gateway/) or [API Gateway](api-gateway-design/) route requests to services.
- **CDN Integration**: Cloudflare or Akamai act as reverse proxies with global caching.
- **Security**: Protects against SQL injection or XSS by filtering requests before reaching servers.
- **High Availability**: Ensures uptime by routing around failed servers.

## Code Examples

### NGINX Reverse Proxy Configuration

Basic reverse proxy setup:

```nginx
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend_servers;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

upstream backend_servers {
    server backend1.example.com:8080;
    server backend2.example.com:8080;
}
```

With SSL termination:

```nginx
server {
    listen 443 ssl;
    server_name example.com;
    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;

    location / {
        proxy_pass http://backend_servers;
        proxy_ssl_verify off;  # For HTTPS backend
    }
}
```

### Squid Forward Proxy Configuration

Basic Squid config snippet:

```squid
http_port 3128

acl localnet src 192.168.1.0/24
http_access allow localnet
http_access deny all

cache_dir ufs /var/spool/squid 100 16 256
```

### Python Client with Forward Proxy

Using `requests` library:

```python
import requests

proxies = {
    'http': 'http://proxy.example.com:3128',
    'https': 'http://proxy.example.com:3128',
}

response = requests.get('http://example.com', proxies=proxies)
print(response.text)
```

For authentication:

```python
proxies = {
    'http': 'http://user:pass@proxy.example.com:3128',
}
```

## References

- [Wikipedia: Proxy Server](https://en.wikipedia.org/wiki/Proxy_server)
- [Wikipedia: Reverse Proxy](https://en.wikipedia.org/wiki/Reverse_proxy)
- [NGINX Proxy Module](https://nginx.org/en/docs/http/ngx_http_proxy_module.html)
- [NGINX Reverse Proxy Guide](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)
- [RFC 7230: HTTP/1.1 Message Syntax and Routing](https://datatracker.ietf.org/doc/html/rfc7230)

## Github-README Links & Related Topics

- [API Gateway Design](api-gateway-design/)
- [Load Balancing](load-balancing/)
- [SSL/TLS Termination](ssl-termination/)
- [Content Delivery Network (CDN)](cdn-architecture/)
- [Web Caching](caching/)

## STAR Summary

- **Situation**: Need to handle high traffic for a web app with multiple backend servers.
- **Task**: Implement a reverse proxy for load balancing and security.
- **Action**: Configured NGINX as reverse proxy with upstream servers, SSL termination, and caching.
- **Result**: Improved performance by 40%, reduced server load, and enhanced security against attacks.

## Common Pitfalls & Edge Cases

- **Infinite Loops**: Avoid proxy_pass to the same server causing loops; use different ports or conditions.
- **Header Spoofing**: Ensure proper header forwarding to prevent security issues.
- **Buffering Issues**: Large responses may exhaust memory; tune proxy_buffers.
- **SSL Certificate Mismatches**: Verify certificates for HTTPS backends.
- **Caching Stale Data**: Set appropriate cache expiration to avoid serving outdated content.
- **Geo-Blocking Bypass**: Forward proxies can be misused for illegal access; monitor usage.

## Tools & Libraries

- **NGINX**: Popular for reverse proxies; supports HTTP, TCP/UDP load balancing.
- **HAProxy**: High-performance TCP/HTTP load balancer and proxy.
- **Squid**: Open-source forward proxy with caching.
- **Apache mod_proxy**: Module for reverse proxy in Apache HTTP Server.
- **Traefik**: Modern reverse proxy with automatic service discovery.
- **Python requests**: Library for HTTP requests with proxy support.
- **Node.js http-proxy**: Library for creating proxies in Node.js applications.