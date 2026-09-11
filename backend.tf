terraform {
  backend "s3" {
    bucket = "terraform-backend-ap-south"
    key    = "day2/terraform.tfstate"
    region = "ap-south-1"
    #    dynamodb_table = "terraform-locks"
  }
}
