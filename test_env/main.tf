provider "aws" {
    region = var.aws_region
}


module "my_vpc" {
	source = "../modules/vpc"
	aws_region = var.aws_region

	
	vpc_cidr = "192.168.0.0/16"
	vpc_id = module.my_vpc.my_vpc_id
	tenancy = "default"
	subnet_cidr = "192.168.10.0/24"
	subnet_id = module.my_vpc.my_subnet_id
	vpc_tag = "test-vpc"
	subnet_tag = "test-subnet-1"
	sg_tag = "test-sg"
	sg_name = "test_sg"
	


}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "ec2_module" {
	
	source = "../modules/ec2"
	aws_region = var.aws_region

	ami_id = data.aws_ami.amazon-linux-2.id
	instances_type = "t2.micro"
	aws_az = "eu-west-2a"
	aws_key = "aws_remote"
	subnet_id = module.my_vpc.my_subnet_id
	sg_id = module.my_vpc.my_security_group_id
	ec2_tag = "test_server"
	sg_name = "test_sg"


}
