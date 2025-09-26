---
title: Java Stream API & Functional Programming
aliases: [Java Streams, Functional Programming in Java]
tags: [#java,#functional-programming]
created: 2025-09-26
updated: 2025-09-26
---

# Overview

The Java Stream API, introduced in Java 8, provides a functional approach to processing collections of data. It enables declarative data manipulation with operations like filtering, mapping, and reducing, promoting functional programming paradigms in Java.

# Detailed Explanation

## Stream Characteristics

- **Lazy Evaluation**: Operations are not executed until a terminal operation is invoked
- **Immutability**: Streams don't modify the source data
- **Pipeline**: Operations are chained together
- **Internal Iteration**: The stream handles iteration internally

## Stream Operations

### Intermediate Operations
- `filter()`: Select elements based on predicate
- `map()`: Transform elements
- `flatMap()`: Flatten nested structures
- `distinct()`: Remove duplicates
- `sorted()`: Sort elements
- `limit()` / `skip()`: Limit or skip elements

### Terminal Operations
- `collect()`: Gather results into a collection
- `forEach()`: Perform action on each element
- `reduce()`: Combine elements
- `count()` / `sum()` / `average()`: Aggregate operations
- `findFirst()` / `findAny()`: Find elements
- `anyMatch()` / `allMatch()` / `noneMatch()`: Check conditions

## Functional Interfaces

- `Predicate<T>`: Boolean-valued function
- `Function<T,R>`: Transform T to R
- `Consumer<T>`: Accept T, return void
- `Supplier<T>`: Provide T without input
- `BiFunction<T,U,R>`: Transform T and U to R

# Real-world Examples & Use Cases

## Data Processing Pipeline

```java
List<Employee> employees = getEmployees();

List<String> seniorDevelopers = employees.stream()
    .filter(e -> e.getDepartment().equals("Development"))
    .filter(e -> e.getExperience() > 5)
    .map(Employee::getName)
    .sorted()
    .collect(Collectors.toList());
```

## Grouping and Aggregation

```java
Map<String, Double> avgSalaryByDept = employees.stream()
    .collect(Collectors.groupingBy(
        Employee::getDepartment,
        Collectors.averagingDouble(Employee::getSalary)
    ));
```

## Complex Filtering

```java
List<Order> highValueOrders = orders.stream()
    .filter(order -> order.getTotal() > 1000)
    .filter(order -> order.getItems().stream()
        .anyMatch(item -> item.getCategory().equals("Electronics")))
    .collect(Collectors.toList());
```

# Code Examples

## Basic Stream Operations

```java
List<String> names = Arrays.asList("Alice", "Bob", "Charlie", "David");

// Filter and transform
List<String> filteredNames = names.stream()
    .filter(name -> name.length() > 3)
    .map(String::toUpperCase)
    .collect(Collectors.toList());

// Count elements
long count = names.stream()
    .filter(name -> name.startsWith("A"))
    .count();
```

## Parallel Streams

```java
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

int sum = numbers.parallelStream()
    .filter(n -> n % 2 == 0)
    .mapToInt(Integer::intValue)
    .sum();
```

## Custom Collectors

```java
Collector<Employee, ?, Map<String, List<Employee>>> groupByDept = 
    Collectors.groupingBy(Employee::getDepartment);

Map<String, List<Employee>> employeesByDept = 
    employees.stream().collect(groupByDept);
```

## Optional with Streams

```java
Optional<Employee> topEarner = employees.stream()
    .max(Comparator.comparingDouble(Employee::getSalary));

topEarner.ifPresent(emp -> 
    System.out.println("Top earner: " + emp.getName()));
```

# References

- [Oracle Java Stream API Documentation](https://docs.oracle.com/javase/8/docs/api/java/util/stream/package-summary.html)
- [Functional Programming in Java](https://www.baeldung.com/java-functional-programming)

# Github-README Links & Related Topics

- [Java Lambda Expressions](../java-lambda-expressions)
- [Java Optional Class](../java-optional-class)
- [Java Collections](../java-collections)