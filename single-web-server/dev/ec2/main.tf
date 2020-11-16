# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A SINGLE EC2 INSTANCE
# This template runs a simple "Hello, World" web server on a single EC2 Instance
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
  backend "s3" {
    bucket = "monarch-sws-tfstate-ec2"
    key    = "single-web-server/dev/ec2"
    region = "us-gov-east-1"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    # Replace this with your bucket name!
    bucket = "monarch-sws-tfstate-sg"
    key    = "single-web-server/dev/sg"
    region = "us-gov-east-1"
  }
}

# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "us-gov-east-1"
  profile = "tapestry"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A SINGLE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------
module "example_instance" {
  source = "../../../modules/dev/ec2"

  ami                    = "ami-7a09e00b"
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.security-group]
  server_port = 8080

  #tags = {
  #  Name = "terraform-example-dev"
  #}
}


module "example_instance_ii" {
  source = "../../../modules/dev/ec2"

  ami                    = "ami-7a09e00b"
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.security-group]
  server_port = 8080

  #tags = {
  #  Name = "terraform-example-ii-dev"
  #}
}
