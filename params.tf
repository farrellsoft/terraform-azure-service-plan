variable application {
  type = string
  validation {
    condition     = length(var.application) > 3
    error_message = "${var.application} must be a minimum of three (3) characters."
  }
}

variable environment {
  type = string
  description = "The environment (dev, test, prod, etc.)"
}

variable instance_number {
  type = string
  validation {
    condition     = can(regex("^[0-9]{3}$", var.instance_number))
    error_message = "${var.instance_number} must be three (3) numbers."
  }
  default   = "001"
}

variable location {
  type        = string
  description = "The location where the resources will be created."
}

variable resource_group_name {
  type        = string
  description = "The name of the resource group where the resources will be created."
}

variable sku_name {
  type        = string
  description = "The name of the SKU to use for the service plan."
}

// optional
variable os_type {
  type        = string
  description = "The operating system type of the virtual machine."
  validation {
    condition     = can(regex("^(Linux|Windows)$", var.os_type))
    error_message = "${var.os_type} must be either Linux or Windows."
  }
  default     = "Linux"
}