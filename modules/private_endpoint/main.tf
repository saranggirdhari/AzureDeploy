resource "azurerm_private_endpoint" "private_endpoints" {
  for_each             = var.services
  name                 = "storage-${each.value.service_name}-pe"
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_id            = var.subnet_id
  private_service_connection {
    name                           = "private-${each.value.service_name}"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = each.value.subresource_names
    is_manual_connection = false
  }
}
