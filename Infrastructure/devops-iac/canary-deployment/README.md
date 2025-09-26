---
title: Canary Deployment
aliases: [Canary Release, Incremental Deployment]
tags: [#devops,#deployment,#system-design]
created: 2025-09-25
updated: 2025-09-25
---

# Canary Deployment

## Overview

Canary Deployment gradually rolls out changes to a small subset of users before full release, allowing for testing in production and minimizing risk.

## Detailed Explanation

### Process

1. **Deploy New Version**: To a small group of servers/users.
2. **Monitor**: Performance, errors, metrics.
3. **Gradual Rollout**: Increase traffic to new version if successful.
4. **Full Release or Rollback**: Based on results.

### Types

- **Traffic-based**: Route percentage of traffic.
- **User-based**: Target specific users.

### Tools

- Istio, Kubernetes, AWS Lambda.

```mermaid
graph TD
    A[Load Balancer] --> B[Canary Group (5%)]
    A --> C[Stable Group (95%)]
    B --> D[New Version]
    C --> E[Old Version]
    D --> F{Monitor Metrics}
    F --> G[Increase Traffic]
    F --> H[Rollback]
```

## Real-world Examples & Use Cases

- **Social Media**: Roll out features to beta users.
- **E-commerce**: Test payment changes.
- **APIs**: Gradual API updates.

## Code Examples

### Kubernetes Canary with Istio

```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: myapp
spec:
  http:
  - route:
    - destination:
        host: myapp
        subset: v1
      weight: 90
    - destination:
        host: myapp
        subset: v2
      weight: 10
```

## Common Pitfalls & Edge Cases

- **Metrics Monitoring**: Ensure proper observability.
- **User Segmentation**: Avoid bias in canary group.
- **Database Changes**: Handle incompatible schemas.

## Tools & Libraries

- Istio
- Flagger (Kubernetes)
- AWS CodeDeploy

## References

- [Canary Deployment Patterns](https://martinfowler.com/bliki/CanaryRelease.html)
- [Kubernetes Canary](https://kubernetes.io/blog/2018/04/30/zero-downtime-deployment-kubernetes-jenkins/)

## Github-README Links & Related Topics

- [Blue-Green Deployment](../blue-green-deployment/README.md)
- [CI/CD Pipelines](../ci-cd-pipelines/README.md)
- [Monitoring and Logging](../monitoring-and-logging/README.md)