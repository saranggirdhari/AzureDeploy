variable "location" {
  type        = string
  description = "Location of the region"
}

variable "resource_group_name" {
  type = string
  description = "Name of the resource group in which to create the storage account"
}

variable "storage_account_name" {
  type = string
  description = "Name of the Azure Storage Account"
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account tier"
}

variable "storage_account_replication" {
  type        = string
  description = "Storage account replication"
}

variable "storage_account_is_hns_enabled" {
  type        = bool
  description = "Storage account replication"
}

variable "storage_account_account_kind" {
  type = string
  description = "Storage account type"
}

variable "subnet_id" {
  type = string
  description = "Subnet ID"
}