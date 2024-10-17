resource "aws_alb" "terraform-ecs-alb" {
  name            = "${var.project_name}-alb"
  subnets         = var.pub-subnets
  security_groups = [aws_security_group.alb.id]
}

resource "aws_alb_target_group" "terraform-ecs-alb-tg" {
  vpc_id      = var.vpc_id
  name        = "${var.project_name}-alb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  health_check {
    unhealthy_threshold = 2
    healthy_threshold   = 3
    interval            = "30"
    protocol            = "HTTP"
    timeout             = "3"
    matcher             = "200"
    path                = "/"
  }
}

resource "aws_alb_listener" "terraform-ecs-alb-listerner" {
  load_balancer_arn = aws_alb.terraform-ecs-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.terraform-ecs-alb-tg.arn
  }
}