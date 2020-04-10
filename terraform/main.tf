provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "Employee_Security_Group" {
  name = "Employee_Security_Group"
  description = "Employee Security Group"

  ingress {
    description = "SSH from my apartment"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Customer_Security_Group" {
  name = "Customer_Security_Group"
  description = "Customer Security Group"

  ingress {
    description = "SSH from my apartment"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "dev_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
}

resource "aws_instance" "jump_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
}

resource "aws_instance" "prod_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
}

resource "aws_instance" "jenkins_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Employee_Security_Group.id]
  key_name = "Nbrown"

  tags = {
    Name = "Web"
  }
}
