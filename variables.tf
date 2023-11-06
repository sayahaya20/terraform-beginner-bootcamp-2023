variable "terratowns_endpoint" {
  type = string
  
}

variable "terratowns_access_token" {
  type = string
  
}


variable "teacherseat_user_uuid" {
  description = "UUID for a user"
  type        = string

}

variable "bucket_name" {
  description = "The name of our s3 bucket"
  type = string

}

variable "index_html_filepath" {
  description = "Path to the index.html file"
  type        = string
}

variable "error_html_filepath" {
  description = "Path to the error.html file"
  type        = string
}

variable "content_version" {
  description = "Content version number"
  type        = number

}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
  
}