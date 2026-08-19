terraform {

  required_version = ">= 1.5"

  cloud {

    organization = "amit-lab"

    workspaces {
      tags = ["ec2-dev"]
    }
  }
}
