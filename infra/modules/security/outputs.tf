output "ec2_instance_profile" {
  value = aws_iam_instance_profile.ec2.name
}

output "secret_arn" {
  value = aws_secretsmanager_secret.app.arn
}

output "github_actions_role_arn" {
  value       = aws_iam_role.github_actions_deploy.arn
  description = "Paste this ARN into GitHub → Settings → Secrets → AWS_DEPLOY_ROLE_ARN"
}