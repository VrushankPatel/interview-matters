---
title: Eventual Consistency Patterns
aliases: [Eventual Consistency in Distributed Systems]
tags: [#system-design, #distributed-systems]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Eventual consistency is a consistency model used in distributed systems where data updates may not be immediately visible across all nodes, but will eventually converge to a consistent state. This model trades immediate consistency for availability and partition tolerance, as defined by the CAP theorem.

Understanding eventual consistency patterns is crucial for designing scalable, fault-tolerant distributed systems that can handle network partitions and maintain high availability.

## Detailed Explanation

### Consistency Models

- **Strong Consistency**: All reads return the most recent write
- **Eventual Consistency**: All replicas eventually converge to the same value
- **Causal Consistency**: Causally related operations are seen in order
- **Read-your-writes**: Client sees their own writes immediately

### Eventual Consistency Guarantees

1. **Convergence**: All replicas eventually agree on the same value
2. **Monotonic Reads**: Once a value is read, future reads return that or newer values
3. **Monotonic Writes**: Writes are applied in order across replicas
4. **Read-your-writes**: Client can read their own writes immediately

## Real-world Examples & Use Cases

### E-commerce Inventory Management

```java
public class InventoryService {
    private final EventPublisher eventPublisher;
    private final InventoryRepository repository;
    
    @Transactional
    public void reserveItems(Order order) {
        // Check and reserve inventory
        for (OrderItem item : order.getItems()) {
            var inventory = repository.findByProductId(item.getProductId());
            if (inventory.getAvailable() < item.getQuantity()) {
                throw new InsufficientInventoryException();
            }
            inventory.reserve(item.getQuantity());
            repository.save(inventory);
        }
        
        // Publish event for eventual consistency
        eventPublisher.publish(new InventoryReservedEvent(order.getId(), order.getItems()));
    }
}

public class OrderService {
    private final EventConsumer eventConsumer;
    
    @EventListener
    public void onInventoryReserved(InventoryReservedEvent event) {
        var order = orderRepository.findById(event.getOrderId());
        order.setStatus(OrderStatus.CONFIRMED);
        orderRepository.save(order);
        
        // Trigger payment processing
        paymentService.processPayment(order);
    }
}
```

### Social Media Timeline

```java
public class PostService {
    public Post createPost(CreatePostRequest request) {
        var post = new Post(request.getUserId(), request.getContent());
        postRepository.save(post);
        
        // Eventually consistent: followers will see post via background process
        eventPublisher.publish(new PostCreatedEvent(post.getId(), request.getUserId()));
        
        return post;
    }
}

public class TimelineService {
    @EventListener
    public void onPostCreated(PostCreatedEvent event) {
        // Background process to update follower timelines
        var followers = followerRepository.findFollowers(event.getUserId());
        for (var follower : followers) {
            timelineRepository.addPost(follower.getFollowerId(), event.getPostId());
        }
    }
    
    public List<Post> getTimeline(String userId) {
        // May not include very recent posts due to eventual consistency
        return timelineRepository.findPostsByUser(userId);
    }
}
```

### Multi-region Database Replication

```java
public class UserService {
    private final PrimaryDatabase primaryDb;
    private final ReadReplica readReplica;
    
    public User createUser(CreateUserRequest request) {
        var user = new User(request.getUsername(), request.getEmail());
        
        // Write to primary
        primaryDb.save(user);
        
        // Eventual consistency: read replica updated asynchronously
        eventPublisher.publish(new UserCreatedEvent(user.getId()));
        
        return user;
    }
    
    public User getUser(String userId) {
        // May read stale data from replica
        return readReplica.findById(userId)
            .orElseThrow(() -> new UserNotFoundException());
    }
}
```

## Code Examples

### Saga Pattern for Distributed Transactions

```java
public sealed interface OrderSagaEvent permits OrderCreated, InventoryReserved, PaymentProcessed, OrderCompleted {}

public record OrderCreated(String orderId, List<OrderItem> items) implements OrderSagaEvent {}
public record InventoryReserved(String orderId) implements OrderSagaEvent {}
public record PaymentProcessed(String orderId, String transactionId) implements OrderSagaEvent {}
public record OrderCompleted(String orderId) implements OrderSagaEvent {}

public class OrderSaga {
    private final Map<String, SagaState> sagas = new ConcurrentHashMap<>();
    
    public void handleEvent(OrderSagaEvent event) {
        var sagaId = event.orderId();
        var state = sagas.computeIfAbsent(sagaId, k -> new SagaState());
        
        switch (event) {
            case OrderCreated e -> {
                state.setStatus(SagaStatus.INVENTORY_PENDING);
                inventoryService.reserveItems(e.items());
            }
            case InventoryReserved e -> {
                state.setStatus(SagaStatus.PAYMENT_PENDING);
                paymentService.processPayment(state.getOrder());
            }
            case PaymentProcessed e -> {
                state.setStatus(SagaStatus.COMPLETED);
                orderService.confirmOrder(e.orderId());
            }
        }
    }
    
    public void compensate(String sagaId) {
        var state = sagas.get(sagaId);
        if (state != null) {
            // Rollback previous steps
            switch (state.getStatus()) {
                case PAYMENT_PENDING -> paymentService.refund(state.getTransactionId());
                case INVENTORY_PENDING -> inventoryService.releaseItems(state.getOrder().getItems());
            }
        }
    }
}
```

### Conflict Resolution Strategies

```java
public class ConflictResolver {
    public VersionedData resolveConflict(VersionedData local, VersionedData remote) {
        // Last-write-wins
        if (local.getVersion() > remote.getVersion()) {
            return local;
        } else if (remote.getVersion() > local.getVersion()) {
            return remote;
        } else {
            // Same version, merge data
            return mergeData(local, remote);
        }
    }
    
    private VersionedData mergeData(VersionedData v1, VersionedData v2) {
        // Application-specific merge logic
        var merged = new HashMap<String, Object>();
        merged.putAll(v1.getData());
        merged.putAll(v2.getData()); // Later wins for conflicts
        
        return new VersionedData(
            Math.max(v1.getVersion(), v2.getVersion()) + 1,
            merged
        );
    }
}
```

### Read Repair Pattern

```java
public class ReadRepairService {
    private final List<Replica> replicas;
    
    public Data readWithRepair(String key) {
        var results = replicas.stream()
            .map(replica -> replica.read(key))
            .filter(Optional::isPresent)
            .map(Optional::get)
            .collect(Collectors.toList());
        
        if (results.isEmpty()) {
            throw new DataNotFoundException();
        }
        
        // Find the most recent version
        var latest = results.stream()
            .max(Comparator.comparing(Data::getVersion))
            .orElseThrow();
        
        // Repair inconsistent replicas
        replicas.forEach(replica -> {
            var replicaData = replica.read(key);
            if (replicaData.isEmpty() || 
                replicaData.get().getVersion() < latest.getVersion()) {
                replica.write(key, latest);
            }
        });
        
        return latest;
    }
}
```

### Quorum-based Consistency

```java
public class QuorumConsistencyService {
    private static final int REPLICATION_FACTOR = 3;
    private static final int READ_QUORUM = 2;
    private static final int WRITE_QUORUM = 2;
    
    public void write(String key, Data data) {
        var successfulWrites = replicas.stream()
            .mapToInt(replica -> replica.write(key, data) ? 1 : 0)
            .sum();
        
        if (successfulWrites < WRITE_QUORUM) {
            throw new WriteQuorumNotMetException();
        }
    }
    
    public Data read(String key) {
        var responses = replicas.stream()
            .map(replica -> replica.read(key))
            .filter(Optional::isPresent)
            .map(Optional::get)
            .sorted(Comparator.comparing(Data::getVersion).reversed())
            .collect(Collectors.toList());
        
        if (responses.size() < READ_QUORUM) {
            throw new ReadQuorumNotMetException();
        }
        
        return responses.get(0); // Most recent version
    }
}
```

## Common Pitfalls & Edge Cases

### Stale Data Issues

```java
// Problem: Client reads stale data
public class BankingService {
    public void transferMoney(String fromAccount, String toAccount, BigDecimal amount) {
        var from = accountRepository.findById(fromAccount);
        var to = accountRepository.findById(toAccount);
        
        // Check balance (may be stale)
        if (from.getBalance().compareTo(amount) < 0) {
            throw new InsufficientFundsException();
        }
        
        // Transfer (race condition possible)
        from.debit(amount);
        to.credit(amount);
        
        accountRepository.save(from);
        accountRepository.save(to);
    }
}
```

**Solution**: Use optimistic locking or event sourcing.

### Causality Violations

```java
// Problem: Causality violation
// User creates post, then immediately likes it
// Like event may arrive before post creation event

public class TimelineService {
    public void onPostCreated(PostCreatedEvent event) {
        // Create post in timeline
    }
    
    public void onPostLiked(PostLikedEvent event) {
        // May fail if post doesn't exist yet
        var post = postRepository.findById(event.getPostId());
        if (post.isPresent()) {
            // Add like
        } else {
            // Handle causality violation - retry or buffer
        }
    }
}
```

### Network Partition Handling

```java
// During partition, system may accept conflicting writes
public class PartitionAwareService {
    private final ClusterState clusterState;
    
    public void writeData(String key, Data data) {
        if (clusterState.isPartitioned()) {
            // Use conflict-free replicated data types (CRDTs)
            crdtService.update(key, data);
        } else {
            // Normal write
            repository.save(key, data);
        }
    }
}
```

## Tools & Libraries

### Event Streaming Platforms

- **Apache Kafka**: Distributed event streaming platform
- **Apache Pulsar**: Multi-tenant, high-performance messaging
- **Redis Streams**: In-memory event streaming

### Consistency Libraries

- **Akka**: Actor-based concurrency with eventual consistency
- **CRDT Libraries**: Conflict-free replicated data types
- **EventStore**: Event sourcing database

### Monitoring & Testing

- **Chaos Monkey**: Simulate network partitions
- **Gremlin**: Failure injection for distributed systems
- **Jepsen**: Consistency testing framework

## References

- [Eventually Consistent - Revisited](https://www.allthingsdistributed.com/2008/12/eventually_consistent.html)
- [Consistency Models](https://jepsen.io/consistency)
- [Eventual Consistency Patterns](https://microservices.io/patterns/data/eventual-consistency.html)
- [Designing Data-Intensive Applications](https://dataintensiv.net/)

## Github-README Links & Related Topics

- [eventual-consistency](eventual-consistency/README.md)
- [cap-theorem-and-distributed-systems](cap-theorem-and-distributed-systems/README.md)
- [distributed-transactions](distributed-transactions/README.md)
- [event-sourcing](event-sourcing/README.md)
