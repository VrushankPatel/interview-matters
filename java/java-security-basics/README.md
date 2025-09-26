---
title: Java Security Basics
aliases: []
tags: ["#java"]
created: 2025-09-26
updated: 2025-09-26
---

# Java Security Basics

## Overview

Java Security Basics cover the fundamental concepts and APIs for securing Java applications, including cryptography, authentication, authorization, and secure coding practices. Java's built-in security framework provides robust tools for protecting sensitive data and preventing common vulnerabilities.

## Detailed Explanation

### Cryptography

- **Symmetric Encryption**: Same key for encryption and decryption (e.g., AES).
- **Asymmetric Encryption**: Public/private key pairs (e.g., RSA).
- **Digital Signatures**: Verify authenticity and integrity of data.
- **Message Digests**: One-way hash functions (e.g., SHA-256).

### Authentication and Authorization

- **JAAS (Java Authentication and Authorization Service)**: Framework for user authentication and access control.
- **Principal and Subject**: Represent authenticated entities and their credentials.
- **Permissions**: Define what actions are allowed for specific code or users.

### Secure Coding Practices

- **Input Validation**: Prevent injection attacks by validating and sanitizing user input.
- **Secure Random**: Use SecureRandom for generating cryptographically strong random numbers.
- **Password Hashing**: Store passwords securely using algorithms like bcrypt or PBKDF2.
- **SSL/TLS**: Secure network communications.

### Key Classes and APIs

- **KeyStore**: Repository for cryptographic keys and certificates.
- **Certificate**: Digital documents verifying identity.
- **SecurityManager**: Enforces security policies at runtime.

## Real-world Examples & Use Cases

- **Web Applications**: Implementing secure login systems with encrypted passwords.
- **E-commerce Platforms**: Protecting payment information during transactions.
- **Enterprise Software**: Role-based access control in corporate applications.
- **Mobile Apps**: Secure data storage and transmission in Android applications.
- **API Security**: Token-based authentication for RESTful services.

## Code Examples

### Password Hashing with PBKDF2

```java
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;

public class PasswordHasher {
    public static String hashPassword(String password, String salt) throws NoSuchAlgorithmException, InvalidKeySpecException {
        int iterations = 10000;
        int keyLength = 256;
        PBEKeySpec spec = new PBEKeySpec(password.toCharArray(), salt.getBytes(), iterations, keyLength);
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        byte[] hash = factory.generateSecret(spec).getEncoded();
        return Base64.getEncoder().encodeToString(hash);
    }

    public static void main(String[] args) {
        try {
            String password = "mySecurePassword";
            String salt = "randomSalt";
            String hashedPassword = hashPassword(password, salt);
            System.out.println("Hashed Password: " + hashedPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

### AES Encryption/Decryption

```java
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class AESEncryption {
    public static String encrypt(String data, String key) throws Exception {
        SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedBytes = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    public static String decrypt(String encryptedData, String key) throws Exception {
        SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedData));
        return new String(decryptedBytes);
    }

    public static void main(String[] args) {
        try {
            String key = "1234567890123456"; // 16 bytes for AES-128
            String original = "Hello, World!";
            String encrypted = encrypt(original, key);
            String decrypted = decrypt(encrypted, key);
            System.out.println("Original: " + original);
            System.out.println("Encrypted: " + encrypted);
            System.out.println("Decrypted: " + decrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

### Secure Random Number Generation

```java
import java.security.SecureRandom;

public class SecureRandomExample {
    public static void main(String[] args) {
        SecureRandom secureRandom = new SecureRandom();
        
        // Generate a random integer
        int randomInt = secureRandom.nextInt();
        System.out.println("Random Integer: " + randomInt);
        
        // Generate a random byte array
        byte[] randomBytes = new byte[16];
        secureRandom.nextBytes(randomBytes);
        System.out.println("Random Bytes: " + java.util.Arrays.toString(randomBytes));
        
        // Generate a secure token
        String token = generateSecureToken(32);
        System.out.println("Secure Token: " + token);
    }

    public static String generateSecureToken(int length) {
        SecureRandom secureRandom = new SecureRandom();
        byte[] tokenBytes = new byte[length];
        secureRandom.nextBytes(tokenBytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes);
    }
}
```

## References

- [Oracle Java Security Overview](https://docs.oracle.com/javase/8/docs/technotes/guides/security/)
- [Java Cryptography Architecture (JCA)](https://docs.oracle.com/javase/8/docs/technotes/guides/security/crypto/CryptoSpec.html)
- [OWASP Java Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Java_Security_Cheat_Sheet.html)

## Github-README Links & Related Topics

- [Java Networking](java-networking/README.md)
- [API Security Best Practices](api-security-best-practices/README.md)
- [Security Best Practices in Java](security-best-practices-in-java/README.md)