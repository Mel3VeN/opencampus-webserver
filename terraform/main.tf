provider "aws" {
  region = "eu-central-1" 
}

terraform {
  backend "s3" {
    bucket = "opencampus-webserver"
    key    = "state/"
    region = "eu-central-1"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0ec7f9846da6b0f61"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example.id]
  key_name = "opencampus-test"

  tags = {
    Name = "WebServer"
  }
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Add any additional ingress rules as needed
}
