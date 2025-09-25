---
title: GraphQL vs REST
aliases: [GraphQL REST Comparison]
tags: [#graphql,#rest,#api-design]
created: 2025-09-25
updated: 2025-09-25
---

# GraphQL vs REST

## Overview

GraphQL and REST are both API paradigms for building web services, but they differ significantly in how they handle data fetching, schema definition, and client-server interactions. REST relies on multiple endpoints with fixed resource shapes, while GraphQL uses a single endpoint with flexible queries that allow clients to specify exactly what data they need. This comparison explores their similarities and differences, helping developers choose the right approach for their use cases.

## Detailed Explanation

### Resources and Data Fetching
REST treats resources as URLs, where each endpoint returns a fixed structure defined by the server. For example, `GET /books/1` returns a book with all its fields, including potentially nested author data.

GraphQL separates resource identity from fetching mechanism. Resources are defined in a schema with types like `Book` and `Author`, and clients query exactly what they need using flexible queries.

**Key Differences:**
- REST: Endpoint defines both resource identity and response shape
- GraphQL: Schema defines data types; queries specify what to fetch
- GraphQL allows fetching related data in one request, avoiding over/under-fetching

### Schema and API Structure
REST APIs are described as lists of endpoints with HTTP verbs:
```
GET /books/:id
POST /books/:id/comments
GET /authors/:id
```

GraphQL uses a type system with Query and Mutation types:
```graphql
type Query {
  book(id: ID!): Book
  author(id: ID!): Author
}

type Mutation {
  addComment(input: AddCommentInput): Comment
}
```

**Key Differences:**
- REST: Linear list of endpoints
- GraphQL: Graph-based schema with relationships
- GraphQL supports nested queries in one request

### Execution Model
REST route handlers execute once per request, returning a complete response.

GraphQL resolvers execute for each field in the query, allowing multiple related operations in one request. The execution engine builds the response to match the query structure.

**Key Differences:**
- REST: One handler per endpoint
- GraphQL: Multiple resolvers per query
- GraphQL enables efficient data fetching with fewer round trips

## Real-world Examples & Use Cases

### When to Use REST
- Simple CRUD operations with predictable data needs
- Public APIs with stable contracts
- Systems requiring HTTP caching and CDN optimization
- Mobile apps with limited bandwidth and simple data requirements

### When to Use GraphQL
- Complex frontend applications needing flexible data fetching
- Mobile apps requiring efficient data loading
- APIs serving multiple clients with different data needs
- Systems with rapidly evolving data requirements
- Microservices architectures needing unified API layer

### Migration Scenarios
- Legacy REST APIs can be wrapped with GraphQL using schema stitching
- Hybrid approaches using GraphQL as a facade over REST services
- Gradual adoption by adding GraphQL alongside existing REST endpoints

## Code Examples

### REST API Example
```javascript
// Express.js REST endpoints
app.get('/books/:id', (req, res) => {
  const book = findBook(req.params.id);
  res.json(book); // Returns fixed structure
});

app.get('/books/:id/author', (req, res) => {
  const book = findBook(req.params.id);
  const author = findAuthor(book.authorId);
  res.json(author); // Separate endpoint for related data
});
```

### GraphQL Schema and Resolvers
```javascript
// GraphQL Schema
const typeDefs = `
  type Query {
    book(id: ID!): Book
    author(id: ID!): Author
  }

  type Book {
    id: ID!
    title: String
    author: Author
  }

  type Author {
    id: ID!
    name: String
    books: [Book]
  }
`;

// Resolvers
const resolvers = {
  Query: {
    book: (parent, args) => findBook(args.id),
    author: (parent, args) => findAuthor(args.id),
  },
  Book: {
    author: (book) => findAuthor(book.authorId),
  },
  Author: {
    books: (author) => findBooksByAuthor(author.id),
  },
};
```

### GraphQL Query Examples
```graphql
# Fetch book with author
query GetBook($id: ID!) {
  book(id: $id) {
    title
    author {
      name
    }
  }
}

# Fetch author with books
query GetAuthor($id: ID!) {
  author(id: $id) {
    name
    books {
      title
    }
  }
}

# Mutation example
mutation AddComment($input: AddCommentInput!) {
  addComment(input: $input) {
    id
    text
  }
}
```

### Client-side Comparison
```javascript
// REST: Multiple requests
const fetchBookWithAuthor = async (bookId) => {
  const bookResponse = await fetch(`/books/${bookId}`);
  const book = await bookResponse.json();
  
  const authorResponse = await fetch(`/authors/${book.authorId}`);
  const author = await authorResponse.json();
  
  return { ...book, author };
};

// GraphQL: Single request
const fetchBookWithAuthor = async (bookId) => {
  const query = `
    query GetBook($id: ID!) {
      book(id: $id) {
        title
        author {
          name
        }
      }
    }
  `;
  
  const response = await fetch('/graphql', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ query, variables: { id: bookId } }),
  });
  
  return response.json();
};
```

## References

- [GraphQL vs. REST - Apollo GraphQL Blog](https://www.apollographql.com/blog/graphql-vs-rest/)
- [GraphQL Official Documentation](https://graphql.org/learn/)
- [REST API Design Best Practices](https://restfulapi.net/)

## Github-README Links & Related Topics

- [API Design Principles](api-design-principles/)
- [GraphQL API Design](graphql-api-design/)
- [RESTful APIs](restful-apis/)
- [API Authentication Methods](api-authentication-methods/)
- [Microservices Communication Patterns](microservices-communication-patterns/)