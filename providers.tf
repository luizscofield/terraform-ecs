provider "aws" {
  region = var.region

  default_tags {
    tags = {
      ProjectName        = var.project_name
      ProjectDescription = var.project_description
      ManagedBy          = "Terraform"
      SourceModule       = "https://github.com/luizscofield/terraform-ecs"
      Env                = var.environment
      AppName            = local.application_name
    }
  }
}