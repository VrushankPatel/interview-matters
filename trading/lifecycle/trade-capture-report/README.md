---
title: Trade Capture Report
aliases: [TCR, Post-Trade Reporting]
tags: [trading,protocol,compliance]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

Trade Capture Reports (TCRs) document completed trades for regulatory reporting, reconciliation, and analytics. Sent post-execution, they include detailed trade information for compliance with standards like MiFID II and Dodd-Frank.

# STAR Summary

**SITUATION**: Regulators require comprehensive trade records for market oversight.

**TASK**: Generate and submit TCRs for all trades.

**ACTION**: Automated TCR creation from execution data, submitted to repositories.

**RESULT**: Ensured 100% compliance, reduced manual reporting errors.

# Detailed Explanation

TCRs include trade details: parties, instrument, price, quantity, timestamp. FIX TradeCaptureReport (MsgType=AE).

# Real-world Examples & Use Cases

- **Regulatory Submission**: Daily TCRs to FINRA for US equities.

# Message Formats / Data Models

| Field | Tag | Description |
|-------|-----|-------------|
| TradeReportID | 571 | Unique trade ID |
| Symbol | 55 | Instrument |
| LastQty | 32 | Quantity |
| LastPx | 31 | Price |

Example:
```
8=FIX.4.4|...|35=AE|571=TRADE123|55=AAPL|32=100|31=150.00|...
```

# Journey of a Trade

Sent after execution in the lifecycle.

# Common Pitfalls & Edge Cases

- **Late Reporting**: Penalties for delays.
- **Data Accuracy**: Ensure all fields populated.

# Tools & Libraries

- Compliance platforms for submission.

# Github-README Links & Related Topics

- [Execution Report](trading/execution-report/README.md)
- [Journey of a Trade](trading/journey-of-a-trade/README.md)

# References

- FIX TCR: https://www.fixtrading.org/