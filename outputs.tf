
output service_plan_resource_id {
  value       = azapi_resource.this.id
  description = "The ID of the App Service Plan."
}

output service_plan_name {
  value       = azapi_resource.this.name
  description = "The name of the App Service Plan."
}