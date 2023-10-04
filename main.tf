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
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version= var.content_version
}