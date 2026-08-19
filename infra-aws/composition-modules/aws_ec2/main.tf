module "ec2_blueprint" {

  source = "app.terraform.io/amit-lab/ec2/aws"

  version = "1.0.0"

  instance_name = var.instance_name

  ami = var.ami

  instance_type = var.instance_type

  subnet_id = var.subnet_id
}