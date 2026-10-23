#Practivce it for exams/interviews

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
    type= string
    default = "us-east-1"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "public_cidr" {
    type = string
    default = "10.0.1.0/24"
}

variable "private_cidr" {
    type = string
    default = "10.0.2.0/24"
}


resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "interview-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id =aws_vpc.main.id
    
    tags = {
        Name = "igw"
    }
    
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        Name = "Public-route-tables"
    }
}




resource "aws_route" "public_route" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


output "vpc_id" {
    value = aws_vpc.main.id
}


variable "my_ip" {
  description = "Your trusted public IP address in CIDR notation"
  type        = string
}

resource "aws_security_group" "ec2_sg" {
  name        = "interview-ec2-sg"
  description = "Allow SSH from trusted IP only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from trusted IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "interview-ec2-sg"
  }
}



resource "aws_instance" "web" {
  ami                         = "ami-xxxxxxxx"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "interview-public-ec2"
  }
}

resource "aws_instance" "backend" {
  ami                         = "ami-xxxxxxxx"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "interview-private-ec2"
  }
}
