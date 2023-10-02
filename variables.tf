variable "user_uuid" {
  description = "UUID for a user"
  type        = string

  validation {
    condition     = can(regex("^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}$", var.user_uuid))
    error_message = "Invalid UUID format. Must be in the form of xxxxxxxx-xxxx-4xxx-xxxx-xxxxxxxxxxxx"
  }
}


