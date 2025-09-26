---
title: Collections & Data Structures
aliases: [Java Collections, Data Structures in Java]
tags: [#java, #data-structures]
created: 2023-10-01
updated: 2025-09-26
---

# Collections & Data Structures

## Overview

Collections and Data Structures in Java provide efficient ways to store, manipulate, and retrieve data. The Java Collections Framework offers interfaces and implementations for common data structures like lists, sets, maps, and queues.

## Detailed Explanation

### Interfaces

- **List**: Ordered collection, allows duplicates.

- **Set**: Unordered collection, no duplicates.

- **Map**: Key-value pairs.

- **Queue**: FIFO structure.

### Implementations

| Interface | Implementation | Description |
|-----------|----------------|-------------|
| List | ArrayList | Dynamic array |
| List | LinkedList | Doubly linked list |
| Set | HashSet | Hash table |
| Set | TreeSet | Red-black tree |
| Map | HashMap | Hash table |
| Map | TreeMap | Red-black tree |

## Real-world Examples & Use Cases

- **ArrayList**: Shopping cart items.

- **HashMap**: User sessions.

- **TreeSet**: Sorted unique elements.

## Code Examples

### ArrayList
```java
List<String> list = new ArrayList<>();
list.add("item1");
list.add("item2");
System.out.println(list.get(0));
```

### HashMap
```java
Map<String, Integer> map = new HashMap<>();
map.put("key", 1);
System.out.println(map.get("key"));
```

## References

- [Oracle Collections](https://docs.oracle.com/javase/tutorial/collections/)

## Github-README Links & Related Topics

- [Java Collections](java-collections/)
- [Data Structures](data-structures/)