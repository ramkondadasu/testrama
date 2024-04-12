terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            #version = "~> 3.0"
        }
    }
	
    backend "remote" {
        organization = "team-arch"

        workspaces {
            name = "test"
        }
    }
	
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "EC2Instance" {
    ami             =   "ami-051f8a213df8bc089"
    instance_type   =   "t2.micro"
    tenancy         =   "default"
    subnet_id       =   "subnet-063627b286abf18e7"
    #iam_instance_profile = "ssm-role"
    vpc_security_group_ids = [
        "sg-076a50ad7a5664472"
         
    ]
    tags = {
      Name = "team-xpanse"
    }
}
