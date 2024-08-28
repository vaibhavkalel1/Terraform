provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

data "aws_vpc" "selected" {
    tags = {
        Name = "Application_vpc"
    }
}
data "aws_subnet" "selected" {
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.selected.id]
    }
}
 
data "aws_ami" "latest_amozon_linux" {
    most_recent = true
    owners      = ["amazon"]

    filter {
        name = "name"
        values =["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "example" {
    ami     = data.aws_ami.latest_amozon_linux.id
    instance_type = var.instance_type
    subnet_id = tolist(data.aws_subnet.selected.ids) [0]

    tags = {
        name = "${var.env}-instance"
    }  
}
 resource "aws_s3_bucket" "example_bucket" {
    bucket = "${var.env}-terraform-bucket"
    acl    = "private"
 }
