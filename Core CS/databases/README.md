# databases
- [database-acid-properties](database-acid-properties/README.md)
- [database-connection-pooling](database-connection-pooling/README.md)
- [database-design-patterns](database-design-patterns/README.md)
- [database-design-principles](database-design-principles/README.md)
- [database-indexing-best-practices](database-indexing-best-practices/README.md)
- [database-indexing-strategies](database-indexing-strategies/README.md)
- [database-indexing-techniques](database-indexing-techniques/README.md)
- [database-migration-strategies](database-migration-strategies/README.md)
- [database-migration-tools](database-migration-tools/README.md)
- [database-normalization](database-normalization/README.md)
- [database-normalization-techniques](database-normalization-techniques/README.md)
- [database-performance-tuning](database-performance-tuning/README.md)
- [database-replication-strategies](database-replication-strategies/README.md)
- [database-sharding-strategies](database-sharding-strategies/README.md)
- [elasticsearch-for-search](elasticsearch-for-search/README.md)
- [geospatial-databases](geospatial-databases/README.md)
- [graph-databases](graph-databases/README.md)
- [hibernate-orm](hibernate-orm/README.md)
- [README.md](README.md/README.md)
- [vector-databases](vector-databases/README.md)

## SQL Interview Concepts

### Joins
- Joins

### Aggregations
- Aggregations like sum, count

### Queries
- Employee table find how many employees are there in each dept
- Find the total salary distributed in each department

Employee
ID| Name | Address | Dept Id | Salary

Department
ID | Dept name

### Additional SQL Concepts
- Difference between Having and Where: WHERE filters records before GROUP BY, HAVING after.
- Difference between EXISTS and IN: EXISTS checks for existence, faster for large subqueries; IN compares values.
- How to find the third largest salary: Use subqueries with MAX and WHERE salary < MAX.
- Difference between inner and outer join: Inner join returns intersection, outer join returns union.
