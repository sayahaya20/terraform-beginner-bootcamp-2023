variable "user_uuid" {
  description = "UUID for a user"
  type        = string

  validation {
    condition     = can(regex("^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$", var.user_uuid))
    error_message = "Invalid UUID format. Must be in the form of xxxxxxxx-xxxx-4xxx-xxxx-xxxxxxxxxxxx"
  }
}

variable "bucket_name" {
  description = "The name of our s3 bucket"
  type = string

  validation {
    condition = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Invalid S3 bucket name. Must be between 3 and 63 characters, containing only lowercase letters, numbers, hyphens, and dots."
  }
  
}