# create some variables
variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
  default     = "my-app-eks"
}

variable "iac_environment_tag" {
  type        = string
  description = "AWS tag to indicate environment name of each infrastructure object."
  default     = "development"
}

variable "name_prefix" {
  type        = string
  description = "Prefix to be used on each infrastructure object Name created in AWS."
  default     = "my-app"
}

variable "main_network_block" {
  type        = string
  description = "Base CIDR block to be used in our VPC."
  default     = "10.0.0.0/16"
}

variable "subnet_prefix_extension" {
  type        = number
  description = "CIDR block bits extension to calculate CIDR blocks of each subnetwork."
  default     = 4
}

variable "zone_offset" {
  type        = number
  description = "CIDR block bits extension offset to calculate Public subnets, avoiding collisions with Private subnets."
  default     = 8
}

variable "region" {
  description = "Choiced region of deployment"
  type        = string
  default     = "us-west-1"
}