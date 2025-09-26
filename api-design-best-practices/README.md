---
title: API Design Best Practices
aliases: [REST API Design, API Best Practices, Web API Design]
tags: [#api, #system-design]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

API design best practices ensure that APIs are intuitive, efficient, secure, and maintainable. This covers RESTful APIs, GraphQL, and general principles for designing interfaces between systems.

# Detailed Explanation

## REST Principles
- **Stateless**: Each request contains all necessary information.
- **Uniform Interface**: Consistent resource identification and manipulation.
- **Client-Server**: Separation of concerns.
- **Cacheable**: Responses should be cacheable when appropriate.
- **Layered System**: Architecture allows for intermediaries.

## HTTP Methods
- GET: Retrieve resources
- POST: Create resources
- PUT: Update resources (full update)
- PATCH: Partial updates
- DELETE: Remove resources

## Status Codes
- 200 OK: Success
- 201 Created: Resource created
- 400 Bad Request: Invalid input
- 401 Unauthorized: Authentication required
- 403 Forbidden: Access denied
- 404 Not Found: Resource not found
- 500 Internal Server Error: Server error

## Versioning Strategies
- URI versioning: `/v1/users`
- Header versioning: `Accept: application/vnd.api+json; version=1`
- Query parameter: `/users?version=1`

## Security
- Use HTTPS
- Authentication: OAuth2, JWT
- Authorization: Role-based access control
- Rate limiting
- Input validation

## GraphQL Considerations
- Schema-first design
- Avoid over-fetching/under-fetching
- Pagination for large datasets

# Real-world Examples & Use Cases

- **E-commerce API**: RESTful design for products, orders, users with proper versioning.
- **Social Media API**: GraphQL for flexible queries on posts, comments, users.
- **Banking API**: Strict security with OAuth2 and comprehensive logging.

# Code Examples

## REST API with Spring Boot
```java
@RestController
@RequestMapping("/api/v1/users")
public class UserController {
    
    @GetMapping
    public ResponseEntity<List<User>> getUsers() {
        List<User> users = userService.getAllUsers();
        return ResponseEntity.ok(users);
    }
    
    @PostMapping
    public ResponseEntity<User> createUser(@Valid @RequestBody User user) {
        User created = userService.createUser(user);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @Valid @RequestBody User user) {
        User updated = userService.updateUser(id, user);
        return ResponseEntity.ok(updated);
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return ResponseEntity.noContent().build();
    }
}
```

## OpenAPI Specification Example
```yaml
openapi: 3.0.0
info:
  title: User API
  version: 1.0.0
paths:
  /users:
    get:
      summary: Get all users
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/User'
    post:
      summary: Create a user
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/User'
      responses:
        '201':
          description: User created
components:
  schemas:
    User:
      type: object
      properties:
        id:
          type: integer
        name:
          type: string
        email:
          type: string
```

## GraphQL Schema
```graphql
type Query {
  users: [User!]!
  user(id: ID!): User
}

type Mutation {
  createUser(input: CreateUserInput!): User!
  updateUser(id: ID!, input: UpdateUserInput!): User!
}

type User {
  id: ID!
  name: String!
  email: String!
}

input CreateUserInput {
  name: String!
  email: String!
}
```

# References

- [REST API Design Rulebook](https://www.oreilly.com/library/view/rest-api-design/9781449317904/)
- [Microsoft REST API Guidelines](https://github.com/microsoft/api-guidelines)
- [GraphQL Specification](https://spec.graphql.org/)

# Github-README Links & Related Topics

- [API Gateway Design](../api-gateway-design/README.md)
- [API Authentication Methods](../api-authentication-methods/README.md)
- [API Versioning Strategies](../api-versioning-strategies/README.md)