#################################################### prod Route table peering + Igw

# Create a route table for Non-Prod Public Subnets (combined IGW + Peering)
resource "aws_route_table" "prod_public_route_table_combined" {
  vpc_id = aws_vpc.prod_vpc.id
  
  tags = {
    Name = "prod-public-route-table"
  }

}

# Route to Internet Gateway for Public Subnets
resource "aws_route" "prod_public_to_igw" {
  route_table_id         = aws_route_table.prod_public_route_table_combined.id
  destination_cidr_block = "0.0.0.0/0"  
  gateway_id             = aws_internet_gateway.prod_igw.id
}

resource "aws_route_table_association" "prod_public_subnet_1_assoc_combined" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.prod_public_route_table_combined.id
}

resource "aws_route_table_association" "prod_public_subnet_2_assoc_combined" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.prod_public_route_table_combined.id
}

resource "aws_route_table_association" "prod_public_subnet_3_assoc_combined" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.prod_public_route_table_combined.id
}

resource "aws_route_table_association" "prod_public_subnet_4_assoc_combined" {
  subnet_id      = aws_subnet.public_subnet_4.id
  route_table_id = aws_route_table.prod_public_route_table_combined.id
}


############################################## Nat Route Table and Association


resource "aws_route_table" "prod_private_route_table" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "prod-private-route-table"
  }
}

resource "aws_route" "non_prod_private_to_nat" {
  route_table_id         = aws_route_table.prod_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "prod_private_subnet_1_assoc" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.prod_private_route_table.id
}