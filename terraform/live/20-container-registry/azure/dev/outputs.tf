output "acr_id" {
  description = "Azure Container Registry Resource ID"
  value       = module.acr.acr_id
}

output "acr_name" {
  description = "Azure Container Registry Name"
  value       = module.acr.acr_name
}

output "login_server" {
  description = "Azure Container Registry Login Server"
  value       = module.acr.login_server
}
