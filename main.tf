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

module "data_factory" {
  source = "./modules/data_factory"
  location = var.location
  resource_group_name = var.resource_group_name
  data_factory_name = var.data_factory_name  
}

module "azure_databricks" {
  source = "./modules/azure_databricks"
  location = var.location
  resource_group_name = var.resource_group_name
  azure_databricks_name = var.azure_databricks_name  
}

module "hdinsight_spark" {
  source = "./modules/hdinsight_spark"
  tenant_id                      = var.tenant_id
  location                       = var.location
  storage_account_name           = "${var.synapse_workspace_name}prmrystg"
  resource_group_name            = var.resource_group_name
  storage_account_account_kind   = var.storage_account_account_kind
  storage_account_is_hns_enabled = var.storage_account_is_hns_enabled
  storage_account_replication    = var.storage_account_replication
  storage_account_tier           = var.storage_account_tier
  subnet_id                      = var.subnet_id
  hdinsight_spark_cluster_tier = var.hdinsight_spark_cluster_tier
  hdinsight_spark_cluster_version = var.hdinsight_spark_cluster_version
  hdinsight_spark_component_version = var.hdinsight_spark_component_version
  hdinsight_spark_gateway_password = var.hdinsight_spark_gateway_password
  hdinsight_spark_gateway_username = var.hdinsight_spark_gateway_username
  hdinsight_spark_hn_vm_size = var.hdinsight_spark_hn_vm_size
  hdinsight_spark_name = var.hdinsight_spark_name
  hdinsight_spark_ssh_password = var.hdinsight_spark_ssh_password
  hdinsight_spark_ssh_username = var.hdinsight_spark_ssh_username
  hdinsight_spark_wn_vm_count = var.hdinsight_spark_wn_vm_count
  hdinsight_spark_wn_vm_size = var.hdinsight_spark_wn_vm_size
  hdinsight_spark_zk_vm_size = var.hdinsight_spark_zk_vm_size
}

module "hdinsight_kafka" {
  source = "./modules/hdinsight_kafka"
  tenant_id                      = var.tenant_id
  location                       = var.location
  storage_account_name           = "${var.synapse_workspace_name}prmrystg"
  resource_group_name            = var.resource_group_name
  storage_account_account_kind   = var.storage_account_account_kind
  storage_account_is_hns_enabled = var.storage_account_is_hns_enabled
  storage_account_replication    = var.storage_account_replication
  storage_account_tier           = var.storage_account_tier
  subnet_id                      = var.subnet_id
  hdinsight_kafka_cluster_tier = var.hdinsight_kafka_cluster_tier
  hdinsight_kafka_cluster_version = var.hdinsight_kafka_cluster_version
  hdinsight_kafka_component_version = var.hdinsight_kafka_component_version
  hdinsight_kafka_gateway_password = var.hdinsight_kafka_gateway_password
  hdinsight_kafka_gateway_username = var.hdinsight_kafka_gateway_username
  hdinsight_kafka_hn_vm_size = var.hdinsight_kafka_hn_vm_size
  hdinsight_kafka_wn_disk_count = var.hdinsight_kafka_wn_disk_count
  hdinsight_kafka_wn_ti_count = var.hdinsight_kafka_wn_ti_count
  hdinsight_kafka_name = var.hdinsight_kafka_name
  hdinsight_kafka_ssh_password = var.hdinsight_kafka_ssh_password
  hdinsight_kafka_ssh_username = var.hdinsight_kafka_ssh_username
  hdinsight_kafka_wn_vm_size = var.hdinsight_kafka_wn_vm_size
  hdinsight_kafka_zk_vm_size = var.hdinsight_kafka_zk_vm_size
} 