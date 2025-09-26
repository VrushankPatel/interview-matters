---
title: Message Queue Patterns
aliases: [Messaging Patterns, Queue Patterns]
tags: [#messaging,#patterns,#architecture,#distributed-systems]
created: 2025-09-25
updated: 2025-09-25
---

# Message Queue Patterns

## Overview

Message queue patterns provide proven solutions for designing robust, scalable, and maintainable messaging systems in distributed applications. These patterns address common challenges in asynchronous communication, load balancing, reliability, and system decoupling. Based on the Enterprise Integration Patterns catalog, these patterns form a comprehensive language for messaging architecture design.

## Detailed Explanation

### Channel Patterns
#### Point-to-Point Channel
A channel delivering messages to exactly one consumer. Ensures reliable delivery and load balancing across multiple consumers.

#### Publish-Subscribe Channel
A channel broadcasting messages to multiple consumers. Enables event-driven architectures and fan-out scenarios.

#### Datatype Channel
A channel dedicated to messages of a specific type, providing type safety and routing clarity.

#### Invalid Message Channel
A channel for handling malformed or invalid messages that cannot be processed normally.

#### Dead Letter Channel
A channel for messages that cannot be delivered or processed after multiple attempts.

### Message Construction Patterns
#### Message
The fundamental pattern: a container for data sent via a messaging system.

#### Command Message
A message requesting the receiver to perform a specific action.

#### Document Message
A message containing data that the sender wants the receiver to store or process.

#### Event Message
A message indicating that something has happened in the sender's domain.

#### Request-Reply
A pattern combining request and response messages for synchronous-like communication over asynchronous channels.

### Routing Patterns
#### Message Router
A component that routes messages to different channels based on message content or rules.

#### Content-Based Router
Routes messages based on message content, enabling conditional routing logic.

#### Recipient List
Sends a message to multiple recipients simultaneously.

#### Splitter
Breaks a composite message into individual messages for parallel processing.

#### Aggregator
Combines multiple related messages into a single message.

#### Scatter-Gather
Broadcasts a request to multiple recipients and aggregates responses.

### Endpoint Patterns
#### Message Endpoint
An interface between application code and messaging system.

#### Messaging Gateway
A facade that hides messaging details from application code.

#### Polling Consumer
Actively checks for messages at regular intervals.

#### Event-Driven Consumer
Passively receives messages when they arrive.

#### Competing Consumers
Multiple consumers processing messages from the same channel for load balancing.

#### Message Dispatcher
Distributes messages to multiple consumers using a shared queue.

#### Selective Consumer
Filters messages based on criteria before processing.

#### Idempotent Receiver
Handles duplicate messages gracefully.

### Transformation Patterns
#### Message Translator
Converts message format between sender and receiver.

#### Envelope Wrapper
Wraps messages with additional routing or security information.

#### Content Enricher
Adds missing information to messages.

#### Content Filter
Removes unnecessary information from messages.

#### Claim Check
Stores large message payloads separately and sends references.

#### Normalizer
Converts different message formats to a canonical format.

### System Management Patterns
#### Control Bus
A separate channel for monitoring and controlling the messaging system.

#### Wire Tap
Inspects messages flowing through channels without interfering.

#### Message History
Tracks the path messages take through the system.

#### Message Store
Persists messages for auditing, debugging, or replay.

## Real-world Examples & Use Cases

### E-commerce Order Processing
- **Splitter**: Breaks order into individual item processing tasks
- **Aggregator**: Combines inventory checks and payment confirmations
- **Publish-Subscribe**: Notifies multiple services (shipping, inventory, notifications) of order status

### Financial Transaction Processing
- **Competing Consumers**: Multiple workers process transactions in parallel
- **Idempotent Receiver**: Handles duplicate transaction messages safely
- **Dead Letter Channel**: Routes failed transactions for manual review

### IoT Data Pipeline
- **Content-Based Router**: Routes sensor data to appropriate processing queues
- **Message Filter**: Filters out invalid or irrelevant sensor readings
- **Aggregator**: Combines data from multiple sensors for analysis

### Microservices Communication
- **Request-Reply**: Synchronous-like communication between services
- **Event Message**: Asynchronous event propagation
- **Claim Check**: Handles large file uploads or data payloads

### Log Aggregation System
- **Publish-Subscribe**: Multiple log consumers (monitoring, analytics, archiving)
- **Message Store**: Persistent storage for log replay and analysis
- **Control Bus**: System health monitoring and configuration updates

## Code Examples

### Point-to-Point Channel with Competing Consumers (RabbitMQ)
```javascript
// Producer
const amqp = require('amqplib');

async function sendMessage() {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  const queue = 'task_queue';
  await channel.assertQueue(queue, { durable: true });
  
  const message = 'Hello World!';
  channel.sendToQueue(queue, Buffer.from(message), { persistent: true });
  
  console.log("Sent:", message);
  await channel.close();
  await connection.close();
}

// Consumer 1
async function consumeMessages(consumerId) {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  const queue = 'task_queue';
  await channel.assertQueue(queue, { durable: true });
  
  channel.prefetch(1); // Process one message at a time
  
  console.log(`Consumer ${consumerId} waiting for messages...`);
  
  channel.consume(queue, async (msg) => {
    const content = msg.content.toString();
    console.log(`Consumer ${consumerId} received: ${content}`);
    
    // Simulate work
    setTimeout(() => {
      console.log(`Consumer ${consumerId} done processing`);
      channel.ack(msg);
    }, Math.random() * 2000);
  }, { noAck: false });
}

// Start multiple consumers
consumeMessages(1);
consumeMessages(2);
consumeMessages(3);
```

### Publish-Subscribe Pattern (RabbitMQ)
```javascript
// Publisher
async function publishMessage() {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  const exchange = 'logs';
  await channel.assertExchange(exchange, 'fanout', { durable: false });
  
  const message = 'Hello subscribers!';
  channel.publish(exchange, '', Buffer.from(message));
  
  console.log("Published:", message);
  await channel.close();
  await connection.close();
}

// Subscriber
async function subscribeMessages(subscriberId) {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  const exchange = 'logs';
  await channel.assertExchange(exchange, 'fanout', { durable: false });
  
  // Create exclusive queue for this subscriber
  const q = await channel.assertQueue('', { exclusive: true });
  await channel.bindQueue(q.queue, exchange, '');
  
  console.log(`Subscriber ${subscriberId} waiting for messages...`);
  
  channel.consume(q.queue, (msg) => {
    console.log(`Subscriber ${subscriberId} received: ${msg.content.toString()}`);
  }, { noAck: true });
}

// Start multiple subscribers
subscribeMessages(1);
subscribeMessages(2);
```

### Request-Reply Pattern (RabbitMQ)
```javascript
// Server (Reply)
async function startServer() {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  const requestQueue = 'rpc_queue';
  await channel.assertQueue(requestQueue, { durable: false });
  channel.prefetch(1);
  
  console.log('Server waiting for RPC requests...');
  
  channel.consume(requestQueue, async (msg) => {
    const n = parseInt(msg.content.toString());
    console.log(`Processing request for: ${n}`);
    
    const result = fibonacci(n);
    
    channel.sendToQueue(
      msg.properties.replyTo,
      Buffer.from(result.toString()),
      { correlationId: msg.properties.correlationId }
    );
    
    channel.ack(msg);
  });
}

function fibonacci(n) {
  if (n === 0 || n === 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Client (Request)
async function makeRequest(n) {
  const connection = await amqp.connect('amqp://localhost');
  const channel = await connection.createChannel();
  
  const q = await channel.assertQueue('', { exclusive: true });
  const correlationId = generateUuid();
  
  console.log(`Requesting fibonacci(${n})`);
  
  channel.consume(q.queue, (msg) => {
    if (msg.properties.correlationId === correlationId) {
      console.log(`Got result: ${msg.content.toString()}`);
      connection.close();
    }
  }, { noAck: true });
  
  channel.sendToQueue(
    'rpc_queue',
    Buffer.from(n.toString()),
    { correlationId, replyTo: q.queue }
  );
}

function generateUuid() {
  return Math.random().toString() + Math.random().toString();
}
```

### Content-Based Router (Apache Kafka Streams)
```java
// Kafka Streams application
StreamsBuilder builder = new StreamsBuilder();

KStream<String, Order> orders = builder.stream("orders");

orders
  .branch(
    (key, order) -> order.getAmount() > 1000, // High value orders
    (key, order) -> order.getRegion().equals("US"), // US orders
    (key, order) -> true // Default
  )
  .get(0).to("high-value-orders"); // High value orders
  
orders
  .branch(
    (key, order) -> order.getAmount() > 1000,
    (key, order) -> order.getRegion().equals("US"),
    (key, order) -> true
  )
  .get(1).to("us-orders"); // US orders
  
orders
  .branch(
    (key, order) -> order.getAmount() > 1000,
    (key, order) -> order.getRegion().equals("US"),
    (key, order) -> true
  )
  .get(2).to("other-orders"); // Other orders

KafkaStreams streams = new KafkaStreams(builder.build(), config);
streams.start();
```

### Aggregator Pattern (Spring Integration)
```java
@Configuration
@EnableIntegration
public class OrderProcessingConfig {
    
    @Bean
    public IntegrationFlow orderProcessingFlow() {
        return IntegrationFlows
            .from("orderItemsChannel")
            .aggregate(aggregatorSpec -> aggregatorSpec
                .correlationExpression("headers['orderId']")
                .releaseExpression("size() == 3") // Wait for all 3 items
                .expireGroupsUponCompletion(true)
                .sendPartialResultOnExpiry(true))
            .handle("orderService", "processCompleteOrder")
            .get();
    }
    
    @Bean
    public MessageChannel orderItemsChannel() {
        return new DirectChannel();
    }
}
```

## References

- [Enterprise Integration Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/)
- [Enterprise Integration Patterns Book](https://www.amazon.com/Enterprise-Integration-Patterns-Designing-Deploying/dp/0321200683)
- [RabbitMQ Documentation](https://www.rabbitmq.com/documentation.html)
- [Apache Kafka Documentation](https://kafka.apache.org/documentation/)
- [Spring Integration Reference](https://docs.spring.io/spring-integration/reference/html/)

## Github-README Links & Related Topics

- [Message Queues and Brokers](message-queues-and-brokers/)
- [Event-Driven Architecture](event-driven-architecture/)
- [Distributed Systems Patterns](https://github.com/donnemartin/system-design-primer#distributed-systems)
- [Asynchronous Logging](asynchronous-logging/)
- [Microservices Communication Patterns](microservices-communication-patterns/)