---
title: Configuration Management
aliases: ["Config Management", "Application Configuration"]
tags: ["#devops","#distributed-systems","#system-design"]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

Configuration management involves the processes and tools for handling application and infrastructure configurations across environments. It ensures configurations are versioned, centralized, and dynamically updatable without code changes.

## Detailed Explanation

In distributed systems, hard-coded configurations lead to inflexibility. Configuration management centralizes settings, allowing runtime updates and environment-specific overrides.

### Key Concepts

- **Centralized Store**: Repository for all configurations.
- **Versioning**: Track changes with Git-like versioning.
- **Environment Separation**: Dev, staging, prod configs.
- **Dynamic Updates**: Push or pull configurations at runtime.
- **Security**: Encrypt sensitive configs.

### Patterns

- **Pull Model**: Services fetch configs from server.
- **Push Model**: Server pushes updates to services.
- **GitOps**: Use Git as source of truth.

## Real-world Examples & Use Cases

- **Spring Cloud Config**: Centralized config for microservices.
- **HashiCorp Consul**: KV store for dynamic configs.
- **Ansible**: Infrastructure configuration automation.
- **Kubernetes ConfigMaps/Secrets**: For containerized apps.
- **AWS Systems Manager Parameter Store**: Cloud-based config store.

## Code Examples

### Spring Cloud Config Server

```java
@SpringBootApplication
@EnableConfigServer
public class ConfigServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConfigServerApplication.class, args);
    }
}
```

### Config Client Usage

```java
@Configuration
public class AppConfig {
    @Value("${app.database.url}")
    private String dbUrl;

    @Value("${app.feature.enabled}")
    private boolean featureEnabled;
}
```

### Consul KV Operations

```bash
# Set a key
curl -X PUT -d 'value' http://localhost:8500/v1/kv/myapp/config/db/url

# Get a key
curl http://localhost:8500/v1/kv/myapp/config/db/url
```

### Ansible Playbook for Config

```yaml
---
- hosts: webservers
  tasks:
  - name: Update nginx config
    template:
      src: nginx.conf.j2
      dest: /etc/nginx/nginx.conf
    notify: restart nginx
```

## Journey / Sequence

1. **Configuration Creation**: Define configs in central store.
2. **Versioning**: Commit changes with descriptions.
3. **Deployment**: Push to environments via CI/CD.
4. **Service Integration**: Services load configs on startup or refresh.
5. **Monitoring**: Track config usage and changes.
6. **Rollback**: Revert to previous versions if issues arise.

## Common Pitfalls & Edge Cases

- **Config Drift**: Differences between environments.
- **Sensitive Data**: Accidental exposure of secrets.
- **Update Failures**: Services failing to reload configs.
- **Dependency on Central Store**: Single point of failure.
- **Complex Hierarchies**: Overriding configs across levels.

## Tools & Libraries

- **Spring Cloud Config**: For Spring-based apps.
- **Consul**: Distributed KV store.
- **Vault**: Secure secret management.
- **Ansible**: Automation for config deployment.
- **Chef/Puppet**: Infrastructure config management.

## References

- [Configuration Management - Wikipedia](https://en.wikipedia.org/wiki/Configuration_management)
- [Spring Cloud Config](https://spring.io/projects/spring-cloud-config)
- [Consul Documentation](https://www.consul.io/docs)
- [Ansible Configuration Management](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html)

## Github-README Links & Related Topics

- [DevOps & Infrastructure as Code](../devops-infrastructure-as-code/)
- [Microservices Architecture](../microservices-architecture/)
- [CI/CD Pipelines](../ci-cd-pipelines/)
- [Infrastructure as Code with Terraform](../infrastructure-as-code-with-terraform/)
- [Kubernetes Basics](../kubernetes-basics/)