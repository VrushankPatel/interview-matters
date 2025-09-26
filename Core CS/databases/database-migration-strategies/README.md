---
title: Database Migration Strategies
aliases: [DB Migration, Schema Migration]
tags: [#database,#migration,#devops]
created: 2025-09-25
updated: 2025-09-25
---

# Database Migration Strategies

## Overview

Database migration strategies involve methods to update database schemas, migrate data, and ensure minimal downtime during changes. They are crucial for maintaining data integrity and application availability in evolving systems.

## Detailed Explanation

### Schema Migrations

- **Versioned Scripts**: Use tools like Flyway or Liquibase to apply incremental changes.
- **Up/Down Scripts**: Define forward and rollback migrations.

### Data Migrations

- **Online Migrations**: Migrate data while the system is running, using techniques like dual-writing.
- **Offline Migrations**: Take the system down for migration.

### Deployment Strategies

- **Blue-Green Deployment**: Maintain two environments, switch after migration.
- **Rolling Updates**: Update instances gradually.
- **Canary Releases**: Test migration on a subset of users.

### Tools

- Flyway: Version-based migrations.
- Liquibase: XML/YAML/JSON based changesets.
- Alembic (Python).

## Real-world Examples & Use Cases

- **E-commerce Platform**: Migrating user tables during peak hours using blue-green.
- **Banking System**: Zero-downtime schema changes with Liquibase.
- **Social Media**: Data migration from monolithic to microservices databases.

## Code Examples

### Flyway Migration Script (SQL)

```sql
-- V1__Create_user_table.sql
CREATE TABLE user (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- V2__Add_email_column.sql
ALTER TABLE user ADD COLUMN email VARCHAR(255);
```

### Liquibase Changelog (XML)

```xml
<databaseChangeLog>
    <changeSet id="1" author="dev">
        <createTable tableName="user">
            <column name="id" type="int" autoIncrement="true">
                <constraints primaryKey="true"/>
            </column>
            <column name="name" type="varchar(255)"/>
        </createTable>
    </changeSet>
</databaseChangeLog>
```

### Python Alembic Migration

```python
from alembic import op
import sqlalchemy as sa

def upgrade():
    op.create_table('user',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('name', sa.String(255))
    )

def downgrade():
    op.drop_table('user')
```

## Common Pitfalls & Edge Cases

- Data loss during migration.
- Long-running migrations causing timeouts.
- Inconsistent states in distributed databases.
- Handling foreign key constraints.

## References

- [Flyway Documentation](https://flywaydb.org/documentation/)
- [Liquibase Documentation](https://www.liquibase.org/documentation/)
- [Alembic Documentation](https://alembic.sqlalchemy.org/)

## Github-README Links & Related Topics

- [Database Indexing Strategies](../database-indexing-strategies/README.md)
- [Database Sharding Strategies](../database-sharding-strategies/README.md)
- [DevOps & Infrastructure as Code](../devops-infrastructure-as-code/README.md)