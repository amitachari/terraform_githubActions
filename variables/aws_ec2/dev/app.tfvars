environment  = "dev"
instance_count = 2
ami_id         = "ami-0123456789abcdef0"
instance_type  = "t3.micro"
app_tier       = "app"

# GPN network
subnet_id = "subnet-07fea73d9fea499c7"

# EBR network
ebr_enabled   = false
ebr_subnet_id = "subnet-0262580ada791f88a"

# Root disk
root_volume_size = 50

# Additional disks created for every instance
additional_ebs_volumes = [
  {
    device_name = "/dev/sdf"
    volume_size = 10
  },
#   {
#     device_name = "/dev/sdg"
#     volume_size = 200
#   }
]

# Optional existing security groups
security_group_ids = [
  "sg-09c793fb8450576fd"
]

# Custom GPN inbound rules
gpn_ingress_rules = [
  {
    description = "Allow SSH from internal network"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.0.0/16"]
  },
  {
    description = "Allow application traffic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }
]

# Custom GPN outbound rules
gpn_egress_rules = [
  {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Custom EBR inbound rules
# Replace the CIDR and port with your approved EBR values.
ebr_ingress_rules = [
  {
    description = "Allow backup traffic"
    from_port   = 8400
    to_port     = 8403
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16"]
  }
]

# Custom EBR outbound rules
ebr_egress_rules = [
  {
    description = "Allow outbound backup traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.30.0.0/16"]
  }
]

tags = {
  Environment = "dev"
  Application = "demo"
  Owner       = "infra-team"
}