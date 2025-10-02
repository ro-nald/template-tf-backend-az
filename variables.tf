variable "location" {
  description = "The Azure region to create the resources in"
  type        = string
  default     = "West Europe"
}

variable "environment" {
  description = "The environment which the terraform state is being deployed to."
  type        = string
  default     = "dev"
}