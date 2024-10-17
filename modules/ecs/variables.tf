variable "project_name" {
  type        = string
  default     = "terraform-ecs"
  description = "Name of the project."
}

variable "pub-subnets" {
  type        = list(string)
  description = "Public subnets"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC."
}