
module "resource-naming" {
  source  = "app.terraform.io/Farrellsoft/resource-naming/azure"
  version = "0.0.7"

  application         = var.application
  environment         = var.environment
  instance_number     = var.instance_number
}

resource azurerm_service_plan this {
  resource_group_name       = var.resource_group_name
  location                  = var.location
  name                      = module.resource-naming.service_plan_name

  os_type                   = var.os_type
  sku_name                  = var.sku_name
}
