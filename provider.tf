provider "aws" {
  region = "us-east-1"
  profile = "life-manager-profile"
}

terraform {
    backend "s3" {
        bucket         = "baruckdev-terraform-state-bucket"
        key            = "life-manager/api-gateway"
        region         = "us-east-1"
        profile        = "life-manager-profile"
        encrypt        = true
    }
}