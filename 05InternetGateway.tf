// Step#05 : Create an IGW
resource "aws_internet_gateway" "DSU_igw" {
  vpc_id = aws_vpc.DSU_vpc.id
  tags = {
    Name = "DSU-IGW"
  }
}