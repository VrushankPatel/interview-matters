---
title: Class Loading Mechanism
aliases: []
tags: [#java, #jvm]
created: 2025-09-26
updated: 2025-09-26
---

# Class Loading Mechanism

## Overview
The Class Loading Mechanism in Java is responsible for loading class files into the JVM at runtime. It involves a hierarchy of class loaders that find, load, and initialize classes, enabling dynamic class loading and modularity.

## Detailed Explanation
Java uses a hierarchical class loader system:
- **Bootstrap Class Loader**: Loads core Java classes from `rt.jar`.
- **Extension Class Loader**: Loads classes from extension directories.
- **System/Application Class Loader**: Loads application classes from classpath.

### Phases of Class Loading
1. **Loading**: Finding and importing the binary data of a class.
2. **Linking**: Verifying bytecode, allocating memory, resolving symbolic references.
3. **Initialization**: Executing static initializers and assigning initial values.

Class loaders follow the delegation model: a class loader delegates to its parent before attempting to load itself.

## Real-world Examples & Use Cases
- **Plugin Systems**: Dynamically loading plugins without restarting the application.
- **Web Servers**: Loading servlet classes on demand.
- **Modular Applications**: Isolating classpaths for different modules.

## Code Examples
```java
public class CustomClassLoader extends ClassLoader {
    @Override
    public Class<?> findClass(String name) throws ClassNotFoundException {
        // Custom loading logic
        byte[] classData = loadClassData(name);
        return defineClass(name, classData, 0, classData.length);
    }
    
    private byte[] loadClassData(String name) {
        // Implementation to load bytecode
        return new byte[0];
    }
}
```

## References
- [Oracle Java Documentation: Class Loading](https://docs.oracle.com/javase/8/docs/technotes/guides/lang/cl-mt.html)
- [GeeksforGeeks: Class Loading in Java](https://www.geeksforgeeks.org/class-loading-in-java/)

## Github-README Links & Related Topics
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Java Class Loaders](../java-class-loaders/README.md)
- [JVM Memory Model](../jvm-memory-model/README.md)