resource "aws_route" "internet_access" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_vpc.terraform-ecs-vpc.main_route_table_id
  gateway_id             = aws_internet_gateway.terraform-ecs-igw.id
}

resource "aws_route_table" "public" {
  count  = var.vpc_az_count
  vpc_id = aws_vpc.terraform-ecs-vpc.id

  tags = {
    Name = "${var.project_name}-public-route-table-${count.index}"
  }
}

resource "aws_route" "public_rt" {
  count                  = var.vpc_az_count
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.public.*.id[count.index]
  gateway_id             = aws_internet_gateway.terraform-ecs-igw.id
}

resource "aws_route_table" "private" {
  count  = var.vpc_az_count
  vpc_id = aws_vpc.terraform-ecs-vpc.id

  tags = {
    Name = "${var.project_name}-private-route-table-${count.index}"
  }
}

resource "aws_route_table_association" "public" {
  count          = var.vpc_az_count
  route_table_id = aws_route_table.public.*.id[count.index]
  subnet_id      = aws_subnet.public.*.id[count.index]
}

resource "aws_route_table_association" "private" {
  count          = var.vpc_az_count
  route_table_id = aws_route_table.private.*.id[count.index]
  subnet_id      = aws_subnet.private.*.id[count.index]
}