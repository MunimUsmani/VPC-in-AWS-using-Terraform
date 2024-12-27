// Create WebServer Instance:

resource "aws_instance" "DSU_webserver_instance" {
  ami                    = "ami-0e2c8caa4b6378d8c"
  instance_type          = "t2.micro"
  key_name               = "DSU-PK" // Key pair name
  vpc_security_group_ids = [aws_security_group.DSU_WebServerSG.id]
  subnet_id              = aws_subnet.DSU_PublicSubnet.id

  tags = {
    Name = "DSU-WebServer"
  }
}

// Security Group Using Terraform for WebServer Instance

resource "aws_security_group" "DSU_WebServerSG" {
  name        = "DSU-WebServerSG"
  description = "DSU-WebServerSG"
  vpc_id      = aws_vpc.DSU_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ALL ICMP - IPv4"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "DSU-WebServerSG"
  }
}

// Create BackendServer Instance:

resource "aws_instance" "DSU_backendserver_instance" {
  ami                    = "ami-0e2c8caa4b6378d8c"
  instance_type          = "t2.micro"
  key_name               = "DSU-PK" 
  vpc_security_group_ids = [aws_security_group.DSU_BackendServerSG.id]
  subnet_id              = aws_subnet.DSU_PrivateSubnet.id

  tags = {
    Name = "DSU-BackendServer"
  }
}

// Security Group Using Terraform for BackendServer Instance

resource "aws_security_group" "DSU_BackendServerSG" {
  name        = "DSU-BackendServerSG"
  description = "DSU-BackendServerSG"
  vpc_id      = aws_vpc.DSU_vpc.id

  ingress {
    description = "ALL TCP"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "DSU-BackendServerSG"
  }
}