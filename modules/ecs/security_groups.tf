resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb"
  description = "Constrols access to the ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_security_group_rule" "alb-ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.alb.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb-egress" {
  type              = "egress"
  security_group_id = aws_alb.terraform-ecs-alb.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}