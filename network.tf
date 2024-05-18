resource "aws_vpc" "xotocross-vpc" {
  cidr_block = var.cidr_vpc
  enable_dns_hostnames = true
  tags = {
    name = "xotocross-${var.aws_bucket_instance_input}-vpc"
  }
}

resource "aws_subnet" "xotocross-subnet" {
  vpc_id = aws_vpc.xotocross-vpc.id
  cidr_block = var.cidr_vpc_subnet
  map_public_ip_on_launch = true
  tags = {
    name = "xotocross-${var.aws_bucket_instance_input}-subnet"
    Type = "Public"
  }
}

resource "aws_internet_gateway" "xotocross-gateway" {
  vpc_id = aws_vpc.xotocross-vpc.id
  tags = {
    name = "xotocross-${var.aws_bucket_instance_input}-gateway"
  }
}

resource "aws_route_table" "xotocross-routetable" {
  vpc_id = aws_vpc.xotocross-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.xotocross-gateway.id
  }

  tags = {
    name = "xotocross-${var.aws_bucket_instance_input}-routetable"
  }
}
resource "aws_route_table_association" "xotocross-routetable-cluster-subnet" {
  subnet_id = aws_subnet.xotocross-subnet.id
  route_table_id = aws_route_table.xotocross-routetable.id
}