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
  ami           = "ami-0c94855ba95c574c8"
  instance_type = "t2.micro"

  key_name = "opencampus-test"

  tags = {
    Name = "WebServer"
  }
}