terraform {
  backend "s3" {
    bucket = "aftab-is-pheonix"
    key    = "environment/terraform.tfstate"
    region = "us-east-1"
}
}

