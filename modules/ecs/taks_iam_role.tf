data "aws_iam_policy_document" "terraform-ecs-task-exec-role" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs-task-exec-role" {
  assume_role_policy = data.aws_iam_policy_document.terraform-ecs-task-exec-role.json
  name               = "${var.project_name}-taks-exec-role"
}

data "aws_iam_policy" "ecs-task-policy" {
  name = "AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs-task-exec-role-attach" {
  role       = aws_iam_role.ecs-task-exec-role.name
  policy_arn = data.aws_iam_policy.ecs-task-policy.arn
}

resource "aws_iam_role" "ecs-task-role" {
  assume_role_policy = data.aws_iam_policy_document.terraform-ecs-task-exec-role.json
  name               = "${var.project_name}-task-role"
}