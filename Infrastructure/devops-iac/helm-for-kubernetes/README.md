---
title: Helm for Kubernetes
aliases: [Helm K8s, Kubernetes Helm]
tags: [#kubernetes,#helm,#devops]
created: 2025-09-25
updated: 2025-09-25
---

# Helm for Kubernetes

## Overview

Helm is a package manager for Kubernetes that simplifies deploying and managing applications. It uses charts to define, install, and upgrade Kubernetes applications.

## Detailed Explanation

### Key Concepts

- **Charts**: Packages containing Kubernetes manifests, templates, and metadata.
- **Releases**: Instances of installed charts.
- **Repositories**: Collections of charts (e.g., Helm Hub).

### Components

- **Chart.yaml**: Metadata about the chart.
- **values.yaml**: Default configuration values.
- **templates/**: Kubernetes manifest templates using Go templating.

### Commands

- `helm install`: Install a chart.
- `helm upgrade`: Update a release.
- `helm rollback`: Revert to previous version.

### Best Practices

- Use versioned charts.
- Manage dependencies with requirements.yaml.
- Secure with RBAC.

## Real-world Examples & Use Cases

- **Microservices Deployment**: Installing complex apps like Prometheus with Helm.
- **CI/CD**: Automating releases in pipelines.
- **Multi-environment**: Different values for dev/staging/prod.

## Code Examples

### Chart.yaml

```yaml
apiVersion: v2
name: myapp
description: A Helm chart for myapp
version: 0.1.0
appVersion: "1.0"
```

### values.yaml

```yaml
replicaCount: 3
image:
  repository: myapp
  tag: "latest"
service:
  type: ClusterIP
  port: 80
```

### Template (deployment.yaml)

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Chart.Name }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{ .Chart.Name }}
  template:
    metadata:
      labels:
        app: {{ .Chart.Name }}
    spec:
      containers:
      - name: {{ .Chart.Name }}
        image: {{ .Values.image.repository }}:{{ .Values.image.tag }}
        ports:
        - containerPort: {{ .Values.service.port }}
```

### Install Command

```bash
helm install myrelease ./myapp
```

## Common Pitfalls & Edge Cases

- Template errors.
- Version conflicts.
- Managing secrets securely.
- Upgrading stateful sets.

## References

- [Helm Documentation](https://helm.sh/docs/)
- [Helm Charts Guide](https://helm.sh/docs/topics/charts/)

## Github-README Links & Related Topics

- [Kubernetes Basics](../kubernetes-basics/README.md)
- [Kubernetes Orchestration](../kubernetes-orchestration/README.md)
- [DevOps & Infrastructure as Code](../devops-infrastructure-as-code/README.md)