resource "aws_security_group" "terraform-ecs-sg-vpc_endpoint" {
  name        = "${var.project_name}-vpc-endpoint-sg"
  vpc_id      = aws_vpc.terraform-ecs-vpc.id
  description = "Security Group for the VPC Endpoint"
}

resource "aws_security_group_rule" "allow_https_vpc" {
  type              = "ingress"
  security_group_id = aws_security_group.terraform-ecs-sg-vpc_endpoint.id
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.terraform-ecs-vpc.cidr_block]
}