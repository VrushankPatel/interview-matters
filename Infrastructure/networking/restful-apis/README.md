---
title: RESTful APIs
aliases: []
tags: [#system-design,#api]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

REST is an acronym for REpresentational State Transfer and an architectural style for distributed hypermedia systems. It is one of the most widely used approaches for building web-based APIs (Application Programming Interfaces).

# Detailed Explanation

REST is based on six guiding principles or constraints:

- **Uniform Interface**: Consistent interface for interactions between clients and servers, using standard HTTP methods (GET, POST, PUT, DELETE) and URIs.
- **Client-Server**: Separation of concerns, improving portability and scalability.
- **Stateless**: Each request contains all necessary information; no session state stored on server.
- **Cacheable**: Responses can be cached to improve performance.
- **Layered System**: Architecture composed of hierarchical layers, allowing for intermediaries.
- **Code on Demand (Optional)**: Servers can extend client functionality by sending executable code.

Resources are abstractions of information, identified by URIs, and manipulated through representations. REST APIs use hypermedia to drive application state.

# Real-world Examples & Use Cases

- Public APIs like GitHub API or Twitter API.
- Microservices communication in distributed systems.
- Mobile app backends requiring stateless interactions.
- Web services for e-commerce platforms.

# Code Examples

## Spring Boot REST Controller

```java
@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable Long id) {
        User user = userService.findById(id);
        return ResponseEntity.ok(user);
    }

    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User user) {
        User savedUser = userService.save(user);
        return ResponseEntity.created(URI.create("/api/users/" + savedUser.getId())).body(savedUser);
    }

    @PutMapping("/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User user) {
        User updatedUser = userService.update(id, user);
        return ResponseEntity.ok(updatedUser);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        userService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
```

## Resource Representation Example

```json
{
  "id": 123,
  "name": "John Doe",
  "email": "john.doe@example.com",
  "links": {
    "self": "/api/users/123",
    "orders": "/api/users/123/orders"
  }
}
```

# References

- [REST API Tutorial](https://restfulapi.net/)
- [REST Architectural Constraints](https://restfulapi.net/rest-architectural-constraints/)
- [HTTP Methods](https://restfulapi.net/http-methods/)

# Github-README Links & Related Topics

- [API Design Principles](api-design-principles/README.md)
- [API Rate Limiting](api-rate-limiting/README.md)
- [Microservices Architecture](microservices-architecture/README.md)
- [Microservices Communication Patterns](microservices-communication-patterns/README.md)
- [System Design Basics](system-design-basics/README.md)
- [Caching](caching/README.md)