resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.terraform-ecs-vpc.id
  service_name      = "com.amazonaws.${data.aws_region.region.name}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = aws_route_table.private.*.id
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id              = aws_vpc.terraform-ecs-vpc.id
  service_name        = "com.amazonaws.${data.aws_region.region.name}.logs"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private.*.id
  security_group_ids  = [aws_security_group.terraform-ecs-sg-vpc_endpoint.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_dkr_endpoint" {
  vpc_id              = aws_vpc.terraform-ecs-vpc.id
  service_name        = "com.amazonaws.${data.aws_region.region.name}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private.*.id
  security_group_ids  = [aws_security_group.terraform-ecs-sg-vpc_endpoint.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_api_endpoint" {
  vpc_id              = aws_vpc.terraform-ecs-vpc.id
  service_name        = "com.amazonaws.${data.aws_region.region.name}.ecr.api"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = aws_subnet.private.*.id
  security_group_ids  = [aws_security_group.terraform-ecs-sg-vpc_endpoint.id]
  private_dns_enabled = true
}