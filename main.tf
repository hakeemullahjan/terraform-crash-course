provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod-vpc"
  }
}

variable "subnet_prefix" {
  description = "Enter a ipv4 CIDR block"
}

resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.prod-vpc.id
  #   cidr_block        = "10.0.1.0/24"
  cidr_block        = var.subnet_prefix[0].cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_prefix[0].name
  }
}


resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.prod-vpc.id
  #   cidr_block        = "10.0.1.0/24"
  cidr_block        = var.subnet_prefix[1].cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_prefix[1].name
  }
}
