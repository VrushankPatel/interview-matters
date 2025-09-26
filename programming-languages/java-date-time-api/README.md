---
title: Java Date Time API
aliases: [Java Date Time API, java.time]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

# Java Date Time API

## Overview

The Java Date Time API, introduced in Java 8, provides a comprehensive set of classes for handling dates, times, instants, durations, and periods. It replaces the legacy Date and Calendar classes with immutable, thread-safe alternatives.

## Detailed Explanation

Key classes include:

- LocalDate: Represents a date without time or timezone.
- LocalTime: Represents time without date or timezone.
- LocalDateTime: Combines date and time.
- ZonedDateTime: Date and time with timezone.
- Instant: Represents a point in time.
- Duration: Amount of time in seconds and nanoseconds.
- Period: Amount of time in years, months, days.

The API uses ISO-8601 calendar system.

## Real-world Examples & Use Cases

- Scheduling events in applications.
- Logging timestamps.
- Calculating age or time differences.
- Handling timezones in global applications.

## Code Examples

```java
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

// Current date
LocalDate today = LocalDate.now();
System.out.println(today);

// Current time
LocalTime now = LocalTime.now();
System.out.println(now);

// Date and time
LocalDateTime dateTime = LocalDateTime.now();
System.out.println(dateTime);

// With timezone
ZonedDateTime zoned = ZonedDateTime.now(ZoneId.of("America/New_York"));
System.out.println(zoned);

// Parsing
LocalDate parsed = LocalDate.parse("2023-09-25");
System.out.println(parsed);

// Formatting
String formatted = today.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
System.out.println(formatted);
```

## References

- [Oracle Java Date Time API Documentation](https://docs.oracle.com/javase/8/docs/api/java/time/package-summary.html)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Multithreading & Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)