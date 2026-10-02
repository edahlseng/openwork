output "web_url" {
  description = "Den web URL."
  value       = local.web_url
}

output "api_url" {
  description = "Den API public URL (DEN_API_PUBLIC_URL)."
  value       = local.api_url
}

output "setup_url" {
  description = "One-time first-administrator page. Works only while the database has no users."
  value       = "${local.web_url}/setup"
}

output "bootstrap_code" {
  description = "Code to enter at /setup with an owner email."
  value       = local.bootstrap_code
  sensitive   = true
}

output "cluster_name" {
  value = var.ecs_cluster
}

output "service_names" {
  value = { den_api = aws_ecs_service.api.name, den_web = aws_ecs_service.web.name }
}

output "secret_arn" {
  description = "Secrets Manager secret holding DATABASE_URL, auth and encryption keys."
  value       = aws_secretsmanager_secret.app.arn
}

output "database_endpoint" {
  value = var.create_database ? aws_db_instance.this[0].address : null
}

output "task_security_group_id" {
  description = "Allow this group on anything else the app must reach (existing database, internal MCP servers)."
  value       = aws_security_group.tasks.id
}

output "log_groups" {
  value = { den_api = aws_cloudwatch_log_group.api.name, den_web = aws_cloudwatch_log_group.web.name }
}
