locals {

  sorted_availability_zones = sort(data.aws_availability_zones.all.names)

  selected_availability_zones = slice(local.sorted_availability_zones, 0, var.vpc_az_count)

}