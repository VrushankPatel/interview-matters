---
title: DevOps & Infrastructure as Code
aliases: [devops, iac, infrastructure automation]
tags: [#devops, #automation, #cloud]
created: 2025-09-26
updated: 2025-09-26
---

# DevOps & Infrastructure as Code

## Overview

DevOps combines development and operations practices to improve software delivery speed and quality. Infrastructure as Code (IaC) treats infrastructure provisioning and management as software development, enabling version control, testing, and automation.

## Detailed Explanation

### DevOps Principles
- **Culture**: Collaboration between development and operations teams
- **Automation**: Automating manual processes and workflows
- **Measurement**: Monitoring and measuring system performance
- **Sharing**: Sharing tools, processes, and knowledge

### Infrastructure as Code
IaC allows infrastructure to be defined, versioned, and managed as code.

#### Benefits
- **Consistency**: Ensure environments are identical across development, staging, and production
- **Scalability**: Easily scale infrastructure up or down
- **Version Control**: Track changes and roll back if needed
- **Testing**: Test infrastructure changes before deployment

#### IaC Tools
- **Declarative**: Specify desired state (Terraform, CloudFormation)
- **Imperative**: Specify exact steps to achieve state (Ansible, Puppet)

### CI/CD Pipelines
Continuous Integration and Continuous Deployment automate the software delivery process.

## Real-world Examples & Use Cases

### Cloud Migration
- Migrating legacy applications to cloud infrastructure using IaC
- Automating multi-environment deployments

### Microservices Deployment
- Container orchestration with Kubernetes and IaC
- Blue-green deployments for zero-downtime releases

### Compliance and Security
- Automated security scanning in CI/CD pipelines
- Infrastructure compliance checks using IaC

### Scalable Web Applications
- Auto-scaling infrastructure based on traffic patterns
- Multi-region deployments for global applications

## Code Examples

### Terraform Infrastructure Definition

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1d0"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
}

resource "aws_s3_bucket" "static_assets" {
  bucket = "my-static-assets-bucket"

  tags = {
    Environment = "Production"
  }
}
```

### Ansible Playbook for Server Configuration

```yaml
---
- name: Configure web server
  hosts: webservers
  become: yes
  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present
      when: ansible_os_family == "Debian"

    - name: Start Apache service
      service:
        name: apache2
        state: started
        enabled: yes

    - name: Deploy application
      copy:
        src: /local/path/to/app
        dest: /var/www/html/
```

### Jenkins Pipeline for CI/CD

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }

    post {
        always {
            junit 'target/surefire-reports/*.xml'
        }
    }
}
```

### Docker Compose for Local Development

```yaml
version: '3.8'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    environment:
      - FLASK_ENV=development
    depends_on:
      - db

  db:
    image: postgres:13
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

## Common Pitfalls & Edge Cases

- **State Drift**: Infrastructure state diverging from IaC definitions
- **Security in IaC**: Avoiding hardcoded secrets in configuration files
- **Testing IaC**: Ensuring infrastructure changes don't break applications
- **Version Compatibility**: Managing tool and provider version conflicts
- **Cost Management**: Monitoring cloud resource costs in automated deployments

## Tools & Libraries

- **Terraform**: Infrastructure provisioning and management
- **Ansible**: Configuration management and application deployment
- **Docker**: Containerization platform
- **Kubernetes**: Container orchestration
- **Jenkins**: Automation server for CI/CD
- **GitLab CI**: Integrated CI/CD in GitLab

## References

- [DevOps Handbook](https://itrevolution.com/book/devops-handbook/)
- [Infrastructure as Code](https://martinfowler.com/bliki/InfrastructureAsCode.html)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Ansible Documentation](https://docs.ansible.com/)

## Github-README Links & Related Topics

- [CI-CD Pipelines](../ci-cd-pipelines/README.md)
- [Container Orchestration](../container-orchestration/README.md)
- [Infrastructure as Code with Terraform](../infrastructure-as-code-with-terraform/README.md)
- [Docker Containerization](../docker-containerization/README.md)