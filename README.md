# Terraform AWS VPC Module
Module to provision a VPC.

# Inputs

| Variable | Type | Default | Comment |
|:------------------------------:|--------|---------------|----------------------------------------------------------|
| cidr_block | string | `10.0.0.0/16` | CIDR Block for the target VPC |
| instance_tenancy | string | `default` | Type of tenancy. Choose "default". "dedicated" or "host" |
| enable_dns_support | bool | `true` |  |
| enable_dns_hostnames | bool | `true` |  |
| enable_classic_link | bool | `false` |  |
| enable_classiclink_dns_support | bool | `false` |  |
| assign_ipv6_block | bool | `false` | Assign a random IPv6 CIDR Block |