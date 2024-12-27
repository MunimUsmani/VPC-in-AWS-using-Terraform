// Step#02 : Creates a Public Subnet and Private Subnet

resource "aws_subnet" "DSU_PublicSubnet" {
  vpc_id                  = aws_vpc.DSU_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "DSU-PublicSN"

  }
}

resource "aws_subnet" "DSU_PrivateSubnet" {
  vpc_id                  = aws_vpc.DSU_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "DSU-PrivateSN"
  }
}