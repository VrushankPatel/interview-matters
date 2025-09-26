---
title: Time in Force Variations
aliases: [TIF, order time in force, trading order validity]
tags: [#trading,#finance,#system-design]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Time in Force (TIF) specifies how long an order remains active in the market before it is executed or canceled. Different TIF variations allow traders to control order behavior based on time constraints and market conditions.

## Detailed Explanation

### Common TIF Types

#### Day Order (DAY)
Order valid only for the trading day. Expires at market close if not filled.

#### Good 'Til Canceled (GTC)
Order remains active until filled or manually canceled. May span multiple trading days.

#### Immediate or Cancel (IOC)
Execute immediately any available portion; cancel the rest.

#### Fill or Kill (FOK)
Execute the entire order immediately or cancel it entirely.

#### Good for Time (GFT/GTT)
Order valid until a specified time or date.

### Implementation Considerations

```java
enum TimeInForce {
    DAY, GTC, IOC, FOK, GTT
}

class Order {
    TimeInForce tif;
    LocalDateTime expiration;
    // other fields
}
```

## Real-world Examples & Use Cases

- **High-Frequency Trading**: IOC for rapid execution.
- **Long-term Investment**: GTC for buy-and-hold strategies.
- **Market Making**: DAY orders for daily liquidity provision.

## Code Examples

### Python: TIF Validation

```python
from datetime import datetime

def validate_tif(order, tif, expiration=None):
    if tif == 'GTT' and expiration is None:
        raise ValueError("GTT requires expiration time")
    # Additional validation...
```

## Common Pitfalls & Edge Cases

- Expiration during market hours.
- Weekend/holiday handling.
- Partial fills with IOC/FOK.

## References

- [Time in Force - Investopedia](https://www.investopedia.com/terms/t/timeinforce.asp)
- FIX Protocol specifications.

## Github-README Links & Related Topics

- [trading-systems](../trading-systems/README.md)
- [order-management](../order-management/README.md)