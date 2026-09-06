variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "ami_id" {
  type = string
}

# ATT Style AMI Config
# variable "ami_config" {
#   type = object({
#     name           = string
#     owner_accounts = list(string)
#   })
# }

variable "instance_type" {
  type = string
}

variable "app_tier" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "network_interfaces" {

  type = object({
    enable_nas = bool
    enable_ebr = bool
  })
}

variable "ebr_subnet_id" {
  type    = string
  default = null
}

variable "nas_subnet_id" {
  type    = string
  default = null
}

variable "root_volume" {
  type = object({
    size = number
    type = string
  })
}

variable "additional_ebs_volumes" {
  type = list(object({
    device_name = string
    volume_size = number
  }))
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "gpn_ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "gpn_egress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "ebr_ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "ebr_egress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "tags" {
  type    = map(string)
  default = {}
}