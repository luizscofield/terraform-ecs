output "endpoint_s3" {
  value = {
    id    = aws_vpc_endpoint.s3.id
    arn   = aws_vpc_endpoint.s3.arn
    state = aws_vpc_endpoint.s3.state
  }
}

output "endpoint_logs" {
  value = {
    id    = aws_vpc_endpoint.logs.id
    arn   = aws_vpc_endpoint.logs.arn
    state = aws_vpc_endpoint.logs.state
  }
}

output "endpoint_ecr_dkr" {
  value = {
    id    = aws_vpc_endpoint.ecr_dkr_endpoint.id
    arn   = aws_vpc_endpoint.ecr_dkr_endpoint.arn
    state = aws_vpc_endpoint.ecr_dkr_endpoint.state
  }
}

output "endpoint_ecr_api" {
  value = {
    id    = aws_vpc_endpoint.ecr_api_endpoint.id
    arn   = aws_vpc_endpoint.ecr_api_endpoint.arn
    state = aws_vpc_endpoint.ecr_api_endpoint.state
  }
}

output "vpc" {
  value = {
    id         = aws_vpc.terraform-ecs-vpc.id
    arn        = aws_vpc.terraform-ecs-vpc.arn
    cidr_block = aws_vpc.terraform-ecs-vpc.cidr_block
  }
}

output "subnets" {
  value = {
    private = {
      id         = aws_subnet.private.*.id
      cidr_block = aws_subnet.private.*.cidr_block
    }
    public = {
      id         = aws_subnet.public.*.id
      cidr_block = aws_subnet.public.*.cidr_block
    }
  }
}

output "route_tables" {
  value = {
    private = {
      id = aws_route_table.private.*.id
    }
    public = {
      id = aws_route_table.public.*.id
    }
  }
}

output "az_count" {
  value = var.vpc_az_count
}

output "selected_azs" {
  value = local.selected_availability_zones
}