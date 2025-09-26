---
title: Load Balancing and Strategies
aliases: [load balancing, load distribution, balancing algorithms]
tags: [#load-balancing,#scalability,#networking]
created: 2025-09-26
updated: 2025-09-26
---

# Load Balancing and Strategies

## Overview

Load balancing distributes incoming network traffic across multiple servers to ensure no single server becomes overwhelmed, improving availability, scalability, and fault tolerance. It can be implemented at various layers (DNS, transport, application) using different algorithms and strategies.

## Detailed Explanation

### Load Balancing Algorithms

| Algorithm | Description | Pros | Cons |
|-----------|-------------|------|------|
| Round Robin | Cycles through servers sequentially | Simple, fair distribution | Ignores server load or capacity |
| Least Connections | Routes to server with fewest active connections | Balances load better for varying request times | Requires tracking connections |
| IP Hash | Uses client IP to consistently route to same server | Ensures session persistence | Can lead to uneven load if IPs cluster |
| Weighted Round Robin | Assigns weights based on server capacity | Accounts for heterogeneous servers | More complex configuration |
| Least Response Time | Routes to server with fastest response | Optimizes for performance | Requires monitoring response times |
| Random | Randomly selects a server | Simple, no state needed | Can be uneven in small samples |
| Power of Two Choices | Randomly selects two servers, chooses the better | Better load distribution than random | Slightly more complex |

### Static vs Dynamic Algorithms

- **Static**: Do not consider current system state (e.g., Round Robin, IP Hash). Efficient for predictable workloads but may lead to imbalance.
- **Dynamic**: Adapt based on real-time load (e.g., Least Connections, Least Response Time). More efficient for variable loads but require communication overhead.

### Types of Load Balancers

- **Hardware**: Dedicated appliances (e.g., F5, Citrix).
- **Software**: Nginx, HAProxy, Apache.
- **Cloud**: AWS ELB, Azure Load Balancer, GCP Load Balancing.

### Layer 4 vs Layer 7

- **Layer 4**: Transport layer, routes based on IP/port, faster but less intelligent.
- **Layer 7**: Application layer, routes based on HTTP headers, content, etc.

```mermaid
graph TD
    C[Client] --> LB[Load Balancer]
    LB --> S1[Server 1]
    LB --> S2[Server 2]
    LB --> S3[Server 3]
    LB --> H[Health Check]
    H --> LB
```

## Real-world Examples & Use Cases

- **Web Applications**: Distribute HTTP requests across app servers to handle high traffic.
- **Databases**: Load balance read queries across replicas for scalability.
- **Microservices**: API gateways route requests to service instances dynamically.
- **CDNs**: Global load balancing directs users to nearest content servers.
- **Telecommunications**: Balance traffic across multiple network links for redundancy and bandwidth.
- **Data Centers**: Distribute workloads in cloud environments for efficient resource use.
- **AI Data Ingestion**: Manage high-volume data pipelines for model training and inference.
- **Failover Systems**: Ensure service continuity by rerouting traffic from failed servers.

## Code Examples

### Nginx Load Balancing

```nginx
# nginx.conf
http {
    upstream backend {
        least_conn;  # Algorithm
        server backend1.example.com:8080 weight=3;
        server backend2.example.com:8080 weight=2;
        server backend3.example.com:8080 backup;
    }

    server {
        listen 80;
        location / {
            proxy_pass http://backend;
            proxy_set_header Host $host;
        }
    }
}
```

### HAProxy Configuration

```haproxy
# haproxy.cfg
frontend http_front
    bind *:80
    default_backend http_back

backend http_back
    balance leastconn
    server web1 192.168.1.10:80 check
    server web2 192.168.1.11:80 check
    server web3 192.168.1.12:80 check backup
```

### AWS Application Load Balancer (Terraform)

```hcl
resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path = "/health"
  }
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
```

### Simple Round-Robin Load Balancer in Python

```python
class RoundRobinLoadBalancer:
    def __init__(self, servers):
        self.servers = servers
        self.index = 0

    def get_server(self):
        if not self.servers:
            return None
        server = self.servers[self.index]
        self.index = (self.index + 1) % len(self.servers)
        return server

# Usage
lb = RoundRobinLoadBalancer(['server1.example.com', 'server2.example.com', 'server3.example.com'])
for _ in range(5):
    print(lb.get_server())
```

## STAR Summary

**Situation**: An e-commerce platform experiencing downtime during peak shopping seasons due to server overload.

**Task**: Implement load balancing to handle 10x traffic increase and maintain 99.9% uptime.

**Action**: Deployed HAProxy with least connections algorithm, configured health checks, and set up auto-scaling. Implemented session persistence for shopping carts.

**Result**: Successfully handled Black Friday traffic with zero downtime, improved response time by 50%, and reduced server costs through efficient resource utilization.

## Journey / Sequence

```mermaid
sequenceDiagram
    participant Client
    participant DNS
    participant LB
    participant Server1
    participant Server2
    participant Server3

    Client->>DNS: Resolve domain
    DNS->>Client: Return LB IP
    Client->>LB: HTTP Request
    LB->>LB: Select server (algorithm)
    LB->>Server1: Forward request
    Server1->>LB: Response
    LB->>Client: Return response
    LB->>LB: Health check servers
```

## Common Pitfalls & Edge Cases

| Pitfall | Description | Mitigation |
|---------|-------------|------------|
| Session Stickiness Issues | User sessions lost during server failures | Use distributed sessions or sticky sessions |
| Health Check Flapping | Servers marked unhealthy due to transient issues | Tune health check intervals and thresholds |
| Uneven Load Distribution | Some servers overloaded despite balancing | Monitor and adjust weights/algorithms |
| SSL Termination Overhead | Load balancer becomes bottleneck for HTTPS | Use hardware acceleration or dedicated SSL terminators |
| Database Connection Pooling | Load balanced app servers exhaust DB connections | Implement connection pooling per server |
| Cache Inconsistency | Different cached data across servers | Use shared cache or cache invalidation strategies |

## Tools & Libraries

| Category | Tool/Library | Description | Language/Framework |
|----------|--------------|-------------|-------------------|
| Software LB | Nginx | High-performance web server with LB | C |
| Software LB | HAProxy | TCP/HTTP load balancer | C |
| Software LB | Apache Traffic Server | Caching proxy and LB | C++ |
| Cloud LB | AWS ELB/ALB | Managed load balancing service | - |
| Cloud LB | Azure Load Balancer | Cloud load balancing | - |
| Cloud LB | GCP Load Balancing | Global load balancing | - |
| Library | Ribbon | Client-side load balancing | Java |
| Library | Eureka | Service discovery with LB | Java |

## References

- [Load Balancing (computing) - Wikipedia](https://en.wikipedia.org/wiki/Load_balancing_(computing))
- [Nginx Load Balancing](https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/)
- [HAProxy Documentation](http://www.haproxy.org/#docs)
- [AWS Load Balancing](https://aws.amazon.com/elasticloadbalancing/)
- [Load Balancing Algorithms](https://www.nginx.com/resources/glossary/load-balancing/)
- [F5 Load Balancing 101](https://f5.com/resources/white-papers/load-balancing-101-nuts-and-bolts)
- [NGINX Power of Two Choices](https://www.nginx.com/blog/nginx-power-of-two-choices-load-balancing-algorithm/)

## Github-README Links & Related Topics

- [api-gateway-design](api-gateway-design/)
- [api-gateway-patterns](api-gateway-patterns/)
- [cloud-architecture-patterns](cloud-architecture-patterns/)
- [distributed-caching-with-redis](distributed-caching-with-redis/)
- [fault-tolerance-in-distributed-systems](fault-tolerance-in-distributed-systems/)
- [high-scalability-patterns](high-scalability-patterns/)
- [proxy-forward-reverse](proxy-forward-reverse/)