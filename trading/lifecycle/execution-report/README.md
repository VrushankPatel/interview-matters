---
title: Execution Report
aliases: [Trade Confirmation]
tags: [trading, reports, fix]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

An Execution Report is a message confirming the execution of a trade, detailing price, quantity, and status.

# STAR Summary

**SITUATION**: After order matching, parties need confirmation.

**TASK**: Explain Execution Report structure and usage.

**ACTION**: Detail FIX fields and workflows.

**RESULT**: Accurate trade recording.

# Detailed Explanation

FIX MsgType=8 (ExecutionReport). Fields: OrderID, ExecID, ExecType, etc.

# Real-world Examples

Post-trade confirmation.

# Message Formats

Example: 8=FIX.4.4|35=8|...|39=2|...

# Journey of a Trade

Part of the sequence.

# Common Pitfalls

Incorrect fills.

# Tools & Libraries

FIX parsers.

# Github-README Links & Related Topics

[[fix-protocol]]

[[trade-capture-report]]

# References

- [FIX Specification](https://www.fixtrading.org/online-documents/fix-protocol-specification/)