terraform {
  backend "s3" {
    bucket         = "tfstat-michaels"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "app-state-michaels"
  }
}