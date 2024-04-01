terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {}
}

module "storage_account" {
  for_each                       = var.storage_account_names
  source                         = "./modules/storage_account"
  location                       = var.location
  storage_account_name           = each.value.name
  resource_group_name            = var.resource_group_name
  storage_account_account_kind   = var.storage_account_account_kind
  storage_account_is_hns_enabled = var.storage_account_is_hns_enabled
  storage_account_replication    = var.storage_account_replication
  storage_account_tier           = var.storage_account_tier
  subnet_id                      = var.subnet_id
}

module "synapse" {
  source                         = "./modules/synapse_workspace"
  tenant_id                      = var.tenant_id
  location                       = var.location
  storage_account_name           = "${var.synapse_workspace_name}prmrystg"
  resource_group_name            = var.resource_group_name
  storage_account_account_kind   = var.storage_account_account_kind
  storage_account_is_hns_enabled = var.storage_account_is_hns_enabled
  storage_account_replication    = var.storage_account_replication
  storage_account_tier           = var.storage_account_tier
  subnet_id                      = var.subnet_id
  synapse_workspace_name         = var.synapse_workspace_name
  synapse_sql_admin_username     = var.synapse_sql_admin_username
  synapse_sql_admin_password     = var.synapse_sql_admin_password
  synapse_aad_admin_object_id    = var.synapse_aad_admin_object_id
}