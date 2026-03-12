variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "project_name" {
  type    = string
  default = "aws-jokes-pipeline"
}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI for eu-central-1"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo in owner/repo format (e.g. myorg/aws-jokes-pipeline)"
  type        = string
}