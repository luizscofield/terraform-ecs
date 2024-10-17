resource "aws_ecr_repository" "terraform-ecs-ecr" {
  name                 = var.app_name
  image_tag_mutability = "MUTABLE"
  force_delete         = var.force_delete_repo
}

resource "aws_ecr_lifecycle_policy" "ecr-policy" {
  repository = aws_ecr_repository.terraform-ecs-ecr.id
  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 5 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 5
      }
    }]
  })
}