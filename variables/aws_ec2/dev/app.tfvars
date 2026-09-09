environment    = "dev"
instance_count = 2
ami_id         = "ami-087d1c9a513324697"
instance_type  = "t3.micro"
app_tier       = "app"

# AMI config
# ami_config = {
#   name           = "ATT-custom-image-1.*"
#   owner_accounts = ["******"]
# }

# GPN network
subnet_id = "subnet-03b3fd372cc985885"

# EBR / NAS network
network_interfaces = {
  enable_nas = true
  enable_ebr = true
}

ebr_subnet_id = "subnet-0262580ada791f88a"
nas_subnet_id = "subnet-060ee05e12a89a950"

# Root disk
root_volume = {
  size = 10
  type = "gp3"
}


# Additional disks created for every instance
additional_ebs_volumes = [
  {
    device_name = "/dev/sdf"
    volume_size = 10
    # type = "gp3"
    # encrypted = true
    # throughput = 125
  },
  #   {
  #     device_name = "/dev/sdg"
  #     volume_size = 200
  #   }
]

EBS_volume_type = "gp3"
# # Optional existing security groups
# security_group_ids = [
#   "sg-09c793fb8450576fd", "sg-0856b0f64bc59dcf5"
# ]

# Custom GPN inbound rules
gpn_ingress_rules = [
  {
    description = "Allow SSH from internal network"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16", "10.31.0.0/16"]
  },
  {
    description = "Allow application traffic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16", "10.31.0.0/16"]
  }
]

# Custom GPN outbound rules
gpn_egress_rules = [
  {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.30.0.0/16", "10.31.0.0/16"]
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
    cidr_blocks = ["10.30.0.0/16", "10.31.0.0/16"]
  }
]

# Custom EBR outbound rules
ebr_egress_rules = [
  {
    description = "Allow outbound backup traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.30.0.0/16", "10.31.0.0/16"]
  }
]


nas_ingress_rules = [
  {
    description = "Allow backup traffic"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16", "10.31.0.0/16"]
  }
]

nas_egress_rules = [
  {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.30.0.0/16", "10.31.0.0/16"]
  }
]
tags = {
  Environment = "dev"
  Application = "demo"
  Owner       = "infra-team"
}
