---
title: Database Normalization
aliases: []
tags: [#database]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Database Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves dividing large tables into smaller, related tables and defining relationships between them.

## Detailed Explanation

Normalization follows normal forms:

- **1NF (First Normal Form)**: Eliminates repeating groups, ensures atomic values.
- **2NF (Second Normal Form)**: Removes partial dependencies on the primary key.
- **3NF (Third Normal Form)**: Removes transitive dependencies.
- **BCNF (Boyce-Codd Normal Form)**: Every determinant is a candidate key.

### Example Table Normalization

| StudentID | Name | Courses |
|-----------|------|---------|
| 1 | Alice | Math, Science |
| 2 | Bob | English |

After 1NF: Separate rows for each course.

## Real-world Examples & Use Cases

- **E-commerce**: Normalizing customer and order data to avoid duplication.
- **HR Systems**: Separating employee and department data.

## Code Examples

### Before Normalization

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Course1 VARCHAR(100),
    Course2 VARCHAR(100)
);
```

### After Normalization (1NF)

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Enrollments (
    StudentID INT,
    Course VARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
```

## References

- [Database Normalization Basics](https://www.lucidchart.com/pages/database-normalization)
- [Wikipedia: Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)

## Github-README Links & Related Topics

- [database-design-principles](../database-design-principles/README.md)
- [database-acid-properties](../database-acid-properties/README.md)
