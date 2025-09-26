---
title: OAuth 2.0 Implementation
aliases: [oauth2 implementation, oauth 2.0 auth]
tags: [#oauth,#authentication,#security]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

OAuth 2.0 is the industry-standard protocol for authorization, enabling third-party applications to obtain limited access to HTTP services on behalf of a resource owner or by allowing the application to obtain access on its own behalf. It separates the role of the client from the resource owner, providing specific authorization flows for web applications, desktop applications, mobile phones, and IoT devices. This framework replaces OAuth 1.0 and is designed for HTTP use, with extensibility for additional grant types and security mechanisms.

## Detailed Explanation

### Roles
OAuth 2.0 defines four roles:
- **Resource Owner**: An entity (e.g., end-user) capable of granting access to protected resources.
- **Resource Server**: The server hosting protected resources, accepting and responding to requests using access tokens.
- **Client**: An application requesting access on behalf of the resource owner.
- **Authorization Server**: The server issuing access tokens after authenticating the resource owner and obtaining authorization.

### Protocol Flow
The abstract flow involves:
1. Client requests authorization from resource owner.
2. Client receives an authorization grant.
3. Client requests an access token from the authorization server.
4. Authorization server issues an access token.
5. Client accesses protected resources with the access token.

### Authorization Grants
OAuth 2.0 supports four main grant types:
- **Authorization Code**: For confidential clients; involves redirection via user-agent.
- **Implicit**: For public clients; optimized for browser-based apps, issues access token directly.
- **Resource Owner Password Credentials**: Client collects username/password directly (high trust required).
- **Client Credentials**: For server-to-server access without resource owner involvement.

Extensions include Device Code, Refresh Token, and others like PKCE for enhanced security.

### Endpoints
- **Authorization Endpoint**: Handles user authentication and consent.
- **Token Endpoint**: Exchanges grants for access tokens.
- **Redirection Endpoint**: Client endpoint for receiving responses.

### Access Tokens
Credentials for accessing protected resources. Types include Bearer (RFC 6750), MAC, etc. Tokens are opaque strings with scope, lifetime, and attributes. Refresh tokens allow obtaining new access tokens without re-authorization.

### Security Considerations
- Use TLS for all communications.
- Validate redirection URIs to prevent attacks.
- Implement CSRF protection with `state` parameter.
- Avoid implicit flow for sensitive apps due to token exposure.
- Protect client secrets and tokens from leakage.

### Client Types
- **Confidential**: Can maintain secret confidentiality (e.g., web servers).
- **Public**: Cannot (e.g., mobile apps, SPAs).

### Extensibility
OAuth 2.0 allows custom grant types, token types, and parameters via registries.

## Real-world Examples & Use Cases

- **Social Login**: Platforms like Google, Facebook, and GitHub use OAuth 2.0 for third-party app access to user profiles without sharing passwords.
- **API Authorization**: Services like Stripe or AWS APIs use client credentials for server-to-server authentication.
- **Mobile Apps**: Apps like Spotify use authorization code with PKCE to access user data securely.
- **IoT Devices**: Device code flow for smart TVs or printers to authorize without keyboards.
- **Enterprise**: SAML or JWT assertions for integrating with identity providers.

## Code Examples

### Authorization Code Grant (Node.js Client)
```javascript
const express = require('express');
const axios = require('axios');

const app = express();
const CLIENT_ID = 'your-client-id';
const CLIENT_SECRET = 'your-client-secret';
const REDIRECT_URI = 'http://localhost:3000/callback';

app.get('/auth', (req, res) => {
  const authUrl = `https://authorization-server.com/auth?response_type=code&client_id=${CLIENT_ID}&redirect_uri=${REDIRECT_URI}&scope=read`;
  res.redirect(authUrl);
});

app.get('/callback', async (req, res) => {
  const code = req.query.code;
  const tokenResponse = await axios.post('https://authorization-server.com/token', {
    grant_type: 'authorization_code',
    code,
    redirect_uri: REDIRECT_URI,
    client_id: CLIENT_ID,
    client_secret: CLIENT_SECRET
  });
  const accessToken = tokenResponse.data.access_token;
  // Use accessToken to access protected resources
  res.send('Access token obtained');
});

app.listen(3000);
```

### Client Credentials Grant (Python Server)
```python
import requests

CLIENT_ID = 'your-client-id'
CLIENT_SECRET = 'your-client-secret'
TOKEN_URL = 'https://authorization-server.com/token'

response = requests.post(TOKEN_URL, data={
    'grant_type': 'client_credentials',
    'client_id': CLIENT_ID,
    'client_secret': CLIENT_SECRET,
    'scope': 'api:read'
})

if response.status_code == 200:
    access_token = response.json()['access_token']
    # Use access_token for API calls
    headers = {'Authorization': f'Bearer {access_token}'}
    api_response = requests.get('https://api.example.com/data', headers=headers)
```

### Bearer Token Usage
```bash
curl -H "Authorization: Bearer <access_token>" https://api.example.com/protected-resource
```

## References

- [OAuth 2.0 Framework (RFC 6749)](https://tools.ietf.org/html/rfc6749)
- [OAuth 2.0 Bearer Token Usage (RFC 6750)](https://tools.ietf.org/html/rfc6750)
- [OAuth 2.0 Security Best Current Practice (RFC 9700)](https://tools.ietf.org/html/rfc9700)
- [OAuth.net Documentation](https://oauth.net/2/)
- [OAuth 2.0 Threat Model and Security Considerations](https://tools.ietf.org/html/rfc6819)

## Github-README Links & Related Topics

- [API Security Best Practices](../api-security-best-practices/)
- [JWT Implementation](../jwt-implementation/)
- [Authentication Methods](../api-authentication-methods/)