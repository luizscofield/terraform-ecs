variable "project_name" {
  type        = string
  default     = "terraform-ecs"
  description = "Name of the project."
}

variable "force_delete_repo" {
  type        = bool
  default     = true
  description = "Determines if the ecr repository should be deleted even if it contains images."
}

variable "app_name" {
  type        = string
  description = "Name of the application."
}