# ----------------------------------
# ********** VPC Creation **********
# ----------------------------------
resource "aws_vpc" "dev_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "custom_vpc"
  }
}

# --------------------------------------
# ********** Internet Gateway **********
# --------------------------------------
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "Cust_IGW"
  }
}

# --------------------------------------
# *********** Public Subnet1 ***********
# --------------------------------------

resource "aws_subnet" "dev_subnet" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "cust_pub_subnet"
  }
}

# --------------------------------------
# *********** Public Subnet2 ***********
# --------------------------------------

resource "aws_subnet" "dev_subnet-2" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "cust_pub_subnet-2"
  }
}

# -----------------------------------------
# *********** Public Route able ***********
# -----------------------------------------

resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
  tags = {
    Name = "Custom_RT"
  }
}

# ----------------------------------------------
# *********** ET Subnets Association ***********
# ----------------------------------------------
resource "aws_route_table_association" "dev_rt_asso" {
  subnet_id      = aws_subnet.dev_subnet.id
  route_table_id = aws_route_table.dev_rt.id
}

resource "aws_route_table_association" "dev_rt_asso2" {
  subnet_id      = aws_subnet.dev_subnet-2.id
  route_table_id = aws_route_table.dev_rt.id
}


# --------------------------------------
# *********** Security Groups ***********
# --------------------------------------
resource "aws_security_group" "dev_sg" {
  name        = "dev_sg"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev_sg"
  }
}



# resource "aws_instance" "dev_instance" {
#   ami = "ami-01a00762f46d584a1"
#   instance_type = "t3.micro"
#   key_name = "devops"
#   availability_zone = aws_subnet.dev_subnet.id
# }