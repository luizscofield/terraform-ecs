variable "project_name" {
  type        = string
  default     = "terraform-ecs"
  description = "Name of the project."
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block"
}

variable "vpc_az_count" {
  type        = number
  default     = 2
  description = "Number of AZs. Must be between 1 and 3."

  validation {
    condition     = var.vpc_az_count > 0 && var.vpc_az_count < 4
    error_message = "The number of AZs must be between 1 and 3."
  }

}