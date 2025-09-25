---
title: Java Testing Advanced
aliases: [Advanced Testing, Mocks and Spies, Test Frameworks]
tags: [#java, #testing]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Advanced testing in Java encompasses unit testing with mocks, integration testing, and behavior-driven development. Essential for ensuring code reliability and facilitating refactoring.

Canonical Interview Prompt: Write a test for a service class using Mockito to mock dependencies and verify interactions.

# Detailed Explanation

## High-Level Design

JUnit 5 provides the testing framework, Mockito for mocking, and tools like JaCoCo for coverage.

```mermaid
graph TD
    A[JUnit 5] --> B[Test Classes]
    B --> C[@Test Methods]
    D[Mockito] --> E[Mock Objects]
    E --> F[Stub/Verify]
    G[JaCoCo] --> H[Coverage Reports]
```

## Key Components

- **JUnit 5**: Annotations like @Test, @BeforeEach, assertions.
- **Mockito**: @Mock, @InjectMocks for dependency injection in tests.
- **Test Doubles**: Mocks, stubs, spies.
- **Parameterized Tests**: Run same test with different inputs.

## Capacity and Throughput Targets

- Test Execution: 100-1000 tests per minute in CI/CD.
- Coverage: Aim for 80%+ code coverage.

## Tradeoffs

- **Over-Mocking**: Can make tests brittle; balance with integration tests.
- **Performance**: Mocks faster than real dependencies, but may miss integration issues.

# Real-world Examples & Use Cases

- **Service Layer Testing**: Mock DAOs in business logic tests.
- **API Testing**: Use RestAssured for integration tests.
- **TDD**: Write tests first to drive design.

# Code Examples

**Basic JUnit Test:**

```java
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {
    @Test
    void testAdd() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.add(2, 3));
    }
}
```

**Mockito Example:**

```java
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import static org.mockito.Mockito.*;

public class UserServiceTest {
    @Mock
    private UserRepository repo;

    private UserService service;

    @Test
    void testGetUser() {
        MockitoAnnotations.openMocks(this);
        service = new UserService(repo);
        User user = new User("John");
        when(repo.findById(1)).thenReturn(user);
        assertEquals("John", service.getUser(1).getName());
        verify(repo).findById(1);
    }
}
```

**Parameterized Test:**

```java
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

public class StringUtilsTest {
    @ParameterizedTest
    @ValueSource(strings = {"racecar", "radar", "level"})
    void testIsPalindrome(String candidate) {
        assertTrue(StringUtils.isPalindrome(candidate));
    }
}
```

# Data Models / Message Formats

**Test Data:**

JSON fixtures or builders for complex objects.

# Common Pitfalls & Edge Cases

- **Mock Verification**: Ensure mocks are verified correctly.
- **Test Isolation**: Each test independent.
- **Flaky Tests**: Avoid time-dependent tests.

# Tools & Libraries

- JUnit 5
- Mockito
- AssertJ for fluent assertions
- JaCoCo for coverage

# Github-README Links & Related Topics

[testing-and-mocking-junit-mockito](../testing-and-mocking-junit-mockito/README.md), [java-language-basics](../java-language-basics/README.md)

# References

- https://junit.org/junit5/docs/current/user-guide/
- https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html
- https://www.baeldung.com/junit-5