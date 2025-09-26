---
title: Kubernetes Networking and Services
aliases: [K8s Networking, Kubernetes Services]
tags: [#kubernetes, #devops]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Kubernetes networking enables communication between pods, services, and external clients. Services provide stable endpoints for pod sets.

# Detailed Explanation

Networking components:
- Pod Networking: Each pod has unique IP.
- CNI Plugins: Implement networking (Calico, Flannel).
- Services: Abstractions for pod access.
  - ClusterIP: Internal access.
  - NodePort: External via node ports.
  - LoadBalancer: Cloud load balancer.
  - ExternalName: DNS alias.
- Ingress: HTTP/HTTPS routing to services.

# Real-world Examples & Use Cases

- Microservices: Service discovery and load balancing.
- Web apps: Expose frontend service externally.
- API Gateway: Route traffic to backend services.

# Code Examples

```yaml
# Service definition
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: ClusterIP

# Ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  rules:
  - host: myapp.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: my-service
            port:
              number: 80
```

# References

- [Kubernetes Docs: Services](https://kubernetes.io/docs/concepts/services-networking/service/)
- [Kubernetes Docs: Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)

# Github-README Links & Related Topics

- [Kubernetes Basics](./kubernetes-basics/README.md)
- [Kubernetes Networking](./kubernetes-networking/README.md)
- [Kubernetes Ingress and Load Balancing](./kubernetes-ingress-and-load-balancing/README.md)

## Common Pitfalls & Edge Cases

- Network policies: Restrict traffic properly.
- DNS resolution: Service names in same namespace.
- Load balancing: Session affinity if needed.

## Tools & Libraries

- CNI Plugins: Calico, Weave Net
- Ingress Controllers: NGINX, Traefik
- Service Meshes: Istio, Linkerd
