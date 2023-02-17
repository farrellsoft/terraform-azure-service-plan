
output service_plan_resource_id {
  value       = azurerm_service_plan.this.id
  description = "The ID of the App Service Plan."
}

output service_plan_name {
  value       = azurerm_service_plan.this.name
  description = "The name of the App Service Plan."
}