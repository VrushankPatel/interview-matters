---
title: API Authentication Methods
aliases: [API Auth Methods, Authentication in APIs]
tags: [#api,#authentication,#security]
created: 2025-09-25
updated: 2025-09-25
---

# API Authentication Methods

## Overview

API authentication methods are techniques used to verify the identity of clients accessing an API. They ensure that only authorized users or applications can access protected resources. Common methods include Basic Auth, API Keys, OAuth, JWT, and more.

## Detailed Explanation

### Basic Authentication

Uses username and password encoded in Base64, sent in the Authorization header.

Pros: Simple to implement.

Cons: Insecure over HTTP (credentials sent with every request), no token expiration.

### API Keys

A unique key provided to the client, often passed in headers or query parameters.

Pros: Simple for server-to-server communication.

Cons: If compromised, hard to revoke without changing keys.

### OAuth 2.0

An authorization framework for delegated access. Allows third-party applications to access resources without sharing credentials.

Key flows:
- Authorization Code: For web apps.
- Implicit: For SPAs.
- Client Credentials: For machine-to-machine.
- Resource Owner Password Credentials: Direct username/password.

### JWT (JSON Web Tokens)

Stateless tokens containing claims (e.g., user ID, roles). Signed and optionally encrypted.

Pros: Self-contained, scalable.

Cons: Cannot be revoked easily once issued.

### Other Methods

- Mutual TLS: Certificate-based authentication.
- SAML: For enterprise SSO.

## Real-world Examples & Use Cases

- **Social Logins**: OAuth used in apps like Spotify for accessing user data from Google or Facebook.
- **API Gateways**: API Keys for rate limiting and access control in services like Stripe.
- **Microservices**: JWT for stateless authentication between services.
- **IoT Devices**: Mutual TLS for secure communication.

## Code Examples

### Basic Auth in Python

```python
import requests
from requests.auth import HTTPBasicAuth

response = requests.get('https://api.example.com/data', auth=HTTPBasicAuth('username', 'password'))
print(response.json())
```

### OAuth 2.0 Authorization Code Flow (Conceptual)

```javascript
// Client-side: Redirect to authorization server
window.location.href = 'https://auth.example.com/authorize?response_type=code&client_id=123&redirect_uri=https://app.example.com/callback';

// Server-side: Exchange code for token
const response = await fetch('https://auth.example.com/token', {
  method: 'POST',
  body: new URLSearchParams({
    grant_type: 'authorization_code',
    code: req.query.code,
    client_id: '123',
    client_secret: 'secret'
  })
});
const { access_token } = await response.json();
```

### JWT Verification in Java

```java
import io.jsonwebtoken.Jwts;

try {
    Claims claims = Jwts.parser()
        .setSigningKey("secretKey")
        .parseClaimsJws(token)
        .getBody();
    String userId = claims.getSubject();
} catch (Exception e) {
    // Invalid token
}
```

## Common Pitfalls & Edge Cases

- Storing secrets insecurely.
- Not validating tokens properly.
- Handling token expiration and refresh.
- CSRF in OAuth flows.

## References

- [RFC 6749: OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)
- [RFC 7519: JSON Web Token (JWT)](https://tools.ietf.org/html/rfc7519)
- [OWASP API Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/REST_Security_Cheat_Sheet.html)

## Github-README Links & Related Topics

- [OAuth 2.0 Simplified](https://oauth.net/2/)
- [JWT.io](https://jwt.io/)
- Related: [User Authentication](../user-authentication/README.md)
- Related: [API Rate Limiting](../api-rate-limiting/README.md)
- Related: [Security Best Practices in Java](../security-best-practices-in-java/README.md)