---
title: Docker Security Best Practices
aliases: [Docker Security]
tags: [#docker,#security,#devops]
created: 2025-09-25
updated: 2025-09-26
---

# Docker Security Best Practices

## Overview

Docker containers provide a lightweight virtualization mechanism, but securing them requires understanding multiple layers of security: kernel namespaces, control groups, daemon attack surface, Linux capabilities, and additional hardening features. By default, Docker containers are reasonably secure, especially when running processes as non-privileged users. However, implementing best practices across image building, runtime configuration, and host security is essential for production deployments.

## Detailed Explanation

### Kernel Namespaces and Isolation
Docker leverages Linux kernel namespaces to provide process, network, and filesystem isolation. Each container gets its own namespaces, preventing processes from seeing or affecting those in other containers or the host. Network isolation uses bridge interfaces, allowing controlled inter-container communication while maintaining separation.

Key points:
- Namespaces have been mature since kernel 2.6.26 (2008)
- Containers cannot access host sockets or interfaces by default
- Public ports and links enable controlled network access

### Control Groups (cgroups)
Cgroups provide resource accounting and limiting, preventing denial-of-service attacks by ensuring fair resource distribution. They track and limit CPU, memory, disk I/O, and other resources, crucial for multi-tenant environments.

### Docker Daemon Security
The Docker daemon runs with root privileges and presents a significant attack surface. Key considerations:

- Only trusted users should control the daemon
- Directory sharing between host and container can expose host filesystem
- REST API should use Unix sockets or HTTPS with certificates
- Avoid exposing daemon API over HTTP without TLS

### Linux Kernel Capabilities
Docker drops most Linux capabilities by default, running containers with reduced privileges. This limits the damage an attacker can do even if they escalate to root within a container.

Common dropped capabilities:
- Mounting filesystems
- Raw socket access
- Device node creation
- Module loading

### Content Trust and Image Security
Enable Docker Content Trust to verify image signatures before pulling and running images. This prevents running tampered or malicious images.

### Additional Hardening
- Use AppArmor, SELinux, or GRSEC for extra security layers
- Implement user namespaces to map container root to non-privileged host user
- Run containers as non-root users
- Use read-only filesystems where possible
- Regularly scan images for vulnerabilities

## Real-world Examples & Use Cases

### Securing a Web Application
In a production web application deployment:
- Use multi-stage builds to minimize attack surface
- Run the application as a non-root user
- Use secrets management for sensitive data
- Implement health checks and resource limits

### CI/CD Pipeline Security
- Scan images for vulnerabilities before deployment
- Use trusted base images (e.g., Alpine Linux)
- Implement image signing and verification
- Limit container privileges in the pipeline

### Multi-tenant Platform
- Use user namespaces for additional isolation
- Implement resource quotas per tenant
- Network segmentation between tenants
- Regular security audits and updates

## Code Examples

### Secure Dockerfile
```dockerfile
# Use trusted base image
FROM alpine:3.18

# Create non-root user
RUN addgroup -g 1001 -S appuser && \
    adduser -S -D -H -u 1001 -h /app -s /sbin/nologin -G appuser -g appuser appuser

# Install dependencies and clean cache
RUN apk add --no-cache nodejs npm && \
    npm install -g npm@latest && \
    rm -rf /var/cache/apk/*

# Set working directory
WORKDIR /app

# Copy application files
COPY --chown=appuser:appuser . .

# Install dependencies
RUN npm ci --only=production && \
    npm cache clean --force

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:3000/health || exit 1

# Run application
CMD ["npm", "start"]
```

### Running Container with Security Options
```bash
# Run with dropped capabilities and read-only filesystem
docker run --rm \
  --cap-drop=ALL \
  --cap-add=NET_BIND_SERVICE \
  --read-only \
  --tmpfs /tmp \
  --tmpfs /app/tmp \
  --security-opt=no-new-privileges \
  --user appuser \
  myapp:latest
```

### Docker Compose with Security
```yaml
version: '3.8'
services:
  web:
    image: myapp:latest
    user: appuser
    read_only: true
    tmpfs:
      - /tmp
      - /app/tmp
    cap_drop:
      - ALL
    cap_add:
      - NET_BIND_SERVICE
    security_opt:
      - no-new-privileges
    secrets:
      - db_password
    networks:
      - app_network

secrets:
  db_password:
    file: ./secrets/db_password.txt

networks:
  app_network:
    driver: bridge
```

### Enabling Content Trust
```bash
# Enable Docker Content Trust
export DOCKER_CONTENT_TRUST=1

# Pull only signed images
docker pull myregistry.com/myapp:latest
```

## References

- [Docker Engine Security Documentation](https://docs.docker.com/engine/security/)
- [Docker Content Trust](https://docs.docker.com/engine/security/trust/)
- [Seccomp Security Profiles](https://docs.docker.com/engine/security/seccomp/)
- [AppArmor Security Profiles](https://docs.docker.com/engine/security/apparmor/)

## Github-README Links & Related Topics

- [Container Security](container-security/)
- [Docker Containerization](docker-containerization/)
- [DevOps Infrastructure as Code](devops-infrastructure-as-code/)
- [Kubernetes Security](kubernetes-security/)
- [CI/CD Best Practices](ci-cd-best-practices/)