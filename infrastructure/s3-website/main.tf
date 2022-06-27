terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
	 region = "us-east-1"
}

data "aws_route53_zone" "selected" {
  name         = "bioanalyze.io."
}

module "website" {
	source = "cloudposse/s3-website/aws"

	namespace = "hpc"
	name = "bioanalyze"
#  parent_zone_id =
	parent_zone_name = data.aws_route53_zone.selected.name
	hostname = "hpc.bioanalyze.io"
	force_destroy = true

	encryption_enabled = true
}

output "zone" {
  value = data.aws_route53_zone.selected
}

output "website" {
	value = module.website
}
