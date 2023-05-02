# variable "param_store_prefix" {
#   type    = string
#   default = "/2550/del"
# }

# variable "dns_zone_id" {
#   type    = string
#   default = "Z09063052B43KCQ7FSGHY"
# }

# variable "param_store_prefix" {
#   type    = string
#   default = "/2550/del"
# }

# variable "dns_zone_id" {
#   type    = string
#   default = "Z09063052B43KCQ7FSGHY"
# }
variable "instance_class" {
  type = string
  default = "db.t2.micro"
}

variable "aws_engine_version" {
  type = number
  default = [
    "10.20",
]
}
variable "allocated_storage" {
  type    = number
  default = 20
}

variable "max_allocated_storage" {
  type    = number
  default = 50
}
variable "multi_az" {
  type    = bool
}

variable "publicly_accessible" {
  type    = bool
}

variable " deletion_protection" {
  type    = bool
}
variable "storage_encrypted" {
  type    = bool
}

variable " storage_type " {
  type    = string
  default = "gp2"
}
# variable "common_tags" {
#   type = map(any)
#   default = {
#     "AssetID"       = "2560"
#     "AssetName"     = "Insfrastructure"
#     "Environment"   = "dev"
#     "Project"       = "nes"
#     "CreateBy"      = "Terraform"
#     "cloudProvider" = "aws"
#   }
# }
