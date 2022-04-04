# Terraform-module-vpc-ec2
The aim of this project is to build a VPC and EC2 instance and run them as a module using IaC methodology  - here I have used Terraform to perform this project.
With the help of reusable Terraform modules, we can create multiple EC2 instances within minutes.


Setup

## VPC - refer [here](https://github.com/nav-InverseInfinity/Terraform-module-vpc-ec2/tree/main/modules/vpc)
 we need main.tf which consist of all the configuration, to make it dynamic, we are assigning variables and saving them in *vars.tf*. 
 The provider for this VPC is AWS, providing resources and creating security group which allows ingress as, HTTP -80, HTTPS -443 and SSH -22 and egress for all.
## EC2 -refer [here](https://github.com/nav-InverseInfinity/Terraform-module-vpc-ec2/tree/main/modules/ec2)
 similarly, we will have to create EC2 instance, here we are implementing user_data field to install Apache and run web server whilst booting EC2 instance.
 
 
## Modules - refer [here](https://github.com/nav-InverseInfinity/Terraform-module-vpc-ec2/tree/main/test_env)
 
 We are setting up two modules - one for VPC and another one for EC2 instances. Also using "data source" to fetch the AWS EC2 instance's **ami** 

To initiate terraform to run the above setup 

``` bash
terraform init
```
During Terraform plan, this will give out all the attributes and section which are going to be created in the Cloud Infrastructure.

``` bash
terraform plan
```
Finally, Terraform apply will create the VPC and EC2 instance in the AWS cloud. Since we have given AWS_Access_key and AWS_Secret_key as an empty variable, Terraform will ask to provide it before creating the Infrastructure in AWS 
``` bash
terraform apply
```





# Screenshot
VPC
![image](https://user-images.githubusercontent.com/98486154/161604576-7082a072-8b96-40a9-b13c-e672732e543d.png)

EC2
![image](https://user-images.githubusercontent.com/98486154/159164299-53fb310e-27b6-40a7-a97c-b10c8f342c21.png)

Webserver
![image](https://user-images.githubusercontent.com/98486154/159164305-c918ff64-41aa-4c8c-a60d-1d10387efb5c.png)



