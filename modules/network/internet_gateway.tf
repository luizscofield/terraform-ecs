resource "aws_internet_gateway" "terraform-ecs-igw" {
  vpc_id = aws_vpc.terraform-ecs-vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}