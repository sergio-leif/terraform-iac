variable "name" {
    type = string
    description = "Resource Group name"
}

variable "location" {
    type = string
    description = "Resource Group Location where to deploy"
}

variable "tags" {
  description = "The tags to associate the resource we are creating"
  type        = "map"
  default     = {}
}