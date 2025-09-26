---
title: Cloud Computing Basics
aliases: []
tags: [#cloud,#devops]
created: 2025-09-25
updated: 2025-09-25
---

# Cloud Computing Basics

## Overview

Cloud computing delivers computing services over the internet, providing scalable, on-demand resources without direct management of physical hardware.

## Detailed Explanation

Cloud computing models:

- **IaaS (Infrastructure as a Service)**: Virtual machines, storage, networking (e.g., AWS EC2, Azure VMs)
- **PaaS (Platform as a Service)**: Development platforms, databases (e.g., Heroku, Google App Engine)
- **SaaS (Software as a Service)**: Ready-to-use applications (e.g., Gmail, Salesforce)

Deployment models:

- Public cloud
- Private cloud
- Hybrid cloud
- Multi-cloud

Benefits: Cost savings, scalability, flexibility, disaster recovery.

Challenges: Security, compliance, vendor lock-in.

## Real-world Examples & Use Cases

1. **Startups**: Using AWS for scalable web apps without upfront hardware costs.
2. **Enterprises**: Hybrid cloud for sensitive data on-premises and scalable compute in public cloud.
3. **Data Analytics**: GCP BigQuery for processing large datasets.

## Code Examples

### Terraform for AWS EC2 Instance

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1d0"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
}
```

### Azure CLI for Resource Group

```bash
az group create --name MyResourceGroup --location eastus
az vm create --resource-group MyResourceGroup --name MyVM --image Ubuntu2204 --generate-ssh-keys
```

## References

- [AWS Cloud Computing Concepts](https://aws.amazon.com/what-is-cloud-computing/)
- [Azure Cloud Basics](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/considerations/fundamental-concepts)
- [Google Cloud Fundamentals](https://cloud.google.com/docs/overview/what-is-google-cloud)

## Github-README Links & Related Topics

- [Infrastructure as Code with Terraform](../infrastructure-as-code-with-terraform/README.md)
- [Cloud Deployment Strategies](../cloud-deployment-strategies/README.md)
- [Serverless Architecture](../serverless-architecture/README.md)
