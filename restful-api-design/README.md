---
title: RESTful API Design
aliases: []
tags: [#api, #system-design]
created: 2025-09-25
updated: 2025-09-25
---

# RESTful API Design

## Overview

REST (Representational State Transfer) is an architectural style for designing networked applications. RESTful APIs use HTTP methods and follow stateless, cacheable communication principles.

## Detailed Explanation

### REST Principles

- **Stateless**: Each request contains all necessary information.
- **Client-Server**: Separation of concerns.
- **Cacheable**: Responses can be cached.
- **Uniform Interface**: Consistent resource identification and manipulation.
- **Layered System**: Hierarchical layers.

### HTTP Methods

| Method | CRUD Operation | Idempotent |
|--------|----------------|------------|
| GET | Read | Yes |
| POST | Create | No |
| PUT | Update/Replace | Yes |
| PATCH | Partial Update | No |
| DELETE | Delete | Yes |

### Resource Naming

- Use nouns: `/users`, `/orders`
- Use plural forms
- Hierarchical: `/users/{id}/orders`

## Real-world Examples & Use Cases

- **Social Media**: User profiles, posts, comments.
- **E-commerce**: Product catalogs, shopping carts.
- **IoT**: Device management and data collection.

## Code Examples

### Express.js REST API

```javascript
const express = require('express');
const app = express();

app.get('/users', (req, res) => {
    // Return list of users
    res.json([{ id: 1, name: 'John' }]);
});

app.post('/users', (req, res) => {
    // Create new user
    const user = req.body;
    // Save user
    res.status(201).json(user);
});

app.get('/users/:id', (req, res) => {
    // Get user by id
    res.json({ id: req.params.id, name: 'John' });
});

app.put('/users/:id', (req, res) => {
    // Update user
    res.json({ id: req.params.id, ...req.body });
});

app.delete('/users/:id', (req, res) => {
    // Delete user
    res.status(204).send();
});
```

### Spring Boot REST Controller

```java
@RestController
@RequestMapping("/api/users")
public class UserController {

    @GetMapping
    public List<User> getUsers() {
        return userService.getAllUsers();
    }

    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User user) {
        User savedUser = userService.saveUser(user);
        return ResponseEntity.created(URI.create("/api/users/" + savedUser.getId())).body(savedUser);
    }

    @GetMapping("/{id}")
    public User getUser(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    @PutMapping("/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        return userService.updateUser(id, user);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return ResponseEntity.noContent().build();
    }
}
```

## Common Pitfalls & Edge Cases

- **Over-fetching/Under-fetching**: Returning too much or too little data.
- **Versioning**: Handling API changes without breaking clients.
- **Authentication**: Securing endpoints properly.
- **Rate Limiting**: Preventing abuse.

## References

- [REST API Tutorial](https://restfulapi.net/)
- [Roy Fielding's Dissertation](https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)

## Github-README Links & Related Topics

- [API Design Principles](../api-design-principles/README.md)
- [API Authentication Methods](../api-authentication-methods/README.md)