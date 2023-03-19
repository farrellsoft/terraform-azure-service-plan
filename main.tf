
terraform {
  required_providers {
    azapi = {
      source = "Azure/azapi"
    }
  }
}

data azurerm_client_config current {}
module "resource-naming" {
  source  = "app.terraform.io/Farrellsoft/resource-naming/azure"
  version = "0.0.9"
  
  application         = var.application
  environment         = var.environment
  instance_number     = var.instance_number
}

locals {
  resource_group_id     = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}"
}

#resource azurerm_service_plan this {
#  resource_group_name       = var.resource_group_name
#  location                  = var.location
#  name                      = module.resource-naming.service_plan_name
#
#  os_type                   = var.os_type
#  sku_name                  = var.sku_name
#}

resource azapi_resource this {
  type            = "Microsoft.Web/serverfarms@2022-03-01"
  name            = module.resource-naming.service_plan_name
  parent_id       = local.resource_group_id
  location        = var.location
  
  body            = jsonencode({
    kind      = "elastic"
    sku       = {
      family    = "EP"
      name      = "EP1"
      size      = "EP1"
      tier      = "ElasticPremium"
    }
    properties  = {
      reserved        = true
    }
  })
}