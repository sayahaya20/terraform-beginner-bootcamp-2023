terraform {
#   cloud {
#     organization = "Sulaiman_Yahaya_Cloud"

#     workspaces {
#       name = "Terra-house"
#     }
#   }
  
  required_providers {
   
   aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}