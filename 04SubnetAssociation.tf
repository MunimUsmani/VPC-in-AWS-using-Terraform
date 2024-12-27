// Step#04 : Defines Route Table Subnet Associations for PublicSN and PrivateSN

resource "aws_route_table_association" "PublicRTAssociation" {
  subnet_id      = aws_subnet.DSU_PublicSubnet.id
  route_table_id = aws_route_table.DSU_PublicRT.id
}

resource "aws_route_table_association" "PrivateRTAssociation" {
  subnet_id      = aws_subnet.DSU_PrivateSubnet.id
  route_table_id = aws_route_table.DSU_PrivateRT.id
}