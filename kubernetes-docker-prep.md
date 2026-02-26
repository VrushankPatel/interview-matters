# Kubernetes and Docker Prep

Focused interview prep for containerization and orchestration.

## Table of Contents

- [Docker Fundamentals](#docker-fundamentals)
- [Kubernetes Fundamentals](#kubernetes-fundamentals)
- [Deployment and Scaling](#deployment-and-scaling)
- [Networking and Service Exposure](#networking-and-service-exposure)
- [Reliability and Operations](#reliability-and-operations)
- [Security Essentials](#security-essentials)
- [Most Asked Questions](#most-asked-questions)

## Docker Fundamentals

- Image vs container.
- Layered image model and caching.
- Multi-stage builds for smaller runtime images.
- `CMD` vs `ENTRYPOINT` semantics.
- Container resource limits (CPU/memory).

### Dockerfile Best Practices

- Use minimal base images.
- Pin dependency versions.
- Avoid running as root.
- Keep build context small.

## Kubernetes Fundamentals

- Pod: smallest deployable unit.
- Deployment: declarative rollout of stateless workloads.
- StatefulSet: stable identity/storage for stateful apps.
- Service: stable virtual endpoint for pods.
- ConfigMap/Secret for externalized config.

## Deployment and Scaling

- Rolling updates and rollback strategy.
- Readiness and liveness probes.
- HPA for autoscaling based on metrics.
- Resource requests/limits to control scheduling and stability.

## Networking and Service Exposure

- ClusterIP for internal communication.
- NodePort/LoadBalancer/Ingress for external access.
- NetworkPolicy for pod-level traffic control.

## Reliability and Operations

- Multi-replica deployment across nodes.
- PodDisruptionBudget during maintenance.
- Graceful termination with preStop and termination grace period.
- Observability integration via logs/metrics/traces.

## Security Essentials

- RBAC least privilege.
- Non-root containers.
- Secret management and rotation.
- Image scanning and signed images where possible.

## Most Asked Questions

1. Docker image vs container?
2. Why use multi-stage Docker builds?
3. Pod vs Deployment vs StatefulSet?
4. Liveness vs readiness probe?
5. Service types and when to use each?
6. How do you do zero-downtime deployments?
7. How do you secure Kubernetes workloads?

## Related

- [Kafka Prep](./kafka-prep.md)
- [System Design Concepts](./system-design-concepts.md)
- [Spring Boot Prep](./spring-boot-prep.md)
