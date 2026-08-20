terraform {

  required_version = ">= 1.5"

  cloud {

    organization = "amit-lab"

    workspaces {
      name = "ec2-dev"
    }
  }
}
