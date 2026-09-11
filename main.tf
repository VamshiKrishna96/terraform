

resource "aws_instance" "ec2" {
  ami                         = "ami-01a00762f46d584a1"
  instance_type               = "t3.micro"
  key_name                    = "devops"
  subnet_id                   = aws_subnet.dev_subnet.id
  vpc_security_group_ids      = [aws_security_group.dev_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "tf-ec2"
  }
}

resource "aws_instance" "ec2-instance" {
  ami                         = "ami-01a00762f46d584a1"
  instance_type               = "t3.micro"
  key_name                    = "devops"
  subnet_id                   = aws_subnet.dev_subnet-2.id
  vpc_security_group_ids      = [aws_security_group.dev_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "tf-ec2-instance"
  }
}
