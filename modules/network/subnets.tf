resource "aws_subnet" "private" {
  count = var.vpc_az_count

  vpc_id     = aws_vpc.terraform-ecs-vpc.id
  cidr_block = cidrsubnet(aws_vpc.terraform-ecs-vpc.cidr_block, 8, count.index)

  availability_zone = local.selected_availability_zones[count.index]

  tags = {
    Name = "${var.project_name}-sub-private-${count.index}"
  }
}

resource "aws_subnet" "public" {
  count = var.vpc_az_count

  vpc_id     = aws_vpc.terraform-ecs-vpc.id
  cidr_block = cidrsubnet(aws_vpc.terraform-ecs-vpc.cidr_block, 8, var.vpc_az_count + count.index)

  availability_zone = local.selected_availability_zones[count.index]

  tags = {
    Name = "${var.project_name}-sub-private-${count.index}"
  }
}