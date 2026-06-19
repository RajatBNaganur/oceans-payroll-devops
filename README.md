# Oceans Payroll Platform - DevOps Technical Assignment

## Overview

This repository contains my solution for the DevOps Engineer Technical Assignment for Oceans Across Pvt. Ltd.

The solution demonstrates a secure, multi-tenant AWS infrastructure using Terraform, Docker, GitHub Actions, CloudWatch monitoring, and security best practices suitable for a payroll platform handling sensitive employee data.

---

# Architecture

The infrastructure includes:

- AWS VPC
- Public and Private Subnets across two Availability Zones
- Three EC2 instances
  - Company Portal
  - Bureau Portal
  - Employee Portal
- PostgreSQL RDS (Private Subnet)
- Amazon S3 (Versioning + Encryption)
- IAM Roles
- CloudWatch Monitoring
- SNS Alerts
- AWS Secrets Manager

Architecture Diagram:

```
diagrams/architecture.png
```

---

# Technology Stack

- Terraform
- AWS
- Docker
- GitHub Actions
- PostgreSQL
- CloudWatch
- SNS
- Secrets Manager
- IAM

---

# Project Structure

```
terraform/
app/
.github/workflows/
docs/
diagrams/
```

---

# Terraform Components

- provider.tf
- networking.tf
- security.tf
- iam.tf
- ec2.tf
- rds.tf
- s3.tf
- monitoring.tf
- secrets.tf

---

# CI/CD

GitHub Actions performs:

- Build Docker image
- Run automated tests
- Deploy via SSH/SSM
- Environment specific configuration

---

# Security

Implemented:

- Least Privilege IAM
- Security Groups
- Network ACLs
- Encrypted RDS
- Encrypted S3
- Secrets Manager
- Private Database
- Tenant Isolation

---

# Monitoring

CloudWatch

- EC2 CPU Alarm
- RDS Connection Alarm
- Application Log Group

SNS

- Critical Alert Notifications

---

# UK GDPR Considerations

## AWS Native Controls

- IAM Least Privilege
- Secrets Manager
- KMS Encryption
- CloudTrail
- AWS Config
- GuardDuty
- Security Hub

## Data Residency

Resources should be deployed in:

- eu-west-2 (London)

or another approved UK/EU region.

## Right to Erasure

Deletion process:

- Delete database records
- Delete S3 objects
- Remove Secrets
- Revoke IAM permissions
- Preserve audit logs where legally required

---

# Trade-offs

Because my AWS account was unavailable during development, this project was validated using Terraform validation, Docker testing, and GitHub Actions rather than deploying live AWS resources.

The infrastructure remains fully deployable with a valid AWS account.

---

# Author

Rajat Naganur
