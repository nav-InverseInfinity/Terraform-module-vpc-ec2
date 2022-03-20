provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "test-webserver" {

	ami 				= var.ami_id
	instance_type 			= var.instances_type
	availability_zone		= var.aws_az
	key_name 		 	= var.aws_key
    	vpc_security_group_ids 		= [var.sg_id]
    	subnet_id			= var.subnet_id
    	associate_public_ip_address 	= true

	user_data = <<EOF
			#!/bin/bash

			sudo yum install httpd -y

			sudo systemctl start httpd
			sudo systemctl enable httpd

			echo "Testing webpage...." > /var/www/html/index.html

			EOF

	tags = {
	  Name = var.ec2_tag
	}


}
