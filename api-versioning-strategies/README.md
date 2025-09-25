---
title: API Versioning Strategies
aliases: []
tags: [#api]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

API Versioning Strategies involve managing changes to APIs while maintaining backward compatibility. Common approaches include URI versioning, header versioning, and query parameter versioning.

## Detailed Explanation

- **URI Versioning**: Include version in the URL (e.g., /v1/users).
- **Header Versioning**: Use custom headers like Accept-Version.
- **Query Parameter Versioning**: Append version as query param (e.g., /users?version=1).
- **Media Type Versioning**: Use content-type headers.

Pros and cons: URI is explicit but breaks REST principles; headers are cleaner but less visible.

## Real-world Examples & Use Cases

- **GitHub API**: Uses URI versioning (/api/v3/).
- **Stripe API**: Header-based versioning.
- **Social Media APIs**: Frequent updates require versioning to support old clients.

## Code Examples

### URI Versioning (Spring Boot)

```java
@RestController
@RequestMapping("/v1/users")
public class UserControllerV1 {
    @GetMapping
    public List<User> getUsers() {
        // Version 1 logic
    }
}

@RestController
@RequestMapping("/v2/users")
public class UserControllerV2 {
    @GetMapping
    public List<UserDTO> getUsers() {
        // Version 2 with DTO
    }
}
```

### Header Versioning

```java
@RestController
public class UserController {
    @GetMapping("/users")
    public ResponseEntity<?> getUsers(@RequestHeader(value = "Api-Version", defaultValue = "1") String version) {
        if ("2".equals(version)) {
            // V2 logic
        }
        // V1 logic
    }
}
```

## References

- [API Versioning Best Practices](https://restfulapi.net/versioning/)
- [Microsoft API Versioning](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)

## Github-README Links & Related Topics

- [api-design-principles](../api-design-principles/README.md)
- [api-gateway-design](../api-gateway-design/README.md)
