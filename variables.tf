variable "project_name" {
  type        = string
  default     = "terraform-ecs"
  description = "Name of the project (optional)"
}

variable "project_description" {
  type        = string
  default     = "ECS Cluster with Terraform"
  description = "Description of the project (optional)"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region used to create the resources (optional)"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Name of the environment (optional)"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC network CIDR block (optional)"
}