output "ec2_instance_profile" {
  value = aws_iam_instance_profile.ec2.name
}

output "secret_arn" {
  value = aws_secretsmanager_secret.app.arn
}