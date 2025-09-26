---
title: Networking Sockets
aliases: [Socket Programming, Low-level Network Programming]
tags: [#networking,#java]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Networking Sockets covers low-level network programming using sockets in Java. This includes creating TCP and UDP sockets for client-server communication, handling connections, and managing data transmission.

# Detailed Explanation

## Socket Types

- **TCP Sockets**: Reliable, connection-oriented communication. Suitable for applications requiring guaranteed delivery.
- **UDP Sockets**: Unreliable, connectionless communication. Faster but no delivery guarantees.

## Client-Server Model

- **Server Socket**: Listens for incoming connections.
- **Client Socket**: Initiates connections to servers.

Key classes: `ServerSocket`, `Socket`, `DatagramSocket`.

# Real-world Examples & Use Cases

- **Chat Applications**: Real-time messaging using TCP sockets.
- **File Transfer**: Reliable data transfer with TCP.
- **Streaming**: UDP for video/audio streaming where some packet loss is acceptable.
- **DNS Queries**: UDP for lightweight queries.

# Code Examples

## Simple TCP Echo Server

```java
import java.io.*;
import java.net.*;

public class EchoServer {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(8080);
        System.out.println("Server listening on port 8080");

        while (true) {
            Socket clientSocket = serverSocket.accept();
            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);

            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                out.println(inputLine);
                if (inputLine.equals("bye")) break;
            }
            clientSocket.close();
        }
    }
}
```

## Simple TCP Echo Client

```java
import java.io.*;
import java.net.*;

public class EchoClient {
    public static void main(String[] args) throws IOException {
        Socket socket = new Socket("localhost", 8080);
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));

        String userInput;
        while ((userInput = stdIn.readLine()) != null) {
            out.println(userInput);
            System.out.println("Echo: " + in.readLine());
            if (userInput.equals("bye")) break;
        }
        socket.close();
    }
}
```

## UDP Echo Server

```java
import java.net.*;

public class UDPEchoServer {
    public static void main(String[] args) throws Exception {
        DatagramSocket socket = new DatagramSocket(8080);
        byte[] buffer = new byte[1024];

        while (true) {
            DatagramPacket packet = new DatagramPacket(buffer, buffer.length);
            socket.receive(packet);
            socket.send(packet);
        }
    }
}
```

# Common Pitfalls & Edge Cases

- Blocking operations causing deadlocks.
- Not handling socket timeouts.
- Resource leaks from unclosed sockets.
- Firewall and port blocking issues.

# Tools & Libraries

- **Java.net Package**: Built-in for socket programming.
- **Netty**: High-performance networking library.
- **Apache MINA**: Alternative for network applications.

# References

- [Oracle Java Networking Tutorial](https://docs.oracle.com/javase/tutorial/networking/sockets/)
- [RFC 793 - TCP Specification](https://tools.ietf.org/html/rfc793)
- [RFC 768 - UDP Specification](https://tools.ietf.org/html/rfc768)

# Github-README Links & Related Topics

- [Java Fundamentals](../java-fundamentals/README.md)
- [Multithreading & Concurrency in Java](../multithreading-and-concurrency-in-java/README.md)
- [Networking TCP/IP HTTP2 TLS](../networking-tcp-ip-http2-tls/README.md)