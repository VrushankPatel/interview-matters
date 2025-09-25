---
title: Hibernate ORM
aliases: []
tags: [#java,#orm,#database]
created: 2025-09-25
updated: 2025-09-25
---

# Overview

Hibernate makes relational data visible to a program written in Java, in a natural and type-safe form, making it easy to write complex queries and work with their results, letting the program easily synchronize changes made in memory with the database, respecting the ACID properties of transactions, and allowing performance optimizations to be made after the basic persistence logic has already been written.

# Detailed Explanation

- **Object/Relational Mapping**: Maps Java objects to database tables.
- **JPA Compatibility**: Implements Jakarta Persistence specification.
- **Idiomatic Persistence**: Follows natural OO idioms including inheritance and polymorphism.
- **Tunable Performance**: Flexible data fetching strategies, two-level caching, optimistic locking.
- **Powerful Query Language**: Hibernate Query Language (HQL), object-oriented dialect of SQL.
- **Wide Database Support**: PostgreSQL, MySQL, Oracle, SQL Server, and more.
- **Developer Joy**: Reduces boilerplate code, compile-time validation.

# Real-world Examples & Use Cases

- Enterprise applications needing ORM for database interactions.
- JPA-based persistence in Java EE applications.
- Complex data models with relationships, inheritance, and polymorphism.
- Applications requiring high performance and scalability in data access.

# Code Examples

## Entity Mapping

```java
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username")
    private String username;

    @Column(name = "email")
    private String email;

    // getters and setters
}
```

## Repository with HQL

```java
@Repository
public class UserRepository {

    @Autowired
    private EntityManager entityManager;

    public List<User> findUsersByEmailDomain(String domain) {
        String hql = "FROM User u WHERE u.email LIKE :domain";
        TypedQuery<User> query = entityManager.createQuery(hql, User.class);
        query.setParameter("domain", "%" + domain);
        return query.getResultList();
    }
}
```

# References

- [Hibernate ORM](https://hibernate.org/orm/)
- [Hibernate Documentation](https://docs.jboss.org/hibernate/orm/7.1/)

# Github-README Links & Related Topics

- [Java Fundamentals](java-fundamentals/README.md)
- [OOP Principles in Java](oop-principles-in-java/README.md)
- [Collections & Data Structures](collections-and-data-structures/README.md)
- [Database Indexing Strategies](database-indexing-strategies/README.md)
- [Database Normalization](database-normalization/README.md)
- [ACID vs BASE Tradeoffs](acid-vs-base-tradeoffs/README.md)
- [System Design Basics](system-design-basics/README.md)