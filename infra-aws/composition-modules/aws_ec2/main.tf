

module "ec2_blueprint" {

  source = "app.terraform.io/amit-lab/ec2/aws"

  version = "3.0.1"

  environment    = var.environment
  instance_count = var.instance_count
  ami_id         = var.ami_id

  #ATT Style
  #
  # ami_config = var.ami_config


  instance_type = var.instance_type
  app_tier      = var.app_tier

  subnet_id = var.subnet_id
  network_interfaces = var.network_interfaces
  ebr_subnet_id      = var.ebr_subnet_id
  nas_subnet_id      = var.nas_subnet_id

  # root_volume_size       = var.root_volume_size
  root_volume = var.root_volume

  additional_ebs_volumes = var.additional_ebs_volumes
  volume_type = var.volume_type

  # security_group_ids = var.security_group_ids

  gpn_ingress_rules = var.gpn_ingress_rules
  gpn_egress_rules  = var.gpn_egress_rules

  ebr_ingress_rules = var.ebr_ingress_rules
  ebr_egress_rules  = var.ebr_egress_rules

  nas_ingress_rules = var.nas_ingress_rules    # Added NAS in 3.0.0 module
  nas_egress_rules  = var.nas_egress_rules

  tags = var.tags
}