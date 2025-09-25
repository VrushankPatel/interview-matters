---
title: Service Discovery
aliases: ["Service Registry", "Dynamic Service Location"]
tags: ["#distributed-systems","#microservices","#system-design"]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Service discovery enables services in a distributed system to dynamically locate and communicate with each other without relying on static IP addresses or hostnames. It provides a registry where services can register themselves and be discovered by clients.

## Detailed Explanation

In microservices architectures, services need to find peers for communication. Service discovery abstracts network locations, allowing for dynamic scaling, load balancing, and fault tolerance.

### Components

- **Service Registry**: A database storing service instances and their locations.
- **Service Registration**: Services register their endpoints upon startup.
- **Service Deregistration**: Services remove themselves when shutting down.
- **Health Checks**: Registry monitors service health.

### Patterns

- **Client-Side Discovery**: Clients query the registry directly and load balance.
- **Server-Side Discovery**: A load balancer queries the registry on behalf of clients.

### Protocols

- **DNS-Based**: Using DNS SRV records.
- **API-Based**: REST or custom APIs for registration/lookup.

## Real-world Examples & Use Cases

- **Netflix Eureka**: Client-side discovery for microservices.
- **Kubernetes Service Discovery**: Via DNS or service API.
- **HashiCorp Consul**: Provides service mesh with discovery.
- **Apache ZooKeeper**: Used for coordination and discovery.
- **AWS ECS Service Discovery**: Integrates with Route 53.

## Code Examples

### Eureka Server Configuration

```yaml
# application.yml for Eureka Server
server:
  port: 8761

eureka:
  client:
    register-with-eureka: false
    fetch-registry: false
```

### Eureka Client in Spring Boot

```java
@SpringBootApplication
@EnableEurekaClient
public class ServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(ServiceApplication.class, args);
    }
}

// Service registration happens automatically
```

### Consul Service Registration

```json
{
  "service": {
    "name": "web",
    "tags": ["rails"],
    "port": 80,
    "check": {
      "http": "http://localhost:80/health",
      "interval": "10s"
    }
  }
}
```

### Client-Side Discovery with Ribbon

```java
@Autowired
private LoadBalancerClient loadBalancer;

public void callService() {
    ServiceInstance instance = loadBalancer.choose("service-name");
    // Use instance.getUri() to make request
}
```

## Journey / Sequence

1. **Service Startup**: Service registers with registry, providing metadata.
2. **Health Monitoring**: Registry performs periodic health checks.
3. **Client Request**: Client queries registry for service instances.
4. **Load Balancing**: Client selects an instance based on strategy.
5. **Communication**: Client communicates directly with selected instance.
6. **Failure Handling**: If instance fails, client retries with another.

## Common Pitfalls & Edge Cases

- **Network Partitions**: Registry unavailability can isolate services.
- **Stale Registrations**: Failed services not deregistering promptly.
- **Security**: Exposing registry can lead to attacks; use authentication.
- **Scalability**: High registration/deregistration rates can overwhelm registry.
- **Multi-Region**: Ensuring discovery works across data centers.

## Tools & Libraries

- **Netflix Eureka**: Open-source service registry.
- **HashiCorp Consul**: Service mesh with discovery, health checks.
- **Apache ZooKeeper**: Coordination service used for discovery.
- **etcd**: Distributed key-value store for service metadata.
- **Spring Cloud Netflix**: Integrates Eureka with Spring.

## References

- [Service Discovery Pattern - Microservices.io](https://microservices.io/patterns/service-discovery.html)
- [Eureka Documentation](https://github.com/Netflix/eureka/wiki)
- [Consul Service Discovery](https://www.consul.io/docs/discovery/services)
- [Kubernetes Service Discovery](https://kubernetes.io/docs/concepts/services-networking/service/)

## Github-README Links & Related Topics

- [Microservices Architecture](../microservices-architecture/)
- [Load Balancing and Strategies](../load-balancing-and-strategies/)
- [Microservices Communication Patterns](../microservices-communication-patterns/)
- [Service Mesh Patterns](../service-mesh-patterns/)
- [Kubernetes Basics](../kubernetes-basics/)