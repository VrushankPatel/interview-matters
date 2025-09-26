---
title: WebSockets vs Server-Sent Events
aliases: [Real-time Communication Protocols]
tags: [#networking,#system-design]
created: 2025-09-25
updated: 2025-09-25
---

# WebSockets vs Server-Sent Events

## Overview

WebSockets and Server-Sent Events (SSE) are technologies for real-time, bidirectional communication between web clients and servers. WebSockets provide full-duplex communication, while SSE offers unidirectional server-to-client streaming.

## Detailed Explanation

### WebSockets

- **Full-Duplex**: Bidirectional communication.
- **Persistent Connection**: Single TCP connection for multiple messages.
- **Protocol**: ws:// or wss://
- **Use Cases**: Chat apps, gaming, collaborative editing.
- **Browser Support**: W3C standard, widely supported.

### Server-Sent Events (SSE)

- **Unidirectional**: Server pushes data to client.
- **HTTP-Based**: Uses regular HTTP, falls back to polling if needed.
- **Automatic Reconnection**: Built-in reconnection on connection loss.
- **Simple API**: EventSource interface in browsers.
- **Use Cases**: Live feeds, notifications, stock prices.

### Comparison

| Aspect | WebSockets | Server-Sent Events |
|--------|------------|-------------------|
| Direction | Bidirectional | Unidirectional (server→client) |
| Protocol | Custom (ws/wss) | HTTP |
| Complexity | Higher | Lower |
| Browser Support | Excellent | Good |
| Overhead | Lower (persistent) | Higher (HTTP headers) |
| Use Case | Interactive apps | Streaming updates |

### When to Use

- **WebSockets**: Real-time collaboration, multiplayer games.
- **SSE**: News feeds, live scores, server notifications.

## Real-world Examples & Use Cases

- **Chat Applications**: WhatsApp Web uses WebSockets for instant messaging.
- **Financial Dashboards**: Stock tickers use SSE for price updates.
- **Live Sports Scores**: SSE for pushing score changes.
- **Collaborative Editing**: Google Docs uses WebSockets.

## Code Examples

### WebSocket Server (Node.js with ws)

```javascript
const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', (ws) => {
    ws.on('message', (message) => {
        console.log('Received:', message);
        ws.send('Echo: ' + message);
    });
});
```

### WebSocket Client (JavaScript)

```javascript
const ws = new WebSocket('ws://localhost:8080');

ws.onopen = () => {
    ws.send('Hello Server!');
};

ws.onmessage = (event) => {
    console.log('Received:', event.data);
};
```

### Server-Sent Events Server (Express.js)

```javascript
const express = require('express');
const app = express();

app.get('/events', (req, res) => {
    res.writeHead(200, {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive'
    });

    setInterval(() => {
        res.write(`data: ${new Date().toISOString()}\n\n`);
    }, 1000);
});
```

### Server-Sent Events Client (JavaScript)

```javascript
const eventSource = new EventSource('/events');

eventSource.onmessage = (event) => {
    console.log('New event:', event.data);
};

eventSource.onerror = (error) => {
    console.error('EventSource error:', error);
};
```

## Common Pitfalls & Edge Cases

- **Connection Limits**: Browsers limit concurrent WebSocket connections.
- **Firewall Issues**: WebSockets may be blocked by corporate firewalls.
- **Scalability**: WebSockets require connection management at scale.
- **Fallbacks**: SSE doesn't work well with older proxies.

## References

- [MDN WebSockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)
- [MDN Server-Sent Events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events)
- [WebSocket RFC 6455](https://tools.ietf.org/html/rfc6455)
- [SSE W3C Recommendation](https://www.w3.org/TR/eventsource/)

## Github-README Links & Related Topics

- [WebSocket Protocols](websocket-protocols/README.md)
- [Real-time Feeds](real-time-feeds/README.md)
- [Event-Driven Systems](event-driven-systems/README.md)