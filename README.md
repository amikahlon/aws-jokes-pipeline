# aws-jokes-pipeline

A full DevOps pipeline for a simple jokes app built on AWS.

## What's inside
- React frontend + Node.js backend
- Dockerized and pushed to ECR
- Infrastructure provisioned with Terraform
- CI/CD via GitHub Actions — push to main = auto deploy

## Infrastructure
- VPC with public/private subnets across 2 AZs
- ALB in public subnet, EC2 instances in private subnets
- Auto Scaling Group, Security Groups, NACLs
- IAM roles with least privilege
- Secrets Manager for sensitive values
- CloudTrail for audit logging

## Run locally
```bash
docker-compose up
```

## Deploy
Push to `main` — GitHub Actions handles the rest.