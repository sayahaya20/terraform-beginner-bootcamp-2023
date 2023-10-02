terraform {
#   cloud {
#     organization = "Sulaiman_Yahaya_Cloud"

#     workspaces {
#       name = "Terra-house"
#     }
#   }
  
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
   aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}