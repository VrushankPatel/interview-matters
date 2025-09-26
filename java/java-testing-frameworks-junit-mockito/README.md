---
title: Java Testing Frameworks (JUnit, Mockito)
aliases: []
tags: [#java,#testing,#junit,#mockito]
created: 2025-09-26
updated: 2025-09-26
---

# Java Testing Frameworks (JUnit, Mockito)

## Overview

Testing is crucial for ensuring software quality. JUnit is the de facto standard for unit testing in Java, providing annotations and assertions to write and run tests. Mockito is a popular mocking framework that works seamlessly with JUnit to isolate units under test by mocking dependencies.

## Detailed Explanation

### JUnit
JUnit provides a framework for writing repeatable tests. Key features include:
- **Annotations**: @Test, @BeforeEach, @AfterEach, @BeforeAll, @AfterAll for lifecycle management.
- **Assertions**: Methods like assertEquals, assertTrue, assertThrows to verify expected outcomes.
- **Test Suites**: Grouping tests with @Suite.
- **Parameterized Tests**: Running the same test with different inputs using @ParameterizedTest.

### Mockito
Mockito allows creating mock objects to simulate the behavior of real objects. Key concepts:
- **Mocking**: Creating fake objects with @Mock annotation.
- **Stubbing**: Defining behavior with when().thenReturn(), thenThrow().
- **Verification**: Checking interactions with verify().
- **Argument Matchers**: Using any(), eq() for flexible matching.

Together, they enable Test-Driven Development (TDD) and ensure code reliability.

## Real-world Examples & Use Cases

- **Unit Testing Business Logic**: Using JUnit to test methods in service classes.
- **Mocking External Dependencies**: Using Mockito to mock database calls or web services in tests.
- **Integration Testing**: Combining JUnit with Spring Boot for end-to-end tests.
- **Behavior Verification**: Ensuring methods are called with correct parameters using Mockito verify.

## Code Examples

### Basic JUnit Test
```java
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class CalculatorTest {

    @Test
    void testAddition() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.add(2, 3));
    }

    @Test
    void testDivisionByZero() {
        Calculator calc = new Calculator();
        assertThrows(ArithmeticException.class, () -> calc.divide(1, 0));
    }
}
```

### Using Mockito for Mocking
```java
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    private UserService userService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        userService = new UserService(userRepository);
    }

    @Test
    void testGetUserById() {
        User mockUser = new User(1, "John");
        when(userRepository.findById(1)).thenReturn(mockUser);

        User user = userService.getUserById(1);
        assertEquals("John", user.getName());
        verify(userRepository).findById(1);
    }
}
```

## References

- [JUnit 5 User Guide](https://junit.org/junit5/docs/current/user-guide/)
- [Mockito Documentation](https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html)

## Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/)
