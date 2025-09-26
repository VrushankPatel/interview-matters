---
title: Execution Report
aliases: [Trade Confirmation, ExecReport]
tags: [trading,protocol,reporting]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Execution Reports (ExecReports) confirm the status and details of order executions, providing traders with real-time feedback on fills, partial fills, rejections, and cancellations. Standardized via FIX protocol, these reports ensure transparency and enable risk management across trading systems.

# STAR Summary

**SITUATION**: Traders require immediate confirmation of order executions for position tracking and compliance.

**TASK**: Implement Execution Report generation and dissemination in a trading engine.

**ACTION**: Integrated FIX ExecutionReport messages with order lifecycle events, including fill details and status updates.

**RESULT**: Achieved 99.9% report accuracy and sub-second delivery, enhancing trader confidence and regulatory compliance.

# Detailed Explanation

Execution Reports are sent for each execution event: new, fill, partial fill, cancel, reject. Key fields include ExecType, LastQty, LastPx, CumQty.

Mapping to FIX: MsgType=8 (ExecutionReport).

# Real-world Examples & Use Cases

- **Partial Fill**: Order for 1000 shares, 500 executed at $100, report sent.
- **Rejection**: Invalid order, ExecType=8 (Rejected).

# Message Formats / Data Models

| Field | Tag | Description |
|-------|-----|-------------|
| ExecType | 150 | Type of execution (0=New, 1=Partial, 2=Fill, 8=Rejected) |
| LastQty | 32 | Quantity of last fill |
| LastPx | 31 | Price of last fill |
| CumQty | 14 | Total filled quantity |

Example:
```
8=FIX.4.4|...|150=1|32=500|31=100.00|14=500|...
```

# Journey of a Trade

Reports are sent at each step in the sequence diagram from Journey of a Trade.

# Common Pitfalls & Edge Cases

- **Out-of-Order Reports**: Sequence number gaps.
- **Duplicate Reports**: Handle idempotently.

# Tools & Libraries

- FIX libraries for parsing/generation.

# Github-README Links & Related Topics

- [Journey of a Trade](trading/journey-of-a-trade/README.md)
- [Trade Capture Report](trading/trade-capture-report/README.md)
- [FIX Protocol](trading/fix-protocol/README.md)

# References

- FIX Spec: https://www.fixtrading.org/