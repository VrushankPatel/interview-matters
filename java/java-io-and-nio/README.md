---
title: Java I/O and NIO
aliases: []
tags: ["#java"]
created: 2025-09-26
updated: 2025-09-26
---

# Java I/O and NIO

## Overview

Java I/O (Input/Output) and NIO (New I/O) are essential APIs for handling data input and output operations in Java applications. Traditional I/O is stream-based and blocking, while NIO introduces channels and buffers for non-blocking, high-performance I/O operations, crucial for scalable applications.

## Detailed Explanation

### Traditional I/O (java.io Package)

- **Streams**: Divided into byte streams (InputStream, OutputStream) and character streams (Reader, Writer) for handling different data types.
- **Blocking Nature**: Operations like read() or write() block the thread until data is available or written, which can be inefficient for concurrent applications.
- **Buffering**: Classes like BufferedReader and BufferedWriter improve performance by reducing the number of I/O operations through internal buffering.

### NIO (java.nio Package)

- **Channels**: Abstractions for connections to I/O sources like files or network sockets, supporting both blocking and non-blocking modes.
- **Buffers**: Fixed-size containers for data, allowing efficient data manipulation and transfer between channels.
- **Selectors**: Enable multiplexing of I/O operations, allowing a single thread to manage multiple channels.
- **Non-blocking I/O**: Check for data availability without blocking, enabling better resource utilization in high-throughput scenarios.

Key differences include NIO's ability to handle large files and network connections more efficiently, especially in server environments.

## Real-world Examples & Use Cases

- **File Processing Applications**: Reading and writing large log files or data dumps in batch processing systems.
- **Network Servers**: Building high-performance web servers or chat applications that handle thousands of concurrent connections using NIO selectors.
- **Data Streaming Services**: Real-time data pipelines in big data applications, such as Apache Kafka producers/consumers.
- **Database Backup Tools**: Efficiently copying large database files or streaming data to remote storage.

## Code Examples

### Traditional I/O: Reading a Text File Line by Line

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TraditionalFileReader {
    public static void main(String[] args) {
        try (BufferedReader reader = new BufferedReader(new FileReader("example.txt"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

### NIO: Reading an Entire File into a String

```java
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;

public class NIOFileReader {
    public static void main(String[] args) {
        Path path = Paths.get("example.txt");
        try {
            String content = Files.readString(path);
            System.out.println(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

### NIO Channel and Buffer: Copying File Contents

```java
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.io.IOException;

public class NIOChannelExample {
    public static void main(String[] args) throws IOException {
        Path sourcePath = Paths.get("source.txt");
        Path destPath = Paths.get("destination.txt");

        try (FileChannel sourceChannel = FileChannel.open(sourcePath, StandardOpenOption.READ);
             FileChannel destChannel = FileChannel.open(destPath, StandardOpenOption.WRITE, StandardOpenOption.CREATE)) {

            ByteBuffer buffer = ByteBuffer.allocate(1024);
            while (sourceChannel.read(buffer) > 0) {
                buffer.flip();
                destChannel.write(buffer);
                buffer.clear();
            }
        }
    }
}
```

## References

- [Oracle Java I/O Tutorial](https://docs.oracle.com/javase/tutorial/essential/io/)
- [Java NIO Overview - Baeldung](https://www.baeldung.com/java-nio)
- [Java NIO vs IO - GeeksforGeeks](https://www.geeksforgeeks.org/java-nio-vs-io/)

## Github-README Links & Related Topics

- [Java Fundamentals](java-fundamentals/README.md)
- [Multithreading & Concurrency in Java](multithreading-and-concurrency-in-java/README.md)
- [File I/O NIO](file-io-nio/README.md)