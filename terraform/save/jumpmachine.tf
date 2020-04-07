resource "aws_instance" "jump_machine" {
        ami = "0a887e401f7654935" 
        instance_type = "t2.medium"
#       key_name = var.key_name
        vpc_security_group_ids = [
          #      "${lookup(var.security-groups, "allow-icmp-from-home")}",
          #      "${lookup(var.security-groups, "allow-ssh-from-home")}"
        ]
#        subnet_id = "${element(var.subnets_private, 0)}"
        root_block_device {
                volume_size = 8
                volume_type = "standard"
        }
        user_data = <<-EOF
                                #!/bin/bash
                                yum -y update
                                EOF
        
}
