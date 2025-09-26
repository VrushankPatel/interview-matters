---
title: Java BlockingQueue
aliases: [BlockingQueue in Java]
tags: [#java,#concurrency,#collections]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

BlockingQueue is an interface in Java that represents a queue that supports operations that wait for the queue to become non-empty when retrieving an element, and wait for space to become available in the queue when storing an element. It's part of the `java.util.concurrent` package and is essential for producer-consumer patterns.

## Detailed Explanation

BlockingQueue extends the Queue interface with blocking operations. When the queue is full, put operations block until space becomes available. When the queue is empty, take operations block until an element is available.

Key methods:
- `put(E e)`: Inserts element, blocks if full.
- `take()`: Retrieves and removes head, blocks if empty.
- `offer(E e, long timeout, TimeUnit unit)`: Timed offer.
- `poll(long timeout, TimeUnit unit)`: Timed poll.

Common implementations:
- **ArrayBlockingQueue**: Bounded, backed by array.
- **LinkedBlockingQueue**: Optionally bounded, backed by linked nodes.
- **PriorityBlockingQueue**: Unbounded priority queue.
- **SynchronousQueue**: Zero-capacity, direct handoff.

### Data Models

#### ArrayBlockingQueue
```
[0] [1] [2] ... [capacity-1]
 ^   ^   ^
put  take  count
```

#### LinkedBlockingQueue
```
Head -> Node1 -> Node2 -> ... -> Tail
```

## Real-world Examples & Use Cases

1. **Producer-Consumer Pattern**: Classic use case for decoupling producers and consumers.
2. **Thread Pools**: Managing task queues in ExecutorService implementations.
3. **Resource Pools**: Managing database connections or thread pools.
4. **Message Queues**: Implementing in-memory message brokers.

## Code Examples

### Producer-Consumer with ArrayBlockingQueue

```java
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ProducerConsumerExample {
    private static final BlockingQueue<Integer> queue = new ArrayBlockingQueue<>(10);
    
    public static void main(String[] args) {
        ExecutorService executor = Executors.newCachedThreadPool();
        
        // Producer
        executor.submit(() -> {
            try {
                for (int i = 0; i < 20; i++) {
                    queue.put(i);
                    System.out.println("Produced: " + i);
                    Thread.sleep(100);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        // Consumer
        executor.submit(() -> {
            try {
                while (true) {
                    int item = queue.take();
                    System.out.println("Consumed: " + item);
                    Thread.sleep(200);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
        
        // Shutdown after some time
        executor.shutdown();
    }
}
```

### Timed Operations

```java
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

public class TimedBlockingQueueExample {
    public static void main(String[] args) {
        BlockingQueue<String> queue = new LinkedBlockingQueue<>(5);
        
        // Try to offer with timeout
        try {
            boolean offered = queue.offer("Item 1", 1, TimeUnit.SECONDS);
            System.out.println("Offered: " + offered);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        // Try to poll with timeout
        try {
            String item = queue.poll(1, TimeUnit.SECONDS);
            System.out.println("Polled: " + item);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}
```

### Drain Operations

```java
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class DrainExample {
    public static void main(String[] args) {
        BlockingQueue<String> queue = new LinkedBlockingQueue<>();
        queue.add("A");
        queue.add("B");
        queue.add("C");
        
        List<String> drained = new ArrayList<>();
        int numDrained = queue.drainTo(drained, 2);
        System.out.println("Drained " + numDrained + " items: " + drained);
    }
}
```

## Common Pitfalls & Edge Cases

- **Capacity Management**: Choose appropriate capacity to avoid blocking or memory issues.
- **Interrupt Handling**: Blocking operations can be interrupted; handle InterruptedException.
- **Performance**: ArrayBlockingQueue may have better performance for small capacities.
- **Null Elements**: Most implementations don't allow null elements.

## Tools & Libraries

- **JDK Implementations**: ArrayBlockingQueue, LinkedBlockingQueue, PriorityBlockingQueue, SynchronousQueue
- **External**: Apache Commons Collections, Google Guava for additional utilities

## References

- [Oracle Java Documentation: BlockingQueue](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/BlockingQueue.html)
- [Java Concurrency in Practice - Chapter 5](https://www.amazon.com/Java-Concurrency-Practice-Brian-Goetz/dp/0321349601)

## Github-README Links & Related Topics

- [Java ConcurrentLinkedQueue](./java-concurrentlinkedqueue/README.md)
- [Java ExecutorService](./java-executorservice/README.md)
- [Collections & Data Structures](./collections-and-data-structures/README.md)