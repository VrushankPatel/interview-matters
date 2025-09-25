---
title: Java Modules
aliases: [JPMS, Java Platform Module System]
tags: [#java]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

The Java Platform Module System (JPMS), introduced in Java 9, provides modularization for better encapsulation, dependency management, and application structure. Modules define boundaries between components, enabling reliable configuration and strong encapsulation.

## Detailed Explanation

### Module Declaration

Modules are declared in `module-info.java` at the root of the module path.

```java
module com.example.myapp {
    requires java.base; // Implicit
    requires com.example.utils;
    exports com.example.api;
    opens com.example.internal to com.example.test;
}
```

### Module Directives

- **requires**: Declares dependencies on other modules.
- **requires transitive**: Dependencies are propagated to consumers.
- **requires static**: Optional dependencies for compilation only.
- **exports**: Makes packages accessible to other modules.
- **exports ... to**: Exports only to specific modules.
- **opens**: Allows deep reflection on packages.
- **opens ... to**: Opens only to specific modules.
- **uses**: Declares service consumption.
- **provides ... with**: Declares service provision.

### Module Path vs Classpath

- **Module Path**: For modular JARs with `module-info.java`.
- **Classpath**: For traditional JARs; modules can access them but not vice versa.
- **Automatic Modules**: JARs without `module-info.java` become automatic modules.

### Services

Modules support service-oriented architecture.

- **Service Interface**: Exported interface.
- **Service Provider**: Implementation in provider module.
- **Service Consumer**: Uses `ServiceLoader` to load providers.

### Migration

- **Unnamed Module**: All classpath JARs in the unnamed module.
- **Automatic Modules**: JARs on module path without `module-info.java`.
- **Named Modules**: JARs with `module-info.java`.

## Real-world Examples & Use Cases

| Use Case | Example | Description |
|----------|---------|-------------|
| Application Structure | Modular monoliths | Separate concerns into modules. |
| Library Distribution | JDK modules | Core libraries as modules. |
| Dependency Management | Maven modules | Build-time modularity. |
| Security | Encapsulation | Hide internal APIs. |
| Performance | Faster startup | Reduced classpath scanning. |

Modules are used in Java 9+ for organizing large applications and libraries like Spring Boot.

## Code Examples

### Basic Module

```java
// src/module-info.java
module com.example.hello {
    requires java.base;
    exports com.example.hello;
}

// src/com/example/hello/Hello.java
package com.example.hello;

public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello Modules!");
    }
}
```

### Module with Dependencies

```java
// utils/module-info.java
module com.example.utils {
    exports com.example.utils;
}

// app/module-info.java
module com.example.app {
    requires com.example.utils;
    exports com.example.app;
}

// app/src/com/example/app/App.java
package com.example.app;

import com.example.utils.Helper;

public class App {
    public static void main(String[] args) {
        Helper.help();
    }
}
```

### Services

```java
// service-api/module-info.java
module com.example.service.api {
    exports com.example.service.api;
    uses com.example.service.api.Greeter;
}

// service-api/src/com/example/service/api/Greeter.java
package com.example.service.api;

public interface Greeter {
    String greet(String name);
}

// service-impl/module-info.java
module com.example.service.impl {
    requires com.example.service.api;
    provides com.example.service.api.Greeter with com.example.service.impl.FriendlyGreeter;
}

// service-impl/src/com/example/service/impl/FriendlyGreeter.java
package com.example.service.impl;

import com.example.service.api.Greeter;

public class FriendlyGreeter implements Greeter {
    @Override
    public String greet(String name) {
        return "Hello, " + name + "!";
    }
}

// consumer/module-info.java
module com.example.consumer {
    requires com.example.service.api;
}

// consumer/src/com/example/consumer/Main.java
package com.example.consumer;

import com.example.service.api.Greeter;
import java.util.ServiceLoader;

public class Main {
    public static void main(String[] args) {
        ServiceLoader<Greeter> loader = ServiceLoader.load(Greeter.class);
        for (Greeter greeter : loader) {
            System.out.println(greeter.greet("World"));
        }
    }
}
```

### Opening Packages

```java
// module-info.java
module com.example.reflection {
    requires java.base;
    opens com.example.reflection.internal;
}

// Usage with reflection
import java.lang.reflect.Field;

public class ReflectionUser {
    public static void main(String[] args) throws Exception {
        Class<?> clazz = Class.forName("com.example.reflection.internal.Secret");
        Field field = clazz.getDeclaredField("secret");
        field.setAccessible(true);
        // Access field
    }
}
```

## Common Pitfalls & Edge Cases

- **Split Packages**: Same package in multiple modules causes conflicts.
- **Cyclic Dependencies**: Modules cannot require each other circularly.
- **Reflection Access**: Closed modules prevent deep reflection.
- **Version Conflicts**: Module versions not enforced; use build tools.
- **Migration Pain**: Large codebases require careful planning.

## Tools & Libraries

- **jlink**: Create custom runtime images with only needed modules.
- **jdeps**: Analyze module dependencies.
- **Maven/Gradle**: Module-aware build tools.
- **Modular JDK**: JDK itself is modularized.

## Github-README Links & Related Topics

- [Build Tools Maven Gradle](java/build-tools-maven-gradle/README.md)
- [JVM Internals and Classloading](java/jvm-internals-and-classloading/README.md)
- [Java Language Basics](java/java-language-basics/README.md)
- [Advanced Java Concepts](java/advanced-java-concepts/README.md)

## References

- [Oracle JPMS Tutorial](https://docs.oracle.com/javase/9/docs/api/java/lang/module/package-summary.html)
- [Java Language Specification: Modules](https://docs.oracle.com/javase/specs/jls/se21/html/jls-7.html)
- [State of the Module System](https://openjdk.org/projects/jigsaw/spec/)
- [Migrating to Modules](https://www.oracle.com/corporate/features/migrating-to-modules.html)</content>
</xai:function_call ><xai:function_call name="write">
<parameter name="filePath">java-records/README.md