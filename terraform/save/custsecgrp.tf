resource "aws_security_group" "Customer_Security_Group"{
  name        = "Customer_Security_Group"
  description = "Customer Security Group"
  vpc_id      =  "aws_vpc.main.id"
}


