---
title: 'Reflection and Annotations'
aliases: ["Runtime Inspection"]
tags: ["#java", "#reflection", "#annotations"]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Reflection and annotations are powerful Java features for runtime inspection and metadata addition. Reflection enables dynamic examination and modification of classes, methods, and fields at runtime, while annotations allow attaching metadata to code elements for processing by tools, frameworks, or the JVM. Together, they facilitate advanced programming patterns like dependency injection, ORM mapping, and compile-time code generation.

## Detailed Explanation

### Reflection

Reflection provides the ability to inspect and manipulate classes, interfaces, fields, and methods at runtime without knowing their names at compile time. It is part of the `java.lang.reflect` package and is commonly used for:

- **Dynamic Class Loading**: Loading classes by name using `Class.forName()`.
- **Introspection**: Examining class structure, including fields, methods, constructors, and annotations.
- **Dynamic Invocation**: Calling methods or accessing fields dynamically.
- **Array Manipulation**: Creating and inspecting arrays.

Key classes include `Class`, `Field`, `Method`, `Constructor`, and `Modifier`.

```mermaid
flowchart TD
    A[Obtain Class Object] --> B{.class literal}
    A --> C[getClass() method]
    A --> D[Class.forName()]
    B --> E[Inspect Members]
    C --> E
    D --> E
    E --> F[Fields]
    E --> G[Methods]
    E --> H[Constructors]
    E --> I[Annotations]
    F --> J[Get/Set Values]
    G --> K[Invoke]
    H --> L[NewInstance]
```

### Annotations

Annotations are a form of metadata that can be added to Java code elements (classes, methods, fields, etc.) without affecting the code's semantics. They are defined using the `@interface` keyword and can be processed at compile-time or runtime.

- **Retention Policies**: Control when annotations are retained.
  - `SOURCE`: Discarded by compiler.
  - `CLASS`: Stored in class file but not available at runtime.
  - `RUNTIME`: Available at runtime via reflection.
- **Targets**: Specify where annotations can be applied (e.g., `TYPE`, `METHOD`, `FIELD`).
- **Meta-Annotations**: Annotations that annotate other annotations, like `@Retention`, `@Target`, `@Documented`, `@Inherited`.

| Meta-Annotation | Purpose |
|-----------------|---------|
| `@Retention` | Specifies how long the annotation is retained |
| `@Target` | Specifies the kinds of program elements to which the annotation can be applied |
| `@Documented` | Indicates that the annotation should be documented by javadoc |
| `@Inherited` | Indicates that the annotation is inherited by subclasses |

## Real-world Examples & Use Cases

- **Dependency Injection (DI)**: Frameworks like Spring use annotations (`@Autowired`, `@Component`) combined with reflection to automatically wire dependencies at runtime.
- **Object-Relational Mapping (ORM)**: Hibernate employs annotations (`@Entity`, `@Table`, `@Column`) to map Java objects to database tables, with reflection handling the mapping logic.
- **Testing Frameworks**: JUnit and TestNG use annotations (`@Test`, `@BeforeEach`) to identify test methods, leveraging reflection to invoke them dynamically.
- **Serialization Libraries**: Jackson and Gson use annotations (`@JsonProperty`) and reflection to customize JSON serialization/deserialization.
- **Code Generation**: Annotation processors generate boilerplate code at compile-time, such as Lombok's `@Data` for getters/setters.
- **Security and Validation**: Custom annotations with runtime processing for input validation or access control.

## Code Examples

### Basic Reflection: Inspecting a Class

```java
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class ReflectionExample {
    public static void main(String[] args) throws Exception {
        Class<?> clazz = String.class;
        
        // Get class name
        System.out.println("Class: " + clazz.getName());
        
        // Get public methods
        Method[] methods = clazz.getMethods();
        System.out.println("Public methods:");
        for (Method method : methods) {
            System.out.println("  " + method.getName());
        }
        
        // Get fields
        Field[] fields = clazz.getDeclaredFields();
        System.out.println("Declared fields:");
        for (Field field : fields) {
            System.out.println("  " + field.getName() + " (" + field.getType().getSimpleName() + ")");
        }
    }
}
```

### Dynamic Method Invocation

```java
import java.lang.reflect.Method;

public class DynamicInvocation {
    public static void main(String[] args) throws Exception {
        Class<?> mathClass = Math.class;
        Method sqrtMethod = mathClass.getMethod("sqrt", double.class);
        
        double result = (double) sqrtMethod.invoke(null, 25.0);
        System.out.println("Square root of 25: " + result); // Output: 5.0
    }
}
```

### Custom Annotation Definition

```java
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD})
public @interface MyCustomAnnotation {
    String value() default "";
    int priority() default 1;
}
```

### Using Custom Annotation

```java
@MyCustomAnnotation(value = "Service Class", priority = 5)
public class MyService {
    
    @MyCustomAnnotation("Important Method")
    public void doSomething() {
        System.out.println("Doing something important");
    }
}
```

### Processing Annotations with Reflection

```java
import java.lang.reflect.Method;

public class AnnotationProcessor {
    public static void main(String[] args) throws Exception {
        Class<?> serviceClass = MyService.class;
        
        // Check class annotation
        MyCustomAnnotation classAnnotation = serviceClass.getAnnotation(MyCustomAnnotation.class);
        if (classAnnotation != null) {
            System.out.println("Class annotation: " + classAnnotation.value() + 
                             ", priority: " + classAnnotation.priority());
        }
        
        // Check method annotations
        Method method = serviceClass.getMethod("doSomething");
        MyCustomAnnotation methodAnnotation = method.getAnnotation(MyCustomAnnotation.class);
        if (methodAnnotation != null) {
            System.out.println("Method annotation: " + methodAnnotation.value());
        }
    }
}
```

## Common Pitfalls & Edge Cases

- **Performance Overhead**: Reflection operations are slower than direct calls. Cache `Method`, `Field`, and `Constructor` objects for repeated use.
- **Security Restrictions**: In environments with security managers, reflection may require permissions. Avoid in untrusted code.
- **Access Control Bypass**: Reflection can access private members, potentially breaking encapsulation. Use `setAccessible(true)` cautiously.
- **Type Erasure**: Generic type information is lost at runtime, limiting reflection on parameterized types.
- **Exception Handling**: Be prepared for `ClassNotFoundException`, `NoSuchMethodException`, `IllegalAccessException`, and `InvocationTargetException`.
- **Annotation Retention**: Ensure annotations have `RUNTIME` retention if they need to be processed at runtime.
- **Inheritance**: Annotations are not inherited by default; use `@Inherited` for class-level inheritance.

## Tools & Libraries

- **Java Reflection API**: Core classes in `java.lang.reflect` package.
- **Annotation Processing Tool (APT)**: For compile-time annotation processing.
- **Lombok**: Library that uses annotations to generate boilerplate code (e.g., `@Getter`, `@Setter`).
- **Spring Framework**: Extensive use of annotations and reflection for DI and AOP.
- **Hibernate**: ORM framework relying on annotations for entity mapping.
- **JUnit/TestNG**: Testing frameworks using annotations for test discovery.

## References

- [Oracle Java Tutorials: The Reflection API](https://docs.oracle.com/javase/tutorial/reflect/)
- [Oracle Java Tutorials: Annotations](https://docs.oracle.com/javase/tutorial/java/annotations/)
- [Java Language Specification: Annotations](https://docs.oracle.com/javase/specs/jls/se21/html/jls-9.html)
- [Baeldung: Java Reflection Guide](https://www.baeldung.com/java-reflection)
- [Baeldung: Java Annotations Tutorial](https://www.baeldung.com/java-custom-annotation)

## Github-README Links & Related Topics

- [Java Reflection](../java-reflection/README.md)
- [Java Annotations](../java-annotations/README.md)
- [JVM Internals and Classloading](../java/advanced-java-concepts/jvm-internals-and-classloading/README.md)
- [Design Patterns](../java/design-patterns/README.md)
- [Testing and Mocking](../java/testing-and-mocking-junit-mockito/README.md)