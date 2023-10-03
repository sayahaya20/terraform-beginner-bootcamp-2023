variable "user_uuid" {
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