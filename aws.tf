provider "aws" {}

variable "cidr_blocks" {
   type = list(string)
}

variable "sn-cidr-block" {
  
   description = "Subnet cidr-block"
   default = "10.0.6.0/24"
   type = string
}


variable "vpc-cidr-block" {
   description = "vpc-cidr-block"
   default = "10.0.0.0/16"
}

variable "env" {
   description = "env to deploy"
   default = "Development"
}

variable az {}

resource "aws_vpc" "vejju_vpc" {
   cidr_block = var.cidr_blocks[0]
   tags = {
      Name = var.env
   }
}

resource "aws_subnet" "vejju_Subnet" {
   vpc_id = aws_vpc.vejju_vpc.id
   cidr_block = var.cidr_blocks[1]
   availability_zone = var.az
   tags = {
      Name = "vsn-1"
    
   }
}

output "vejju-vpc-id" {
   value = aws_vpc.vejju_vpc.id
}

output "vejju-sn-id" {
   value = aws_subnet.vejju_Subnet.id
}
