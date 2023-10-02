terraform {
#   cloud {
#     organization = "Sulaiman_Yahaya_Cloud"

#     workspaces {
#       name = "Terra-house"
#     }
#   }
  

}

module "terrahouse_aws" {
  source = "./modules/terrahome_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}