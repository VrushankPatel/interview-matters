---
title: JVM Memory Model
aliases: []
tags: [#java, #jvm]
created: 2025-09-26
updated: 2025-09-26
---

# JVM Memory Model

## Overview
The JVM Memory Model defines how the Java Virtual Machine manages memory for Java applications. It divides memory into several areas, each serving specific purposes for storing different types of data and ensuring efficient execution.

## Detailed Explanation
The JVM memory is divided into:
- **Heap**: Stores objects and instance variables. Divided into Young Generation (Eden, Survivor spaces) and Old Generation.
- **Stack**: Stores local variables, method calls, and partial results. Each thread has its own stack.
- **Method Area**: Stores class-level data like static variables, method bytecode, and runtime constant pool.
- **Program Counter (PC) Register**: Holds the address of the current instruction being executed.
- **Native Method Stack**: For native method calls.

### Memory Management
- Objects are allocated in the heap.
- Garbage collection reclaims unused heap memory.
- Stacks are automatically managed per thread.

## Real-world Examples & Use Cases
- **Web Applications**: Heap stores user session data; stacks manage request processing.
- **Multithreaded Servers**: Each thread's stack isolates local variables.
- **Large Data Processing**: Method area holds class metadata for dynamic loading.

## Code Examples
```java
public class MemoryExample {
    private static int staticVar = 10; // Method Area
    
    public void method() {
        int localVar = 5; // Stack
        Object obj = new Object(); // Heap
    }
}
```

## References
- [Oracle JVM Documentation: Memory Management](https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/)
- [GeeksforGeeks: JVM Memory Model](https://www.geeksforgeeks.org/jvm-memory-model/)

## Github-README Links & Related Topics
- [JVM Internals & Class Loading](../jvm-internals-and-class-loading/README.md)
- [Garbage Collection Algorithms](../garbage-collection-algorithms/README.md)
- [Java Memory Management](../java-memory-management/README.md)