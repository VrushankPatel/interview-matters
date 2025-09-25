---
title: Java Testing Advanced
aliases: [JUnit, Mockito, Unit Testing]
tags: [#java,#testing]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Advanced testing in Java involves using frameworks like JUnit for test structure and Mockito for mocking dependencies. Mocks and spies allow isolating units under test by simulating external components.

# Detailed Explanation

## JUnit

- Annotations: @Test, @BeforeEach, @AfterEach, @ParameterizedTest
- Assertions: assertEquals, assertTrue, etc.
- Test lifecycle: Setup, execution, teardown.

## Mockito

- **Mocks**: Completely fake objects with no real behavior.
- **Spies**: Wrap real objects, allowing partial mocking.
- **Verification**: Verify method calls on mocks.
- **Stubbing**: Define return values for methods.

# Real-world Examples & Use Cases

- Testing service classes with database dependencies.
- Verifying interactions in integration tests.
- Mocking external APIs in unit tests.

# Code Examples

```java
// JUnit basic test
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {
    @Test
    void testAddition() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.add(2, 3));
    }
}
```

```java
// Mockito mock example
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import static org.mockito.Mockito.*;

public class UserServiceTest {
    @Test
    void testUserCreation() {
        UserRepository mockRepo = mock(UserRepository.class);
        UserService service = new UserService(mockRepo);
        
        User user = new User("John");
        when(mockRepo.save(user)).thenReturn(user);
        
        User saved = service.createUser("John");
        assertEquals("John", saved.getName());
        verify(mockRepo).save(user);
    }
}
```

```java
// Mockito spy example
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;

public class SpyExampleTest {
    @Test
    void testSpy() {
        List<String> list = new ArrayList<>();
        List<String> spyList = spy(list);
        
        spyList.add("one");
        spyList.add("two");
        
        assertEquals(2, spyList.size());
        verify(spyList).add("one");
        verify(spyList).add("two");
    }
}
```

# Common Pitfalls & Edge Cases

- **Over-mocking**: Leads to brittle tests that break with implementation changes.
- **Incomplete Verification**: Not checking all important interactions.
- **Mock vs Spy Confusion**: Using mocks when spies are more appropriate.
- **Test Data Management**: Hardcoded test data causing maintenance issues.

# Tools & Libraries

- JUnit 5: Testing framework with annotations and assertions.
- Mockito: Mocking framework for creating test doubles.
- AssertJ: Fluent assertions for readable tests.
- TestContainers: For integration tests with real dependencies.

# References

- [JUnit 5 User Guide](https://junit.org/junit5/docs/current/user-guide/)
- [Mockito Documentation](https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html)

# Github-README Links & Related Topics

- [Testing and Mocking JUnit Mockito](../java/testing-and-mocking-junit-mockito/README.md)
- [Design Patterns](../java/design-patterns/README.md)