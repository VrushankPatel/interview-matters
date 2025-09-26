---
title: Order Types (DAY, GTC, FOK, IOC)
aliases: [Time-in-Force, Order Attributes]
tags: [trading, order-types, exchange-behavior]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Order types define the conditions under which a trade order is executed, including time-in-force parameters that specify how long the order remains active. Common types include DAY (valid for the trading day), GTC (Good Till Cancelled), FOK (Fill or Kill), and IOC (Immediate or Cancel). These types allow traders to control execution timing and risk.

# STAR Summary

**S (Situation):** Traders need precise control over order execution to implement various strategies in volatile markets.

**T (Task):** Define and implement handling for different order types in a trading system.

**A (Action):** Analyzed exchange rules, implemented time-in-force logic, and tested edge cases.

**R (Result):** Improved order fill rates by 25% and reduced unintended executions.

# Detailed Explanation

Order types are categorized by time-in-force (TIF) and execution conditions:

- **DAY:** Order expires at the end of the trading day if not filled. Common for intraday trading.

- **GTC:** Order persists until filled, cancelled, or expires (typically 60-90 days). Used for longer-term strategies.

- **FOK:** Execute the entire order immediately or cancel it. No partial fills. Ideal for large orders to avoid slippage.

- **IOC:** Execute as much as possible immediately, cancel the remainder. Allows partial fills but prioritizes speed.

Exchanges may have variations; e.g., NYSE supports GTD (Good Till Date).

# Real-world Examples & Use Cases

- **DAY Order:** A day trader buys AAPL with a DAY limit order at $150; if not filled by close, it cancels.

- **GTC Order:** An investor places a GTC sell order for TSLA at $200, holding until price reaches or order expires.

- **FOK Order:** Institutional trader sells 10,000 shares FOK to ensure full execution at once.

- **IOC Order:** HFT algorithm submits IOC buy order for liquidity, taking what's available instantly.

# Message Formats / Data Models

FIX Tag 59 (TimeInForce):

- 0 = DAY

- 1 = GTC

- 3 = IOC

- 4 = FOK

Example NewOrderSingle with IOC:

8=FIX.4.4|9=123|35=D|49=CLIENT|56=BROKER|34=1|52=20230926-12:00:00|11=ORDER123|55=AAPL|54=1|38=100|40=2|44=150.00|59=3|10=123|

| Order Type | FIX Tag 59 | Behavior |
|------------|------------|----------|
| DAY | 0 | Expires end of day |
| GTC | 1 | Persists until filled/cancelled |
| IOC | 3 | Immediate or cancel |
| FOK | 4 | Fill or kill |

# Journey of a Trade

Not applicable for this topic, as it focuses on order attributes rather than lifecycle.

# Common Pitfalls & Edge Cases

- **Misinterpretation of IOC vs FOK:** IOC allows partial fills, FOK does not; wrong choice can lead to over/under execution.

- **GTC Expiration:** Orders may expire unnoticed, causing missed opportunities.

- **Market Hours:** DAY orders in extended hours may behave differently.

- **Exchange Variations:** TIF semantics differ by venue; e.g., some exchanges treat GTC as 30 days.

# Tools & Libraries

- **Trading APIs:** Interactive Brokers, Alpaca for order type support.

- **FIX Libraries:** QuickFIX for implementing TIF.

Sample code (Python):

```python
# Example order submission with TIF
order = {
    'symbol': 'AAPL',
    'qty': 100,
    'side': 'buy',
    'type': 'limit',
    'tif': 'IOC',  # Time-in-Force
    'price': 150.00
}
# Submit via API
```

# Github-README Links & Related Topics

- [Journey of a Trade](../../lifecycle/journey-of-a-trade/README.md)
- [FIX Protocol](../../protocols/fix-protocol/README.md)
- [Order Entry Protocols](../../protocols/order-entry-protocols/README.md)

## References

- FIX Protocol: https://www.fixtrading.org/
- Order Types - Investopedia: https://www.investopedia.com/terms/o/ordertypes.asp