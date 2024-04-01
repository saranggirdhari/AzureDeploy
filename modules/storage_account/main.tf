resource "azurerm_storage_account" "storage_account" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location                 = var.location
  account_kind = var.storage_account_account_kind
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
  is_hns_enabled = var.storage_account_is_hns_enabled
}

# module "private_endpoints" {
#   source             = "../private_endpoint"
#   location = var.location
#   resource_group_name = var.resource_group_name
#   storage_account_id = azurerm_storage_account.storage_account.id
#   subnet_id = var.subnet_id
#   services = {
#     file = {
#       service_name        = "file"
#       subresource_names   = ["file"]
#     }
#     blob = {
#       service_name        = "blob"
#       subresource_names   = ["blob"]
#     }
#     dfs = {
#       service_name        = "dfs"
#       subresource_names   = ["dfs"]
#     }
#   }
# }

resource "azurerm_storage_data_lake_gen2_filesystem" "adls_fs" {
  name               = "${var.storage_account_name}fs"
  storage_account_id = azurerm_storage_account.storage_account.id
  depends_on = [ azurerm_storage_account.storage_account ]
}

output "adls_fs_id" {
  value = azurerm_storage_data_lake_gen2_filesystem.adls_fs.id
}