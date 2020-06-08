provider "aws" {
  region = "us-east-1"
}

#Security Groups Start

resource "aws_security_group" "Jump_Security" {
  name        = "Jump_Security"
  description = "Allow Access from Jump Box Only"

  ingress {
    description = "SSH from my apartment"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

   ingress {
    description = "Port from my apartment"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port = 0
    to_port = 0
    protocol ="-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {
    Name = "Jump Access Only"
  }
}


resource "aws_security_group" "Employee_Security_Group" {
  name = "Employee_Security_Group"
  description = "Employee Security Group"

  ingress {
    description = "SSH from my apartment"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["73.106.0.0/16"]
  }

ingress {
  description = "HTTP for updates"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["73.106.0.0/16"]
}

ingress {
description = "HTTPS for updates"
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["73.106.0.0/16"]
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

#Start of Machines 

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
  vpc_security_group_ids = [aws_security_group.Jump_Security.id,aws_security_group.Customer_Security_Group.id]
  key_name = "Nbrown"



  tags = { 
    Name = "Dev"
  }

}

resource "aws_instance" "prod_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Jump_Security.id,aws_security_group.Customer_Security_Group.id]
  key_name = "Nbrown"


  tags = { 
    Name = "Prod"
  }

}

resource "aws_instance" "jenkins_machine" {
  ami = "ami-08fe38a2865705db8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Jump_Security.id]
  key_name = "Nbrown"

  lifecycle {
    prevent_destroy = true
  }

    tags = {
    Name = "Jenkins"
 } 



}


#Elastic IP (EIP) Code Blocks start here


resource "aws_eip" "jump" {
instance = aws_instance.jump_machine.id
 } 
 



resource "aws_eip" "dev"  {
instance = aws_instance.dev_machine.id
 } 


resource "aws_eip" "prod"  {
instance = aws_instance.prod_machine.id
 } 


resource "aws_eip" "jenkins"  {
instance = aws_instance.jenkins_machine.id
 } 


#Elastic-IP ends here





