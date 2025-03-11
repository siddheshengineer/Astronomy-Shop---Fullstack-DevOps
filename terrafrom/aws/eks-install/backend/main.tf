# Configure the AWS Provider with Canada (Central) region
provider "aws" {
  region = "ca-central-1"
}


resource "aws_s3_bucket" "tf-s3-bucket" {
  bucket = "astronomy-tf-eks-state-bucket"

  tags = {
    Project        = "Astronomy Shop"
    Author         = "Siddhesh N"
    Part           =  "Terraform state backend"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "tf-dynamodb" {
  name           = "terrform-eks-state-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Project        = "Astronomy Shop"
    Author         = "Siddhesh N"
    Part           =  "Terraform state lock"
  }
}