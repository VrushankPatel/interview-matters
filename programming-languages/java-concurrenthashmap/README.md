---
title: Java ConcurrentHashMap
aliases: [ConcurrentHashMap]
tags: [#java,#concurrency,#collections]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

A hash table supporting full concurrency of retrievals and high expected concurrency for updates. This class obeys the same functional specification as `Hashtable`, and includes versions of methods corresponding to each method of `Hashtable`. However, even though all operations are thread-safe, retrieval operations do *not* entail locking, and there is *not* any support for locking the entire table in a way that prevents all access.

# Detailed Explanation

Retrieval operations reflect the results of the most recently completed update operations. For aggregate operations, concurrent retrievals may reflect insertion or removal of only some entries.

The table is dynamically expanded when there are too many collisions. It supports parallel bulk operations like forEach, search, reduce.

Does not allow null keys or values.

## Constructors

- `ConcurrentHashMap()`: Default.
- `ConcurrentHashMap(int initialCapacity)`: With capacity.
- `ConcurrentHashMap(int initialCapacity, float loadFactor)`: With load factor.
- `ConcurrentHashMap(int initialCapacity, float loadFactor, int concurrencyLevel)`: With concurrency level.
- `ConcurrentHashMap(Map<? extends K,? extends V> m)`: From map.

## Key Methods

- `V put(K key, V value)`: Maps key to value.
- `V get(Object key)`: Returns value.
- `V remove(Object key)`: Removes mapping.
- `boolean containsKey(Object key)`: Checks key.
- `int size()`: Returns size (estimate).
- `long mappingCount()`: More accurate count.
- Bulk ops: forEach, search, reduce variants.

# Real-world Examples & Use Cases

- Shared caches: Concurrent access to cached data.
- Frequency maps: Using LongAdder for counts.
- Concurrent registries: Monitoring shared state.

# Code Examples

Frequency map:

```java
ConcurrentHashMap<String, LongAdder> freqs = new ConcurrentHashMap<>();
freqs.computeIfAbsent(key, k -> new LongAdder()).increment();
```

Bulk forEach:

```java
map.forEach((k, v) -> System.out.println(k + " -> " + v));
```

Reduce:

```java
long sum = map.reduceValuesToLong(1, Long::longValue, 0, Long::sum);
```

# References

- [Oracle Java Docs: ConcurrentHashMap](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ConcurrentHashMap.html)

# Github-README Links & Related Topics

- [Collections & Data Structures](collections-and-data-structures/)
- [Multithreading & Concurrency in Java](multithreading-and-concurrency-in-java/)
- [Java Stream API & Functional Programming](java-stream-api-and-functional-programming/)

# Common Pitfalls & Edge Cases

- No nulls: Throws NullPointerException.
- Size estimate: size() may not reflect concurrent changes.
- Iterators: Weakly consistent, may not reflect latest changes.
- Bulk ops: Correctness depends on no ordering assumptions.

# Tools & Libraries

- Java Standard Library: java.util.concurrent.ConcurrentHashMap

| Method Category | Examples |
|-----------------|----------|
| Basic | put, get, remove |
| Conditional | putIfAbsent, replace |
| Bulk | forEach, search, reduce |
| Atomic | compute, merge |