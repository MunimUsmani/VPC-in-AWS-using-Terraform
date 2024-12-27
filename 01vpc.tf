// Step#01 : Create a VPC
resource "aws_vpc" "DSU_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "DSU-VPC"
  }
}