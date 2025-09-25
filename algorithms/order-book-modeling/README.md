---
title: Order Book Modeling
aliases: [Order Book, Trading Systems, Matching Engine]
tags: [#algorithms, #data-structures, #interviews]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Order book models for financial trading systems. In-memory data structures for bids/asks, persistence strategies.

# STAR Summary

**Situation:** Built matching engine for crypto exchange.  
**Task:** Handle high-frequency orders with low latency.  
**Action:** Implemented priority queues for order book.  
**Result:** Processed 10k orders/sec with <1ms latency.

# Detailed Explanation

## Complexity Analysis

- Insertion/Deletion: O(log n) with priority queues or balanced trees.
- Matching: O(n) in worst case for full traversal, but optimized with heaps.
- Persistence: O(log n) for updates in LSM trees or B-trees.

## Typical Interview Variants

- Limit orders: Price-specific.
- Market orders: Immediate execution.
- Stop orders: Triggered at price levels.

## High-Level Design

```mermaid
classDiagram
    class OrderBook {
        +PriorityQueue bids
        +PriorityQueue asks
        +addOrder(Order)
        +matchOrders()
    }
    class Order {
        +long id
        +double price
        +int quantity
        +OrderType type
    }
    OrderBook --> Order
```

# Real-world Examples & Use Cases

Stock exchanges, crypto platforms.

# Code Examples

**Java Order Book with PriorityQueue:**

```java
import java.util.*;

class OrderBook {
    private PriorityQueue<Order> bids = new PriorityQueue<>((a,b) -> Double.compare(b.price, a.price));
    private PriorityQueue<Order> asks = new PriorityQueue<>(Comparator.comparingDouble(a -> a.price));

    public void addOrder(Order order) {
        if (order.type == OrderType.BUY) {
            bids.add(order);
        } else {
            asks.add(order);
        }
    }

    public void match() {
        while (!bids.isEmpty() && !asks.isEmpty() && bids.peek().price >= asks.peek().price) {
            // match logic
        }
    }
}
```

# Data Models / Message Formats

| Field | Type | Description |
|-------|------|-------------|
| id | long | Order ID |
| price | double | Price |
| quantity | int | Quantity |
| type | enum | BUY/SELL |

# Journey / Sequence

```mermaid
sequenceDiagram
    participant Client
    participant MatchingEngine
    participant OrderBook

    Client->>MatchingEngine: Submit Order
    MatchingEngine->>OrderBook: Add to Book
    OrderBook->>MatchingEngine: Match if possible
    MatchingEngine->>Client: Confirmation
```

# Common Pitfalls & Edge Cases

- Price-time priority  
- Partial fills  
- Market orders  
- High-frequency updates causing contention

# Common Interview Questions

1. **Implement Order Book**: Use two heaps for bids/asks, handle add/match. Test with sample orders.
2. **Matching Engine**: Process orders, handle partial fills, update quantities.
3. **Persistence Strategy**: Design for crash recovery, use WAL and snapshots.

# Tools & Libraries

Java PriorityQueue, custom heaps.

# Github-README Links & Related Topics

[[graphs-trees-heaps-and-tries]], [[matching-algorithms]]

# References

- https://en.wikipedia.org/wiki/Order_book
- https://www.investopedia.com/terms/o/order-book.asp