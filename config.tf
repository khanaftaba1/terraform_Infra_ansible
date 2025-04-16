# Configuring the Terraform backend to use Amazon S3 for storing the Terraform state file...

terraform {
  backend "s3" {
    bucket = "aftab-is-pheonix"
    key    = "environment/terraform.tfstate"
    region = "us-east-1"
}
}

