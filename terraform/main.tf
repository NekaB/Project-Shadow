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
    cidr_blocks = ["73.106.72.159/32"]
  }

ingress {
  description = "HTTP for updates"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["73.106.72.159/32"]
}

ingress {
description = "HTTPS for updates"
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["73.106.72.159/32"]
}


ingress {
description = "Private Network"
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["172.31.0.0/16"]
}


egress {
description = "Universal Egress"
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_security_group" "Customer_Security_Group" {
  name = "Customer_Security_Group"
  description = "Customer Security Group"

  ingress {
    description = "SSH from my apartment"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

}



resource "aws_instance" "jump_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Employee_Security_Group.id]
  key_name = "Nbrown"

  tags = { 
    Name = "Jump"
  }
}

resource "aws_instance" "dev_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Employee_Security_Group.id]
  key_name = "Nbrown"

  tags = { 
    Name = "Dev"
  }

}
resource "aws_instance" "prod_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Employee_Security_Group.id]
  key_name = "Nbrown"

  tags = { 
    Name = "Prod"
  }

}
resource "aws_instance" "jenkins_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
<<<<<<< HEAD
=======
  
   lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Jenkins"
 } 

}

resource "aws_instance" "web" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
>>>>>>> 281e2fcd304fa55550803796edcd4fc8b9866cda
  vpc_security_group_ids = [aws_security_group.Employee_Security_Group.id]
  key_name = "Nbrown"
  
      

  tags = {
    Name = "Jenkins"
  } 
}



