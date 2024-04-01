module "storage_account" {
  source                         = "../storage_account"
  location                       = var.location
  storage_account_name           = "${var.synapse_workspace_name}ps"
  resource_group_name            = var.resource_group_name
  storage_account_account_kind   = var.storage_account_account_kind
  storage_account_is_hns_enabled = var.storage_account_is_hns_enabled
  storage_account_replication    = var.storage_account_replication
  storage_account_tier           = var.storage_account_tier
  subnet_id = var.subnet_id
}

resource "azurerm_synapse_workspace" "synapse" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = module.storage_account.adls_fs_id
  sql_administrator_login              = var.synapse_sql_admin_username
  sql_administrator_login_password     = var.synapse_sql_admin_password

  aad_admin {
    login     = "AzureAD Admin"
    object_id = var.synapse_aad_admin_object_id
    tenant_id = var.tenant_id
  }

  identity {
    type = "SystemAssigned"
  }
}

output "synapse_id" {
  value = azurerm_synapse_workspace.synapse.id
}

module "synapse_spark_pool" {
  source = "../synapse_spark_pool"
  synapse_workspace_name = var.synapse_workspace_name
  resource_group_name = var.resource_group_name
  depends_on = [ azurerm_synapse_workspace.synapse ]
}

module "synapse_sql_pool" {
  source = "../synapse_sql_pool"
  resource_group_name = var.resource_group_name
  synapse_workspace_name = var.synapse_workspace_name
  depends_on = [ azurerm_synapse_workspace.synapse ]
}

# resource "azurerm_synapse_firewall_rule" "synapse_firewall_rule" {
#   name                 = "AllowAll"
#   synapse_workspace_id = azurerm_synapse_workspace.synapse.id
#   start_ip_address     = "0.0.0.0"
#   end_ip_address       = "255.255.255.255"
# }

# resource "azurerm_synapse_role_assignment" "example" {
#   synapse_workspace_id = azurerm_synapse_workspace.synapse.id
#   role_name            = "Synapse SQL Administrator"
#   principal_id         = var.synapse_aad_admin_object_id

#   depends_on = [azurerm_synapse_firewall_rule.example]
# }