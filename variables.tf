variable "cidr_block" {
  default     = "10.0.0.0/16"
  description = "The CIDR Block for the target VPC."
  type        = string
}
variable "tags" {
  description = "A map of tags"
  type        = map
  default     = {
    "Name"        = "Sample-VPC-Module"
    "Description" = "Generated from https://github.com/asajaroff/terraform-aws-vpc"
    "Stage"       = "Testing"
    "Owner"       = ""
    "Team"        = "SysOps Team"
  }
}

variable "instance_tenancy" {
  default     = "default"
  description = "default / dedicated / host"
  type        = string
}

variable "enable_dns_support" {
  default     = true
  description = "Enable DNS Support"
  type        = bool
}
variable "enable_dns_hostnames" {
  default     = true
  description = "Enable DNS Hostnames"
  type        = bool
}

variable "enable_classiclink" {
  default     = false
  description = "Enable ClassicLink support."
  type        = bool
}

variable "enable_classiclink_dns_support" {
  default     = false
  description = "Enable ClassicLink DNS Support"
  type        = bool
}

variable "assign_ipv6_block" {
  default     = false
  description = "Assign IPv6 Block"
  type        = bool
}
