---
title: OAuth 2.0 Implementation
aliases: [OAuth2 Implementation, OAuth 2.0 Guide]
tags: [#oauth, #authentication, #security, #api]
created: 2025-09-25
updated: 2025-09-26
---

# OAuth 2.0 Implementation

## Overview

OAuth 2.0 is the industry-standard protocol for authorization, enabling third-party applications to obtain limited access to user accounts on an HTTP service. It focuses on client developer simplicity while providing specific authorization flows for web applications, desktop applications, mobile phones, and IoT devices. OAuth 2.0 separates the role of the client from that of the resource owner, allowing secure delegated access without sharing credentials.

## Detailed Explanation

### Core Concepts
- **Resource Owner**: The user who owns the protected resources
- **Client**: The application requesting access to resources
- **Authorization Server**: Issues access tokens after authenticating the resource owner
- **Resource Server**: Hosts the protected resources
- **Access Token**: Credentials used to access protected resources
- **Refresh Token**: Credentials used to obtain new access tokens

### Grant Types
OAuth 2.0 defines several grant types for different use cases:

#### Authorization Code Grant
Most secure flow for confidential clients (web servers). Involves redirecting users to authorization server.

#### Proof Key for Code Exchange (PKCE)
Extension to authorization code grant for public clients (SPAs, mobile apps) to prevent authorization code interception.

#### Client Credentials Grant
For machine-to-machine authentication where client is also the resource owner.

#### Device Authorization Grant
For devices with limited input capabilities (smart TVs, IoT devices).

#### Refresh Token Grant
For obtaining new access tokens without user interaction.

### Security Considerations
- Use HTTPS for all OAuth endpoints
- Validate redirect URIs to prevent open redirect attacks
- Implement proper token storage and rotation
- Use PKCE for public clients
- Implement token revocation
- Follow OAuth Security Best Current Practice (RFC 9700)

### Token Types
- **Bearer Tokens**: Simple possession-based tokens
- **JWT Access Tokens**: Structured tokens with claims
- **Refresh Tokens**: Long-lived tokens for obtaining new access tokens

## Real-world Examples & Use Cases

### Web Application Authentication
A web app allowing users to sign in with Google or GitHub accounts uses the authorization code grant flow.

### API Access for Mobile Apps
Mobile applications use PKCE-enhanced authorization code flow to securely obtain tokens.

### Machine-to-Machine Communication
Microservices use client credentials grant to authenticate API calls between services.

### IoT Device Authorization
Smart home devices use device authorization grant for user consent without direct input.

### Third-Party API Integration
Business applications integrate with SaaS platforms using OAuth to access user data.

## Code Examples

### Authorization Server Implementation (Node.js with Express)
```javascript
const express = require('express');
const crypto = require('crypto');
const app = express();

app.use(express.json());

// In-memory storage (use database in production)
const clients = {
  'client_id_123': {
    client_secret: 'client_secret_456',
    redirect_uris: ['http://localhost:3000/callback']
  }
};

const authorizationCodes = new Map();
const accessTokens = new Map();

// Authorization endpoint
app.get('/authorize', (req, res) => {
  const { response_type, client_id, redirect_uri, scope, state } = req.query;
  
  // Validate client and redirect URI
  const client = clients[client_id];
  if (!client || !client.redirect_uris.includes(redirect_uri)) {
    return res.status(400).json({ error: 'invalid_client' });
  }
  
  // In production, show login/consent page
  // For demo, auto-approve
  const code = crypto.randomBytes(32).toString('hex');
  authorizationCodes.set(code, {
    client_id,
    redirect_uri,
    scope,
    user_id: 'user_123'
  });
  
  const redirectUrl = new URL(redirect_uri);
  redirectUrl.searchParams.set('code', code);
  if (state) redirectUrl.searchParams.set('state', state);
  
  res.redirect(redirectUrl.toString());
});

// Token endpoint
app.post('/token', (req, res) => {
  const { grant_type, code, client_id, client_secret, redirect_uri } = req.body;
  
  if (grant_type === 'authorization_code') {
    const authCode = authorizationCodes.get(code);
    if (!authCode || authCode.client_id !== client_id || 
        authCode.redirect_uri !== redirect_uri) {
      return res.status(400).json({ error: 'invalid_grant' });
    }
    
    // Validate client credentials
    const client = clients[client_id];
    if (client.client_secret !== client_secret) {
      return res.status(401).json({ error: 'invalid_client' });
    }
    
    // Generate tokens
    const accessToken = crypto.randomBytes(32).toString('hex');
    const refreshToken = crypto.randomBytes(32).toString('hex');
    
    accessTokens.set(accessToken, {
      client_id,
      user_id: authCode.user_id,
      scope: authCode.scope,
      expires_at: Date.now() + 3600000 // 1 hour
    });
    
    authorizationCodes.delete(code);
    
    res.json({
      access_token: accessToken,
      token_type: 'Bearer',
      expires_in: 3600,
      refresh_token: refreshToken,
      scope: authCode.scope
    });
  }
});

app.listen(4000, () => console.log('OAuth server running on port 4000'));
```

### Client Implementation (Authorization Code Flow)
```javascript
// Client-side JavaScript for web app
function initiateOAuth() {
  const clientId = 'client_id_123';
  const redirectUri = 'http://localhost:3000/callback';
  const scope = 'read write';
  const state = crypto.randomBytes(16).toString('hex');
  
  sessionStorage.setItem('oauth_state', state);
  
  const authUrl = new URL('http://localhost:4000/authorize');
  authUrl.searchParams.set('response_type', 'code');
  authUrl.searchParams.set('client_id', clientId);
  authUrl.searchParams.set('redirect_uri', redirectUri);
  authUrl.searchParams.set('scope', scope);
  authUrl.searchParams.set('state', state);
  
  window.location.href = authUrl.toString();
}

// Handle callback
async function handleCallback() {
  const urlParams = new URLSearchParams(window.location.search);
  const code = urlParams.get('code');
  const state = urlParams.get('state');
  const storedState = sessionStorage.getItem('oauth_state');
  
  if (state !== storedState) {
    throw new Error('State mismatch');
  }
  
  // Exchange code for token
  const response = await fetch('http://localhost:4000/token', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      grant_type: 'authorization_code',
      code: code,
      client_id: 'client_id_123',
      client_secret: 'client_secret_456',
      redirect_uri: 'http://localhost:3000/callback'
    })
  });
  
  const tokenData = await response.json();
  localStorage.setItem('access_token', tokenData.access_token);
  
  // Redirect to app
  window.location.href = '/dashboard';
}

// API call with token
async function callAPI() {
  const token = localStorage.getItem('access_token');
  
  const response = await fetch('http://localhost:5000/api/user', {
    headers: {
      'Authorization': `Bearer ${token}`
    }
  });
  
  return response.json();
}
```

### PKCE Implementation
```javascript
// Generate PKCE challenge
function generatePKCE() {
  const verifier = crypto.randomBytes(32).toString('base64url');
  const challenge = crypto.createHash('sha256')
    .update(verifier)
    .digest('base64url');
  
  return { verifier, challenge };
}

// Authorization request with PKCE
function initiatePKCEFlow() {
  const { verifier, challenge } = generatePKCE();
  sessionStorage.setItem('pkce_verifier', verifier);
  
  const authUrl = new URL('http://localhost:4000/authorize');
  authUrl.searchParams.set('response_type', 'code');
  authUrl.searchParams.set('client_id', 'spa_client_id');
  authUrl.searchParams.set('redirect_uri', 'http://localhost:3000/callback');
  authUrl.searchParams.set('code_challenge', challenge);
  authUrl.searchParams.set('code_challenge_method', 'S256');
  
  window.location.href = authUrl.toString();
}

// Token exchange with PKCE
async function exchangeCodeWithPKCE(code) {
  const verifier = sessionStorage.getItem('pkce_verifier');
  
  const response = await fetch('http://localhost:4000/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      grant_type: 'authorization_code',
      code: code,
      client_id: 'spa_client_id',
      code_verifier: verifier,
      redirect_uri: 'http://localhost:3000/callback'
    })
  });
  
  return response.json();
}
```

### Client Credentials Grant
```javascript
// Machine-to-machine authentication
async function getClientCredentialsToken() {
  const clientId = 'service_client_id';
  const clientSecret = 'service_client_secret';
  
  const credentials = btoa(`${clientId}:${clientSecret}`);
  
  const response = await fetch('http://localhost:4000/token', {
    method: 'POST',
    headers: {
      'Authorization': `Basic ${credentials}`,
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: new URLSearchParams({
      grant_type: 'client_credentials',
      scope: 'api:read api:write'
    })
  });
  
  const tokenData = await response.json();
  return tokenData.access_token;
}
```

## References

- [OAuth 2.0 Framework - RFC 6749](https://tools.ietf.org/html/rfc6749)
- [OAuth 2.0 Security Best Current Practice - RFC 9700](https://tools.ietf.org/html/rfc9700)
- [Proof Key for Code Exchange - RFC 7636](https://tools.ietf.org/html/rfc7636)
- [OAuth 2.0 Simplified](https://aaronparecki.com/oauth-2-simplified/)
- [OAuth.net Documentation](https://oauth.net/2/)

## Github-README Links & Related Topics

- [API Authentication Methods](api-authentication-methods/)
- [OAuth and JWT Authentication](oauth-and-jwt-authentication/)
- [API Security Best Practices](api-security-best-practices/)
- [JWT Profile for Access Tokens](https://tools.ietf.org/html/rfc9068)
- [OpenID Connect](https://openid.net/connect/)