variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {} 

variable "rg_name" {
    type = string
    description = "Resource Group name"
    default=""
}

variable "location" {
    type = string
    description = "Resource Group Location where to deploy"
    default     = ""
}

variable "default_tags" {
  description = ""
  type        = "map"
  default     = {}
}

variable "address_space" {
  description = ""
  default     = ""
}

variable "subnet" {
  description = ""
  default     = ""
}

variable "application" {
  description = ""
  default     = ""
}

variable "environment" {
  description = ""
  default     = ""
}

variable "capacity" {
  description = ""
  default     = ""
}