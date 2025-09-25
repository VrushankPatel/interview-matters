---
title: Time in Force Variations
aliases: [Time in Force, Order Types, Exchange Semantics]
tags: [#system-design, #trading, #interviews]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Time-in-force semantics across exchanges: GTC, IOC, FOK, etc.

# STAR Summary

**Situation:** Implemented order types for trading platform.  
**Task:** Support various TIF for compliance.  
**Action:** Added TIF logic in order engine.  
**Result:** Passed regulatory audits.

# Detailed Explanation

GTC: Good till canceled.  
IOC: Immediate or cancel.  
FOK: Fill or kill.

# Real-world Examples & Use Cases

Stock trading platforms.

# Code Examples

```java
enum TimeInForce {
    GTC, IOC, FOK
}

class Order {
    TimeInForce tif;
    // logic based on tif
}
```

# Data Models / Message Formats

Order with TIF field.

# Journey / Sequence

```mermaid
sequenceDiagram
    participant Trader
    participant Exchange
    participant Book

    Trader->>Exchange: Submit IOC Order
    Exchange->>Book: Attempt Match
    alt Match
        Book-->>Exchange: Filled
    else No Match
        Book-->>Exchange: Canceled
    end
    Exchange-->>Trader: Result
```

# Common Pitfalls & Edge Cases

- Partial fills for IOC  
- Expiration handling

# Tools & Libraries

Exchange APIs.

# Github-README Links & Related Topics

[[order-book-modeling]], [[matching-algorithms]]

# References

- https://www.investopedia.com/terms/t/timeinforce.asp