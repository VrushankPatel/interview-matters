---
title: Java 20 Features
aliases: [Java 20, JDK 20 Features]
tags: [#java]
created: 2025-09-26
updated: 2025-09-26
---

## Overview

Java 20, released in March 2023, is a non-LTS release that continues refining preview features from previous versions. It includes the second preview of record patterns, fourth preview of pattern matching for switch, and scoped values. This release focuses on language enhancements for better expressiveness and type safety.

## Detailed Explanation

Java 20 builds on the previews introduced in Java 19, providing more mature versions of these features. Key features include:

### Record Patterns (Second Preview)
Enhanced pattern matching for records with improved syntax and capabilities.

### Pattern Matching for Switch (Fourth Preview)
Further refinements to pattern matching in switch expressions and statements.

### Scoped Values (Preview)
A way to share immutable data within and across threads, providing an alternative to thread-local variables.

### Foreign Function & Memory API (Preview)
Continued development of the API for native interoperability.

### Other Features
- Vector API (Fourth Incubator)
- Linux/RISC-V Port improvements
- Security and performance updates

## Real-world Examples & Use Cases

### Record Patterns in Data Processing
Process complex nested data structures more elegantly.

```java
public record Order(String id, Customer customer, List<Item> items) {}
public record Customer(String name, Address address) {}
public record Address(String street, String city) {}
public record Item(String name, double price) {}

public double calculateTotal(Order order) {
    return switch (order) {
        case Order(var id, Customer(var name, Address(var street, var city)), var items) -> {
            double total = items.stream().mapToDouble(Item::price).sum();
            System.out.println("Order " + id + " for " + name + " totals: " + total);
            yield total;
        }
    };
}
```

### Scoped Values for Request Context
Share request-scoped data without thread-local variables.

```java
import jdk.incubator.concurrent.ScopedValue;

public class ScopedValueExample {
    private static final ScopedValue<String> REQUEST_ID = ScopedValue.newInstance();
    
    public static void main(String[] args) {
        ScopedValue.where(REQUEST_ID, "req-123").run(() -> {
            processRequest();
        });
    }
    
    private static void processRequest() {
        System.out.println("Processing request: " + REQUEST_ID.get());
        
        // Simulate async operation
        ScopedValue.where(REQUEST_ID, REQUEST_ID.get()).run(() -> {
            System.out.println("Async task for request: " + REQUEST_ID.get());
        });
    }
}
```

### Pattern Matching in Switch for Complex Logic
Handle different types of messages in a messaging system.

```java
public sealed interface Message permits TextMessage, ImageMessage, SystemMessage {}

public record TextMessage(String sender, String content) implements Message {}
public record ImageMessage(String sender, String imageUrl) implements Message {}
public record SystemMessage(String type, String data) implements Message {}

public void handleMessage(Message message) {
    switch (message) {
        case TextMessage(var sender, var content) -> 
            System.out.println(sender + ": " + content);
        case ImageMessage(var sender, var imageUrl) -> 
            System.out.println(sender + " sent an image: " + imageUrl);
        case SystemMessage(var type, var data) -> 
            System.out.println("System " + type + ": " + data);
    }
}
```

## Code Examples

### Complete Scoped Values Example

```java
import jdk.incubator.concurrent.ScopedValue;

public class RequestContextExample {
    private static final ScopedValue<String> USER_ID = ScopedValue.newInstance();
    private static final ScopedValue<String> SESSION_ID = ScopedValue.newInstance();
    
    public static void handleRequest(String userId, String sessionId) {
        ScopedValue.where(USER_ID, userId)
                   .where(SESSION_ID, sessionId)
                   .run(() -> {
                       authenticate();
                       processBusinessLogic();
                       logRequest();
                   });
    }
    
    private static void authenticate() {
        System.out.println("Authenticating user: " + USER_ID.get());
    }
    
    private static void processBusinessLogic() {
        System.out.println("Processing for session: " + SESSION_ID.get());
    }
    
    private static void logRequest() {
        System.out.println("Logging request for user " + USER_ID.get() + " in session " + SESSION_ID.get());
    }
    
    public static void main(String[] args) {
        handleRequest("user123", "session456");
    }
}
```

### Record Patterns with Guards

```java
public record Person(String name, int age) {}

public class RecordPatternWithGuards {
    public static void main(String[] args) {
        Person person = new Person("Alice", 25);
        
        String category = switch (person) {
            case Person(var name, var age) when age < 18 -> "Minor";
            case Person(var name, var age) when age >= 18 && age < 65 -> "Adult";
            case Person(var name, var age) when age >= 65 -> "Senior";
        };
        
        System.out.println(person.name() + " is categorized as: " + category);
    }
}
```

## References

- [Oracle Java 20 Documentation](https://docs.oracle.com/en/java/javase/20/)
- [OpenJDK JDK 20 Release Notes](https://openjdk.org/projects/jdk/20/)
- [JEP 432: Record Patterns (Second Preview)](https://openjdk.org/jeps/432)
- [JEP 433: Pattern Matching for Switch (Fourth Preview)](https://openjdk.org/jeps/433)
- [JEP 429: Scoped Values (Preview)](https://openjdk.org/jeps/429)
- [JEP 434: Foreign Function & Memory API (Second Preview)](https://openjdk.org/jeps/434)

## Github-README Links & Related Topics

- [Java Records](java-records/)
- [Java Pattern Matching](java-pattern-matching/)
- [Java Scoped Values](java-scoped-values/)
- [Java 19 Features](java-19-features/)
- [Java 21 Features](java-21-features/)