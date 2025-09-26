---
title: Java Networking
aliases: []
tags: ["#java"]
created: 2025-09-26
updated: 2025-09-26
---

# Java Networking

## Overview

Java Networking encompasses APIs and libraries for building network-enabled applications, including socket programming, URL handling, and HTTP communication. It provides both low-level socket APIs and high-level abstractions for client-server communication and web interactions.

## Detailed Explanation

### Socket Programming

- **Sockets**: Endpoints for communication between two machines over a network.
- **ServerSocket and Socket**: Classes for creating server and client sockets.
- **TCP/IP**: Reliable, connection-oriented communication.
- **UDP**: Connectionless datagram communication using DatagramSocket.

### URL and HTTP Handling

- **URL Class**: Represents Uniform Resource Locators for accessing resources.
- **URLConnection**: Abstract class for accessing resources via URLs.
- **HttpURLConnection**: Subclass for HTTP-specific operations.
- **HttpClient (Java 11+)**: Modern, asynchronous HTTP client with better performance and features.

### Key Concepts

- **Ports**: Logical endpoints for network services (0-65535).
- **IP Addresses**: Numerical labels assigned to devices in a network.
- **Protocols**: Rules for data exchange (TCP, UDP, HTTP, etc.).
- **Asynchronous Operations**: Non-blocking I/O for scalable applications.

## Real-world Examples & Use Cases

- **Web Crawlers**: Building applications that scrape websites and gather data.
- **Chat Applications**: Real-time messaging systems using socket connections.
- **REST API Clients**: Consuming web services and APIs in enterprise applications.
- **File Transfer Protocols**: Implementing custom FTP-like services.
- **IoT Devices**: Communication between sensors and central servers.

## Code Examples

### Simple TCP Client-Server Communication

**Server:**

```java
import java.io.*;
import java.net.*;

public class SimpleServer {
    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(8080)) {
            System.out.println("Server listening on port 8080");
            Socket clientSocket = serverSocket.accept();
            System.out.println("Client connected");

            BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);

            String message = in.readLine();
            System.out.println("Received: " + message);
            out.println("Echo: " + message);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

**Client:**

```java
import java.io.*;
import java.net.*;

public class SimpleClient {
    public static void main(String[] args) {
        try (Socket socket = new Socket("localhost", 8080);
             PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()))) {

            out.println("Hello, Server!");
            String response = in.readLine();
            System.out.println("Server response: " + response);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

### HTTP Request using HttpClient (Java 11+)

```java
import java.net.http.*;
import java.net.URI;
import java.io.IOException;

public class HttpClientExample {
    public static void main(String[] args) {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.github.com/users/octocat"))
                .build();

        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            System.out.println("Status Code: " + response.statusCode());
            System.out.println("Response Body: " + response.body());
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```

### URL Connection Example

```java
import java.io.*;
import java.net.*;

public class URLConnectionExample {
    public static void main(String[] args) {
        try {
            URL url = new URL("https://www.example.com");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            System.out.println("Response: " + response.toString());
            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

## References

- [Oracle Java Networking Tutorial](https://docs.oracle.com/javase/tutorial/networking/)
- [Java HttpClient API](https://openjdk.java.net/groups/net/httpclient/)
- [Socket Programming in Java - Baeldung](https://www.baeldung.com/java-socket-programming)

## Github-README Links & Related Topics

- [Java I/O and NIO](java-io-and-nio/README.md)
- [Java Security Basics](java-security-basics/README.md)
- [Microservices Communication Patterns](microservices-communication-patterns/README.md)