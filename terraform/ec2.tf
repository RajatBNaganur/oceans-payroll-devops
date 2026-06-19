#########################################
# Latest Amazon Linux 2023 AMI
#########################################

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

#########################################
# Company EC2
#########################################

resource "aws_instance" "company" {

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.company_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.company_profile.name

  tags = merge(local.common_tags, {
    Name = "company-server"
  })
}

#########################################
# Bureau EC2
#########################################

resource "aws_instance" "bureau" {

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.bureau_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.bureau_profile.name

  tags = merge(local.common_tags, {
    Name = "bureau-server"
  })
}

#########################################
# Employee EC2
#########################################

resource "aws_instance" "employee" {

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_2.id
  vpc_security_group_ids = [aws_security_group.employee_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.employee_profile.name

  tags = merge(local.common_tags, {
    Name = "employee-server"
  })
}