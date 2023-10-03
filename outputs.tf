 output "bucket_name" {
    description = "bucket name for static website"
    value = module.terrahouse_aws.bucket_name
 }


 output "s3_website_endpoint" {
  description = "s3 static website endpoint"
  value =module.terrahouse_aws.website_endpoint
   
 }