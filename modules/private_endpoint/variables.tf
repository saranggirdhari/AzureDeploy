variable "location" {
  type        = string
  description = "Location of the region"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group in which to create the storage account"
}

variable "storage_account_id" {
  type = string
  description = "ID of the Azure Storage Account"
}

variable "services" {
  description = "Map of services for which private endpoints should be created"
  type        = map(object({
    service_name            = string
    subresource_names       = list(string)
  }))
}

variable "subnet_id" {
  type = string
  description = "Subnet ID"
}