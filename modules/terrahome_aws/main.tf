terraform {  
  required_providers {
   
   aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "website_bucket" {
  #Bucket Naming Rules 
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = var.bucket_name
  
  tags = {
    UserUid = var.user_uuid
  }

}
