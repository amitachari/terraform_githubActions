

module "ec2_blueprint" {

  source = "app.terraform.io/amit-lab/ec2/aws"

  version = "2.0.1"

  environment = var.environment


  instance_name = var.instance_name
  instance_count = var.instance_count
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  app_tier       = var.app_tier

  subnet_id     = var.subnet_id
  ebr_enabled   = var.ebr_enabled
  ebr_subnet_id = var.ebr_subnet_id

  root_volume_size      = var.root_volume_size
  additional_ebs_volumes = var.additional_ebs_volumes

  security_group_ids = var.security_group_ids

  gpn_ingress_rules = var.gpn_ingress_rules
  gpn_egress_rules  = var.gpn_egress_rules

  ebr_ingress_rules = var.ebr_ingress_rules
  ebr_egress_rules  = var.ebr_egress_rules

  tags = var.tags
}