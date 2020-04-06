resource "aws_instance" "jenkins_machine" {
   ami = "0a887e401f7654935" 
instance_type	= "t2.micro"

# subnet_id = aws_subnet.public_1.id
# Security group assign to instance

# vpc_security_group_ids = [aws_security_group.allow.ssh.id] 
# key name

# key_name = var.key_name

 user_data = <<EOF
   #! /bin/bash 
	      sudo yum update -y 
   sudo yum install -y httpd.x86_64
   sudo service httpd start
   sudo service httpd enable
   echo "<h1>Deployed via Terraform</h1> | sudo tee /var/www/html/index.html

   yum install java-1.8.0-openjdk-devel -y
   curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repo
   sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key 
   yum install -y jenkins
   systemctl start jenkins	
   systemctl status jenkins	
   systemctl enable jenkins

EOF 

}
