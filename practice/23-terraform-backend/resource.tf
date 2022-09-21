terraform {
  backend "s3" {
    bucket = "fateh-tf"
    region = "us-east-1"
    key    = "terraform.tfstate"
    # Remote Backend State Locking using S3 and DynamoDB
    dynamodb_table = "fateh-tf-table"
  }
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
resource "aws_instance" "web" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.small"
}


# migrate the tfsate file
# comment or change the backend and run. the command.
# terraform init -migrate-state

