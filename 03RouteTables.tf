// Step#03 : Creates a Route Tables for PubicSN and PrivateSN

resource "aws_route_table" "DSU_PublicRT" {
  vpc_id = aws_vpc.DSU_vpc.id
  tags = {
    Name = "DSU-PublicRT"
  }
  // Update Route in PublicRT
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.DSU_igw.id
  }
}

resource "aws_route_table" "DSU_PrivateRT" {
  vpc_id = aws_vpc.DSU_vpc.id
  tags = {
    Name = "DSU-PrivateRT"
  }
}