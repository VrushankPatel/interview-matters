---
title: Logging with ELK Stack
aliases: [ELK Stack, Elasticsearch Logstash Kibana]
tags: [#system-design,#devops,#logging]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

The ELK Stack (Elasticsearch, Logstash, Kibana) is a comprehensive logging and analytics platform. Elasticsearch provides distributed search and analytics, Logstash processes and ingests data, and Kibana offers visualization and dashboard capabilities for log data.

## Detailed Explanation

### Components

- **Elasticsearch**: Distributed search engine for storing and searching log data
- **Logstash**: Data processing pipeline for ingesting, transforming, and shipping logs
- **Kibana**: Web interface for visualizing Elasticsearch data
- **Beats**: Lightweight shippers for collecting and shipping data

### Data Flow

```
Application Logs → Logstash/Beats → Elasticsearch → Kibana
```

### Logstash Pipeline

Logstash uses a pipeline with three stages:
1. **Input**: Collect data from various sources
2. **Filter**: Parse, transform, and enrich data
3. **Output**: Send processed data to destinations

## Real-world Examples & Use Cases

### Application Error Tracking

Monitor application errors across microservices:

```json
{
  "timestamp": "2023-09-25T10:30:00Z",
  "level": "ERROR",
  "service": "user-service",
  "message": "Database connection failed",
  "user_id": 12345,
  "request_id": "abc-123"
}
```

### Security Monitoring

Track security events and anomalies:

- Failed login attempts
- Unusual access patterns
- Firewall rule violations

### Performance Analysis

Analyze application performance metrics from logs:
- Response times
- Database query performance
- Resource utilization trends

## Code Examples

### Logstash Configuration

```ruby
# logstash.conf
input {
  file {
    path => "/var/log/application.log"
    start_position => "beginning"
  }
}

filter {
  grok {
    match => { "message" => "%{TIMESTAMP_ISO8601:timestamp} %{LOGLEVEL:level} %{DATA:service} %{GREEDYDATA:message}" }
  }
  date {
    match => ["timestamp", "ISO8601"]
  }
}

output {
  elasticsearch {
    hosts => ["localhost:9200"]
    index => "application-logs-%{+YYYY.MM.dd}"
  }
}
```

### Elasticsearch Index Template

```json
{
  "index_patterns": ["application-logs-*"],
  "settings": {
    "number_of_shards": 3,
    "number_of_replicas": 1
  },
  "mappings": {
    "properties": {
      "timestamp": { "type": "date" },
      "level": { "type": "keyword" },
      "service": { "type": "keyword" },
      "message": { "type": "text" },
      "user_id": { "type": "long" }
    }
  }
}
```

### Kibana Dashboard Query

```json
{
  "query": {
    "bool": {
      "must": [
        { "term": { "level": "ERROR" } },
        { "range": { "timestamp": { "gte": "now-1h" } } }
      ]
    }
  }
}
```

## References

- [Elasticsearch Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
- [Logstash Documentation](https://www.elastic.co/guide/en/logstash/current/index.html)
- [Kibana Documentation](https://www.elastic.co/guide/en/kibana/current/index.html)
- [ELK Stack Best Practices](https://www.elastic.co/guide/en/elastic-stack/current/elastic-stack.html)

## Github-README Links & Related Topics

- [Monitoring and Logging](./monitoring-and-logging/README.md)
- [Async Logging](./async-logging/README.md)
- [Logging Frameworks](./logging-frameworks/README.md)
- [Distributed Tracing](./distributed-tracing/README.md)