# Spring Boot Prep

A focused Spring + Spring Boot interview guide for backend and microservices roles.

## Table of Contents

- [Spring Core Essentials](#spring-core-essentials)
- [Spring Boot Fundamentals](#spring-boot-fundamentals)
- [REST API and Validation](#rest-api-and-validation)
- [Data Access with Spring Data JPA](#data-access-with-spring-data-jpa)
- [Transactions](#transactions)
- [Security](#security)
- [Microservices with Spring Boot](#microservices-with-spring-boot)
- [Observability and Actuator](#observability-and-actuator)
- [Resilience Patterns](#resilience-patterns)
- [Testing Strategy](#testing-strategy)
- [Production Best Practices](#production-best-practices)
- [Most Asked Spring Boot Interview Questions](#most-asked-spring-boot-interview-questions)

## Spring Core Essentials

- IoC container manages object lifecycle.
- Dependency Injection via constructor injection preferred.
- Bean scopes: singleton, prototype, request, session.
- Annotations: `@Component`, `@Service`, `@Repository`, `@Controller`.

## Spring Boot Fundamentals

- Auto-configuration reduces boilerplate.
- Starters simplify dependency alignment.
- Externalized configuration via `application.yml` and profiles.
- Common annotations: `@SpringBootApplication`, `@ConfigurationProperties`.

### Configuration Practices

- Use profiles: `dev`, `test`, `prod`.
- Avoid logic in config classes; keep config declarative.
- Bind typed config objects for maintainability.

## REST API and Validation

- Use `@RestController`, `@RequestMapping`, `@GetMapping`, `@PostMapping`.
- Validate request DTOs with Bean Validation (`@Valid`, `@NotNull`, `@Size`).
- Standardize error response structure via global exception handler.

## Data Access with Spring Data JPA

- Entities + repositories cover most CRUD use cases fast.
- Handle N+1 query problem with fetch joins/entity graphs.
- Use pagination (`Pageable`) for list endpoints.
- Separate API DTOs from JPA entities in non-trivial systems.

## Transactions

- `@Transactional` defines atomic unit.
- Understand propagation and isolation semantics.
- Keep transaction boundaries in service layer, not controllers.

## Security

- Spring Security for authentication/authorization.
- JWT/OAuth2 for stateless APIs.
- Password hashing with BCrypt.
- Avoid exposing sensitive actuator endpoints publicly.

## Microservices with Spring Boot

- Service boundaries should follow domain capabilities.
- Use synchronous calls carefully; prefer async/eventing where needed.
- Key building blocks:
  - API Gateway
  - Config Server
  - Service discovery (if required)
  - Circuit breaker/retry/bulkhead

## Observability and Actuator

- Actuator endpoints: `health`, `info`, `metrics`, `prometheus`.
- Integrate Micrometer for metrics.
- Correlate logs with trace IDs.
- Add readiness/liveness probes for container platforms.

## Resilience Patterns

- Timeouts on all outbound calls.
- Retry with jitter and bounded attempts.
- Circuit breaker for failing downstreams.
- Idempotency for retry-safe write APIs.

## Testing Strategy

- Unit tests for business logic.
- Slice tests (`@WebMvcTest`, `@DataJpaTest`) for focused layers.
- Integration tests with Testcontainers.
- Contract tests for service-to-service compatibility.

## Production Best Practices

- Graceful shutdown support.
- Connection pool tuning.
- Rate limiting and request size limits.
- Structured logging.
- Secure secrets management.
- Backward-compatible API evolution.

## Most Asked Spring Boot Interview Questions

1. Difference between `@Component`, `@Service`, `@Repository`?
2. Why constructor injection is preferred?
3. How does auto-configuration work?
4. `@Transactional` pitfalls?
5. How to solve N+1 query issue?
6. Actuator endpoints you enable in production?
7. Global exception handling design?
8. How do you secure a stateless REST API?
9. How would you design a Spring Boot microservice for scale?
10. What tests run in CI for confidence?

## Related

- [Java Prep](./java-prep.md)
- [System Design Concepts](./system-design-concepts.md)
- [Kafka Prep](./kafka-prep.md)
- [Kubernetes and Docker Prep](./kubernetes-docker-prep.md)
