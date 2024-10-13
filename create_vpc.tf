resource "aws_vpc" "main_self_vpc" {
  cidr_block       = var.block1
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_web_subnet1" {
  vpc_id = aws_vpc.main_self_vpc.id
  availability_zone = var.webzone1
  cidr_block = var.block2
  map_public_ip_on_launch = true
  tags = {
    Name = var.publicsubnet1
  }
}

resource "aws_subnet" "public_web_subnet2" {
  vpc_id = aws_vpc.main_self_vpc.id
  availability_zone = var.webzone2
  cidr_block = var.block3
  map_public_ip_on_launch = true
  tags = {
    Name = var.publicsubnet2
  }
}

resource "aws_internet_gateway" "aws_igw1" {
  vpc_id = aws_vpc.main_self_vpc.id
}

resource "aws_route_table" "pub_route" {
  vpc_id         = aws_vpc.main_self_vpc.id
  route {
    cidr_block = var.block4
    gateway_id = aws_internet_gateway.aws_igw1.id
  }
  tags = {
    Name = var.routetable1
  }
}

resource "aws_route_table_association" "route_assoc1" {
  route_table_id = aws_route_table.pub_route.id
  subnet_id = aws_subnet.public_web_subnet1.id
}

resource "aws_route_table_association" "route_assoc2" {
  route_table_id = aws_route_table.pub_route.id
  subnet_id = aws_subnet.public_web_subnet2.id

}
