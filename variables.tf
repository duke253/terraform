# Main

variable "YC_REGION" {
  type    = string
  default = "ru-central1-c"
}

variable "YC_TOKEN" {
  type        = string
  description = "..."
}

variable "YC_CLOUD_ID" {
  type        = string
  description = "..."
}

variable "YC_FOLDER_ID" {
  type        = string
  description = "..."
}

variable "SSH_KEY_OPEN" {
  type        = string
  description = "..."
}

#variable "YC_SA_NAME" {
#  type        = string
#  description = "..."
#}

#variable "YC_STATE_BUCKET_NAME" {
#  type        = string
#  description = "..."
#}

#############################################
# Network

variable "YC_NETWORK_NAME" {
  type        = string
  description = "..."
}

variable "YC_DMZ_SUBNET_NAME" {
  type        = string
  description = "..."
}

variable "YC_INFRA_SUBNET_NAME" {
  type        = string
  description = "..."
}

############################################
# VM1 ald-dc-1

variable "YC_VM1_NAME" {
  type        = string
  description = "..."
}

variable "YC_VM1_HOSTNAME" {
  type        = string
  description = "..."
}

variable "YC_VM1_DESCRIPTION" {
  type        = string
  description = "..."
}

variable "YC_VM1_PLATFORM_ID" {
  type        = string
  description = "..."
}

variable "YC_VM1_CORES" {
  type        = number
  description = "..."
}

variable "YC_VM1_CORE_FRACTION" {
  type        = number
  description = "..."
}

variable "YC_VM1_MEM" {
  type        = number
  description = "..."
}

variable "YC_VM1_PREEMPTIBLE" {
  type        = bool
  description = "..."
}

variable "YC_VM1_NETWORK_IF_NAT" {
  type        = bool
  description = "..."
}

variable "YC_VM1_IPV4_ADDRESS" {
  type        = string
  description = "..."
}

variable "YC_VM1_BOOT_DISK_SIZE" {
  type        = number
  description = "..."
}

variable "YC_VM1_BOOT_DISK_BLOCK_SIZE" {
  type        = number
  description = "..."
}

variable "YC_VM1_BOOT_DISK_TYPE" {
  type        = string
  description = "..."
}

############################################
# VM2 ald-client-1

variable "YC_VM2_NAME" {
  type        = string
  description = "..."
}

variable "YC_VM2_HOSTNAME" {
  type        = string
  description = "..."
}

variable "YC_VM2_DESCRIPTION" {
  type        = string
  description = "..."
}

variable "YC_VM2_PLATFORM_ID" {
  type        = string
  description = "..."
}

variable "YC_VM2_CORES" {
  type        = number
  description = "..."
}

variable "YC_VM2_CORE_FRACTION" {
  type        = number
  description = "..."
}

variable "YC_VM2_MEM" {
  type        = number
  description = "..."
}

variable "YC_VM2_PREEMPTIBLE" {
  type        = bool
  description = "..."
}

variable "YC_VM2_NETWORK_IF_NAT" {
  type        = bool
  description = "..."
}

variable "YC_VM2_IPV4_ADDRESS" {
  type        = string
  description = "..."
}

variable "YC_VM2_BOOT_DISK_SIZE" {
  type        = number
  description = "..."
}

variable "YC_VM2_BOOT_DISK_BLOCK_SIZE" {
  type        = number
  description = "..."
}

variable "YC_VM2_BOOT_DISK_TYPE" {
  type        = string
  description = "..."
}
