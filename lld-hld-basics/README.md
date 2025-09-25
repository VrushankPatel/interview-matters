---
title: LLD HLD Basics
aliases: ['Low Level Design High Level Design Basics']
tags: ['#system-design', '#lld', '#hld']
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Low Level Design (LLD) and High Level Design (HLD) are fundamental concepts in system design interviews. HLD provides a bird's-eye view of the system's architecture, focusing on components, data flow, and scalability. LLD dives into the implementation details, including class diagrams, data structures, algorithms, and APIs. Mastering both is essential for designing robust, scalable systems.

## Detailed Explanation

### High Level Design (HLD)

HLD outlines the overall system architecture without delving into code specifics. It includes:

- **System Architecture**: Description of hardware, software interfaces, and user interfaces.
- **Database Design**: High-level database schema and relationships.
- **Components**: Services, databases, caches, load balancers.
- **Data Flow**: How data moves between components.
- **Scalability**: Horizontal/vertical scaling, partitioning.
- **Reliability**: Fault tolerance, redundancy.
- **Security**: Authentication, encryption.

HLD answers "what" and "why" at a high level. It is created by solution architects based on Software Requirement Specification (SRS).

### Low Level Design (LLD)

LLD focuses on the internals of components identified in HLD. It includes:

- **Class Diagrams**: Relationships between classes, interfaces.
- **Data Structures**: Choices for storage and retrieval (e.g., hash maps, trees).
- **Algorithms**: Sorting, searching, optimization.
- **APIs**: Endpoints, request/response formats.
- **Database Schemas**: Detailed tables, relationships, indexes.
- **Program Specifications**: Detailed logic for each module.

LLD answers "how" with implementation details. It is created by designers and developers based on reviewed HLD.

### Key Differences

| Aspect          | HLD (High-Level Design)     | LLD (Low-Level Design)     |
|-----------------|-----------------------------|-----------------------------|
| **Scope**      | System-wide architecture    | Component internals         |
| **Detail Level**| High-level components       | Code-level design           |
| **Audience**   | Architects, stakeholders    | Developers, engineers       |
| **Tools**      | Diagrams, flowcharts        | UML, pseudocode             |
| **Focus**      | Scalability, reliability    | Efficiency, correctness     |
| **Input**      | SRS (Software Requirement Specification) | Reviewed HLD               |
| **Output**     | Database design, functional design, review record | Program specification, unit test plan |
| **Created By** | Solution Architect           | Designers and Developers    |

```mermaid
graph TD
    A[System Design] --> B[HLD: Architecture]
    A --> C[LLD: Implementation]
    B --> D[Components & Flow]
    C --> E[Classes & Algorithms]
```

### HLD Diagram Example

```mermaid
graph LR
    Client --> LB[Load Balancer]
    LB --> AG[API Gateway]
    AG --> S[Shortener Service]
    S --> DB[(Database)]
    S --> C[(Cache)]
```

### LLD Class Diagram Example

```mermaid
classDiagram
    class UrlShortener {
        -Map<String, String> urlToShort
        -Map<String, String> shortToUrl
        -String BASE_URL
        +String shorten(String longUrl)
        +String expand(String shortUrl)
        -String generateKey(String url)
    }
```

## Real-world Examples & Use Cases

- **HLD Example**: Designing a URL shortener with API gateway, service layer, and database.
- **LLD Example**: Implementing the shortening algorithm using base62 encoding and hash maps.
- **Use Case**: In interviews, start with HLD to show big-picture thinking, then LLD to demonstrate technical depth.
- **Industry Application**: HLD for microservices architecture in e-commerce platforms; LLD for specific service implementations.

## Code Examples

### LLD: URL Shortener Implementation

```java
import java.util.HashMap;
import java.util.Map;

public class UrlShortener {
    private Map<String, String> urlToShort = new HashMap<>();
    private Map<String, String> shortToUrl = new HashMap<>();
    private static final String BASE_URL = "http://short.ly/";
    private int counter = 0;

    public String shorten(String longUrl) {
        if (urlToShort.containsKey(longUrl)) {
            return urlToShort.get(longUrl);
        }
        String shortKey = generateKey();
        String shortUrl = BASE_URL + shortKey;
        urlToShort.put(longUrl, shortUrl);
        shortToUrl.put(shortUrl, longUrl);
        return shortUrl;
    }

    public String expand(String shortUrl) {
        return shortToUrl.get(shortUrl);
    }

    private String generateKey() {
        return Integer.toString(counter++, 36); // Base36 encoding
    }
}
```

### HLD: Conceptual Architecture

```
Client -> Load Balancer -> API Gateway -> Shortener Service -> Database
                                       -> Cache
```

## References

- [Difference between High Level Design(HLD) and Low Level Design(LLD)](https://www.geeksforgeeks.org/difference-between-high-level-design-and-low-level-design/)
- [System Design Interview Guide](https://github.com/donnemartin/system-design-primer)
- [Grokking the System Design Interview](https://www.educative.io/courses/grokking-the-system-design-interview)
- [Martin Kleppmann: Designing Data-Intensive Applications](https://dataintensive.net/)

## Github-README Links & Related Topics

- [Design Patterns](design-patterns/)
- [Microservices Architecture](microservices-architecture/)
- [Database Design Principles](database-design-principles/)
- [API Design Principles](api-design-principles/)
- [System Design Basics](lld-hld-basics/)