---
title: DevOps & Infrastructure as Code
aliases: [DevOps IaC, Infrastructure Automation]
tags: [#devops, #infrastructure-as-code, #automation]
created: 2025-09-26
updated: 2025-09-26
---

# DevOps & Infrastructure as Code

## Overview

DevOps combines development and operations for faster, reliable software delivery. Infrastructure as Code (IaC) treats infrastructure provisioning as code, enabling version control, automation, and repeatability.

## Detailed Explanation

### DevOps Principles
- Collaboration between dev and ops.
- Automation of CI/CD pipelines.
- Monitoring and feedback loops.
- Culture of continuous improvement.

### Infrastructure as Code
- Define infrastructure in code (e.g., servers, networks).
- Tools: Terraform, CloudFormation, Ansible.
- Benefits: Consistency, scalability, disaster recovery.

### Journey / Sequence
1. Plan: Define requirements.
2. Code: Write IaC scripts.
3. Build: CI/CD pipeline.
4. Test: Validate infrastructure.
5. Deploy: Provision resources.
6. Monitor: Observe and iterate.

### Tools & Libraries
- Terraform: Declarative IaC.
- Ansible: Configuration management.
- Docker: Containerization.
- Kubernetes: Orchestration.

### Common Pitfalls & Edge Cases
- State management in Terraform.
- Secrets handling.
- Immutable vs mutable infrastructure.
- Cost optimization in cloud.

## Real-world Examples & Use Cases

- Netflix: Uses Spinnaker for CD, Terraform for IaC.
- Amazon: IaC for scaling services.

Use cases: Cloud migrations, multi-environment setups, compliance.

## Code Examples

### Terraform for AWS EC2

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
}
```

### Ansible Playbook for Nginx

```yaml
---
- name: Install Nginx
  hosts: webservers
  become: yes

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Start Nginx
      service:
        name: nginx
        state: started
```

### Docker Compose for App

```yaml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "80:80"
  app:
    build: .
    ports:
      - "3000:3000"
```

## References

- [What is DevOps?](https://aws.amazon.com/devops/what-is-devops/)
- [Infrastructure as Code](https://www.terraform.io/intro)
- [DevOps Handbook](https://itrevolution.com/book/the-devops-handbook/)

## Github-README Links & Related Topics

- [CI CD Pipelines](ci-cd-pipelines/)
- [Container Orchestration with Kubernetes](container-orchestration-with-kubernetes/)
- [Infrastructure as Code with Terraform](infrastructure-as-code-with-terraform/)
- [Docker Containerization](docker-containerization/)
