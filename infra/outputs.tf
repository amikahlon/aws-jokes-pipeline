output "client_repo_url" {
  value = module.ecr.client_repo_url
}

output "server_repo_url" {
  value = module.ecr.server_repo_url
}

output "alb_dns_name" {
  value = module.compute.alb_dns_name
}