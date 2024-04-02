variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

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

variable "hdinsight_spark_name" {
  type = string
  description = "HDInsight spark name"
}

variable "hdinsight_spark_cluster_version" {
  type = string
  description = "HDInsight spark cluster version"
}

variable "hdinsight_spark_cluster_tier" {
  type = string
  description = "HDInsight spark cluster tier"
}

variable "hdinsight_spark_component_version" {
  type = string
  description = "HDInsight spark component version"
}

variable "hdinsight_spark_gateway_username" {
  type = string
  description = "HDInsight spark gateway username"
}

variable "hdinsight_spark_gateway_password" {
  type = string
  description = "HDInsight spark gateway password"
}

variable "hdinsight_spark_hn_vm_size" {
  type = string
  description = "HDInsight spark head node VM size"
}

variable "hdinsight_spark_wn_vm_size" {
  type = string
  description = "HDInsight spark worker node VM size"
}

variable "hdinsight_spark_wn_vm_count" {
  type = number
  description = "HDInsight spark worker node VM size"
}

variable "hdinsight_spark_zk_vm_size" {
  type = string
  description = "HDInsight spark head node VM size"
}

variable "hdinsight_spark_ssh_username" {
  type = string
  description = "HDInsight spark ssh username"
}

variable "hdinsight_spark_ssh_password" {
  type = string
  description = "HDInsight spark ssh password"
}