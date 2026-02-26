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
- [Most Frequently Asked (Challenging) Spring Boot Questions](#most-frequently-asked-challenging-spring-boot-questions)

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

---

## Most Frequently Asked (Challenging) Spring Boot Questions

These are the high-frequency deep-dive questions commonly used for experienced backend candidates.

### Boot Internals and Configuration

1. How does Spring Boot auto-configuration actually work (`@Conditional*`, `spring.factories`/auto-configuration imports)?
2. What is the exact startup sequence from `SpringApplication.run()` to fully initialized context?
3. Configuration precedence: what wins between env vars, command-line args, profiles, and `application.yml`?
4. `@ConfigurationProperties` vs `@Value`: maintainability and runtime safety trade-offs.
5. When would you exclude an auto-configuration and why?
6. Common causes of slow application startup and how to profile/fix them.

### Dependency Injection, Proxies, and AOP

7. What problems can field injection cause compared with constructor injection?
8. JDK dynamic proxies vs CGLIB in Spring: behavior differences that matter.
9. Why self-invocation can break `@Transactional` and other proxy-based annotations.
10. Bean lifecycle hooks (`@PostConstruct`, `InitializingBean`, `BeanPostProcessor`) and when to use each.
11. Circular dependencies: how Spring resolves them and when to redesign instead.

### Data, JPA, and Transactions

12. Solving N+1 at scale: fetch join vs entity graph vs batch size.
13. Transaction propagation modes (`REQUIRES_NEW`, `NESTED`, etc.) with real use cases.
14. Isolation levels and anomaly prevention in a Spring/JPA service.
15. Why `@Transactional` on `private` methods does not work as expected.
16. Lazy loading pitfalls in APIs and DTO mapping boundaries.
17. Optimistic vs pessimistic locking in concurrent update flows.
18. How to design idempotent write endpoints with transaction safety.

### Web, Security, and API Design

19. Building a global exception strategy with consistent error contract.
20. Spring Security filter chain order and common JWT authentication mistakes.
21. CSRF in stateless APIs: when to disable and when not to.
22. Method-level security (`@PreAuthorize`) pitfalls and test strategy.
23. API versioning approaches in Spring Boot (`URI`, header, media type) and trade-offs.

### Resilience, Observability, and Production

24. Timeouts, retries, and circuit breakers: where each belongs in client stack.
25. How to expose Actuator endpoints safely in production.
26. Readiness vs liveness probes and failure-mode-aware probe design.
27. Detecting thread pool exhaustion and connection pool starvation in live systems.
28. Handling graceful shutdown without dropping in-flight requests/messages.
29. Structured logging + trace correlation design for debugging distributed calls.
30. Backpressure strategies for burst traffic in Spring Boot services.

## Related

- [Java Prep](./java-prep.md)
- [System Design Concepts](./system-design-concepts.md)
- [Kafka Prep](./kafka-prep.md)
- [Kubernetes and Docker Prep](./kubernetes-docker-prep.md)
