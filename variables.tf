variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "client_id" {
  type        = string
  description = "Service principal ID for authentication"
}

variable "client_secret" {
  type        = string
  description = "Service principal secret for authentication"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location of the region"
}

#Network
variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

#Storage account
variable "storage_account_names" {
  type = map(object({
    name = string
  }))
  description = "Storage account names"
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
  type        = string
  description = "Storage account type"
}

#Synapse workspace
variable "synapse_workspace_name" {
  type        = string
  description = "Synapse workspace name"
}

variable "synapse_sql_admin_username" {
  type        = string
  description = "Synapse SQL admin username"
}

variable "synapse_sql_admin_password" {
  type        = string
  description = "Synapse SQL admin password"
}

variable "synapse_aad_admin_object_id" {
  type        = string
  description = "Synapse aad admin object id"
}

#Data factory
variable "data_factory_name" {
  type        = string
  description = "Synapse workspace name"
}

#Azure databricks
variable "azure_databricks_name" {
  type        = string
  description = "Synapse workspace name"
}

#HDInsight spark
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

#HDInsight Kafka
variable "hdinsight_kafka_name" {
  type = string
  description = "HDInsight kafka name"
}

variable "hdinsight_kafka_cluster_version" {
  type = string
  description = "HDInsight kafka cluster version"
}

variable "hdinsight_kafka_cluster_tier" {
  type = string
  description = "HDInsight kafka cluster tier"
}

variable "hdinsight_kafka_component_version" {
  type = string
  description = "HDInsight kafka component version"
}

variable "hdinsight_kafka_gateway_username" {
  type = string
  description = "HDInsight kafka gateway username"
}

variable "hdinsight_kafka_gateway_password" {
  type = string
  description = "HDInsight kafka gateway password"
}

variable "hdinsight_kafka_hn_vm_size" {
  type = string
  description = "HDInsight kafka head node VM size"
}

variable "hdinsight_kafka_wn_vm_size" {
  type = string
  description = "HDInsight kafka worker node VM size"
}

variable "hdinsight_kafka_wn_ti_count" {
  type = number
  description = "HDInsight kafka worker node target instance count"
}

variable "hdinsight_kafka_wn_disk_count" {
  type = number
  description = "HDInsight kafka number of disks per worker node"
}

variable "hdinsight_kafka_zk_vm_size" {
  type = string
  description = "HDInsight kafka head node VM size"
}

variable "hdinsight_kafka_ssh_username" {
  type = string
  description = "HDInsight kafka ssh username"
}

variable "hdinsight_kafka_ssh_password" {
  type = string
  description = "HDInsight kafka ssh password"
}